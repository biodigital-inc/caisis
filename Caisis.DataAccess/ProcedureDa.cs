using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for ProcedureDa.
	/// </summary>
    public class ProcedureDa : BaseDA
	{
        public DataSet FormGetSpecialRecords(int PatientId, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic" && !String.IsNullOrEmpty(searchFilter) && !String.IsNullOrEmpty(searchField))
            {
                sql = "SELECT * ";
                sql += "FROM Procedures ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "AND " + searchField + " " + searchClause + " (" + searchFilter + ") ";
                sql += "ORDER BY ProcDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }
             return ds;
        }

        public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT * ";
                sql += "FROM Procedures ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "ORDER BY ProcDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }
        
        public DataSet FormGetProcPathRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT * ";
                sql += "FROM Procedures ";
                sql += "LEFT JOIN Pathology ON Pathology.ProcedureID = Procedures.ProcedureID ";
                sql += "WHERE (Procedures.PatientId = @PatientId ) ";
                sql += "ORDER BY ProcDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

        public DataSet FormGetProcAssistantRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT Procedures.*, ProcedureAssistants.ProcedureId, ProcedureAssistants.ProcedureAssistantId, ProcedureAssistants.ProcAssistantType as \"ProcedureAssistantType\", ProcedureAssistants.ProcAccreditation, ProcedureAssistants.ProcAssistant as \"ProcedureAssistant\" ";
                sql += "FROM Procedures ";
                sql += "INNER JOIN ProcedureAssistants ON Procedures.ProcedureID = ProcedureAssistants.ProcedureID ";
                sql += "WHERE (Procedures.PatientId = @PatientId ) ";
                sql += "ORDER BY ProcedureAssistantId ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }
	}
}
