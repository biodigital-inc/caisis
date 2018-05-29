using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for BiopsyDa.
	/// </summary>
	public class BiopsyDa : BaseDA
	{
		/*protected override void SetParams()  
		{
			this._GetStoredProc = "spGetBiopsiesRecord";
			this._InsertStoredProc = "spInsertBiopsiesRecord";
			this._UpdateStoredProc = "spUpdateBiopsiesRecord";
			this._DeleteStoredProc = "spDeleteBiopsiesRecord";
		}*/



        public DataSet FormGetRecords(int PatientId, string HpiBiopsyId, string FormName, string FormType)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormListBiopsies");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            if (HpiBiopsyId != null && HpiBiopsyId.Length > 0)
            {
                int bId = Convert.ToInt32(HpiBiopsyId);
                DataAccessHelper.AddIntInputParam(com, "ProcedureId", bId);
            }
            DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
            DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataTable GetProstateBiopsies(int PatientId)
        {

            string sql =
            @"
           SELECT ProcDateText, ProcDate, ProcName, ProcQuality, PathResult, PathQuality, 
          Procedures.LockedBy, Procedures.ProcedureId AS PrimaryKey, 'Procedures' AS TableName, 'Prostate' AS BxType, PathGG1, PathGG2, PathGG3, PathGGS, PathResult AS PathResult2, PathHG_PIN, PathASAP, PathPosSites, PathNumSites, PathPosCores, PathNumCores, Pathology.PathologyId
   FROM Procedures INNER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
                   LEFT OUTER JOIN ProstateBiopsyPath ON Pathology.PathologyId=ProstateBiopsyPath.PathologyId
   WHERE Procedures.PatientId = @PatientId AND
         ProcSite='Prostate' AND ProcName IN('TURP','TRUS Biopsy','Biopsy','Needle Biopsy')
   UNION ALL
   SELECT ProcDateText, ProcDate, ProcName, ProcQuality, PathResult, PathQuality, 
          Procedures.LockedBy, Procedures.ProcedureId, 'Procedures', 'General', NULL, NULL, NULL, NULL, PathResult, NULL, NULL, NULL, NULL, NULL, NULL, Pathology.PathologyId
   FROM Procedures LEFT OUTER JOIN Pathology ON Procedures.ProcedureId = Pathology.ProcedureId
   WHERE (ProcName LIKE '%Biopsy%' OR ProcName = 'Needle Aspiration') AND 
         (Procedures.PatientId = @PatientId) AND
         (Procedures.ProcedureId NOT IN
                          (
                           SELECT ProcedureId
                           FROM Procedures 
                           WHERE PatientId = @PatientId AND ProcSite='Prostate' AND ProcName IN('TURP','TRUS Biopsy','Biopsy','Needle Biopsy')
                          ))
   ORDER BY ProcDate
            ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }




        public DataTable FormGetBiopsyCorePathsByProcedureId(int ProcId)
		{
            string sql =
            @"
           SELECT
                c.PathologyId,
                c.PathCoreSide,
                c.PathCoreLaterality,
                c.PathCoreLevel,
                c.PathCoreNumCores,
                c.PathCoreGG1,
                c.PathCoreGG2,
                c.PathCoreGGS,
                c.PathCorePercCancer,
                c.PathCoreMaxCancerLength,
                c.PathCoreLength,
                c.PathCorePerineuralInv,
                c.PathCorePNI_Diam,
                c.PathCoreASAP,
                c.PathCoreHG_PIN
           FROM Procedures a INNER JOIN Pathology b ON a.ProcedureId = b.ProcedureId
                           INNER JOIN ProstateBiopsyCorePath c ON b.PathologyId=c.PathologyId
           WHERE a.ProcedureId = @ProcedureId
            ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProcedureId", ProcId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public DataTable FormGetBiopsyCorePathsByPathologyId(int PathId)
        {
            string sql =
            @"
           SELECT
                c.PathologyId,
                c.PathCoreSide,
                c.PathCoreLaterality,
                c.PathCoreLevel,
                c.PathCoreNumCores,
                c.PathCoreNumTotalCores,
                c.PathCoreGG1,
                c.PathCoreGG2,
                c.PathCoreGGS,
                c.PathCorePercCancer,
                c.PathCoreMaxCancerLength,
                c.PathCoreLength,
                c.PathCorePerineuralInv,
                c.PathCorePNI_Diam,
                c.PathCoreASAP,
                c.PathCoreHG_PIN
           FROM Pathology b INNER JOIN ProstateBiopsyCorePath c ON b.PathologyId=c.PathologyId
           WHERE b.PathologyId = @PathologyId
            ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PathologyId", PathId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }
	}
}
