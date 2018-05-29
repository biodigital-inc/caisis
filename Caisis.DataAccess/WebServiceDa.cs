using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Caisis.DataAccess
{
	public static class WebServiceDa
	{
		public static void ConsumeStarDataPoints(int patientId, Func<IDataRecord, bool> consumer)
		{
			#region sql
			string sql =
                @"SELECT
					Patients.PatientId,
					DATEDIFF(year, PtBirthDate, GETDATE()) AS PtAge,
					PreSurgeryPSA.LabResult AS PreSurgeryPSA,
					RP.ProcDateText AS RPDate,
					PP.PathGG1,
					PP.PathGG2,
					PP.PathExtension AS ECE,
                    CASE
		                WHEN PP.PathExtension IN ('Established', 'Focal') THEN 1
		                WHEN PP.PathExtension IN ('Invades Capsule', 'None') THEN 0
		                ELSE NULL
	                END AS ECE_Parsed,
					PP.PathSV_Inv AS SVI,
                    CASE	
		                WHEN PP.PathSV_Inv = 'Positive' THEN 1
		                WHEN PP.PathSV_Inv = 'Negative' THEN 0
		                ELSE NULL
	                END as SVI_Parsed,
					PLND_Path.PathResult AS LNI,
                    CASE
		                WHEN PLND_Path.PathResult LIKE '%normal%' THEN 0
		                WHEN PLND_Path.PathResult LIKE 'Pos%' THEN 1
		                WHEN PLND_Path.PathResult LIKE 'ABN%' THEN 1
		                WHEN PLND_Path.PathResult LIKE 'Negative%' THEN 0
		                WHEN PLND_Path.PathResult LIKE 'No%' THEN 0
		                WHEN PLND_Path.PathResult IS NULL THEN 0
		                ELSE NULL
	                END AS LNI_Parsed,
					CASE
						WHEN PLND.ProcedureID IS NOT NULL THEN 'Yes'
						ELSE 'No'
					END AS PLND,
					CASE
						WHEN (SocHxTobaccoType LIKE 'Cig%' OR SocHxTobaccoType IN ('Pipe', 'Yes')) OR
							 (SocHxTobaccoType IS NULL AND SocHxTobaccoPacksPerDay IS NOT NULL)
						THEN 'Yes'
						ELSE 'No'
					END AS Smoker
					
				FROM 
					Patients
						INNER JOIN Procedures RP
							ON Patients.PatientId = RP.PatientId
							AND RP.ProcName IN (
								'CP','LP','LP_CONV','PP','RALP','RP','SalvCP','SalvLP','SalvRP'
							)

						LEFT OUTER JOIN Procedures PLND
							ON Patients.PatientId = PLND.PatientId
							AND PLND.ProcName = 'PLND'

						LEFT OUTER JOIN LabTests PreSurgeryPSA
							ON Patients.PatientId = PreSurgeryPSA.PatientId
							AND PreSurgeryPSA.LabTestId = (
								SELECT TOP 1 LabTestId
								FROM LabTests
								WHERE LabDate <= RP.ProcDate
								AND LabTest = 'PSA'
								AND PatientId = Patients.PatientId
								ORDER BY
									LabDate DESC,
									CASE LabQuality
										WHEN 'RR' THEN 4
										WHEN 'STD' THEN 3
										WHEN 'REV' THEN 2
										WHEN 'OUT' THEN 1
										ELSE 0
									END DESC,
									LabResult DESC
							)

						LEFT OUTER JOIN ProstatectomyPath PP
							ON PP.PathologyId = (
								SELECT TOP 1 Pathology.PathologyId
								FROM Pathology 
									INNER JOIN ProstatectomyPath
										ON Pathology.PathologyId = ProstatectomyPath.PathologyId
									WHERE ProcedureId = RP.ProcedureId
									ORDER BY
										CASE PathQuality
											WHEN 'RR' THEN 4
											WHEN 'STD' THEN 3
											WHEN 'REV' THEN 2
											WHEN 'OUT' THEN 1
											ELSE 0
										END DESC
							)

						LEFT OUTER JOIN Pathology PLND_Path
							ON Patients.PatientId = PLND_Path.PatientId
							AND PLND_Path.PathologyId = (
								SELECT TOP 1 PathologyId
								FROM Pathology
								WHERE PatientId = Patients.PatientId
								AND ProcedureId = PLND.ProcedureId
								AND PathSpecimenType = 'PLND'
								ORDER BY
									CASE PathQuality
										WHEN 'RR' THEN 4
										WHEN 'STD' THEN 3
										WHEN 'REV' THEN 2
										WHEN 'OUT' THEN 1
										ELSE 0
									END DESC
							)

						LEFT OUTER JOIN SocialHistories
							ON Patients.PatientId = SocialHistories.PatientId

				WHERE Patients.PatientId = @PatientId";
			#endregion

			SqlCommand cmd = new SqlCommand(sql);
			cmd.Parameters.AddWithValue("@PatientId", patientId);

			Connectivity.ConsumeRecord(cmd, new Connectivity.RecordConsumerDelegate(consumer));
		}
	}
}
