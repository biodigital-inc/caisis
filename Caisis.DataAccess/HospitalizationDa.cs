using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
    /// Summary description for Hospitalization.
	/// </summary>
    public class HospitalizationDa : BaseDA
	{

        public DataSet FormGetSpecialRecords(int PatientId, string FormName, string FormType, string searchField, string searchClause, string searchFilter)
        
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic" && !String.IsNullOrEmpty(searchFilter) && !String.IsNullOrEmpty(searchField))
            {
                string sql = @"
                  SELECT * 
                  FROM Hospitalizations
                  WHERE (PatientId = @PatientId ) AND @SearchField @SearchClause (@SearchFilter) 
                  ORDER BY HospAdmitDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
                DataAccessHelper.AddStringInputParam(com, "SearchField", searchField);
                DataAccessHelper.AddStringInputParam(com, "SearchClause", searchClause);
                DataAccessHelper.AddStringInputParam(com, "SearchFilter", searchFilter);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

        public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic")
            {
                string sql = @"
                  SELECT * 
                  FROM Hospitalizations
                  WHERE (PatientId = @PatientId )
                  ORDER BY HospAdmitDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

        public DataSet FormGetHospitalizationsWithServiceAction (int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic")
            {
                string sql = @"
                    SELECT * FROM Hospitalizations hosp
                    LEFT JOIN 
                        (SELECT * FROM Actions WHERE ActionItem LIKE '%Received From Service%' ) AS hospAction 
                        ON hospAction.ActionDateText = hosp.HospAdmitDateText
                    LEFT JOIN Patients ON Patients.PatientId = hosp.PatientId
                    WHERE (hosp.PatientId = @PatientId ) 
                    ORDER BY HospAdmitDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }


			
	}
}
