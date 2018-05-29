using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text;
using System.Web.Script.Serialization;

namespace Caisis.DataAccess
{
    public class DynamicNomogramDa
    {
        private static readonly float DAYS_PER_MONTH = 30.43685f;
        private static readonly float DAYS_PER_YEAR = 365.25f;
        private int? currentPatientId;
        private Dictionary<string, double> currentPreRP_Results = null;
        private Dictionary<string, double> currentPostRP_Results = null;

        public class NomogramResult
        {
            public NomogramResult() { }

            public NomogramResult(double? value, string valueDisplay, string errorMessage)
            {
                this.value = value;
                this.valueDisplay = valueDisplay;
                this.errorMessage = errorMessage;
            }

            public double? value;
            public string valueDisplay;
            public string errorMessage;
        }

        public class PreRP_Result
        {
            public NomogramResult cancerSpecificSurvival_10Year;
            public NomogramResult cancerSpecificSurvival_15Year;
            public NomogramResult progressionFree_5Year;
            public NomogramResult progressionFree_10Year;
            public NomogramResult ece;
            public NomogramResult lni;
            public NomogramResult ocd;
            public NomogramResult svi;
        }

        public class PostRP_Result
        {
            public NomogramResult recurrenceFree_2Year;
            public NomogramResult recurrenceFree_5Year;
            public NomogramResult recurrenceFree_7Year;
            public NomogramResult recurrenceFree_10Year;
            public NomogramResult cancerSpecificSurvival_15Year;
        }

        #region old
        //public double GetPreRP_Result(int patientId, int years)
        //{
        //    // TODO: STATE MANAGEMENT
        //    //if (patientId != currentPatientId)
        //    //{
        //    //    currentPreRP_Results = null;
        //    //    currentPostRP_Results = null;
        //    //    currentPatientId = patientId;
        //    //}

        //    //if (currentPreRP_Results == null)
        //    //{
                
        //    //}

        //    // get pretx data
        //    DataRow data = GetTreatmentData("spNomogramPreTxData", patientId);

        //    if (data == null)
        //    {
        //        throw new NomogramDataException("No biopsy noted.");
        //    }

        //    // run calculations
        //    string y = string.Format("pre-surgery_{0}-year_recurrence_free", years);
        //    var results = PreRP(data);

        //    if (results.ContainsKey(y) && results[y].HasValue)
        //    {
        //        return results[y].Value;
        //    }
        //    else
        //    {
        //        throw new NomogramDataException("NA");
        //    }
        //}

        //public double GetPostRP_Result(int patientId, int years)
        //{
        //    DataRow data = GetTreatmentData("spNomogramPostTxData", patientId);

        //    if (data == null)
        //    {
        //        throw new NomogramDataException("No biopsy noted.");
        //    }

        //    // run calculations
        //    string y = string.Format("post-surgery_{0}-year", years);
        //    var results = PostRP(data);

        //    if (results.ContainsKey(y) && results[y].HasValue)
        //    {
        //        return results[y].Value;
        //    }
        //    else
        //    {
        //        throw new NomogramDataException("NA");
        //    }
        //}
        #endregion

        #region sql
        string preTreatmentSql =
            @"SELECT
                Procedures.ProcDate AS RPDate,
                LabTests.LabResult AS PSA,
                ClinicalStages.ClinStageT,
                ClinicalStages.ClinStageSystem,
                ProstateBiopsyPath.PathPosCores AS BxPosCores,
                ProstateBiopsyPath.PathNumCores AS BxTotalCores,
                ProstateBiopsyPath.PathGG1 AS BxGG1,
                ProstateBiopsyPath.PathGG2 AS BxGG2,
                MIN(MedicalTherapy.MedTxDate) AS FirstHormDate,
                MIN(NeoAdjRadTx.RadTxDate) AS FirstXRTDate,
                RadiationTherapy.RadTxTotalDose,
                CASE Pathology.PathQuality
                    WHEN 'RR' THEN 4
                    WHEN 'STD' THEN 3
                    WHEN 'REV' THEN 2
                    WHEN 'OUT' THEN 1
                    ELSE 0
                END as QualitySort
            FROM

                Patients
    		
                    INNER JOIN Pathology ON Patients.PatientId = Pathology.PatientId
                    INNER JOIN ProstateBiopsyPath ON Pathology.PathologyId = ProstateBiopsyPath.PathologyId
		            INNER JOIN Procedures Biopsy ON Pathology.ProcedureId = Biopsy.ProcedureId

                    LEFT OUTER JOIN Procedures ON Patients.PatientId = Procedures.PatientId AND
                        Procedures.ProcName IN ('CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP','RPLND')

                    LEFT OUTER JOIN LabTests ON Patients.PatientId = LabTests.PatientId AND
                        LabTests.LabTestId = 
                        (
	                        SELECT TOP 1 LabTestId
	                        FROM LabTests
					            LEFT OUTER JOIN MedicalTherapy MT ON Patients.PatientId = MT.PatientId
						            AND ((MedTxType LIKE '%HORM%')
							            OR (MedTxType = 'ORCH')
							            OR (MedTxType ='Bilateral Orchiectomy')
							            OR (MedTxType LIKE 'ORCH_BIL%')
							            OR (MedTxType LIKE '%LHRH%')
							            OR (MedTxType LIKE '%AA%')
							            OR (MedTxType LIKE '%ESTROGEN%')
							            OR (MedTxType LIKE '%PROGEST%'))
							            AND (MedTxType NOT LIKE '%STOP')
					            LEFT OUTER JOIN RadiationTherapy RT ON Patients.PatientId = RT.PatientId
						            AND RadTxType
							            IN ('XRT','EBRT','RT','COMBO','BRACHY','COMBO','RADIOISOTOPE','SEED','IMPLANT','Brachytherapy',
								            'External Beam','Radiation Therapy, Unspecified','External Beam, IMRT',
								            'High-Dose Rate Brachytherapy','External Beam, 3D Conventional','External Beam, 3D Conformal') 
	                        WHERE LabTests.PatientId = Patients.PatientId
	                        AND LabTest = 'PSA'
	                        AND DATEDIFF(day,COALESCE(Procedures.ProcDate,GETDATE()),LabDate) <= 0
				            GROUP BY LabTestId, LabQuality, LabDate, LabResult
	                        ORDER BY 
					            --DATEDIFF(day,COALESCE(Procedures.ProcDate,GETDATE()),LabDate) DESC, 
					            -- 1. most recent prebx MSK PSA
					            -- 2. most recent pretx MSK PSA
					            -- 3. most recent prebx OUT PSA
					            -- 4. OUT PSA >= 3 weeks after bx
					            CASE
						            WHEN LabQuality IN ('RR', 'STD') THEN 1
						            ELSE 0
					            END DESC,
					            CASE
						            WHEN LabQuality IN ('RR', 'STD') THEN
							            DATEDIFF(day, 
								            COALESCE(Biopsy.ProcDate, Procedures.ProcDate, 
									            MIN(MT.MedTxDate), MIN(RT.RadTxDate), GETDATE()), 
									            LabDate)
						            ELSE
							            CASE
								            WHEN DATEDIFF(day, Biopsy.ProcDate, LabDate) <= 0 THEN
									            DATEDIFF(day, Biopsy.ProcDate, LabDate)
								            ELSE
									            0 - DATEDIFF(day, DATEADD(day, 21, Biopsy.ProcDate), LabDate)
							            END
					            END DESC,
		                        CASE LabQuality
			                        WHEN 'RR' THEN 4
			                        WHEN 'STD' THEN 3
			                        WHEN 'REV' THEN 2
			                        WHEN 'OUT' THEN 1
			                        ELSE 0
		                        END DESC, 
		                        LabResult DESC
                        )

                    LEFT OUTER JOIN ClinicalStages ON Patients.PatientId = ClinicalStages.PatientId AND
                        ClinicalStages.ClinicalStageId =
                        (
	                        SELECT TOP 1 ClinicalStageId
	                        FROM ClinicalStages
	                        WHERE PatientId = Patients.PatientId
	                        AND DATEDIFF(day,COALESCE(Procedures.ProcDate,GETDATE()),ClinStageDate) <= 0
	                        ORDER BY DATEDIFF(day,COALESCE(Procedures.ProcDate,GETDATE()),ClinStageDate) DESC, 
		                        CASE ClinStageQuality
			                        WHEN 'RR' THEN 4
			                        WHEN 'STD' THEN 3
			                        WHEN 'REV' THEN 2
			                        WHEN 'OUT' THEN 1
			                        ELSE 0
		                        END DESC
                        )
    		
                    LEFT OUTER JOIN MedicalTherapy ON Patients.PatientId = MedicalTherapy.PatientId
                        AND ((MedicalTherapy.MedTxType LIKE '%HORM%')
	                        OR (MedicalTherapy.MedTxType = 'ORCH')
	                        OR (MedicalTherapy.MedTxType ='Bilateral Orchiectomy')
	                        OR (MedicalTherapy.MedTxType LIKE 'ORCH_BIL%')
	                        OR (MedicalTherapy.MedTxType LIKE '%LHRH%')
	                        OR (MedicalTherapy.MedTxType LIKE '%AA%')
	                        OR (MedicalTherapy.MedTxType LIKE '%ESTROGEN%')
	                        OR (MedicalTherapy.MedTxType LIKE '%PROGEST%'))
	                        AND (MedicalTherapy.MedTxType NOT LIKE '%STOP')

                    LEFT OUTER JOIN RadiationTherapy NeoAdjRadTx ON Patients.PatientId = NeoAdjRadTx.PatientId
                        AND NeoAdjRadTx.RadTxType
	                        IN ('XRT','EBRT','RT','COMBO','BRACHY','COMBO','RADIOISOTOPE','SEED','IMPLANT','Brachytherapy',
		                        'External Beam','Radiation Therapy, Unspecified','External Beam, IMRT',
		                        'High-Dose Rate Brachytherapy','External Beam, 3D Conventional','External Beam, 3D Conformal')

                    LEFT OUTER JOIN RadiationTherapy ON Patients.PatientId = RadiationTherapy.PatientId AND
                        RadiationTherapy.RadiationTherapyId =
                        (
	                        SELECT TOP 1 RadiationTherapyId
	                        FROM RadiationTherapy
	                        WHERE PatientId = Patients.PatientId
	                        AND RadTxType IN
		                        ('XRT','EBRT','RT','COMBO','BRACHY','COMBO','RADIOISOTOPE','SEED','IMPLANT','Brachytherapy',
			                        'External Beam','Radiation Therapy, Unspecified','External Beam, IMRT',
			                        'High-Dose Rate Brachytherapy','External Beam, 3D Conventional','External Beam, 3D Conformal')
	                        ORDER BY RadTxDate ASC
                        )

            WHERE Patients.PatientId = @PatientId

            GROUP BY Procedures.ProcDate, LabTests.LabResult, ClinicalStages.ClinStageT, ClinicalStages.ClinStageSystem,
                ProstateBiopsyPath.PathPosCores, ProstateBiopsyPath.PathNumCores, ProstateBiopsyPath.PathPosCores,
                ProstateBiopsyPath.PathGG1, ProstateBiopsyPath.PathGG2, RadiationTherapy.RadTxTotalDose, Pathology.PathQuality

            ORDER BY QualitySort DESC";

        string postTreatmentSql =
            @"SELECT
	            Procedures.ProcDate as RPDate,
                MIN(MedicalTherapy.MedTxDate) as FirstHormDate,
                MIN(RadiationTherapy.RadTxDate) as FirstXRTDate,
                LabTests.LabResult AS PSA,
                PP.PathGG1,
                PP.PathGG2,
                PP.PathMargin as Margin,
                PP.PathSV_Inv as SVI,
                CASE 
		            WHEN PP.PathExtension LIKE 'inv%' THEN 'Negative'
		            ELSE PP.PathExtension
	            END as ECE,
                Pathology.PathResult as LNI,
                CASE PP.PathQuality
                    WHEN 'RR' THEN 4
                    WHEN 'STD' THEN 3
                    WHEN 'REV' THEN 2
                    WHEN 'OUT' THEN 1
                    ELSE 0
                END as QualitySort
            FROM
                Procedures
		            LEFT OUTER JOIN
                    (
			            SELECT PatientId, ProcedureId, PathGG1, PathGG2, PathMargin, PathSV_Inv, PathExtension,PathQuality
			            FROM Pathology a INNER JOIN ProstatectomyPath b ON a.PathologyId = b.PathologyId
			            WHERE PatientId = @PatientId
                    ) PP 
			            ON Procedures.ProcedureId = PP.ProcedureId

		            LEFT OUTER JOIN Pathology BxPath ON Procedures.PatientId = BxPath.PatientId
                    INNER JOIN ProstateBiopsyPath ON BxPath.PathologyId = ProstateBiopsyPath.PathologyId
		            INNER JOIN Procedures Biopsy ON BxPath.ProcedureId = Biopsy.ProcedureId

                    LEFT OUTER JOIN LabTests ON Procedures.PatientId = LabTests.PatientId AND
                        LabTests.LabTestId = 
                        (
	                        SELECT TOP 1 LabTestId
	                        FROM LabTests
					            LEFT OUTER JOIN MedicalTherapy MT ON Procedures.PatientId = MT.PatientId
						            AND ((MedTxType LIKE '%HORM%')
							            OR (MedTxType = 'ORCH')
							            OR (MedTxType ='Bilateral Orchiectomy')
							            OR (MedTxType LIKE 'ORCH_BIL%')
							            OR (MedTxType LIKE '%LHRH%')
							            OR (MedTxType LIKE '%AA%')
							            OR (MedTxType LIKE '%ESTROGEN%')
							            OR (MedTxType LIKE '%PROGEST%'))
							            AND (MedTxType NOT LIKE '%STOP')
					            LEFT OUTER JOIN RadiationTherapy RT ON Procedures.PatientId = RT.PatientId
						            AND RadTxType
							            IN ('XRT','EBRT','RT','COMBO','BRACHY','COMBO','RADIOISOTOPE','SEED','IMPLANT','Brachytherapy',
								            'External Beam','Radiation Therapy, Unspecified','External Beam, IMRT',
								            'High-Dose Rate Brachytherapy','External Beam, 3D Conventional','External Beam, 3D Conformal') 
	                        WHERE LabTests.PatientId = Procedures.PatientId
	                        AND LabTest = 'PSA'
	                        AND DATEDIFF(day,COALESCE(Procedures.ProcDate,GETDATE()),LabDate) <= 0
				            GROUP BY LabTestId, LabQuality, LabDate, LabResult
	                        ORDER BY 
					            --DATEDIFF(day,COALESCE(Procedures.ProcDate,GETDATE()),LabDate) DESC, 
					            -- 1. most recent prebx MSK PSA
					            -- 2. most recent pretx MSK PSA
					            -- 3. most recent prebx OUT PSA
					            -- 4. OUT PSA >= 3 weeks after bx
					            CASE
						            WHEN LabQuality IN ('RR', 'STD') THEN 1
						            ELSE 0
					            END DESC,
					            CASE
						            WHEN LabQuality IN ('RR', 'STD') THEN
							            DATEDIFF(day, 
								            COALESCE(Biopsy.ProcDate, Procedures.ProcDate, 
									            MIN(MT.MedTxDate), MIN(RT.RadTxDate), GETDATE()), 
									            LabDate)
						            ELSE
							            CASE
								            WHEN DATEDIFF(day, Biopsy.ProcDate, LabDate) <= 0 THEN
									            DATEDIFF(day, Biopsy.ProcDate, LabDate)
								            ELSE
									            0 - DATEDIFF(day, DATEADD(day, 21, Biopsy.ProcDate), LabDate)
							            END
					            END DESC,
		                        CASE LabQuality
			                        WHEN 'RR' THEN 4
			                        WHEN 'STD' THEN 3
			                        WHEN 'REV' THEN 2
			                        WHEN 'OUT' THEN 1
			                        ELSE 0
		                        END DESC, 
		                        LabResult DESC
                        )

                    LEFT OUTER JOIN Procedures PLND
			            ON Procedures.PatientId = PLND.PatientId
			            AND PLND.ProcName = 'PLND'

                    LEFT OUTER JOIN Pathology
                        ON PLND.ProcedureId = Pathology.ProcedureId
                        AND Pathology.PathSpecimenType = 'PLND'

                    LEFT OUTER JOIN MedicalTherapy
                        ON Procedures.PatientId = MedicalTherapy.PatientId
                        AND ((MedicalTherapy.MedTxType LIKE '%HORM%')
	                        OR (MedicalTherapy.MedTxType = 'ORCH')
	                        OR (MedicalTherapy.MedTxType ='Bilateral Orchiectomy')
	                        OR (MedicalTherapy.MedTxType LIKE 'ORCH_BIL%')
	                        OR (MedicalTherapy.MedTxType LIKE '%LHRH%')
	                        OR (MedicalTherapy.MedTxType LIKE '%AA%')
	                        OR (MedicalTherapy.MedTxType LIKE '%ESTROGEN%')
	                        OR (MedicalTherapy.MedTxType LIKE '%PROGEST%'))
	                        AND (MedicalTherapy.MedTxType NOT LIKE '%STOP')

                    LEFT OUTER JOIN RadiationTherapy
                        ON Procedures.PatientId = RadiationTherapy.PatientId
                        AND RadiationTherapy.RadTxType
	                        IN ('XRT','EBRT','RT','COMBO','BRACHY','COMBO','RADIOISOTOPE','SEED','IMPLANT','Brachytherapy',
		                        'External Beam','Radiation Therapy, Unspecified','External Beam, IMRT',
		                        'High-Dose Rate Brachytherapy','External Beam, 3D Conventional','External Beam, 3D Conformal')
            WHERE
                Procedures.ProcName IN ('CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP') AND
                Procedures.PatientId = @PatientId
    	
            GROUP BY Procedures.ProcDate, LabTests.LabResult, PP.PathGG1, PP.PathGG2, 
                PP.PathMargin, PP.PathSV_Inv, PP.PathExtension, Pathology.PathResult, PP.PathQuality
            ORDER BY QualitySort DESC";
        #endregion

        public PreRP_Result GetPreRP_Result(int patientId, string patientDateOfBirth)
        {
            DataRow row = GetTreatmentData(preTreatmentSql, patientId);

            if (row == null)
            {
                throw new NomogramDataException("No biopsy noted.");
            }

            return PreRP(row, patientDateOfBirth);
        }

        public PostRP_Result GetPostRP_Result(int patientId, string patientDateOfBirth)
        {
            DataRow row = GetTreatmentData(postTreatmentSql, patientId);

            if (row == null)
            {
                throw new NomogramDataException("No path record noted.");
            }

            return PostRP(row, patientDateOfBirth);
        }

        private DataRow GetTreatmentData(string sql, int patientId)
        {
            DataTable table = new DataTable();
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);

            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            DataAccessHelper.GetRecord(cmd, table);

            if (table.Rows.Count > 0)
            {
                return table.Rows[0];
            }
            else
            {
                return null;
            }
        }

        private string NOMOGRAM_SERVICE_URL = "http://vssurpweblib1/nomogram/production/v01";

        #region helper lambdas
        Func<Dictionary<string, double?>, string, NomogramResult> nr =
            (Dictionary<string, double?> dict, string key) =>
        {
            double? d = dict[key];
            return new NomogramResult(d, d.HasValue ? d.Value.ToString("F0") : "NA", null);
        };

        Func<string, NomogramResult> err = msg =>
        {
            return new NomogramResult(null, "NA", msg);
        };
        #endregion

        private PreRP_Result PreRP(DataRow row, string dobString)
        {
            PreRP_Result output = new PreRP_Result();

            _PreRP(row, dobString, "pre-op_dynamic",
                (results, error) =>
                {
                    if (error != null)
                    {
                        output.progressionFree_5Year = err(error);
                        output.progressionFree_10Year = err(error);
                    } 
                    else if (results != null)
                    {
                        output.progressionFree_5Year = nr(results, "pre-surgery_5-year_recurrence_free");
                        output.progressionFree_10Year = nr(results, "pre-surgery_10-year_recurrence_free");
                    }
                });

            _PreRP(row, dobString, "pre-op_cancer_specific_survival",
                (results, error) =>
                {
                    if (error != null)
                    {
                        output.cancerSpecificSurvival_10Year = err(error);
                        output.cancerSpecificSurvival_15Year = err(error);
                    }
                    else if (results != null)
                    {
                        output.cancerSpecificSurvival_10Year = nr(results, "cancer-specific_survival_10-year");
                        output.cancerSpecificSurvival_15Year = nr(results, "cancer-specific_survival_15-year");
                    }
                });

            _PreRP(row, dobString, "extracapsular_extension_dynamic",
                (results, error) =>
                {
                    if (error != null)
                    {
                        output.ece = err(error);
                    }
                    else if (results != null)
                    {
                        output.ece = nr(results, "extracapsular_extension");
                    }
                });

            _PreRP(row, dobString, "lymph_node_involvement_dynamic",
                (results, error) =>
                {
                    if (error != null)
                    {
                        output.lni = err(error);
                    }
                    else if (results != null)
                    {
                        output.lni = nr(results, "lymph_node_involvement");
                    }
                });

            _PreRP(row, dobString, "organ_confined_disease_dynamic",
                (results, error) =>
                {
                    if (error != null)
                    {
                        output.ocd = err(error);
                    }
                    else if (results != null)
                    {
                        output.ocd = nr(results, "organ_confined_disease");
                    }
                });

            _PreRP(row, dobString, "seminal_vesicle_invasion_dynamic",
                (results, error) =>
                {
                    if (error != null)
                    {
                        output.svi = err(error);
                    }
                    else if (results != null)
                    {
                        output.svi = nr(results, "seminal_vesicle_invasion");
                    }
                });

            return output;
        }

        private PostRP_Result PostRP(DataRow row, string dobString)
        {
            PostRP_Result output = new PostRP_Result();

            _PostRP(row, dobString, "post-op_dynamic",
                (results, error) =>
                {
                    if (error != null)
                    {
                        output.recurrenceFree_2Year = err(error);
                        output.recurrenceFree_5Year = err(error);
                        output.recurrenceFree_7Year = err(error);
                        output.recurrenceFree_10Year = err(error);
                    }
                    else if (results != null)
                    {
                        output.recurrenceFree_2Year = nr(results, "post-surgery_2-year");
                        output.recurrenceFree_5Year = nr(results, "post-surgery_5-year");
                        output.recurrenceFree_7Year = nr(results, "post-surgery_7-year");
                        output.recurrenceFree_10Year = nr(results, "post-surgery_10-year");
                    }
                });

            _PostRP(row, dobString, "post-op_cancer-specific_mortality",
                (results, error) =>
                {
                    if (error != null)
                    {
                        output.cancerSpecificSurvival_15Year = err(error);
                    }
                    else if (results != null)
                    {
                        output.cancerSpecificSurvival_15Year = nr(results, "post-surgery_pcss_15-year");
                    }
                });

            return output;
        }

        // TODO: refactor; inefficient

        private void _PreRP(DataRow row, string dobString, string serviceName, Action<Dictionary<string, double?>, string> updater)
        {
            var inputs = new Dictionary<string, object>
            {
                {"pre_treatment_psa", row["PSA"]},
                {"primary_biopsy_gleason", row["BxGG1"]},
                {"secondary_biopsy_gleason", row["BxGG2"]}
            };

            // tstage
            string ts = row["ClinStageT"].ToString();
            if (row["ClinStageSystem"].ToString() == "UICC_97")
            {
                inputs["clinical_tumor_stage_2010"] = NomogramDa.Convert97To92TStage(ts);
            }
            else
            {
                inputs["clinical_tumor_stage_2010"] = ts;
            }

            // cores
            int posCores;
            int totalCores;
            if (int.TryParse(row["BxPosCores"].ToString(), out posCores) &&
                int.TryParse(row["BxTotalCores"].ToString(), out totalCores))
            {
                int negCores = totalCores - posCores;
                if (negCores >= 0)
                {
                    inputs["biopsy_cores_positive"] = posCores;
                    inputs["biopsy_cores_negative"] = negCores;
                }
            }

            // neo stuff
            DateTime rpdate;
            DateTime hormdate;
            DateTime xrtdate;
            if (DateTime.TryParse(row["RPDate"].ToString(), out rpdate))
            {
                inputs["age"] = GetPatientAgeAtSurgery(dobString, rpdate);
                if (DateTime.TryParse(row["FirstHormDate"].ToString(), out hormdate) &&
                    hormdate < rpdate)
                {
                    inputs["neoadjuvant_hormone_therapy"] = true;
                }

                if (DateTime.TryParse(row["FirstXRTDate"].ToString(), out xrtdate) &&
                    xrtdate < rpdate)
                {
                    inputs["neoadjuvant_radiation_therapy"] = true;
                }
            }
            else
            {
                inputs["age"] = GetPatientAgeAtSurgery(dobString, null);
                DateTime today = DateTime.Today;

                if (DateTime.TryParse(row["FirstHormDate"].ToString(), out hormdate) &&
                    hormdate < today)
                {
                    inputs["neoadjuvant_hormone_therapy"] = true;
                }

                if (DateTime.TryParse(row["FirstXRTDate"].ToString(), out xrtdate) &&
                    xrtdate < today)
                {
                    inputs["neoadjuvant_radiation_therapy"] = true;
                }
            }

            _RP(inputs, serviceName, updater);
        }

        private void _PostRP(DataRow row, string dobString, string serviceName, Action<Dictionary<string, double?>, string> updater)
        {
            var inputs = new Dictionary<string, object>
            {
                {"pre_treatment_psa", row["PSA"]}
            };

            // ggs
            int gg1;
            int gg2;

            bool parsedGG1 = int.TryParse(row["PathGG1"].ToString(), out gg1);        
            bool parsedGG2 = int.TryParse(row["PathGG2"].ToString(), out gg2);

            if (parsedGG1)
            {
                inputs["primary_surgery_gleason"] = gg1;
            }

            if (parsedGG2)
            {
                inputs["secondary_surgery_gleason"] = gg2;
            }

            if (parsedGG1 && parsedGG2)
            {
                inputs["surgery_gleason_sum"] = gg1 + gg2;
            }

            // ece
            string ece = row["ECE"].ToString().ToUpper().TrimStart();
            inputs["extracapsular_extension"] = ece.StartsWith("POS") || ece.StartsWith("EST") || ece.StartsWith("FOCAL");

            // lni
            string lni = row["LNI"].ToString().ToUpper().TrimStart();
            inputs["lymph_node_involvement"] = lni.StartsWith("MOD") || lni.StartsWith("POS");

            // svi
            string svi = row["SVI"].ToString().ToUpper().TrimStart();
            inputs["seminal_vesicle_involvement"] = svi.StartsWith("POS");

            // sms
            string margin = row["Margin"].ToString().ToUpper().TrimStart();
            inputs["surgical_margins_positive"] = margin.StartsWith("POS");

            DateTime rpdate;
            DateTime hormdate;
            DateTime xrtdate;
            if (DateTime.TryParse(row["RPDate"].ToString(), out rpdate))
            {
                inputs["age_at_surgery"] =  GetPatientAgeAtSurgery(dobString, rpdate);
                inputs["months_disease_free"] = (DateTime.Today - rpdate).Days / DAYS_PER_MONTH;

                if (DateTime.TryParse(row["FirstHormDate"].ToString(), out hormdate) &&
                    hormdate < rpdate)
                {
                    inputs["neoadjuvant_hormone_therapy"] = true;
                }

                if (DateTime.TryParse(row["FirstXRTDate"].ToString(), out xrtdate) &&
                    xrtdate < rpdate)
                {
                    inputs["neoadjuvant_radiation_therapy"] = true;
                }
            }
            else
            {
                inputs["months_disease_free"] = 0;
                inputs["age_at_surgery"] = GetPatientAgeAtSurgery(dobString, null);
                DateTime today = DateTime.Today;

                if (DateTime.TryParse(row["FirstHormDate"].ToString(), out hormdate) &&
                    hormdate < today)
                {
                    inputs["neoadjuvant_hormone_therapy"] = true;
                }

                if (DateTime.TryParse(row["FirstXRTDate"].ToString(), out xrtdate) &&
                    xrtdate < today)
                {
                    inputs["neoadjuvant_radiation_therapy"] = true;
                }
            }

            _RP(inputs, serviceName, updater);
        }

        private void _RP(Dictionary<string, object> inputs, string serviceName, Action<Dictionary<string, double?>, string> updater)
        {
            try
            {
                var results = Calculate(string.Format("{0}/prostate/{1}/calculate", NOMOGRAM_SERVICE_URL, serviceName), inputs);
                updater(results, null);
            }
            catch (NomogramDataException e)
            {
                updater(null, e.Message);
            }
        }

        #region old
        //private Dictionary<string, double?> __PreRP(DataRow row)
        //{
        //    string url = NOMOGRAM_SERVICE_URL + "prostate/pre-op_dynamic/calculate";

        //    var inputs = new Dictionary<string, object>
        //    {
        //        {"pre_treatment_psa", row["PSA"]},
        //        {"primary_biopsy_gleason", row["BxGG1"]},
        //        {"secondary_biopsy_gleason", row["BxGG2"]}
        //    };

        //    // tstage
        //    string ts = row["ClinStageT"].ToString();
        //    if (row["ClinStageSystem"].ToString() == "UICC_97")
        //    {
        //        inputs["clinical_tumor_stage_2010"] = NomogramDa.Convert97To92TStage(ts);
        //    }
        //    else
        //    {
        //        inputs["clinical_tumor_stage_2010"] = ts;
        //    }

        //    // cores
        //    int posCores;
        //    int totalCores;
        //    if (int.TryParse(row["BxPosCores"].ToString(), out posCores) &&
        //        int.TryParse(row["BxTotalCores"].ToString(), out totalCores))
        //    {
        //        int negCores = totalCores - posCores;
        //        if (negCores >= 0)
        //        {
        //            inputs["biopsy_cores_positive"] = posCores;
        //            inputs["biopsy_cores_negative"] = negCores;
        //        }
        //    }


        //    // neo stuff
        //    DateTime rpdate;
        //    DateTime hormdate;
        //    DateTime xrtdate;
        //    if (DateTime.TryParse(row["RPDate"].ToString(), out rpdate))
        //    {
        //        if (DateTime.TryParse(row["FirstHormDate"].ToString(), out hormdate) &&
        //            hormdate < rpdate)
        //        {
        //            inputs["neoadjuvant_hormone_therapy"] = true;
        //        }
                
        //        if (DateTime.TryParse(row["FirstXRTDate"].ToString(), out xrtdate) &&
        //            xrtdate < rpdate)
        //        {
        //            inputs["neoadjuvant_radiation_therapy"] = true;
        //        }
        //    }
        //    else
        //    {
        //        DateTime today = DateTime.Today;

        //        if (DateTime.TryParse(row["FirstHormDate"].ToString(), out hormdate) &&
        //            hormdate < today)
        //        {
        //            inputs["neoadjuvant_hormone_therapy"] = true;
        //        }

        //        if (DateTime.TryParse(row["FirstXRTDate"].ToString(), out xrtdate) &&
        //            xrtdate < today)
        //        {
        //            inputs["neoadjuvant_radiation_therapy"] = true;
        //        }
        //    }

        //    return Calculate(url, inputs);
        //}
        #endregion

        #region old
        //private Dictionary<string, double?> __PostRP(DataRow row)
        //{
        //    string url = NOMOGRAM_SERVICE_URL + "prostate/post-op_dynamic/calculate";
        //    var inputs = new Dictionary<string, object>
        //    {
        //        {"pre_treatment_psa", row["PSA"]},
        //    };

        //    // ggs
        //    int gg1;
        //    int gg2;
        //    if (int.TryParse(row["PathGG1"].ToString(), out gg1) &&
        //        int.TryParse(row["PathGG2"].ToString(), out gg2))
        //    {
        //        inputs["surgery_gleason_sum"] = gg1 + gg2;
        //    }

        //    // ece
        //    string ece = row["ECE"].ToString().ToUpper().TrimStart();
        //    inputs["extracapsular_extension"] = ece.StartsWith("POS") || ece.StartsWith("EST") || ece.StartsWith("FOCAL");

        //    // lni
        //    string lni = row["LNI"].ToString().ToUpper().TrimStart();
        //    inputs["lymph_node_involvement"] = lni.StartsWith("MOD") || lni.StartsWith("POS");

        //    // svi
        //    string svi = row["SVI"].ToString().ToUpper().TrimStart();
        //    inputs["seminal_vesicle_involvement"] = svi.StartsWith("POS");

        //    // sms
        //    string margin = row["Margin"].ToString().ToUpper().TrimStart();
        //    inputs["surgical_margins_positive"] = margin.StartsWith("POS");

        //    DateTime rpdate;
        //    DateTime hormdate;
        //    DateTime xrtdate;
        //    if (DateTime.TryParse(row["RPDate"].ToString(), out rpdate))
        //    {
        //        inputs["months_disease_free"] = (DateTime.Today - rpdate).Days / DAYS_PER_MONTH;
                
        //        if (DateTime.TryParse(row["FirstHormDate"].ToString(), out hormdate) &&
        //            hormdate < rpdate)
        //        {
        //            inputs["neoadjuvant_hormone_therapy"] = true;
        //        }
                
        //        if (DateTime.TryParse(row["FirstXRTDate"].ToString(), out xrtdate) &&
        //            xrtdate < rpdate)
        //        {
        //            inputs["neoadjuvant_radiation_therapy"] = true;
        //        }
        //    }
        //    else
        //    {
        //        inputs["months_disease_free"] = 0;

        //        DateTime today = DateTime.Today;

        //        if (DateTime.TryParse(row["FirstHormDate"].ToString(), out hormdate) &&
        //            hormdate < today)
        //        {
        //            inputs["neoadjuvant_hormone_therapy"] = true;
        //        }

        //        if (DateTime.TryParse(row["FirstXRTDate"].ToString(), out xrtdate) &&
        //            xrtdate < today)
        //        {
        //            inputs["neoadjuvant_radiation_therapy"] = true;
        //        }
        //    }
                
        //    return Calculate(url, inputs);
        //}
        #endregion

        private Dictionary<string, double?> Calculate(string url, Dictionary<string, object> inputs)
        {
            using (var client = new WebClient())
            {
                // build input object
                NameValueCollection nvc = new NameValueCollection();
                foreach (var kvp in inputs)
                {
                    nvc.Add(kvp.Key, kvp.Value.ToString());
                }

                // POST
                string jsonResponse = null;

                try
                {
                    byte[] rawResponse = client.UploadValues(url, nvc);
                    jsonResponse = Encoding.UTF8.GetString(rawResponse);
                }
                catch (System.Net.WebException)
                {
                    throw new NomogramDataException("Calculation failed due to invalid data");
                }

                if (string.IsNullOrEmpty(jsonResponse))
                {
                    throw new NomogramDataException("Calculation failed due to invalid data");
                }
                
                // handle output
                var serializer = new JavaScriptSerializer();
                var output = serializer.DeserializeObject(jsonResponse) as Dictionary<string, object>;
                var results = new Dictionary<string, double?>();

                if (output != null)
                {
                    // errors?
                    if (output.ContainsKey("errors"))
                    {
                        var errors = output["errors"] as object[];
                        var parsedErrors = new List<string>();

                        if (errors != null)
                        {
                            foreach (var e in errors)
                            {
                                var error = e as Dictionary<string, object>;
                                if (error != null && error.ContainsKey("input_error"))
                                {
                                    parsedErrors.Add(error["input_error"].ToString().Replace('_', ' '));
                                }
                            }
                        }

                        if (parsedErrors.Count == 0)
                        {
                            // if we can't parse for any particular reason
                            throw new NomogramDataException("Calculation failed due to invalid data");
                        }
                        else
                        {
                            string msg = string.Join("\n", parsedErrors.ToArray());
                            throw new NomogramDataException(msg);
                        }
                    }

                    foreach (var kvp in output)
                    {
                        var outputItem = kvp.Value as Dictionary<string, object>;
                        if (outputItem == null)
                        {
                            continue;
                        }

                        double d;
                        if (outputItem.ContainsKey("value") &&
                            double.TryParse(outputItem["value"].ToString(), out d))
                        {
                            results[kvp.Key] = d;
                        }
                        else
                        {
                            results[kvp.Key] = null;
                        }
                    }
                }

                return results;
            }
        }

        // TODO: hack until we change the query
        private int? GetPatientAgeAtSurgery(string dobString, DateTime? rpDate)
        {
            DateTime dob;
            if (!DateTime.TryParse(dobString, out dob))
            {
                return null;
            }

            return (int) (((rpDate.HasValue ? rpDate.Value : DateTime.Today) - dob).Days / DAYS_PER_YEAR);
        }
    }
}
