using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Caisis.DataAccess
{
    public class ActiveSurveillanceDa : BaseDA
    {
        public static DataView GetDiagnositicBiopsy(int patientId)
        {
            #region sql
            string sql =
                @"SELECT TOP 1
	                Procedures.ProcedureId,
	                Pathology.PathologyId,
	                ProcDate, 
	                ProcName, 
	                PathGG1, 
	                PathGG2, 
	                PathGGS,
	                PathPosCores,
	                PathNumCores,
	                PathResult, 
	                PathQuality, 
	                ProcQuality,
                    DATEDIFF(year, PtBirthDate, GETDATE()) AS PtAge
                FROM
	                Procedures
                        INNER JOIN Patients
                            ON Procedures.PatientId = Patients.PatientId
		                INNER JOIN Pathology
			                ON Procedures.ProcedureId = Pathology.ProcedureId
			                AND Pathology.PathologyId =
			                (
				                SELECT TOP 1 p.PathologyId
				                FROM Pathology p
				                WHERE 
					                p.ProcedureId = Procedures.ProcedureId AND
					                (
						                p.PathResult LIKE '%MOD%' OR
						                p.PathResult LIKE 'POOR%' OR
						                p.PathResult LIKE '%WELL%' OR
						                p.PathResult LIKE '%LOW%' OR
						                p.PathResult lIKE 'POS%'
					                )
				                ORDER BY
					                CASE p.PathQuality
						                WHEN 'RR' THEN 4
                                        WHEN 'STD' THEN 3
                                        WHEN 'REV' THEN 2
                                        WHEN 'OUT' THEN 1
                                        ELSE 0
					                END DESC
			                )
		                LEFT OUTER JOIN ProstateBiopsyPath
			                ON Pathology.PathologyId = ProstateBiopsyPath.PathologyId
                WHERE
	                Procedures.PatientId = @PatientId AND
	                ProcSite = 'Prostate' AND 
	                ProcName IN ('TURP', 'TRUS Biopsy', 'Biopsy', 'Needle Biopsy')
                ORDER BY ProcDate;";
            #endregion

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            cmd.Parameters.AddWithValue("@PatientId", patientId);

            return DataAccessHelper.GetList(cmd).Tables[0].DefaultView;
        }

        public static DataView GetBiopsies(int patientId)
        {
            #region sql
            string sql =
                @"SELECT
	                Procedures.ProcedureId,
	                Pathology.PathologyId,
	                ProcDate, 
	                ProcName, 
	                PathGG1, 
	                PathGG2, 
	                PathGGS,
	                PathPosCores,
	                PathNumCores,
	                PathResult, 
	                PathQuality, 
	                ProcQuality
                FROM
	                Procedures
		                INNER JOIN Pathology
			                ON Procedures.ProcedureId = Pathology.ProcedureId
			                AND Pathology.PathologyId =
			                (
				                SELECT TOP 1 p.PathologyId
				                FROM Pathology p
				                WHERE 
					                p.ProcedureId = Procedures.ProcedureId
				                ORDER BY
					                CASE p.PathQuality
						                WHEN 'RR' THEN 4
                                        WHEN 'STD' THEN 3
                                        WHEN 'REV' THEN 2
                                        WHEN 'OUT' THEN 1
                                        ELSE 0
					                END DESC
			                )
		                LEFT OUTER JOIN ProstateBiopsyPath
			                ON Pathology.PathologyId = ProstateBiopsyPath.PathologyId
                WHERE
	                Procedures.PatientId = @PatientId AND
	                ProcSite = 'Prostate' AND 
	                ProcName IN ('TURP', 'TRUS Biopsy', 'Biopsy', 'Needle Biopsy')
                ORDER BY ProcDate;";
            #endregion

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            cmd.Parameters.AddWithValue("@PatientId", patientId);

            return DataAccessHelper.GetList(cmd).Tables[0].DefaultView;
        }

        public static DataView GetCurrentClinicalStage(int patientId)
        {
            #region sql
            string sql =
                @"SELECT
	                ClinicalStageId,
	                ClinStageDate,
	                ClinStageSystem,
	                ClinStageT,
	                ClinStageQuality
                FROM ClinicalStages
                WHERE PatientId = @PatientId AND
                    ClinStageDisease = 'Prostate'
                ORDER BY
	                ClinStageDate DESC,
	                CASE ClinStageQuality
		                WHEN 'RR' THEN 4
                        WHEN 'STD' THEN 3
                        WHEN 'REV' THEN 2
                        WHEN 'OUT' THEN 1
                        ELSE 0
	                END DESC;";
            #endregion

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            cmd.Parameters.AddWithValue("@PatientId", patientId);

            return DataAccessHelper.GetList(cmd).Tables[0].DefaultView;
        }

        public static DataView GetPSAs(int patientId)
        {
            #region sql
            string sql =
                @"SELECT
	                LabDate,
	                LabResult,
	                LabQuality,
	                LabUnits
                FROM LabTests
                WHERE PatientId = @PatientId AND
	                LabTest = 'PSA'
                ORDER BY LabDate";
            #endregion

            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            cmd.Parameters.AddWithValue("@PatientId", patientId);

            return DataAccessHelper.GetList(cmd).Tables[0].DefaultView;
        }
    }
}
