using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Modules.Prostate;

public class Algorithm
{
    private string connectionString;
    private int? userId;
    private AlgorithmOptions options;
    private const double DAYS_PER_MONTH = 30.43685;
    private const double DAYS_PER_YEAR = 365.25;

    public Algorithm(string connectionString)
    {
        this.connectionString = connectionString;
        this.userId = null;
        this.options = DefaultOptions;
    }

    public Algorithm(string connectionString, int userId) 
        : this(connectionString, userId, null) {}

    public Algorithm(string connectionString, int userId, AlgorithmOptions options)
    {
        this.connectionString = connectionString;
        this.userId = userId;
        this.options = options != null ? options : DefaultOptions;
    }

    public AlgorithmOptions DefaultOptions
    {
        get
        {
            AlgorithmOptions options = new AlgorithmOptions();
            // select all by default
            options.SelectedRP_Types = All_RP_Types;
            return options;
        }
    }

    public string ProjectPurpose { get; set; }
    public DateTime? ProjectIRB_ApprovalDate { get; set; }
    public string ProjectIRB_ApprovalType { get; set; }
    public string ProjectInvestigator { get; set; }
    public string ProjectDescription { get; set; }
    public string ProjectPrivacyLevel { get { return "Identified"; } }
    
    private AlgorithmOptions.RP_Types All_RP_Types
    {
        get
        {
            int maxval = (int) AlgorithmOptions.RP_Types.SalvRALP;
            return (AlgorithmOptions.RP_Types) ((maxval << 1) - 1);
        }
    }

    string selectedPatientsSQL = @"
        SELECT MSK_Procedures.PatientId
        FROM MSK_Procedures
	        INNER JOIN MSK_Patients ON
		        MSK_Procedures.PatientId = MSK_Patients.PatientId
		        AND PtBirthDate IS NOT NULL
        WHERE ProcName IN (
	        'CP','LP','LP_CONV','PP','RALP','RP',
	        'SalvCP','SalvLP','SalvRP','SalvRALP'
        )
        AND ProcDate IS NOT NULL

        UNION

        SELECT MSK_Procedures.PatientId
        FROM MSK_Procedures
	        INNER JOIN MSK_Patients ON
		        MSK_Procedures.PatientId = MSK_Patients.PatientId
		        AND PtBirthDate IS NOT NULL
	        INNER JOIN MSK_Pathology
		        ON MSK_Procedures.ProcedureId = MSK_Pathology.ProcedureId
		        AND MSK_Pathology.PathResult IN (
			        'MOD', 'POOR', 'WELL', 
			        'LOW', 'POS', 'Positive'
		        )
	        LEFT OUTER JOIN MSK_ProstateBiopsyPath 
		        ON MSK_Pathology.PathologyId = MSK_ProstateBiopsyPath.PathologyId
        WHERE 
	        ProcDate IS NOT NULL
	        AND ((ProcSite = 'Prostate' AND 
			        ProcName IN ('TURP', 'TRUS Biopsy', 'Biopsy', 'Needle Biopsy'))
		        OR MSK_ProstateBiopsyPath.PathologyId IS NOT NULL
        )
        ";

    private string ConfigureAlgorithm(AlgorithmOptions options)
    {
        return string.Format(this.sql, selectedPatientsSQL);
    }

    #region experimental stuff
    #region select patients - RP subquery
    string rpSelectSql = @"
        SELECT MSK_Patients.PatientId
        FROM MSK_Patients
	        INNER JOIN MSK_Procedures RP
		        ON MSK_Patients.PatientId = RP.PatientId
                AND RP.ProcDate IS NOT NULL
		        AND RP.ProcName IN ({0})
		        -- 2. add criteria (btw, >= min, <= max) for RP.ProcDate if set
                -- e.g.: AND RP.ProcDate BETWEEN '1/1/2010' AND '1/1/2013'
		        {1}";
    #endregion

    #region select patients - POS BX subquery
    string bxSelectSql = @"
        SELECT MSK_Patients.PatientId
        FROM MSK_Patients
	        INNER JOIN MSK_Procedures RP
		        ON MSK_Patients.PatientId = RP.PatientId
                AND RP.ProcDate IS NOT NULL
		        AND RP.ProcName IN ({0})
		        -- 2. add criteria (btw, >= min, <= max) for RP.ProcDate if set
		        --e.g.: AND RP.ProcDate BETWEEN '1/1/2010' AND '1/1/2013'
                {1}
	        INNER JOIN MSK_Procedures BX
		        ON MSK_Patients.PatientId = BX.PatientId
		        AND BX.ProcSite = 'Prostate' 
		        AND BX.ProcName IN (
			        'TURP', 'TRUS Biopsy', 
			        'Biopsy', 'Needle Biopsy'
		        )
		        AND Bx.ProcDate <= RP.ProcDate
	        INNER JOIN MSK_Pathology BXPath
		        ON BX.ProcedureId = BXPath.ProcedureId
		        AND BXPath.PathResult IN (
			        'MOD', 'POOR', 'WELL', 
			        'LOW', 'POS', 'Positive'
		        )
        GROUP BY MSK_Patients.PatientId
        -- 3. add HAVING criteria for BX.ProcDate if set
        -- e.g.: HAVING MIN(BX.ProcDate) BETWEEN '1/1/2009' AND '1/1/2012'
        {2}";
    #endregion

    
    private string ConfigureAlgorithm2(AlgorithmOptions options)
    {
        if (options == null)
        {
            options = DefaultOptions;
        }

        // handle rp types
        string rpJoin = null;
        string rpTypes = null;
        Func<AlgorithmOptions.RP_Types, string> quotes = 
            e => string.Format("'{0}'", e.ToString().Replace(", ", "', '"));

        if (options.SelectedRP_Types == AlgorithmOptions.RP_Types.None)
        {
            // if none selected, left outer join over all rp types
            rpJoin = "LEFT OUTER";
            rpTypes = quotes(All_RP_Types);
        }
        else
        {
            // if any rp types selected, inner join
            rpJoin = "INNER";
            rpTypes = quotes(options.SelectedRP_Types);
        }

        string rpDates = BuildDateRange("AND RP.ProcDate", options.MinimumRP_Date, options.MaximumRP_Date);
        string bxDates = BuildDateRange("HAVING MIN(BX.ProcDate)", options.MinimumDxDate, options.MaximumDxDate);

        return string.Format(this.sql, rpJoin, rpTypes, rpDates, bxDates);
    }

    // TODO: if the user does not select any RP types, we shouldn't have a ProcName IN restriction
    // e.g. let's say they wanted data for watchful waiting patients

    private string ConfigureAlgorithm3(AlgorithmOptions options)
    {
        if (options == null)
        {
            options = DefaultOptions;
        }

        // build rp types, rp dates, bx dates
        Func<AlgorithmOptions.RP_Types, string> quotes = 
            e => string.Format("'{0}'", e.ToString().Replace(", ", "', '"));

        string rpTypes = null;
        string rpDates = null;

        if (options.SelectedRP_Types != AlgorithmOptions.RP_Types.None)
        {
            rpTypes = quotes(options.SelectedRP_Types);
            rpDates = BuildDateRange("AND RP.ProcDate", options.MinimumRP_Date, options.MaximumRP_Date);
        }

        string bxDates = BuildDateRange("HAVING MIN(BX.ProcDate)", options.MinimumDxDate, options.MaximumDxDate);

        // build query for SelectedPatients based on which options have values
        return null;
    }

    private string BuildDateRange(string phrase, DateTime? min, DateTime? max)
    {
        if (min.HasValue && max.HasValue)
        {
            string fmt = "{0} BETWEEN '{1}' AND '{2}'";
            return string.Format(fmt, phrase, FormatDate(min.Value), FormatDate(max.Value));
        }
        else if (min.HasValue)
        {
            return string.Format("{0} >= '{1}'", phrase, FormatDate(min.Value));
        }
        else if (max.HasValue)
        {
            return string.Format("{0} <= '{1}'", phrase, FormatDate(max.Value));
        }

        // both values are empty
        return string.Empty;
    }
    
    #endregion

    #region sql
    string sql = @"
        -- expanded DVV
        -- time:
        -- 38s over VPN
        -- patient selection
        -- perhaps use procedures as CTE (psas up into post and pre)?

        -- advanced version?
        -- RPs as CTE (just procedures, not the extra tables)
        -- break positive biopsies into pre/post RP
        -- break PSAs up into pre(e.g. pre dx, prerp) / post RP + 42+ days (used for bcr)

        -- TODO: return patient data separately or with procedure, what about DOB, DxBxAge?
        -- this could be a dataset
        --WITH SelectedPatients(PatientId) AS (
	    --    Select PatientId
	    --    FROM MSK_Procedures
	    --    WHERE ProcName IN (
		--        'CP','LP','LP_CONV','PP','RALP','RP',
		--        'SalvCP','SalvLP','SalvRP','SalvRALP'
	    --    )
	    --    AND ProcDate IS NOT NULL 
        --)

        -- get prostate patients (rp or pos bx)
        WITH SelectedPatients(PatientId) AS (
	        {0}
        )

        -- general patient info
        -- EVENT HANDLED
        SELECT
	        MSK_Patients.PatientId,
	        PtBirthDate AS Date,
	        'PATIENT' AS Variable,
	        0 AS QualitySort,
	        NULL AS Quality,
	        ISNULL(PtMRN, '') + '||' +
	        ISNULL(PtRace, '') + '||' +
	        ISNULL(PtEthnicity, '') + '||' +
	        ISNULL(CONVERT(varchar, PtDeathDate, 101), '') + '||' +
	        ISNULL(PtDeathType, '') + '||' +
	        ISNULL(PtDeathCause, '') AS Data,
            1 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_Patients
		        ON SelectedPatients.PatientId = MSK_Patients.PatientId
                AND PtBirthDate IS NOT NULL
		
        UNION

        -- 1. positive biopsies
        -- EVENT HANDLED
        SELECT
	        MSK_Procedures.PatientId,
	        ProcDate AS Date,
	        'POSITIVE BIOPSY' AS Variable,
	        CASE PathQuality
		        WHEN 'RR' THEN 4
		        WHEN 'STD' THEN 3
		        WHEN 'REV' THEN 2
		        WHEN 'OUT' THEN 1
		        ELSE 0
	        END QualitySort,
	        PathQuality AS Quality,
	        ISNULL(ProcName, '') + '||' +
	        ISNULL(PathGG1, '') + '||' +
	        ISNULL(PathGG2, '') + '||' +
	        ISNULL(PathGGS, '') + '||' +
	        ISNULL(PathPosCores, '') + '||' +
	        ISNULL(PathNumCores, '') + '||' +
	        ISNULL(PathResult, '') AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_Procedures ON
		        SelectedPatients.PatientId = MSK_Procedures.PatientId
                AND ProcDate IS NOT NULL
		        --AND ProcSite = 'Prostate' 
		        --AND ProcName IN ('TURP', 'TRUS Biopsy', 'Biopsy', 'Needle Biopsy')
	        INNER JOIN MSK_Pathology ON
		        MSK_Procedures.ProcedureId = MSK_Pathology.ProcedureId 
                --AND
		        --PathResult IN ('MOD', 'POOR', 'WELL', 'LOW', 'POS', 'Positive')
	        LEFT OUTER JOIN MSK_ProstateBiopsyPath ON
		        MSK_Pathology.PathologyId = MSK_ProstateBiopsyPath.PathologyId
            WHERE
	            (ProcSite = 'Prostate' AND 
	             ProcName IN ('TURP', 'TRUS Biopsy', 'Biopsy', 'Needle Biopsy'))
	            OR MSK_ProstateBiopsyPath.PathologyId IS NOT NULL
	
        UNION
		
        -- 2. prostatectomies (RP)
        -- EVENT HANDLED
        SELECT
	        MSK_Procedures.PatientId,
	        MSK_Procedures.ProcDate As Date,
	        'RP' As Variable,
	        (CASE MSK_Pathology.PathQuality
		        WHEN 'RR' THEN 4
		        WHEN 'STD' THEN 3
		        WHEN 'REV' THEN 2
		        WHEN 'OUT' THEN 1
		        ELSE 0
	        END + 1) * 100 +
	        (CASE MSK_PathologyStageGrade.PathQuality
		        WHEN 'RR' THEN 4
		        WHEN 'STD' THEN 3
		        WHEN 'REV' THEN 2
		        WHEN 'OUT' THEN 1
		        ELSE 0
	        END + 1) * 10 +
	        (CASE PLND_Path.PathQuality
		        WHEN 'RR' THEN 4
		        WHEN 'STD' THEN 3
		        WHEN 'REV' THEN 2
		        WHEN 'OUT' THEN 1
		        ELSE 0
	        END) AS QualitySort, -- (path quality + 1) * 100 + psg * 10 + plnd path quality
	        MSK_Pathology.PathQuality AS Quality,
	
	        --ProcDate,ProcName,ProcInstitution,OpCaseSurgeon,ProcSurgeon,OpDuration,OpEstBloodLoss,ProcL_NVB_DissectionType,ProcL_NVB_Status,ProcR_NVB_DissectionType,ProcR_NVB_Status
	        --PathGG1,PathGG2,PathGGS,PathBN_Inv,PathExtension,PathMargin,PathPerineuralInv,PathSV_Inv,PathVascularInv
	        --PathStageSystem,PathStageT
	
	        ISNULL(MSK_Procedures.ProcName, '') + '||' +
	        ISNULL(MSK_Procedures.ProcInstitution, '') + '||' +
	        ISNULL(OpCaseSurgeon, '') + '||' +
	        ISNULL(MSK_Procedures.ProcSurgeon, '') + '||' +
	        ISNULL(OpDuration, '') + '||' +
	        ISNULL(OpEstBloodLoss, '') + '||' +
	        ISNULL(ProcL_NVB_DissectionType, '') + '||' +
	        ISNULL(ProcL_NVB_Status, '') + '||' +
	        ISNULL(ProcR_NVB_DissectionType, '') + '||' +
	        ISNULL(ProcR_NVB_Status, '') + '||' +
	        ISNULL(PathGG1, '') + '||' +
	        ISNULL(PathGG2, '') + '||' +
	        ISNULL(PathGGS, '') + '||' +
	        ISNULL(PathBN_Inv, '') + '||' +
	        ISNULL(PathExtension, '') + '||' +
	        ISNULL(PathMargin, '') + '||' +
	        ISNULL(MSK_ProstatectomyPath.PathPerineuralInv, '') + '||' +
	        ISNULL(PathSV_Inv, '') + '||' +
	        ISNULL(MSK_ProstatectomyPath.PathVascularInv, '') + '||' +
	        COALESCE(PLND_Path.PathResult, AE.AbsentReason, '')  + '||' +
	        ISNULL(PathStageSystem, '') + '||' +
	        ISNULL(PathStageT, '') + '||' +
	        ISNULL(ProcStageSystem, '') + '||' +
	        ISNULL(ProcStageT, '') + '||' +
            ISNULL(OpASA, '') + '||' +
            ISNULL(STUFF((
		        SELECT '|' + PathFindPosNodes + ':' + PathFindNumNodes
		        FROM MSK_NodePathFinding
		        WHERE PathologyId = PLND_Path.PathologyId
		        FOR XML PATH('')
	        ), 1, 1, ''), '') + '||' +
	        ISNULL(STUFF((
		        SELECT '|' + PathFindPosNodes + ':' + PathFindNumNodes
		        FROM MSK_NodePathFinding
		        WHERE PathologyId = RPLND_Path.PathologyId
		        FOR XML PATH('')
	        ), 1, 1, ''), '') AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_Procedures 
		        ON SelectedPatients.PatientId = MSK_Procedures.PatientId
                AND MSK_Procedures.ProcDate IS NOT NULL
		        AND MSK_Procedures.ProcName IN (
			        'CP','LP','LP_CONV','PP','RALP','RP',
			        'SalvCP','SalvLP','SalvRP','SalvRALP'
		        )
            -- outside/unlinked operations?
	        LEFT OUTER JOIN MSK_OperatingRoomDetails
		        ON MSK_Procedures.OperatingRoomDetailId = 
			        MSK_OperatingRoomDetails.OperatingRoomDetailId
	        LEFT OUTER JOIN MSK_ProstatectomyProc
		        ON MSK_Procedures.ProcedureId = MSK_ProstatectomyProc.ProcedureId
            -- what about unlinked path records?
	        LEFT OUTER JOIN MSK_Pathology
		        ON MSK_Procedures.ProcedureId = MSK_Pathology.ProcedureId
		        AND (
			        MSK_Pathology.PathSpecimenType IN (
				        'CP','LP','LP_CONV','PP','RALP','RP',
				        'SalvCP','SalvLP','SalvRP','SalvRALP'
			        )
			        OR MSK_Pathology.PathSpecimenType LIKE '%prostatectomy%'
		        )
	        LEFT OUTER JOIN MSK_ProstatectomyPath
		        ON MSK_Pathology.PathologyId = MSK_ProstatectomyPath.PathologyId
	        LEFT OUTER JOIN MSK_PathologyStageGrade
		        ON MSK_Pathology.PathologyId = MSK_PathologyStageGrade.PathologyId
	        -- PLND
	        LEFT OUTER JOIN MSK_Procedures PLND
		        ON MSK_Procedures.OperatingRoomDetailId = PLND.OperatingRoomDetailId
		        AND PLND.ProcName = 'PLND'
	        LEFT OUTER JOIN MSK_Pathology PLND_Path
		        ON PLND.ProcedureId = PLND_Path.ProcedureId
		        AND PLND_Path.PathSpecimenType = 'PLND'
	        -- RPLND
	        LEFT OUTER JOIN MSK_Procedures RPLND
		        ON MSK_Procedures.OperatingRoomDetailId = RPLND.OperatingRoomDetailId
		        AND RPLND.ProcName = 'RPLND'
	        LEFT OUTER JOIN MSK_Pathology RPLND_Path
		        ON RPLND.ProcedureId = RPLND_Path.ProcedureId
		        AND RPLND_Path.PathSpecimenType = 'RPLND'
            LEFT OUTER JOIN MSK_AbsentEvents AE
				ON SelectedPatients.PatientId = AE.PatientId
				AND AE.TableName = 'Procedures'
				AND AE.FieldName = 'ProcName'
				AND AE.FieldValue = 'PLND'
 
        UNION
    
        -- PSAs
        SELECT
	        MSK_LabTests.PatientId,
	        LabDate,
	        'PSA' AS Variable,
	        CASE LabQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END,
	        LabQuality AS Quality,
	        LabResult AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_LabTests
		        ON SelectedPatients.PatientId = MSK_LabTests.PatientId
                AND LabDate IS NOT NULL
		        AND LabTest = 'PSA'

        UNION 

        -- clinical stages
        SELECT
	        MSK_ClinicalStages.PatientId,
	        ClinStageDate AS Date,
	        'CLINICAL STAGE' AS Variable,
	        CASE ClinStageQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END AS QualitySort,
	        ClinStageQuality AS Quality,
	        -- ClinStageSystem,ClinStageT,ClinStageN,ClinStageM,ClinStageQuality
	        ISNULL(ClinStageSystem, '') + '||' +
	        ISNULL(ClinStageT, '') + '||' +
	        ISNULL(ClinStageN, '') + '||' +
	        ISNULL(ClinStageM, '') AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_ClinicalStages
		        ON SelectedPatients.PatientId = MSK_ClinicalStages.PatientId
		        --AND ClinStageDate IS NOT NULL
                AND (ClinStageDisease LIKE 'prostate%' OR ClinStageDisease IS NULL)

        UNION

        -- hormones (start / stop)
        SELECT
	        MSK_MedicalTherapy.PatientId,
	        MedTxDate AS Date,
	        'HORMONES' AS Variable,
	        CASE MedTxQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0	
	        END AS QualitySort,
	        MedTxQuality AS Quality,
	        -- MedTxType,MedTxAgent,MedTxStopDate
	        ISNULL(MedTxType, '') + '||' +
	        ISNULL(MedTxAgent, '') + '||' +
	        ISNULL(CONVERT(varchar, MedTxStopDate, 101), '') + '||' +
	        CASE -- duration
		        WHEN MedTxDate IS NOT NULL AND MedTxStopDate IS NOT NULL THEN 
			        CONVERT(varchar, DATEDIFF(day, MedTxDate, MedTxStopDate))
		        ELSE ''
	        END AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_MedicalTherapy
		        ON SelectedPatients.PatientId = MSK_MedicalTherapy.PatientId
                AND MedTxDate IS NOT NULL
		        AND (
			        MedTxType IN ('AA', 'LHRH', 'HORM', 'ESTROGEN', '5_ALPHA') OR
			        MedTxType LIKE '%AA' OR
			        MedTxType LIKE '%ESTROGEN%'
		        )

        UNION

        -- chemo (split into CHEMO/CLIN_TRIAL?)
        SELECT
	        MSK_MedicalTherapy.PatientId,
	        MedTxDate AS Date,
	        'CHEMOTHERAPY' AS Variable,
	        CASE MedTxQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0	
	        END AS QualitySort,
	        MedTxQuality AS Quality,
	        -- MedTxType,MedTxAgent
	        ISNULL(MedTxType, '') + '||' +
	        ISNULL(MedTxAgent, '') AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_MedicalTherapy
		        ON SelectedPatients.PatientId = MSK_MedicalTherapy.PatientId
                AND MedTxDate IS NOT NULL
		        AND MedTxType LIKE '%CHEMO%'

        UNION

        SELECT
	        MSK_MedicalTherapy.PatientId,
	        MedTxDate AS Date,
	        'CLINICAL TRIAL' AS Variable,
	        CASE MedTxQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0	
	        END AS QualitySort,
	        MedTxQuality AS Quality,
	        -- MedTxType,MedTxAgent
	        ISNULL(MedTxType, '') + '||' +
	        ISNULL(MedTxAgent, '') AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_MedicalTherapy
		        ON SelectedPatients.PatientId = MSK_MedicalTherapy.PatientId
                AND MedTxDate IS NOT NULL
		        AND (MedTxType = 'CLIN_TRIAL' OR ProtocolId IS NOT NULL)

        UNION

        -- rad tx
        SELECT 
	        MSK_RadiationTherapy.PatientId,
	        RadTxDate AS Date,
	        'RADIATION THERAPY' AS Variable,
	        CASE RadTxQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END AS QualitySort,
	        RadTxQuality As Quality,
	        -- RadTxType,RadTxTotalDose,RadTxTarget
	        ISNULL(RadTxType, '') + '||' +
	        ISNULL(RadTxTotalDose, '') + '||' +
	        ISNULL(RadTxTarget, '') + '||' +
            ISNULL(RadTxUnits, '') + '||' +
            ISNULL(RadTxIndication, '') AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_RadiationTherapy
		        ON SelectedPatients.PatientId = MSK_RadiationTherapy.PatientId
                AND RadTxDate IS NOT NULL
		        AND RadTxType IS NOT NULL

        UNION

        -- brachy
        SELECT MSK_BrachyTherapy.PatientId,
	        BrachyDate AS Date,
	        'BRACHYTHERAPY' AS Variable,
	        CASE BrachyQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END AS QualitySort,
	        BrachyQuality AS Quality,
	        ISNULL(BrachyIsotope, '') + '||' +
	        ISNULL(BrachyPrescribedDose, '') AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_BrachyTherapy
		        ON SelectedPatients.PatientId = MSK_BrachyTherapy.PatientId
                AND BrachyDate IS NOT NULL

        UNION

        -- active surveillance (not totally compatible with RP, but whatever)
        SELECT
	        MSK_Status.PatientId,
	        StatusDate AS Date,
	        'ACTIVE SURVEILLANCE' AS Variable,
	        CASE StatusQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END AS QualitySort,
	        StatusQuality AS Quality,
	        MSK_Status.Status AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_Status
		        ON SelectedPatients.PatientId = MSK_Status.PatientId
		        AND StatusDisease IN ('Prostate', 'Prostate Cancer')
		        AND MSK_Status.Status IN (
			        'Active Surveillance',
			        'Watchful Waiting'
		        )

        UNION

        -- mets
        SELECT
	        MSK_Status.PatientId,
	        StatusDate AS Date,
	        'CLINICAL METS' AS Variable,
	        CASE StatusQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END AS QualitySort,
	        StatusQuality AS Quality,
	        MSK_Status.Status AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_Status
		        ON SelectedPatients.PatientId = MSK_Status.PatientId
		        AND StatusDate IS NOT NULL
		        AND StatusDisease IN ('Prostate', 'Prostate Cancer')
		        AND MSK_Status.Status IN (
			        'Clinical Mets Castrate',
			        'Clinical Mets Non-Castrate',
                    'Distant Metastasis',
                    'Metastatic Disease'
		        )

        -- op note?

        UNION

		-- status disease
		SELECT
			MSK_Status.PatientId,
			StatusDate AS Date,
			'STATUS DISEASE' AS Variable,
			CASE StatusQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END AS QualitySort,
	        StatusQuality AS Quality,
	        StatusDisease AS Data,
            0 AS PatientSort
		FROM SelectedPatients
	        INNER JOIN MSK_Status
		        ON SelectedPatients.PatientId = MSK_Status.PatientId

        UNION

        -- MRIs
        SELECT
	        MSK_Diagnostics.PatientId,
	        DxDate AS Date,
	        'MRI' AS Variable,
	        CASE DxQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END AS QualitySort,
	        DxQuality AS Quality,
	        DxType AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_Diagnostics
		        ON SelectedPatients.PatientId = MSK_Diagnostics.PatientId
		        AND DxDate IS NOT NULL
		        AND (DxType IN ('EMRI', 'MRSI')
			        OR (DxType = 'MRI' AND DxTarget LIKE '%prostate%'))

        -- survey: Sexual Function
        UNION

        SELECT
	        MSK_Surveys.PatientId,
	        SurveyDate AS Date,
	        'ERECTILE FUNCTION' AS Variable,
	        CASE SurveyQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END AS QualitySort,
	        SurveyQuality AS Quality,
	        ISNULL(SurveyResult, '') + '||' +
	        ISNULL(SurveyTotal, '') + '||' +
	        ISNULL(SurveyItemResult, '') AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_Surveys
		        ON SelectedPatients.PatientId = MSK_Surveys.PatientId
		        AND SurveyType = 'Sexual Function'
                AND SurveyDate IS NOT NULL
	        -- there's no guarantee that this only returns one row
	        LEFT OUTER JOIN MSK_SurveyItems
		        ON MSK_Surveys.SurveyId = MSK_SurveyItems.SurveyId
		        AND SurveyItem = 'Erectile Function'

        -- survey: Urinary Function
        UNION

        SELECT
	        MSK_Surveys.PatientId,
	        SurveyDate AS Date,
	        'URINARY FUNCTION' AS Variable,
	        CASE SurveyQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END AS QualitySort,
	        SurveyQuality AS Quality,
	        ISNULL(SurveyResult, '') + '||' +
	        ISNULL(SurveyTotal, '') + '||' +
	        ISNULL(SurveyItemResult, '') AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_Surveys
		        ON SelectedPatients.PatientId = MSK_Surveys.PatientId
		        AND SurveyType = 'Urinary Function'
                AND SurveyDate IS NOT NULL
	        -- there's no guarantee that this only returns one row
	        LEFT OUTER JOIN MSK_SurveyItems
		        ON MSK_Surveys.SurveyId = MSK_SurveyItems.SurveyId
		        AND SurveyItem = 'Continence'

        -- complications/toxicities (we care about count, grade, and within 90 days of rp)
        UNION

        SELECT
	        MSK_Toxicities.PatientId,
	        ToxDate AS Date,
	        'COMPLICATION',
	        CASE ToxQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END AS QualitySort,
	        ToxQuality AS Quality,
	        ISNULL(ToxGrade, '') + '||' +
	        ISNULL(ToxName, '') AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_Toxicities
		        ON SelectedPatients.PatientId = MSK_Toxicities.PatientId
                AND ToxDate IS NOT NULL

        UNION

        SELECT
	        MSK_Surveys.PatientId,
	        SurveyDate AS Date,
	        'PROSTATE QOL SURVEY' AS Variable,
	        CASE SurveyQuality
		        WHEN 'RR' THEN 4
                WHEN 'STD' THEN 3
                WHEN 'REV' THEN 2
                WHEN 'OUT' THEN 1
                ELSE 0
	        END AS QualitySort,
	        SurveyQuality AS Quality,
	        CONVERT(varchar, MSK_Surveys.SurveyId) + '||' +
	        ISNULL(STUFF((
		        SELECT '|' + SurveyItemNum + ':' + SurveyItemResult
		        FROM MSK_SurveyItems
		        WHERE SurveyId = MSK_Surveys.SurveyId
		        FOR XML PATH('')
	        ), 1, 1, ''), '') AS Data,
            0 AS PatientSort
        FROM SelectedPatients
	        INNER JOIN MSK_Surveys
		        ON SelectedPatients.PatientId = MSK_Surveys.PatientId
		        AND SurveyType = 'Prostate QOL Survey'
		        AND SurveyDate IS NOT NULL

        ORDER BY
	        PatientId,
            PatientSort DESC,
	        Date,
	        Variable,
	        -- TODO: variable sort?
	        QualitySort DESC
        ";
    #endregion

    #region design
    /*
        What global state do we need to track for reach patient?
        - rp date
        - current psa
        - current clin stage
        - dxdate
        - first (min) horm start
        - current horm stop?
        - horm list (append to for each event)
        - what do we need for BCR?

        Define event handlers:
        Inputs: variable, state, db record
        Can update state
        Output: dictionary

        Use dictionary returned to update raw output record

        On new patient or EOD, use map raw output record fieldnames to output
            file display names. - necessary? Why not set them directly? 
        DxBxDate isn't in the query results; pos bx event handler 
        should know how to map Date value to DxBxDate.
    */
    #endregion

    #region per-patient state
    class PatientState
    {
        public DateTime? patientDOB;
        public DateTime? rpDate;
        public DateTime? dxDate;
        public DateTime? lcrDate;

        // pre-rp biopsy
        public DateTime? preRP_BxDate;

        // hormones
        public DateTime? firstPreRP_HormoneStartDate;
        public List<string> preRP_HormoneTypes = new List<string>();
        public DateTime? firstPostRP_HormoneStartDate;
        public List<string> postRP_HormoneTypes = new List<string>();

        // chemo/clin trials
        public DateTime? preRP_ChemoDate;
        public DateTime? postRP_ChemoDate;
        public DateTime? preRP_ClinicalTrialDate;
        public DateTime? postRP_ClinicalTrialDate;

        // radiation
        public DateTime? preRP_RadiationDate;
        public DateTime? postRP_RadiationDate;

        // brachy
        public DateTime? preRP_BrachyDate;
        public DateTime? postRP_BrachyDate;

        // BCR
        public List<KeyValuePair<DateTime, double>> bcrPSAs = new List<KeyValuePair<DateTime, double>>();

        // other PSAs
        public KeyValuePair<DateTime, string>? preDxPSA;
        public KeyValuePair<DateTime, string>? preRP_PSA;

        // Scardino BCR 01_011
        public List<KeyValuePair<DateTime, double>> scardinoPSAs = new List<KeyValuePair<DateTime, double>>();
        public KeyValuePair<DateTime, double>? scardinoFirstBcrPSA;
        public DateTime? scardinoBcrDate;

        // Scardino BCR 01_01
        public List<KeyValuePair<DateTime, double>> scardino_01_01_PSAs = new List<KeyValuePair<DateTime, double>>();
        public KeyValuePair<DateTime, double>? scardino_01_01_FirstBcrPSA;
        public DateTime? scardino_01_01_BcrDate;

        // baseline PSA (for Scardino)
        public DateTime? baselinePSA_Date;
        public KeyValuePair<DateTime, string>? lastMSK_PSA;
        public KeyValuePair<DateTime, string>? lastOutsidePSA;

        // first clinical stage (for Melanie)
        public DateTime? firstClinicalStageDate;

        // disease statuses (for Melanie)
        public HashSet<string> diseaseStatusSet = new HashSet<string>();
        public List<string> diseaseStatuses = new List<string>();

        // post-rp mets (for Melanie)
        public DateTime? postRP_MetsDate;

        // mri (for Melanie)
        public DateTime? preRP_FirstMRI_Date;

        // erectile, urinary functions (for Melanie)
        public KeyValuePair<DateTime, double>? baselineSurgeonEF;
        public KeyValuePair<DateTime, double>? baselineSurgeonUF;
        public KeyValuePair<DateTime, KeyValuePair<double, double>>? baselinePatientEF_UF;

        // complications (for Melanie)
        public List<int> complicationGrades = new List<int>();

        // active surveillance support (for Melanie)
        public DateTime? firstActiveSurveillanceStatusDate;
        public DateTime? firstPositiveBiopsyDate;
        public DateTime? firstMSK_BiopsyDate;
        public DateTime? firstPositiveMSK_BiopsyDate;
        public DateTime? firstMSK_BiopsyDateAfterFirstPositiveBiopsy;
    }
    #endregion

    #region output template
    DataTable outputTemplate = BuildOutputTemplate();

    private static DataTable BuildOutputTemplate()
    {
        DataTable t = new DataTable();

        t.Columns.Add("PtMRN", typeof(string));
        t.Columns.Add("PatientID", typeof(string));
        t.Columns.Add("DOB", typeof(string));
        t.Columns.Add("PtRace", typeof(string));
        t.Columns.Add("PtEthnicity", typeof(string));
        t.Columns.Add("PtDeathDate", typeof(string));
        t.Columns.Add("PtDeathType", typeof(string));
        t.Columns.Add("PtDeathCause", typeof(string));
        t.Columns.Add("ActiveSurveillance", typeof(string));
        t.Columns.Add("ActiveSurveillanceDate", typeof(string));
        t.Columns.Add("PreDxBxPSA_Date", typeof(string));
        t.Columns.Add("PreDxBxPSA_Value", typeof(string));
        t.Columns.Add("PTS_BaselinePSA_Date", typeof(string));
        t.Columns.Add("PTS_BaselinePSA_Value", typeof(string));
        t.Columns.Add("DxBxDate", typeof(string));
        t.Columns.Add("DxBxAge", typeof(string));
        t.Columns.Add("DxBxType", typeof(string));
        t.Columns.Add("DxBxGG1", typeof(string));
        t.Columns.Add("DxBxGG2", typeof(string));
        t.Columns.Add("DxBxGGS", typeof(string));
        t.Columns.Add("DxBxPosCores", typeof(string));
        t.Columns.Add("DxBxNumCores", typeof(string));
        t.Columns.Add("DxBxQuality", typeof(string));
        t.Columns.Add("FirstClinStageDate", typeof(string));
        t.Columns.Add("FirstClinStageSystem", typeof(string));
        t.Columns.Add("FirstClinT_Stage", typeof(string));
        t.Columns.Add("FirstClinN_Stage", typeof(string));
        t.Columns.Add("FirstClinM_Stage", typeof(string));
        t.Columns.Add("FirstClinStageQuality", typeof(string));
        t.Columns.Add("ClinStageDate", typeof(string));
        t.Columns.Add("ClinStageSystem", typeof(string));
        t.Columns.Add("ClinT_Stage", typeof(string));
        t.Columns.Add("ClinN_Stage", typeof(string));
        t.Columns.Add("ClinM_Stage", typeof(string));
        t.Columns.Add("ClinStageQuality", typeof(string));
        t.Columns.Add("OpNoteClinStageSystem", typeof(string));
        t.Columns.Add("OpNoteClinStage", typeof(string));
        t.Columns.Add("PreOpMets", typeof(string));
        t.Columns.Add("NeoAdjHormType", typeof(string));
        t.Columns.Add("NeoAdjHormStartDate", typeof(string));
        t.Columns.Add("NeoAdjHormStopDate", typeof(string));
        t.Columns.Add("NeoAdjHormDuration", typeof(string));
        t.Columns.Add("NeoAdjRadTxType", typeof(string));
        t.Columns.Add("NeoAdjRadTxDose", typeof(string));
        t.Columns.Add("NeoAdjRadTxDate", typeof(string));
        t.Columns.Add("NeoAdjRadTxTarget", typeof(string));
        t.Columns.Add("NeoAdjRadTxUnits", typeof(string));
        //t.Columns.Add("PreRP_RadTxType", typeof(string));
        //t.Columns.Add("PreRP_RadTxDose", typeof(string));
        //t.Columns.Add("PreRP_RadTxDate", typeof(string));
        //t.Columns.Add("PreRP_RadTxTarget", typeof(string));
        t.Columns.Add("NeoAdjBrachyType", typeof(string));
        t.Columns.Add("NeoAdjBrachyDose", typeof(string));
        t.Columns.Add("NeoAdjBrachyDate", typeof(string));
        //t.Columns.Add("PreRP_BrachyType", typeof(string));
        //t.Columns.Add("PreRP_BrachyDate", typeof(string));
        t.Columns.Add("NeoAdjChemoDate", typeof(string));
        t.Columns.Add("NeoAdjChemoAgent", typeof(string));
        t.Columns.Add("NeoAdjClinTrialDate", typeof(string));
        t.Columns.Add("NeoAdjClinTrialAgent", typeof(string));
        //t.Columns.Add("PreRP_ChemoType", typeof(string));
        //t.Columns.Add("PreRP_ChemoAgent", typeof(string));
        //t.Columns.Add("PreRP_ChemoClinTrial", typeof(string));
        //t.Columns.Add("PreRP_ChemoDate", typeof(string));
        t.Columns.Add("PreRP_BxDate", typeof(string));
        t.Columns.Add("PreRP_BxAge", typeof(string));
        t.Columns.Add("PreRP_BxType", typeof(string));
        t.Columns.Add("PreRP_BxGG1", typeof(string));
        t.Columns.Add("PreRP_BxGG2", typeof(string));
        t.Columns.Add("PreRP_BxGGS", typeof(string));
        t.Columns.Add("PreRP_BxPosCores", typeof(string));
        t.Columns.Add("PreRP_BxNumCores", typeof(string));
        t.Columns.Add("PreRP_BxQuality", typeof(string));
        t.Columns.Add("PreRP_PSA_Date", typeof(string));
        t.Columns.Add("PreRP_PSA_Value", typeof(string));
        t.Columns.Add("RP_Date", typeof(string));
        t.Columns.Add("RP_Type", typeof(string));
        t.Columns.Add("RP_Institution", typeof(string));
        t.Columns.Add("CaseSurgeon", typeof(string));
        t.Columns.Add("Surgeon", typeof(string));
        t.Columns.Add("RP_OperatingTime", typeof(string));
        t.Columns.Add("RP_EstBloodLoss", typeof(string));
        t.Columns.Add("RP_ASA", typeof(string));
        t.Columns.Add("RP_L_NVB_Dissection", typeof(string));
        t.Columns.Add("RP_L_NVB_Status", typeof(string));
        t.Columns.Add("RP_R_NVB_Dissection", typeof(string));
        t.Columns.Add("RP_R_NVB_Status", typeof(string));
        t.Columns.Add("PathGG1", typeof(string));
        t.Columns.Add("PathGG2", typeof(string));
        t.Columns.Add("PathGGS", typeof(string));
        t.Columns.Add("BNI", typeof(string));
        t.Columns.Add("ECE", typeof(string));
        t.Columns.Add("SMS", typeof(string));
        t.Columns.Add("PNI", typeof(string));
        t.Columns.Add("SVI", typeof(string));
        t.Columns.Add("VascularInv", typeof(string));
        t.Columns.Add("LNI", typeof(string));
        t.Columns.Add("StageSystem", typeof(string));
        t.Columns.Add("PathStage", typeof(string));
        t.Columns.Add("SumPathFindPosNodes", typeof(string));
        t.Columns.Add("SumPathFindTotalNodes", typeof(string));
        t.Columns.Add("PLND_SumPathFindPosNodes", typeof(string));
        t.Columns.Add("PLND_SumPathFindTotalNodes", typeof(string));
        t.Columns.Add("RPLND_SumPathFindPosNodes", typeof(string));
        t.Columns.Add("RPLND_SumPathFindTotalNodes", typeof(string));
        t.Columns.Add("PostRP_HormType", typeof(string));
        t.Columns.Add("PostRP_HormStartDate", typeof(string));
        t.Columns.Add("PostRP_HormStopDate", typeof(string));
        t.Columns.Add("PostRP_HormDuration", typeof(string));
        t.Columns.Add("PostRP_RadTxType", typeof(string));
        t.Columns.Add("PostRP_RadTxDose", typeof(string));
        t.Columns.Add("PostRP_RadTxDate", typeof(string));
        t.Columns.Add("PostRP_RadTxTarget", typeof(string));
        t.Columns.Add("PostRP_RadTxUnits", typeof(string));
        t.Columns.Add("PostRP_RadTxFreeTimeDays", typeof(string));
        t.Columns.Add("PostRP_RadTxFreeTimeMonths", typeof(string));
        t.Columns.Add("PostRP_RadTxFreeTimeYears", typeof(string));
        t.Columns.Add("PostRP_BrachyType", typeof(string));
        t.Columns.Add("PostRP_BrachyDose", typeof(string));
        t.Columns.Add("PostRP_BrachyDate", typeof(string));
        t.Columns.Add("PostRP_BrachyFreeTimeDays", typeof(string));
        t.Columns.Add("PostRP_BrachyFreeTimeMonths", typeof(string));
        t.Columns.Add("PostRP_BrachyFreeTimeYears", typeof(string));
        t.Columns.Add("PostRP_ChemoDate", typeof(string));
        t.Columns.Add("PostRP_ChemoAgent", typeof(string));
        t.Columns.Add("PostRP_ChemoFreeTimeDays", typeof(string));
        t.Columns.Add("PostRP_ChemoFreeTimeMonths", typeof(string));
        t.Columns.Add("PostRP_ChemoFreeTimeYears", typeof(string));
        t.Columns.Add("PostRP_ClinTrialDate", typeof(string));
        t.Columns.Add("PostRP_ClinTrialAgent", typeof(string));
        t.Columns.Add("PostRP_ClinTrialFreeTimeDays", typeof(string));
        t.Columns.Add("PostRP_ClinTrialFreeTimeMonths", typeof(string));
        t.Columns.Add("PostRP_ClinTrialFreeTimeYears", typeof(string));
        t.Columns.Add("BCR_Date", typeof(string));
        t.Columns.Add("BCR_PSA_Value", typeof(string));
        t.Columns.Add("BCR_FreeTimeDays", typeof(string));
        t.Columns.Add("BCR_FreeTimeMonths", typeof(string));
        t.Columns.Add("BCR_FreeTimeYears", typeof(string));
        t.Columns.Add("PTS_BCR_1_11_Date", typeof(string));
        t.Columns.Add("PTS_BCR_1_11_Type", typeof(string));
        t.Columns.Add("PTS_BCR_1_11_PSA_Value", typeof(string));
        t.Columns.Add("PTS_BCR_1_11_FreeTimeDays", typeof(string));
        t.Columns.Add("PTS_BCR_1_11_FreeTimeMonths", typeof(string));
        t.Columns.Add("PTS_BCR_1_11_FreeTimeYears", typeof(string));
        t.Columns.Add("PTS_BCR_1_1_Date", typeof(string));
        t.Columns.Add("PTS_BCR_1_1_Type", typeof(string));
        t.Columns.Add("PTS_BCR_1_1_PSA_Value", typeof(string));
        t.Columns.Add("PTS_BCR_1_1_FreeTimeDays", typeof(string));
        t.Columns.Add("PTS_BCR_1_1_FreeTimeMonths", typeof(string));
        t.Columns.Add("PTS_BCR_1_1_FreeTimeYears", typeof(string));
        t.Columns.Add("LCR_BxDate", typeof(string));
        t.Columns.Add("LCR_BxResult", typeof(string));
        t.Columns.Add("LCR_BxQuality", typeof(string));
        t.Columns.Add("LCR_BxGG1", typeof(string));
        t.Columns.Add("LCR_BxGG2", typeof(string));
        t.Columns.Add("LCR_BxGGS", typeof(string));
        t.Columns.Add("MetsFreeTimeDays", typeof(string));
        t.Columns.Add("MetsFreeTimeMonths", typeof(string));
        t.Columns.Add("MetsFreeTimeYears", typeof(string));
        t.Columns.Add("DiseaseStatus", typeof(string));
        t.Columns.Add("FirstPreRP_MRI_Date", typeof(string));
        t.Columns.Add("LastPreRP_MRI_Date", typeof(string));
        t.Columns.Add("BaselineErectileFunction", typeof(string));
        t.Columns.Add("BaselineErectileFunctionDate", typeof(string));
        t.Columns.Add("RecentErectileFunction", typeof(string));
        t.Columns.Add("RecentErectileFunctionDate", typeof(string));
        t.Columns.Add("BaselineUrinaryFunction", typeof(string));
        t.Columns.Add("BaselineUrinaryFunctionDate", typeof(string));
        t.Columns.Add("RecentUrinaryFunction", typeof(string));
        t.Columns.Add("RecentUrinaryFunctionDate", typeof(string));
        t.Columns.Add("BaselinePatientQOL_SurveyDate", typeof(string));
        t.Columns.Add("BaselinePatientErectileFunction", typeof(string));
        t.Columns.Add("BaselinePatientUrinaryFunction", typeof(string));
        t.Columns.Add("RecentPatientQOL_SurveyDate", typeof(string));
        t.Columns.Add("RecentPatientErectileFunction", typeof(string));
        t.Columns.Add("RecentPatientUrinaryFunction", typeof(string));
        t.Columns.Add("MaxSurgicalComplicationsGrade", typeof(string));
        t.Columns.Add("LastUpdated", typeof(string));

        return t;
    }
    #endregion

    public IEnumerable<string> OutputHeaders
    {
        get
        {
            foreach (DataColumn c in outputTemplate.Columns)
            {
                yield return c.ColumnName;
            }
        }
    }

    public IEnumerable<DataRow> GenerateOutput()
    {
        string configuredSql = ConfigureAlgorithm(this.options);
        if (userId.HasValue)
        {
            int userExportId = LogDataExport(this.userId.Value, configuredSql);
        }
        return ConsumeExtendedPatientHistories(configuredSql);
    }

    private IEnumerable<DataRow> ConsumeExtendedPatientHistories(string sql)
    {
        int currentPatientId = -1;
        PatientState currentState = new PatientState();
        DataRow currentOutput = null;

        // wire up (completed) event handlers
        var eventHandlers =
            new Dictionary<string, Func<PatientState, IDataRecord, IDictionary<string, string>>>()
            {
                { "PATIENT", HandleEvent_PATIENT },
                { "PSA", HandleEvent_PSA },
                { "POSITIVE BIOPSY", HandleEvent_POSITIVE_BIOPSY },
                { "ACTIVE SURVEILLANCE", HandleEvent_ACTIVE_SURVEILLANCE },
                { "CLINICAL STAGE", HandleEvent_CLINICAL_STAGE },
                { "CLINICAL METS", HandleEvent_CLINICAL_METS },
                { "STATUS DISEASE", HandleEvent_STATUS_DISEASE },
                { "MRI", HandleEvent_MRI },
                { "ERECTILE FUNCTION", HandleEvent_ERECTILE_FUNCTION },
                { "URINARY FUNCTION", HandleEvent_URINARY_FUNCTION },
                { "PROSTATE QOL SURVEY", HandleEvent_PROSTATE_QOL_SURVEY },
                { "RP", HandleEvent_RP },
                { "COMPLICATION", HandleEvent_COMPLICATION },
                { "HORMONES", HandleEvent_HORMONES },
                { "CHEMOTHERAPY", HandleEvent_CHEMOTHERAPY },
                { "CLINICAL TRIAL", HandleEvent_CLINICAL_TRIAL },
                { "RADIATION THERAPY", HandleEvent_RADIATION_THERAPY },
                { "BRACHYTHERAPY", HandleEvent_BRACHYTHERAPY }
            };

        using (SqlConnection conn = GetSqlConnection())
        {
            SqlCommand command = new SqlCommand(sql, conn);
            command.CommandTimeout = 300;
            conn.Open();

            SqlDataReader reader = command.ExecuteReader();
            DateTime timestamp = DateTime.Now;

            while (reader.Read())
            {
                // if patientId != currentPatientId or EOD:
                // - emit current output
                // - clear state
                // - init new output

                int patientId = reader.GetInt32(0); // PatientId

                if (patientId != currentPatientId)
                {
                    if (currentOutput != null)
                    {
                        // WriteOutput(writer, currentOutput);
                        yield return currentOutput;
                    }

                    currentPatientId = patientId;
                    currentState = new PatientState();
                    currentOutput = InitOutput(patientId, timestamp);
                }

                string variable = reader.GetString(2); // Variable
                if (eventHandlers.ContainsKey(variable))
                {
                    IDictionary<string, string> fields = eventHandlers[variable](currentState, reader);
                    UpdateOutput(currentOutput, fields);
                }
            }

            // EOD: handle final output
            if (currentOutput != null)
            {
                // WriteOutput(writer, currentOutput);
                yield return currentOutput;
            }

            reader.Close();
        }
    }

    private DataRow InitOutput(int patientId, DateTime timestamp)
    {
        DataRow row = outputTemplate.NewRow();
        row["PatientId"] = patientId;
        row["LastUpdated"] = timestamp.ToString();
        return row;
    }

    private void UpdateOutput(DataRow output, IDictionary<string, string> fields)
    {
        foreach (var kvp in fields)
        {
            output[kvp.Key] = kvp.Value;
        }
    }

    #region event handlers
    private IDictionary<string, string> HandleEvent_PATIENT(PatientState state, IDataRecord record)
    {
        // update state with dob
        state.patientDOB = (DateTime) record["Date"];

        // output
        string[] values = UnpipeData(record);
        string mrnFormatString = options.ExportForExcel ? "=\"{0}\"" : "{0}";

        return new Dictionary<string, string>()
            {
                { "PtMRN", string.Format(mrnFormatString, values[0]) }, // PtMRN
                { "DOB", FormatDate(state.patientDOB.Value) },
                { "PtRace", values[1] }, // PtRace
                { "PtEthnicity", values[2] }, // PtEthnicity
                { "PtDeathDate", values[3] },
                { "PtDeathType", values[4] }, // PtDeathType
                { "PtDeathCause", values[5] } // PtDeathCause
            };
    }

    private HashSet<string> positivity = new HashSet<string> { "MOD", "POOR", "WELL", "LOW", "POS", "Positive" };

    private IDictionary<string, string> HandleEvent_POSITIVE_BIOPSY(PatientState state, IDataRecord record)
    {
        Dictionary<string, string> output = new Dictionary<string, string>();
        DateTime currentDate = (DateTime) record["Date"];
        string quality = record[4].ToString();
        string[] values = UnpipeData(record);
        string pathResult = values[6];

        bool positive = positivity.Contains(pathResult);

        // handle active surveillance
        if (state.firstPositiveBiopsyDate.HasValue && quality == "STD" &&
            !state.firstMSK_BiopsyDateAfterFirstPositiveBiopsy.HasValue)
        {
            state.firstMSK_BiopsyDateAfterFirstPositiveBiopsy = currentDate;
        }

        if (!state.firstMSK_BiopsyDate.HasValue && quality == "STD")
        {
            state.firstMSK_BiopsyDate = currentDate;
        }

        if (positive)
        {
            if (!state.firstPositiveBiopsyDate.HasValue)
            {
                state.firstPositiveBiopsyDate = currentDate;
            }

            if (!state.firstPositiveMSK_BiopsyDate.HasValue && quality == "STD")
            {
                state.firstPositiveMSK_BiopsyDate = currentDate;
            }
        }

        DateTime? asDate = ProstateUtil.ActiveSurveillanceDate(state.firstActiveSurveillanceStatusDate,
                                                               state.firstPositiveBiopsyDate,
                                                               state.firstMSK_BiopsyDate,
                                                               state.firstPositiveMSK_BiopsyDate,
                                                               state.firstMSK_BiopsyDateAfterFirstPositiveBiopsy);
        if (asDate.HasValue)
        {
            output["ActiveSurveillance"] = "YES";
            output["ActiveSurveillanceDate"] = FormatDate(asDate.Value);
        }
        
        if (!positive)
        {
            return output;
        }

        // pre-rp: possible diagnosis
        // post-rp: possible LCR? (is this true?)
        if (!state.rpDate.HasValue)
        {
            
            

            if (state.dxDate.HasValue)
            {
                // Dictionary<string, string> preRP_BxOutput = new Dictionary<string, string>();

                // handle preRP_Bx, taking highest quality   
                

                if (!state.preRP_BxDate.HasValue || currentDate > state.preRP_BxDate.Value)
                {
                    state.preRP_BxDate = currentDate;
                    string[] _values = UnpipeData(record);
                    double age = (state.preRP_BxDate.Value - state.patientDOB.Value).Days / DAYS_PER_YEAR;

                    output["PreRP_BxDate"] = FormatDate(state.preRP_BxDate.Value);
                    output["PreRP_BxAge"] = age.ToString();
                    output["PreRP_BxType"] = _values[0];
                    output["PreRP_BxGG1"] = _values[1];
                    output["PreRP_BxGG2"] = _values[2];
                    output["PreRP_BxGGS"] = _values[3];
                    output["PreRP_BxPosCores"] = _values[4];
                    output["PreRP_BxNumCores"] = _values[5];
                    output["PreRP_BxQuality"] = record["Quality"].ToString();
                }

                // return preRP_BxOutput;
            }
            else
            {
                // update state with diagnosis date
                state.dxDate = (DateTime) record["Date"];

                // output
                //string[] values = UnpipeData(record);
                double ageAtBiopsy = (state.dxDate.Value - state.patientDOB.Value).Days / DAYS_PER_YEAR;

                //Dictionary<string, string> output = new Dictionary<string, string>
                //{
                output["DxBxDate"] = FormatDate(state.dxDate.Value);
                output["DxBxAge"] = ageAtBiopsy.ToString();
                output["DxBxType"] = values[0]; // ProcName
                output["DxBxGG1"] = values[1]; // PathGG1
                output["DxBxGG2"] = values[2]; // PathGG2
                output["DxBxGGS"] = values[3]; // PathGGS
                output["DxBxPosCores"] = values[4]; // PathPosCores
                output["DxBxNumCores"] = values[5]; // PathNumCores
                output["DxBxQuality"] = record["Quality"].ToString();
                //};

                // handle preDxPSA if necessary
                if (state.preDxPSA.HasValue)
                {
                    var preDxPSA = state.preDxPSA.Value;
                    output["PreDxBxPSA_Date"] = FormatDate(preDxPSA.Key);
                    output["PreDxBxPSA_Value"] = preDxPSA.Value;
                }

                // handle preRP_Bx, taking highest quality
                if (!state.preRP_BxDate.HasValue || state.dxDate.Value > state.preRP_BxDate.Value)
                {
                    state.preRP_BxDate = state.dxDate;

                    output["PreRP_BxDate"] = FormatDate(state.preRP_BxDate.Value);
                    output["PreRP_BxAge"] = ageAtBiopsy.ToString();
                    output["PreRP_BxType"] = values[0];
                    output["PreRP_BxGG1"] = values[1];
                    output["PreRP_BxGG2"] = values[2];
                    output["PreRP_BxGGS"] = values[3];
                    output["PreRP_BxPosCores"] = values[4];
                    output["PreRP_BxNumCores"] = values[5];
                    output["PreRP_BxQuality"] = record["Quality"].ToString();
                }

                // return output;
            }

            return output;
        }
        else
        {
            if (state.lcrDate.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // update state with lcr date
            state.lcrDate = (DateTime) record["Date"];

            //string[] values = UnpipeData(record);
            return new Dictionary<string, string>
                {
                    { "LCR_BxDate", state.lcrDate.Value.ToShortDateString() },
                    { "LCR_BxResult", values[6] }, // PathResult
                    { "LCR_BxQuality", record["Quality"].ToString() },
                    { "LCR_BxGG1", values[1] }, // PathGG1
                    { "LCR_BxGG2", values[2] }, // PathGG2
                    { "LCR_BxGGS", values[3] } // PathGGS
                };
        }
    }

    private IDictionary<string, string> HandleEvent_RP(PatientState state, IDataRecord record)
    {
        // handle only the first RP record (this gives us the highest quality path, stage, etc.)
        if (state.rpDate.HasValue)
        {
            return new Dictionary<string, string>();
        }

        // update state
        state.rpDate = (DateTime) record["Date"];

        // output 
        string[] values = UnpipeData(record);

        Dictionary<string, string> output = new Dictionary<string, string>()
            {
                { "RP_Date", FormatDate(state.rpDate.Value) },
                { "RP_Type", values[0] }, // ProcName
                { "RP_Institution", values[1] }, // ProcInstitution
                { "CaseSurgeon", values[2] }, // OpCaseSurgeon
                { "Surgeon", values[3] }, // ProcSurgeon
                { "RP_OperatingTime", values[4] }, // OpDuration
                { "RP_EstBloodLoss", values[5] }, // OpEstBloodLoss
                { "RP_L_NVB_Dissection", values[6] }, // ProcL_NVB_DissectionType
                { "RP_L_NVB_Status", values[7] }, // ProcL_NVB_Status
                { "RP_R_NVB_Dissection", values[8] }, // ProcR_NVB_DissectionType
                { "RP_R_NVB_Status", values[9] }, // ProcR_NVB_Status
                { "PathGG1", values[10] }, // PathGG1
                { "PathGG2", values[11] }, // PathGG2
                { "PathGGS", values[12] }, // PathGGS
                { "BNI", values[13] }, // PathBN_Inv
                { "ECE", values[14] }, // PathExtension
                { "SMS", values[15] }, // PathMargin
                { "PNI", values[16] }, // PathPerineuralInv
                { "SVI", values[17] }, // PathSV_Inv
                { "VascularInv", values[18] }, // PathVascularInv
                { "LNI", values[19] }, // PathResult
                { "StageSystem", values[20] }, // PathStageSystem
                { "PathStage", values[21] }, // PathStageT
                { "OpNoteClinStageSystem", values[22] }, // ProcStageSystem
                { "OpNoteClinStage", values[23] }, // ProcStageT
                { "RP_ASA", values[24] }, // OpASA
            };

        string nodeStream = values[25];
        if (!string.IsNullOrEmpty(nodeStream))
        {
            int posNodes = 0;
            int totalNodes = 0;
            bool hasPosNodes = false;
            bool hasTotalNodes = false;
            string[] nodeStreamItems = nodeStream.Split('|');

            foreach (string item in nodeStreamItems)
            {
                string[] n = item.Split(':');
                int p, t;
                if (int.TryParse(n[0].Trim(), out p))
                {
                    posNodes += p;
                    hasPosNodes = true;
                }

                if (int.TryParse(n[1].Trim(), out t))
                {

                    totalNodes += t;
                    hasTotalNodes = true;
                }
            }

            // return counts, even for empty values
            hasPosNodes = true;
            hasTotalNodes = true;

            if (hasPosNodes)
            {
                output["SumPathFindPosNodes"] = posNodes.ToString();
                output["PLND_SumPathFindPosNodes"] = posNodes.ToString();
            }

            if (hasTotalNodes)
            {
                output["SumPathFindTotalNodes"] = totalNodes.ToString();
                output["PLND_SumPathFindTotalNodes"] = totalNodes.ToString();
            }
        }

        string rplndNodeStream = values[26];
        // TODO: extract into a function
        if (!string.IsNullOrEmpty(rplndNodeStream))
        {
            int posNodes = 0;
            int totalNodes = 0;
            bool hasPosNodes = false;
            bool hasTotalNodes = false;
            string[] nodeStreamItems = rplndNodeStream.Split('|');

            foreach (string item in nodeStreamItems)
            {
                string[] n = item.Split(':');
                int p, t;
                if (int.TryParse(n[0].Trim(), out p))
                {
                    posNodes += p;
                    hasPosNodes = true;
                }

                if (int.TryParse(n[1].Trim(), out t))
                {

                    totalNodes += t;
                    hasTotalNodes = true;
                }
            }

            // return counts, even for empty values
            hasPosNodes = true;
            hasTotalNodes = true;

            if (hasPosNodes)
            {
                output["RPLND_SumPathFindPosNodes"] = posNodes.ToString();
            }

            if (hasTotalNodes)
            {
                output["RPLND_SumPathFindTotalNodes"] = totalNodes.ToString();
            }
        }

        // handle preRP_PSA if necessary
        if (state.preRP_PSA.HasValue)
        {
            var preRP_PSA = state.preRP_PSA.Value;
            output["PreRP_PSA_Date"] = FormatDate(preRP_PSA.Key);
            output["PreRP_PSA_Value"] = preRP_PSA.Value;
        }

        if (!state.baselinePSA_Date.HasValue)
        {
            KeyValuePair<DateTime, string>? baselinePSA = null;

            // handle scardino baseline if necessary
            if (state.lastMSK_PSA.HasValue)
            {
                baselinePSA = state.lastMSK_PSA.Value;
            }
            else if (state.lastOutsidePSA.HasValue)
            {
                baselinePSA = state.lastOutsidePSA.Value;
            }

            if (baselinePSA.HasValue)
            {
                state.baselinePSA_Date = baselinePSA.Value.Key;
                output["PTS_BaselinePSA_Date"] = FormatDate(baselinePSA.Value.Key);
                output["PTS_BaselinePSA_Value"] = baselinePSA.Value.Value;
            }
        }

        return output;
    }

    private IDictionary<string, string> HandleEvent_PSA(PatientState state, IDataRecord record)
    {
        // flag potential dx, pre-rp PSAs (handlers for those events will handle output)
        // output date/value of first bcr PSA when second rise >= .1 seen

        Dictionary<string, string> output = new Dictionary<string, string>();
        DateTime psaDate = record.GetDateTime(1);

        if (!state.dxDate.HasValue)
        {
            // update state but don't output
            // DateTime psaDate = record.GetDateTime(1);

            // take the highest quality PSA
            if (!state.preDxPSA.HasValue || (psaDate > state.preDxPSA.Value.Key))
            {
                string rawPSA_Value = record[5].ToString(); // allow bogons
                state.preDxPSA = new KeyValuePair<DateTime, string>(psaDate, rawPSA_Value);
            }
        }

        #region scardino baseline reference
        /* 
            Scardino baseline
        1.	Baseline PSA before treatment – the “baseline” PSA used in nomograms to predict 
            pathologic stage and prognosis (cancer recurrence or survival) should be selected as follows:
        a.	The PSA at MSKCC before the baseline biopsy and before initiation of any treatment 
            for prostate cancer (surgery, radiation or hormone therapy)
        b.	IF no MSKCC PSA is available before biopsy, THEN the MSKCC PSA immediately before treatment  
            (surgery, radiation or hormone therapy) AS LONG AS that PSA is at least 3 weeks 
            after a prostate biopsy of cystoscopy
        c.	IF no MSKCC PSA is available that fits definitions a. or b., 
            THEN use the OUTSIDE PSA immediately before the prostate biopsy
        d.	IF no OUTSIDE PSA is available before the biopsy, the OUTSIDE PSA 
            at least 3 weeks or more after the biopsy
        */
        #endregion

        // translation
        // if predx and [rp, radtx, horm] dates are null, update last msk/out PSAs
        // if post dx and [rp, radtx, horm] dates are null, 
        //     and PSA date >= dx date + 3 weeks, update last msk/out PSAs

        // update states for Scardino baseline
        if (!(state.rpDate.HasValue || state.firstPreRP_HormoneStartDate.HasValue ||
                state.preRP_RadiationDate.HasValue))
        {
            int qualitySort = record.GetInt32(3);
            string psaValue = record[5].ToString();
            double psaValueParsed;

            if (TryParsePSA(psaValue, out psaValueParsed))
            {
                var psa = new KeyValuePair<DateTime, string>(psaDate, psaValueParsed.ToString());

                // TODO: only accept numeric PSAs
                // TODO: OUT PSAs aren't being considered

                if (!state.dxDate.HasValue)
                {
                    if (qualitySort > 2 && (!state.lastMSK_PSA.HasValue || psaDate > state.lastMSK_PSA.Value.Key))
                    {
                        state.lastMSK_PSA = psa;
                    }

                    if (qualitySort <= 2 && (!state.lastOutsidePSA.HasValue || psaDate > state.lastOutsidePSA.Value.Key))
                    {
                        state.lastOutsidePSA = psa;
                    }
                }
                else if ((psaDate - state.dxDate.Value).Days >= 21)
                {
                    if (qualitySort > 2 &&
                        (!state.lastMSK_PSA.HasValue ||
                         (state.lastMSK_PSA.Value.Key > state.dxDate.Value && psaDate > state.lastMSK_PSA.Value.Key)))
                    {
                        state.lastMSK_PSA = psa;
                    }

                    if (qualitySort <= 2 &&
                        (!state.lastOutsidePSA.HasValue ||
                         (state.lastOutsidePSA.Value.Key > state.dxDate.Value && psaDate > state.lastOutsidePSA.Value.Key)))
                    {
                        state.lastOutsidePSA = psa;
                    }
                }
            }
        }

        if (!state.rpDate.HasValue)
        {
            // update state but don't output
            // DateTime psaDate = record.GetDateTime(1);

            // take the highest quality PSA
            if (!state.preRP_PSA.HasValue || (psaDate > state.preRP_PSA.Value.Key))
            {
                string rawPSA_Value = record[5].ToString(); // allow bogons
                state.preRP_PSA = new KeyValuePair<DateTime, string>(psaDate, rawPSA_Value);
            }
        }
        else if (state.bcrPSAs.Count < 2)
        {
            // check for bcr after 42 days
            // only one PSA / day
            // DateTime labDate = record.GetDateTime(1);

            //if ((labDate - state.rpDate.Value).Days < 42 ||
            //    (state.bcrPSAs.Count == 1 && labDate == state.bcrPSAs[0].Key))
            //{
            //    return new Dictionary<string, string>();
            //}

            if ((psaDate - state.rpDate.Value).Days >= 42 &&
                !(state.bcrPSAs.Count == 1 && psaDate == state.bcrPSAs[0].Key))
            {
                string labResult = record[5].ToString();
                double psa;

                if (TryParsePSA(labResult, out psa) && psa >= 0.1)
                {
                    // update state

                    state.bcrPSAs.Add(new KeyValuePair<DateTime, double>(psaDate, psa));

                    if (state.bcrPSAs.Count == 2)
                    {
                        // output
                        var bcrPSA = state.bcrPSAs[0];
                        DateTime bcrPSA_Date = bcrPSA.Key;
                        double bcrFreeTimeDays = (bcrPSA_Date - state.rpDate.Value).Days;
                        double bcrFreeTimeMonths = bcrFreeTimeDays / DAYS_PER_MONTH;
                        double bcrFreeTimeYears = bcrFreeTimeDays / DAYS_PER_YEAR;

                        //return new Dictionary<string, string>
                        //{
                        //    { "BCR_Date", FormatDate(bcrPSA_Date) },
                        //    { "BCR_PSA_Value", bcrPSA.Value.ToString() },
                        //    { "BCR_FreeTime", bcrFreeTimeDays.ToString() },
                        //    { "BCR_FreeTimeMonths", bcrFreeTimeMonths.ToString() },
                        //    { "BCR_FreeTimeYears", bcrFreeTimeYears.ToString() }
                        //};

                        output["BCR_Date"] = FormatDate(bcrPSA_Date);
                        output["BCR_PSA_Value"] = bcrPSA.Value.ToString();
                        output["BCR_FreeTimeDays"] = bcrFreeTimeDays.ToString();
                        output["BCR_FreeTimeMonths"] = bcrFreeTimeMonths.ToString();
                        output["BCR_FreeTimeYears"] = bcrFreeTimeYears.ToString();
                    }
                }
            }
        }

        #region scardino bcr reference .1 -> .11
        /*
         * (Scardino)
         *  2.	The date of Biochemical recurrence is:
         *      a.	The date of the first PSA after RP that is 0.10 ng/ml or greater, 
         *          IF there is a subsequent, confirmatory PSA 0.11 or greater, or
         *      b.	The date of initiation of additional therapy for prostate cancer 
         *          (radiation or hormones therapy) IF the PSA before additional therapy 
         *          is detectable (>= 0.05 ng/ml)
         */
        #endregion

        // if we're post-rp and we haven't recorded a scardino bcr yet
        if (state.rpDate.HasValue && !state.scardinoBcrDate.HasValue)
        {
            // record all psas with new dates
            // if psa >= .1 and scardinoFirstBCR_PSA is empty, set scardinoFirstBCR_PSA
            // if scardinoFirstBCR_PSA is non-empty and psa >= .11, EMIT scardinoBCR_Date = scardinoFirstBCR_PSA
            // DateTime labDate = record.GetDateTime(1);

            if ((psaDate - state.rpDate.Value).Days >= 42 &&
                (state.scardinoPSAs.Count == 0 || psaDate > state.scardinoPSAs.Last().Key))
            {
                string labResult = record[5].ToString();
                double psa;

                if (TryParsePSA(labResult, out psa))
                {
                    var currentPSA = new KeyValuePair<DateTime, double>(psaDate, psa);
                    state.scardinoPSAs.Add(currentPSA);

                    if (!state.scardinoFirstBcrPSA.HasValue)
                    {
                        if (psa >= .1)
                        {
                            state.scardinoFirstBcrPSA = currentPSA;
                        }
                    }
                    else
                    {
                        if (psa >= .11)
                        {
                            state.scardinoBcrDate = state.scardinoFirstBcrPSA.Value.Key;

                            double freetimeDays = (state.scardinoBcrDate.Value - state.rpDate.Value).Days;
                            double freetimeMonths = freetimeDays / DAYS_PER_MONTH;
                            double freetimeYears = freetimeDays / DAYS_PER_YEAR;

                            output["PTS_BCR_1_11_Date"] = FormatDate(state.scardinoBcrDate.Value);
                            output["PTS_BCR_1_11_Type"] = "PSA";
                            output["PTS_BCR_1_11_PSA_Value"] = state.scardinoFirstBcrPSA.Value.Value.ToString();
                            output["PTS_BCR_1_11_FreeTimeDays"] = freetimeDays.ToString();
                            output["PTS_BCR_1_11_FreeTimeMonths"] = freetimeMonths.ToString();
                            output["PTS_BCR_1_11_FreeTimeYears"] = freetimeYears.ToString();
                        }
                    }
                }
            }
        }

        #region scardino bcr reference .1 -> .1
        /*
         * (Scardino)
         *  2.	The date of Biochemical recurrence is:
         *      a.	The date of the first PSA after RP that is 0.10 ng/ml or greater, 
         *          IF there is a subsequent, confirmatory PSA 0.10 or greater, or
         *      b.	The date of initiation of additional therapy for prostate cancer 
         *          (radiation or hormones therapy) IF the PSA before additional therapy 
         *          is detectable (>= 0.05 ng/ml)
         */
        #endregion

        // if we're post-rp and we haven't recorded a scardino 01 bcr yet
        // NOTE: this is a copy/paste with SUBTLE difference, non-DRY because I want
        // this calculation to be independent of the handling of .1 -> .11 
        if (state.rpDate.HasValue && !state.scardino_01_01_BcrDate.HasValue)
        {
            if ((psaDate - state.rpDate.Value).Days >= 42 &&
                (state.scardino_01_01_PSAs.Count == 0 || psaDate > state.scardino_01_01_PSAs.Last().Key))
            {
                string labResult = record[5].ToString();
                double psa;

                if (TryParsePSA(labResult, out psa))
                {
                    var currentPSA = new KeyValuePair<DateTime, double>(psaDate, psa);
                    state.scardino_01_01_PSAs.Add(currentPSA);

                    if (!state.scardino_01_01_FirstBcrPSA.HasValue)
                    {
                        if (psa >= .1)
                        {
                            state.scardino_01_01_FirstBcrPSA = currentPSA;
                        }
                    }
                    else
                    {
                        if (psa >= .1)
                        {
                            state.scardino_01_01_BcrDate = state.scardino_01_01_FirstBcrPSA.Value.Key;

                            double freetimeDays = (state.scardino_01_01_BcrDate.Value - state.rpDate.Value).Days;
                            double freetimeMonths = freetimeDays / DAYS_PER_MONTH;
                            double freetimeYears = freetimeDays / DAYS_PER_YEAR;

                            output["PTS_BCR_1_1_Date"] = FormatDate(state.scardino_01_01_BcrDate.Value);
                            output["PTS_BCR_1_1_Type"] = "PSA";
                            output["PTS_BCR_1_1_PSA_Value"] = state.scardino_01_01_FirstBcrPSA.Value.Value.ToString();
                            output["PTS_BCR_1_1_FreeTimeDays"] = freetimeDays.ToString();
                            output["PTS_BCR_1_1_FreeTimeMonths"] = freetimeMonths.ToString();
                            output["PTS_BCR_1_1_FreeTimeYears"] = freetimeYears.ToString();
                        }
                    }
                }
            }
        }

        return output;
    }

    private IDictionary<string, string> HandleEvent_CLINICAL_STAGE(PatientState state, IDataRecord record)
    {
        Dictionary<string, string> output = new Dictionary<string, string>();

        // find the last pre-rp clinical stage
        if (state.rpDate.HasValue)
        {
            return output;
        }

        string[] values = UnpipeData(record);

        // TODO: this could be null given MB's revisions
        string formattedClinStageDate = null;
        DateTime? clinStageDate = null;
        if (!record.IsDBNull(1))
        {
            clinStageDate = record.GetDateTime(1);
            formattedClinStageDate = FormatDate(clinStageDate.Value);
        }
        
        string clinStageSystem = values[0]; // ClinStageSystem
        string clinT_Stage = values[1]; // ClinStageT
        string clinN_Stage = values[2]; // ClinStageN
        string clinM_Stage = values[3]; // ClinStageM
        string clinStageQuality = record[4].ToString();

        if (!state.firstClinicalStageDate.HasValue)
        {
            state.firstClinicalStageDate = clinStageDate ?? DateTime.Today;

            if (clinStageDate.HasValue)
            {
                output["FirstClinStageDate"] = formattedClinStageDate;
            }
            output["FirstClinStageSystem"] = clinStageSystem;
            output["FirstClinT_Stage"] = clinT_Stage;
            output["FirstClinN_Stage"] = clinN_Stage;
            output["FirstClinM_Stage"] = clinM_Stage;
            output["FirstClinStageQuality"] = clinStageQuality;
        }

        if (clinStageDate.HasValue)
        {
            output["ClinStageDate"] = formattedClinStageDate;
        }
        output["ClinStageSystem"] = clinStageSystem;
        output["ClinT_Stage"] = clinT_Stage;
        output["ClinN_Stage"] = clinN_Stage;
        output["ClinM_Stage"] = clinM_Stage;
        output["ClinStageQuality"] = clinStageQuality;

        return output;
    }

    private IDictionary<string, string> HandleEvent_HORMONES(PatientState state, IDataRecord record)
    {
        // accumulate hormones
        // output the earliest start date
        // output the latest stop date
        if (!state.rpDate.HasValue)
        {
            string[] values = UnpipeData(record);

            // update state
            state.preRP_HormoneTypes.Add(values[0]);

            if (!state.firstPreRP_HormoneStartDate.HasValue)
            {
                state.firstPreRP_HormoneStartDate = record.GetDateTime(1);
            }

            // output
            string stopDate = values[2];
            double? duration = null;
            if (!string.IsNullOrEmpty(stopDate))
            {
                duration = (DateTime.Parse(stopDate) - state.firstPreRP_HormoneStartDate.Value).Days;
            }

            Dictionary<string, string> output = new Dictionary<string, string>()
            {
                { "NeoAdjHormType", string.Join(";", state.preRP_HormoneTypes.ToArray()) },
                { "NeoAdjHormStartDate", FormatDate(state.firstPreRP_HormoneStartDate.Value) },
                { "NeoAdjHormStopDate", values[2] },
                { "NeoAdjHormDuration", duration.HasValue ? duration.ToString() : "" }
            };

            if (!state.baselinePSA_Date.HasValue)
            {
                KeyValuePair<DateTime, string>? baselinePSA = null;

                // handle scardino baseline if necessary
                if (state.lastMSK_PSA.HasValue)
                {
                    baselinePSA = state.lastMSK_PSA.Value;
                }
                else if (state.lastOutsidePSA.HasValue)
                {
                    baselinePSA = state.lastOutsidePSA.Value;
                }

                if (baselinePSA.HasValue)
                {
                    state.baselinePSA_Date = baselinePSA.Value.Key;
                    output["PTS_BaselinePSA_Date"] = FormatDate(baselinePSA.Value.Key);
                    output["PTS_BaselinePSA_Value"] = baselinePSA.Value.Value;
                }
            }

            return output;
        }
        else
        {
            string[] values = UnpipeData(record);

            // update state
            state.postRP_HormoneTypes.Add(values[0]);

            if (!state.firstPostRP_HormoneStartDate.HasValue)
            {
                state.firstPostRP_HormoneStartDate = record.GetDateTime(1);
            }

            // output
            string stopDate = values[2];
            double? duration = null;
            if (!string.IsNullOrEmpty(stopDate))
            {
                duration = (DateTime.Parse(stopDate) - state.firstPostRP_HormoneStartDate.Value).Days;
            }

            Dictionary<string, string> output = new Dictionary<string, string>
            {
                { "PostRP_HormType", string.Join(";", state.postRP_HormoneTypes.ToArray()) },
                { "PostRP_HormStartDate", FormatDate(state.firstPostRP_HormoneStartDate.Value) },
                { "PostRP_HormStopDate", values[2] },
                { "PostRP_HormDuration", duration.HasValue ? duration.ToString() : "" }
            };

            /*
             * (Scardino)
             *  2.	The date of Biochemical recurrence is:
             *      a.	The date of the first PSA after RP that is 0.10 ng/ml or greater, 
             *          IF there is a subsequent, confirmatory PSA 0.11 or greater, or
             *      b.	The date of initiation of additional therapy for prostate cancer 
             *          (radiation or hormones therapy) IF the PSA before additional therapy 
             *          is detectable (>= 0.05 ng/ml)
             *          -- UPDATE 2014:
             *          PTS: "As long as the PSA >= 0.05 and confirmed on a separate occasion it
             *          does not matter if the level just before radiation is <0.05."
             *          BAS translation: 2 or more PSAs >= 0.05
             */

            if (!state.scardinoBcrDate.HasValue && 
                state.scardinoPSAs.Count > 0 && 
                state.scardinoPSAs.Count(psa => psa.Value >= 0.05) >= 2)
            {
                state.scardinoBcrDate = state.firstPostRP_HormoneStartDate;

                double freetimeDays = (state.scardinoBcrDate.Value - state.rpDate.Value).Days;
                double freetimeMonths = freetimeDays / DAYS_PER_MONTH;
                double freetimeYears = freetimeDays / DAYS_PER_YEAR;

                output["PTS_BCR_1_11_Date"] = FormatDate(state.scardinoBcrDate.Value);
                output["PTS_BCR_1_11_Type"] = "Hormones";
                output["PTS_BCR_1_11_PSA_Value"] = state.scardinoPSAs.Last().Value.ToString();
                output["PTS_BCR_1_11_FreeTimeDays"] = freetimeDays.ToString();
                output["PTS_BCR_1_11_FreeTimeMonths"] = freetimeMonths.ToString();
                output["PTS_BCR_1_11_FreeTimeYears"] = freetimeYears.ToString();
            }

            /*
             * (Scardino)
             *  2.	The date of Biochemical recurrence is:
             *      a.	The date of the first PSA after RP that is 0.10 ng/ml or greater, 
             *          IF there is a subsequent, confirmatory PSA 0.10 or greater, or
             *      b.	The date of initiation of additional therapy for prostate cancer 
             *          (radiation or hormones therapy) IF the PSA before additional therapy 
             *          is detectable (>= 0.05 ng/ml)
             *          -- UPDATE 2014:
             *          PTS: "As long as the PSA >= 0.05 and confirmed on a separate occasion it
             *          does not matter if the level just before radiation is <0.05."
             *          BAS translation: 2 or more PSAs >= 0.05
             */

            if (!state.scardino_01_01_BcrDate.HasValue &&
                state.scardino_01_01_PSAs.Count > 0 &&
                state.scardino_01_01_PSAs.Count(psa => psa.Value >= 0.05) >= 2)
            {
                state.scardino_01_01_BcrDate = state.firstPostRP_HormoneStartDate;

                double freetimeDays = (state.scardino_01_01_BcrDate.Value - state.rpDate.Value).Days;
                double freetimeMonths = freetimeDays / DAYS_PER_MONTH;
                double freetimeYears = freetimeDays / DAYS_PER_YEAR;

                output["PTS_BCR_1_1_Date"] = FormatDate(state.scardino_01_01_BcrDate.Value);
                output["PTS_BCR_1_1_Type"] = "Hormones";
                output["PTS_BCR_1_1_FreeTimeDays"] = freetimeDays.ToString();
                output["PTS_BCR_1_1_FreeTimeMonths"] = freetimeMonths.ToString();
                output["PTS_BCR_1_1_FreeTimeYears"] = freetimeYears.ToString();
            }

            return output;
        }
    }

    private IDictionary<string, string> HandleEvent_CHEMOTHERAPY(PatientState state, IDataRecord record)
    {
        if (!state.rpDate.HasValue)
        {
            if (state.preRP_ChemoDate.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // update state
            state.preRP_ChemoDate = record.GetDateTime(1);

            // output
            string[] values = UnpipeData(record);
            return new Dictionary<string, string>
            {
                { "NeoAdjChemoDate", FormatDate(state.preRP_ChemoDate.Value) },
                { "NeoAdjChemoAgent", values[1] } // MedTxAgent
            };
        }
        else
        {
            if (state.postRP_ChemoDate.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // update state
            state.postRP_ChemoDate = record.GetDateTime(1);

            // output
            string[] values = UnpipeData(record);
            double duration = (state.postRP_ChemoDate.Value - state.rpDate.Value).Days;
            double durationMonths = duration / DAYS_PER_MONTH;
            double durationYears = duration / DAYS_PER_YEAR;
            return new Dictionary<string, string>
            {
                { "PostRP_ChemoDate", FormatDate(state.postRP_ChemoDate.Value) },
                { "PostRP_ChemoAgent", values[1] }, // MedTxAgent
                { "PostRP_ChemoFreeTimeDays", duration.ToString() },
                { "PostRP_ChemoFreeTimeMonths", durationMonths.ToString() },
                { "PostRP_ChemoFreeTimeYears", durationYears.ToString() }
            };
        }
    }

    private IDictionary<string, string> HandleEvent_CLINICAL_TRIAL(PatientState state, IDataRecord record)
    {
        if (!state.rpDate.HasValue)
        {
            if (state.preRP_ClinicalTrialDate.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // update state
            state.preRP_ClinicalTrialDate = record.GetDateTime(1);

            // output
            string[] values = UnpipeData(record);
            return new Dictionary<string, string>
            {
                { "NeoAdjClinTrialDate", FormatDate(state.preRP_ClinicalTrialDate.Value) },
                { "NeoAdjClinTrialAgent", values[1] } // MedTxAgent
            };
        }
        else
        {
            if (state.postRP_ClinicalTrialDate.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // update state
            state.postRP_ClinicalTrialDate = record.GetDateTime(1);

            // output
            string[] values = UnpipeData(record);
            double duration = (state.postRP_ClinicalTrialDate.Value - state.rpDate.Value).Days;
            double durationMonths = duration / DAYS_PER_MONTH;
            double durationYears = duration / DAYS_PER_YEAR;
            return new Dictionary<string, string>
            {
                { "PostRP_ClinTrialDate", FormatDate(state.postRP_ClinicalTrialDate.Value) },
                { "PostRP_ClinTrialAgent", values[1] }, // MedTxAgent
                { "PostRP_ClinTrialFreeTimeDays", duration.ToString() },
                { "PostRP_ClinTrialFreeTimeMonths", durationMonths.ToString() },
                { "PostRP_ClinTrialFreeTimeYears", durationYears.ToString() }
            };
        }
    }

    private IDictionary<string, string> HandleEvent_RADIATION_THERAPY(PatientState state, IDataRecord record)
    {
        // pre or post-rp?
        if (!state.rpDate.HasValue)
        {
            if (state.preRP_RadiationDate.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // update state
            state.preRP_RadiationDate = record.GetDateTime(1);

            // output
            string[] values = UnpipeData(record);
            Dictionary<string, string> output = new Dictionary<string, string>()
            {
                { "NeoAdjRadTxType", values[0] }, // RadTxType
                { "NeoAdjRadTxDose", values[1] }, // RadTxTotalDose
                { "NeoAdjRadTxDate", FormatDate(state.preRP_RadiationDate.Value) },
                { "NeoAdjRadTxTarget", values[2] }, // RadTxTarget
                { "NeoAdjRadTxUnits", values[3] } // RadTxUnits
            };

            if (!state.baselinePSA_Date.HasValue)
            {
                KeyValuePair<DateTime, string>? baselinePSA = null;

                // handle scardino baseline if necessary
                if (state.lastMSK_PSA.HasValue)
                {
                    baselinePSA = state.lastMSK_PSA.Value;
                }
                else if (state.lastOutsidePSA.HasValue)
                {
                    baselinePSA = state.lastOutsidePSA.Value;
                }

                if (baselinePSA.HasValue)
                {
                    state.baselinePSA_Date = baselinePSA.Value.Key;
                    output["PTS_BaselinePSA_Date"] = FormatDate(baselinePSA.Value.Key);
                    output["PTS_BaselinePSA_Value"] = baselinePSA.Value.Value;
                }
            }
            
            return output;
        }
        else
        {
            if (state.postRP_RadiationDate.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // update state
            state.postRP_RadiationDate = record.GetDateTime(1);

            // output
            string[] values = UnpipeData(record);
            double duration = (state.postRP_RadiationDate.Value - state.rpDate.Value).Days;
            double durationMonths = duration / DAYS_PER_MONTH;
            double durationYears = duration / DAYS_PER_YEAR;
            string target = values[2];
            
            Dictionary<string, string> output = new Dictionary<string, string>
            {
                { "PostRP_RadTxType", values[0] }, // RadTxType
                { "PostRP_RadTxDose", values[1] }, // RadTxTotalDose
                { "PostRP_RadTxDate", FormatDate(state.postRP_RadiationDate.Value) },
                { "PostRP_RadTxTarget", target }, // RadTxTarget
                { "PostRP_RadTxUnits", values[3] }, // RadTxUnits
                { "PostRP_RadTxFreeTimeDays", duration.ToString() },
                { "PostRP_RadTxFreeTimeMonths", durationMonths.ToString() },
                { "PostRP_RadTxFreeTimeYears", durationYears.ToString() }
            };

            /*
             * (Scardino)
             *  2.	The date of Biochemical recurrence is:
             *      a.	The date of the first PSA after RP that is 0.10 ng/ml or greater, 
             *          IF there is a subsequent, confirmatory PSA 0.11 or greater, or
             *      b.	The date of initiation of additional therapy for prostate cancer 
             *          (radiation or hormones therapy) IF the PSA before additional therapy 
             *          is detectable (>= 0.05 ng/ml)
             *          -- UPDATE 2014:
             *          PTS: "As long as the PSA >= 0.05 and confirmed on a separate occasion it
             *          does not matter if the level just before radiation is <0.05."
             *          BAS translation: 2 or more PSAs >= 0.05
             */

            
            // TODO: AND 'prost' in target AND indication != 'adjuvant'
            string indication = values[4];
            if (!state.scardinoBcrDate.HasValue &&
                state.scardinoPSAs.Count > 0 &&
                state.scardinoPSAs.Count(psa => psa.Value >= 0.05) >= 2 &&
                target.ToLower().Contains("prost") &&
                !indication.ToLower().Contains("adjuvant"))
            {
                state.scardinoBcrDate = state.postRP_RadiationDate;

                double freetimeDays = (state.scardinoBcrDate.Value - state.rpDate.Value).Days;
                double freetimeMonths = freetimeDays / DAYS_PER_MONTH;
                double freetimeYears = freetimeDays / DAYS_PER_YEAR;

                output["PTS_BCR_1_11_Date"] = FormatDate(state.scardinoBcrDate.Value);
                output["PTS_BCR_1_11_Type"] = "Radiation";
                output["PTS_BCR_1_11_PSA_Value"] = state.scardinoPSAs.Last().Value.ToString();
                output["PTS_BCR_1_11_FreeTimeDays"] = freetimeDays.ToString();
                output["PTS_BCR_1_11_FreeTimeMonths"] = freetimeMonths.ToString();
                output["PTS_BCR_1_11_FreeTimeYears"] = freetimeYears.ToString();
            }

            /*
             * (Scardino)
             *  2.	The date of Biochemical recurrence is:
             *      a.	The date of the first PSA after RP that is 0.10 ng/ml or greater, 
             *          IF there is a subsequent, confirmatory PSA 0.10 or greater, or
             *      b.	The date of initiation of additional therapy for prostate cancer 
             *          (radiation or hormones therapy) IF the PSA before additional therapy 
             *          is detectable (>= 0.05 ng/ml)
             *          -- UPDATE 2014:
             *          PTS: "As long as the PSA >= 0.05 and confirmed on a separate occasion it
             *          does not matter if the level just before radiation is <0.05."
             *          BAS translation: 2 or more PSAs >= 0.05
             */

            if (!state.scardino_01_01_BcrDate.HasValue &&
                state.scardino_01_01_PSAs.Count > 0 &&
                state.scardino_01_01_PSAs.Count(psa => psa.Value >= 0.05) >= 2)
            {
                state.scardino_01_01_BcrDate = state.postRP_RadiationDate;

                double freetimeDays = (state.scardino_01_01_BcrDate.Value - state.rpDate.Value).Days;
                double freetimeMonths = freetimeDays / DAYS_PER_MONTH;
                double freetimeYears = freetimeDays / DAYS_PER_YEAR;

                output["PTS_BCR_1_1_Date"] = FormatDate(state.scardino_01_01_BcrDate.Value);
                output["PTS_BCR_1_1_Type"] = "Radiation";
                output["PTS_BCR_1_1_FreeTimeDays"] = freetimeDays.ToString();
                output["PTS_BCR_1_1_FreeTimeMonths"] = freetimeMonths.ToString();
                output["PTS_BCR_1_1_FreeTimeYears"] = freetimeYears.ToString();
            }

            return output;
        }
    }

    private IDictionary<string, string> HandleEvent_BRACHYTHERAPY(PatientState state, IDataRecord record)
    {
        if (!state.rpDate.HasValue)
        {
            if (state.preRP_BrachyDate.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // update state
            state.preRP_BrachyDate = record.GetDateTime(1);

            // output
            string[] values = UnpipeData(record);
            return new Dictionary<string, string>
            {
                { "NeoAdjBrachyType", values[0] }, // BrachyIsotope
                { "NeoAdjBrachyDose", values[1] }, // BrahcyPrescribedDose
                { "NeoAdjBrachyDate", FormatDate(state.preRP_BrachyDate.Value) }
            };
        }
        else
        {
            if (state.postRP_BrachyDate.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // update state
            state.postRP_BrachyDate = record.GetDateTime(1);

            // output
            string[] values = UnpipeData(record);
            double duration = (state.postRP_BrachyDate.Value - state.rpDate.Value).Days;
            double durationMonths = duration / DAYS_PER_MONTH;
            double durationYears = duration / DAYS_PER_YEAR;
            return new Dictionary<string, string>
            {
                { "PostRP_BrachyType", values[0] }, // BrachyIsotope
                { "PostRP_BrachyDose", values[1] }, // BrahcyPrescribedDose
                { "PostRP_BrachyDate", FormatDate(state.postRP_BrachyDate.Value) },
                { "PostRP_BrachyFreeTimeDays", duration.ToString() },
                { "PostRP_BrachyFreeTimeMonths", durationMonths.ToString() },
                { "PostRP_BrachyFreeTimeYears", durationYears.ToString() }
            };
        }
    }

    private IDictionary<string, string> HandleEvent_CLINICAL_METS(PatientState state, IDataRecord record)
    {
        if (!state.rpDate.HasValue)
        {
            return new Dictionary<string, string>
            {
                { "PreOpMets", "YES" }
            };
        }
        else 
        {
            if (state.postRP_MetsDate.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // update state
            state.postRP_MetsDate = record.GetDateTime(1);

            // output
            double duration = (state.postRP_MetsDate.Value - state.rpDate.Value).Days;
            double durationMonths = duration / DAYS_PER_MONTH;
            double durationYears = duration / DAYS_PER_YEAR;
            return new Dictionary<string, string>
            {
                { "MetsFreeTimeDays", duration.ToString() },
                { "MetsFreeTimeMonths", durationMonths.ToString() },
                { "MetsFreeTimeYears", durationYears.ToString() }
            };
        }
    }

    private IDictionary<string, string> HandleEvent_ACTIVE_SURVEILLANCE(PatientState state, IDataRecord record)
    {
        //string formattedActiveSurveillanceDate = string.Empty;
        //if (!record.IsDBNull(1))
        //{
        //    formattedActiveSurveillanceDate = FormatDate(record.GetDateTime(1));
        //}

        //return new Dictionary<string, string>
        //{
        //    { "ActiveSurveillance", "YES" },
        //    { "ActiveSurveillanceDate", formattedActiveSurveillanceDate }
        //};

        // TODO: call AS Date function
        // inputs: 1st as status date, 1st pos bx date, 1st msk bx date, 1st msk pos bx date,
        // 1st msk biopsy date after 1st pos bx
        if (record.IsDBNull(1) || state.rpDate.HasValue || state.firstActiveSurveillanceStatusDate.HasValue)
        {
            return new Dictionary<string, string>();
        }

        DateTime activeSurveillanceStatusDate = record.GetDateTime(1);
        
        // update state
        state.firstActiveSurveillanceStatusDate = activeSurveillanceStatusDate;

        // output
        DateTime? asDate = ProstateUtil.ActiveSurveillanceDate(state.firstActiveSurveillanceStatusDate,
                                                               state.firstPositiveBiopsyDate,
                                                               state.firstMSK_BiopsyDate,
                                                               state.firstPositiveMSK_BiopsyDate,
                                                               state.firstMSK_BiopsyDateAfterFirstPositiveBiopsy);
        if (!asDate.HasValue)
        {
            return new Dictionary<string, string>();
        }
        else
        {
            return new Dictionary<string, string>
            {
                { "ActiveSurveillance", "YES" },
                { "ActiveSurveillanceDate", FormatDate(asDate.Value) }
            };
        }

    }

    private IDictionary<string, string> HandleEvent_STATUS_DISEASE(PatientState state, IDataRecord record)
    {
        // if disease not in set:
        // 1. add disease to set and list
        // 2. output list
        string disease = record[5].ToString(); // Data
        if (string.IsNullOrEmpty(disease) || state.diseaseStatusSet.Contains(disease))
        {
            return new Dictionary<string, string>();
        }

        // update state
        state.diseaseStatusSet.Add(disease);
        state.diseaseStatuses.Add(disease);

        // output
        return new Dictionary<string, string>
        {
            { "DiseaseStatus", string.Join(";", state.diseaseStatuses.ToArray()) }
        };
    }
    
    private IDictionary<string, string> HandleEvent_MRI(PatientState state, IDataRecord record)
    {
        Dictionary<string, string> output = new Dictionary<string, string>();
        DateTime mriDate = record.GetDateTime(1);

        if (state.rpDate.HasValue && mriDate > state.rpDate.Value)
        {
            return new Dictionary<string, string>();
        }

        string formattedDate = FormatDate(mriDate);
        if (!state.preRP_FirstMRI_Date.HasValue)
        {
            state.preRP_FirstMRI_Date = mriDate;
            output["FirstPreRP_MRI_Date"] = formattedDate;
        }

        output["LastPreRP_MRI_Date"] = formattedDate;
        return output;
    }
    
    private IDictionary<string, string> HandleEvent_ERECTILE_FUNCTION(PatientState state, IDataRecord record)
    {
        DateTime surveyDate = record.GetDateTime(1);
        string[] values = UnpipeData(record);
        if (!state.rpDate.HasValue || surveyDate == state.rpDate.Value)
        {
            if (state.baselineSurgeonEF.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // baseline
            foreach (string v in values)
            {
                // SurveyResult > SurveyTotal > SurveyItemResult
                if (string.IsNullOrEmpty(v))
                {
                    continue;
                }

                double result;
                if (TryParseSurgeonSurveyResult(v, out result))
                {
                    state.baselineSurgeonEF =
                        new KeyValuePair<DateTime, double>(surveyDate, result);

                    return new Dictionary<string, string>()
                    {
                        { "BaselineErectileFunction", result.ToString() },
                        { "BaselineErectileFunctionDate", FormatDate(surveyDate) }
                    };
                }
            }
        }
        else if (state.rpDate.Value.AddMonths(18) <= surveyDate &&
                 surveyDate <= state.rpDate.Value.AddMonths(30))
        {
            foreach (string v in values)
            {
                if (string.IsNullOrEmpty(v))
                {
                    continue;
                }

                double result;
                if (TryParseSurgeonSurveyResult(v, out result))
                {
                    return new Dictionary<string, string>()
                    {
                        { "RecentErectileFunction", result.ToString() },
                        { "RecentErectileFunctionDate", FormatDate(surveyDate) }
                    };
                }
            }
        }

        return new Dictionary<string, string>();
    }

    private IDictionary<string, string> HandleEvent_URINARY_FUNCTION(PatientState state, IDataRecord record)
    {
        DateTime surveyDate = record.GetDateTime(1);
        string[] values = UnpipeData(record);
        if (!state.rpDate.HasValue || surveyDate == state.rpDate.Value)
        {
            if (state.baselineSurgeonUF.HasValue)
            {
                return new Dictionary<string, string>();
            }

            // baseline
            foreach (string v in values)
            {
                // SurveyResult > SurveyTotal > SurveyItemResult
                if (string.IsNullOrEmpty(v))
                {
                    continue;
                }

                double result;
                if (TryParseSurgeonSurveyResult(v, out result))
                {
                    state.baselineSurgeonUF =
                        new KeyValuePair<DateTime, double>(surveyDate, result);

                    return new Dictionary<string, string>()
                    {
                        { "BaselineUrinaryFunction", result.ToString() },
                        { "BaselineUrinaryFunctionDate", FormatDate(surveyDate) }
                    };
                }
            }
        }
        else if (state.rpDate.Value.AddMonths(18) <= surveyDate &&
                 surveyDate <= state.rpDate.Value.AddMonths(30))
        {
            foreach (string v in values)
            {
                if (string.IsNullOrEmpty(v))
                {
                    continue;
                }

                double result;
                if (TryParseSurgeonSurveyResult(v, out result))
                {
                    return new Dictionary<string, string>()
                    {
                        { "RecentUrinaryFunction", result.ToString() },
                        { "RecentUrinaryFunctionDate", FormatDate(surveyDate) }
                    };
                }
            }
        }

        return new Dictionary<string, string>();
    }

    private IDictionary<string, string> HandleEvent_COMPLICATION(PatientState state, IDataRecord record)
    {
        // company (1/0), compint (grade or 0), compmaj (max >= 3 ? 1 : 0)
        // within 90 days of surgery
        if (record.IsDBNull(1))
        {
            return new Dictionary<string, string>();
        }

        DateTime compDate = record.GetDateTime(1);
        if (!state.rpDate.HasValue || (compDate - state.rpDate.Value).Days > 90)
        {
            return new Dictionary<string, string>();
        }

        string[] values = UnpipeData(record);
        string rawToxGrade = values[0]; // ToxGrade
        int toxGrade;

        if (int.TryParse(rawToxGrade, out toxGrade))
        {
            state.complicationGrades.Add(toxGrade);
        }
        else
        {
            state.complicationGrades.Add(0);
        }

        int compMax = state.complicationGrades.Max();

        // keep updating comp output
        return new Dictionary<string, string>()
            {
                {"MaxSurgicalComplicationsGrade", compMax.ToString() }
            };
    }

    private IDictionary<string, string> HandleEvent_PROSTATE_QOL_SURVEY(PatientState state, IDataRecord record)
    {
        // recent_ef_patient, recent_uf_patient, recent_patient_survey_date
        DateTime surveyDate = record.GetDateTime(1);
        
        Dictionary<string, string> output = new Dictionary<string, string>();
        string[] values = UnpipeData(record);
        string surveyItemData = values[1];

        // build survey dictionary
        Dictionary<string, string> surveyItems = new Dictionary<string, string>();
        foreach (string i in surveyItemData.Split('|'))
        {
            string[] item = i.Split(':');
            if (item.Length == 2)
            {
                surveyItems[item[0].Trim()] = item[1].Trim();
            }
        }

        // ef (2, 3, 4, 5, 6, 7)
        int efAnsweredCount = 0;
        int efAnswerSum = 0;
        for (int i = 2; i <= 7; i++)
        {
            string key = i.ToString();
            if (!surveyItems.ContainsKey(key))
            {
                continue;
            }

            string a = surveyItems[key];
            int answer;
            if (!int.TryParse(a, out answer))
            {
                continue;
            }

            efAnswerSum += i == 2 ? answer : answer - 1;
            efAnsweredCount += 1;
        }

        // uf (8, 9, 10, 11, 12)
        int ufAnswerCount = 0;
        int ufAnswerSum = 0;
        for (int i = 8; i <= 12; i++)
        {
            string key = i.ToString();
            if (!surveyItems.ContainsKey(key))
            {
                continue;
            }

            string a = surveyItems[key];
            int answer;
            if (!int.TryParse(a, out answer))
            {
                continue;
            }

            ufAnswerSum += answer - 1;
            ufAnswerCount += 1;
        }

        // baseline vs recent
        if (!state.rpDate.HasValue || surveyDate == state.rpDate.Value)
        {
            output["BaselinePatientQOL_SurveyDate"] = FormatDate(surveyDate);

            if (efAnsweredCount > 0)
            {
                output["BaselinePatientErectileFunction"] = ((efAnswerSum / (float) efAnsweredCount) * 6).ToString();
            }

            if (ufAnswerCount > 0)
            {
                output["BaselinePatientUrinaryFunction"] = (21 - (ufAnswerSum / (float) ufAnswerCount) * 5).ToString();
            }
        }
        else if (state.rpDate.Value.AddMonths(18) <= surveyDate &&
                 surveyDate <= state.rpDate.Value.AddMonths(30))
        {
            output["RecentPatientQOL_SurveyDate"] = FormatDate(surveyDate);

            if (efAnsweredCount > 0)
            {
                output["RecentPatientErectileFunction"] = ((efAnswerSum / (float) efAnsweredCount) * 6).ToString();
            }

            if (ufAnswerCount > 0)
            {
                output["RecentPatientUrinaryFunction"] = (21 - (ufAnswerSum / (float) ufAnswerCount) * 5).ToString();
            }
        }

        // update last followup
        //if (!state.lastFollowupDate.HasValue || surveyDate > state.lastFollowupDate.Value)
        //{
        //    state.lastFollowupDate = surveyDate;
        //    output["lastfollowupdate"] = FormatDate(state.lastFollowupDate.Value);
        //}

        return output;
    }
    
    #endregion

    #region export logging
    private int LogDataExport(int userId, string selectedPatientsSql)
    {
        UserExport userExport = new UserExport();
        userExport[UserExport.ExportType] = "Data Export";
        userExport[UserExport.ExportName] = "Prostate Algorithm";
        userExport[UserExport.DiseaseType] = "Prostate";
        userExport[UserExport.Purpose] = ProjectPurpose;
        userExport[UserExport.ExportDate] = DateTime.Now;
        userExport[UserExport.PrivacyLevel] = ProjectPrivacyLevel;
        userExport[UserExport.IRB_ApprovalDate] = null;
        userExport[UserExport.IRB_ApprovalType] = ProjectIRB_ApprovalType;
        userExport[UserExport.UserLoginId] = userId;
        userExport.Save();

        int userExportId = (int) userExport[UserExport.UserExportId];

        // is this necessary if we're identifying patients?
        //UserExportPatientsDa da = new UserExportPatientsDa();
        //da.CreateTable(selectedPatientsSql, userExportId);

        return userExportId;
    }
    #endregion

    private SqlConnection GetSqlConnection()
    {
        return new SqlConnection(connectionString);
    }

    private string[] UnpipeData(IDataRecord record)
    {
        string[] pipes = { "||" };
        return record["Data"].ToString().Split(pipes, StringSplitOptions.None);
    }

    private string FormatDate(DateTime d)
    {
        return d.ToString("MM/dd/yyyy");
    }

    static Dictionary<char, string> PSA_Bogons = new Dictionary<char, string>
    {
        // { '<', null }, excluded
        { '>', null },
        { '~', null },
        { ' ', null }
    };

    // remove ('<', '>', '~', ' ')
    private bool TryParsePSA(string p, out double psa)
    {
        if (string.IsNullOrEmpty(p))
        {
            psa = 0;
            return false;
        }

        StringBuilder normalized = new StringBuilder();
        foreach (char c in p)
        {
            if (PSA_Bogons.ContainsKey(c))
            {
                continue;
            }

            normalized.Append(c);
        }

        return double.TryParse(normalized.ToString(), out psa);
    }

    private bool TryParseSurgeonSurveyResult(string s, out double result)
    {
        if (string.IsNullOrEmpty(s))
        {
            result = 0;
            return false;
        }

        if (s == "Continent")
        {
            result = 1;
            return true;
        }

        // handle ranges
        if (s.Contains('-') || s.Contains(','))
        {
            var tokens = s.Split('-', ',')
                          .Select(x => x.Trim())
                          .Select(x => x.StartsWith("(") ? x.Substring(1, 1) : x);

            if (tokens.Count() == 2)
            {
                int a, b;
                if (int.TryParse(tokens.ElementAt(0), out a) &&
                    int.TryParse(tokens.ElementAt(1), out b))
                {
                    result = (a + b) / 2.0;
                    return true;
                }
            }
        }

        return double.TryParse(s, out result);
    }
}

public class AlgorithmOptions
{
    public DateTime? MinimumDxDate { get; set; }
    public DateTime? MaximumDxDate { get; set; }
    public DateTime? MinimumRP_Date { get; set; }
    public DateTime? MaximumRP_Date { get; set; }

    public RP_Types SelectedRP_Types { get; set; }

    public bool ExportForExcel { get; set; }

    [Flags]
    public enum RP_Types
    {
        None = 0,
        CP = 1,
        LP = 2,
        LP_CONV = 4,
        PP = 8,
        RALP = 16,
        RP = 32,
        SalvCP = 64,
        SalvLP = 128,
        SalvRP = 256,
        SalvRALP = 512
    }
}