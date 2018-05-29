using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for BiopsyProstateDa.
	/// </summary>
	public class BiopsyProstateDa : BaseDA
	{
        public DataSet FormGetSpecialRecords(int PatientId, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic" && !String.IsNullOrEmpty(searchFilter) && !String.IsNullOrEmpty(searchField))
            {
                sql = "SELECT * ";
                sql += "FROM Pathology ";
                sql += "INNER JOIN ProstateBiopsyPath ON ProstateBiopsyPath.PathologyId = Pathology.PathologyID ";
                sql += "INNER JOIN ProstateBiopsyCorePath ON ProstateBiopsyCorePath.PathologyId = Pathology.PathologyID ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "AND " + searchField + " " + searchClause + " (" + searchFilter + ") ";
                sql += "ORDER BY PathDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }
             return ds;
        }

        public DataSet FormGetBiopsyPathologyIds(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = @"
                SELECT Pathology.PathologyId FROM Pathology 
                LEFT JOIN ProstateBiopsyPath ON ProstateBiopsyPath.PathologyId = Pathology.PathologyID 
                LEFT JOIN ProstateBiopsyCorePath ON ProstateBiopsyCorePath.PathologyId = Pathology.PathologyID 
                WHERE (PatientId = @PatientId) 
                AND (ProstateBiopsyPath.PathologyId IS NOT NULL OR ProstateBiopsyCorePath.PathologyId IS NOT NULL)
                GROUP BY Pathology.PathologyId";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);

            }
            return ds;
        }
       
        public DataSet FormGetBiopsyPathRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = @"
                    SELECT * FROM Pathology 
                    INNER JOIN ProstateBiopsyPath ON ProstateBiopsyPath.PathologyId = Pathology.PathologyID
                    WHERE (PatientId = @PatientId ) 
                    ORDER BY PathDate ASC";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }
            return ds;
        }
        
        public DataSet FormGetBiopsyPathRecords(int PatientId, string FormName, string FormType, string PathologyIds)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT * FROM Pathology ";
                sql += "LEFT JOIN ProstateBiopsyPath ON ProstateBiopsyPath.PathologyId = Pathology.PathologyID ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "AND Pathology.PathologyID IN (" + PathologyIds + ") ";
                sql += "ORDER BY PathDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
                ds = DataAccessHelper.GetRecord(com);
            }
            return ds;
        }

        public DataSet FormGetBiopsyCorePathRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = @"
                     SELECT * FROM ProstateBiopsyCorePath  
                    INNER JOIN  Pathology ON Pathology.PathologyId = ProstateBiopsyCorePath.PathologyID
                    WHERE (PatientId = @PatientId  ) 
                    ORDER BY PathDate ASC";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }
            return ds;
        }

        public DataSet FormGetBiopsyCorePathRecords(int PatientId, string FormName, string FormType, string PathologyIds)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql =  "SELECT * FROM Pathology ";
                sql += "LEFT JOIN  ProstateBiopsyCorePath ON ProstateBiopsyCorePath.PathologyId = Pathology.PathologyID ";
                sql += "WHERE (PatientId = @PatientId  ) ";
                sql += "AND Pathology.PathologyID IN (" + PathologyIds + ") ";
                sql += "ORDER BY PathDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
                ds = DataAccessHelper.GetRecord(com);
            }
            return ds;
        }

        public DataSet FormGetBiopsyTRUSVolumeRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = @"
                    SELECT * FROM Pathology 
                    INNER JOIN ProstateBiopsyPath ON ProstateBiopsyPath.PathologyId = Pathology.PathologyID
                    LEFT JOIN (SELECT Diagnostics.PatientId, Diagnostics.DiagnosticId, DxDateText, ImgProstateVolume FROM Diagnostics 
                    INNER JOIN DxImageProstate ON DxImageProstate.DiagnosticId = Diagnostics.DiagnosticId
                    WHERE DxType = 'TRUS' GROUP BY Diagnostics.DiagnosticId, DxDateText, ImgProstateVolume, Diagnostics.PatientId) trus ON trus.DxDateText = Pathology.PathDateText
                    WHERE (Pathology.PatientId = @PatientId AND trus.PatientId = @PatientId) 
                    ORDER BY PathDate ASC";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }



            return ds;
        }
    }
}
