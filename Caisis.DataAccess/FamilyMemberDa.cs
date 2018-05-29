using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Family Member DataAccess calls procedures.
	/// </summary>
	public class FamilyMemberDa : BaseDA
	{
		

		public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormListFamilyMemberDiagnosis");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}


        public DataSet FormGetFamMemRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT * ";
                sql += "FROM FamilyMembers ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "ORDER BY FamilyMemberId ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }



            return ds;
        }

        public DataSet FormGetFamMemDiagnosisRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT * ";
                sql += "FROM FamilyMembers ";
                sql += "INNER JOIN FamilyMemberDiagnosis ON FamilyMemberDiagnosis.FamilyMemberId = FamilyMembers.FamilyMemberId ";
                sql += "WHERE (PatientId = @PatientId) ";
                sql += "ORDER BY FamilyMemberDiagnosisId ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }



            return ds;
        }

        public DataSet FormGetFamMemDiagnosisSpecialRecords(int PatientId, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT * ";
                sql += "FROM FamilyMembers ";
                sql += "INNER JOIN FamilyMemberDiagnosis ON FamilyMemberDiagnosis.FamilyMemberId = FamilyMembers.FamilyMemberId ";
                sql += "WHERE (PatientId = @PatientId) ";
                sql += "AND " + searchField + " " + searchClause + " (" + searchFilter + ") ";
                sql += "ORDER BY FamilyMemberDiagnosisId ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }



            return ds;
        }
	}
}
