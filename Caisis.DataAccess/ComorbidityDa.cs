using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for Comorbidities.
	/// </summary>
	public class ComorbidityDa : BaseDA
	{
		



		public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormListComorbidities");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}

        public DataSet FormGetSpecialRecords(int PatientId, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
        
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic" && !String.IsNullOrEmpty(searchFilter) && !String.IsNullOrEmpty(searchField))
            {
                string sql = "SELECT * ";
                sql += "FROM Comorbidities ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "AND " + searchField + " " + searchClause + " (" + searchFilter + ") ";
                sql += "ORDER BY ComorbDate ASC, Comorbidity ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

        public DataSet FormGetOsteoRecords(int PatientId, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic" && !String.IsNullOrEmpty(searchFilter) && !String.IsNullOrEmpty(searchField))
            {
                string sql = "SELECT * ";
                sql += "FROM Comorbidities ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "AND (" + searchField + " " + searchClause + " (" + searchFilter + ") ";
                sql += "OR Comorbidity LIKE '%Fracture%') ";
                sql += "ORDER BY ComorbDate ASC, Comorbidity ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

        public DataSet FormGetNonOsteoRecords(int PatientId, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic" && !String.IsNullOrEmpty(searchFilter) && !String.IsNullOrEmpty(searchField))
            {
                string sql = "SELECT * ";
                sql += "FROM Comorbidities ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "AND (" + searchField + " " + searchClause + " (" + searchFilter + ") ";
                sql += "AND Comorbidity NOT LIKE '%Fracture%') ";
                sql += "ORDER BY ComorbDate ASC, Comorbidity ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }


			
	}
}
