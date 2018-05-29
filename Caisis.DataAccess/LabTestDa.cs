using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for Lab Tests.
	/// </summary>
	public class LabTestDa : BaseDA
	{
		
		public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormListLabTests");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}


		public DataSet FormGetRecords(int PatientId, string FormName, string FormType, string Modifier, int NumMonths, string VarNames, int NumColumns)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormListLabTests");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataAccessHelper.AddStringInputParam(com, "Modifier", Modifier);
			DataAccessHelper.AddIntInputParam(com, "NumMonths", NumMonths);
			DataAccessHelper.AddStringInputParam(com, "VarNames", VarNames);
			DataAccessHelper.AddIntInputParam(com, "NumColumns", NumColumns);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}

        public DataSet FormGetAllLabs(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic")
            {
                string sql = "SELECT * ";
                sql += "FROM LabTests ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "ORDER BY LabDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

        public DataSet GetLabTestsbyList(int PatientId, params string[] labs)
        {
            string sql = @"
              SELECT *
              FROM LabTests
              WHERE PatientId = @PatientId {0} 
              ORDER BY LabDate ";

            string[] labParams = new string[labs.Length];
            for (int i = 0; i < labs.Length; i++)
            {
                string labParam = "LabTest_" + i;
                labParams[i] = labParam;
            }
            if (labParams.Length > 0)
            {
                string findExpr = "AND LabTest IN (@" + string.Join(",@", labParams) + ") ";
                sql = string.Format(sql, findExpr);
            }
            else
            {
                sql = string.Format(sql, string.Empty);
            }
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", PatientId);
            for (int i = 0; i < labs.Length; i++)
            {
                string key = labParams[i];
                string value = labs[i];
                DataAccessHelper.AddStringInputParam(cmd, key, value);
            }
            
            DataSet ds = DataAccessHelper.GetList(cmd);

            return ds;
        }

        /// <summary>
        /// Gets records labtests=PSA for a patient for Uro Sexual Function FU eform
        /// </summary>
        /// <param name="PatientId"></param>
        /// <param name="Status"></param>
        /// <returns></returns>
        public DataSet GetUroSexualLabs(int PatientId, string LabTest)
        {
            string sql = @"
              SELECT TOP 3 *
              FROM LabTests
              WHERE PatientId = @PatientId AND LabTest in (@LabTest)
              ORDER BY LabDate DESC";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "LabTest", LabTest);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        /// <summary>
        /// Gets most recent distinct patient labs 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="numOfEachType">Number of each distinct type of lab to return. (i.e. numOfEachType = 1, returns TOP 1 of each distinct lab. numOfEachType = 2 returns TOP 2 of each distinct lab)</param>
        /// <returns></returns>
        public DataSet GetMostRecentDistinctLabTests(int patientId, int numOfEachType)
        {

            DataSet ds = new DataSet();
            // get the names of the patient's distinct labs
            DataTable distinctLabTests = GetDistinctPatientLabNames(patientId);
            string[] distinctLabTestsList = CreateDelimitedString(distinctLabTests, "LabTest", ",").Split(',');

            int topNumber = 1;
            if (numOfEachType > 0)
                topNumber = numOfEachType;

            if (distinctLabTestsList.Length > 0)
            {
                string[] paramList = new string[distinctLabTestsList.Length];
                for (int i = 0; i < distinctLabTestsList.Length; i++)
                {
                    string paramName = "LabTest_" + i;
                    if (i == 0)
                        paramList[i] = " SELECT * FROM ( SELECT TOP " + topNumber.ToString() + " * FROM LabTests WHERE LabTests.PatientId = @PatientId AND LabTests.LabTest = @" + paramName + " ORDER BY LabDate DESC) AS LT_" + i + " ";
                    else
                        paramList[i] = " UNION SELECT * FROM ( SELECT TOP " + topNumber.ToString() + " * FROM LabTests WHERE LabTests.PatientId = @PatientId AND LabTests.LabTest = @" + paramName + " ORDER BY LabDate DESC) AS LT_" + i + " ";
                }
                string sql = String.Empty;
                sql += string.Join(" ", paramList);

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
                for (int i = 0; i < distinctLabTestsList.Length; i++)
                {
                    string paramName = "LabTest_" + i;
                    string paramValue = distinctLabTestsList[i];
                    DataAccessHelper.AddStringInputParam(com, paramName, paramValue);
                }

                ds = DataAccessHelper.GetRecord(com);
            }
            return ds;
        }


        /// <summary>
        /// Gets distinct lab test names for patient 
        /// </summary>
        /// <param name="PatientId"></param>
        /// <returns></returns>
        public DataTable GetDistinctPatientLabNames(int PatientId)
        {
            string sql = @"
              SELECT LabTest FROM LabTests
              WHERE PatientId = @PatientId 
              GROUP BY LabTest
              ORDER BY LabTest ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataTable dt = DataAccessHelper.GetList(com).Tables[0];

            return dt;
        }

        protected String CreateDelimitedString(DataTable dt, string columnName, string delimter)
        {
            string list = "";
            foreach (DataRow dr in dt.Rows)
            {
                string fieldValue = dr[columnName].ToString();
                // if value already contains an apostrophe
                if (fieldValue.Contains("'"))
                    fieldValue = fieldValue.Replace("'", "''");

                list = String.Concat(list, fieldValue, delimter);
            }

            if (list.EndsWith(delimter))
            {
                int index = list.LastIndexOf(delimter);
                list = list.Remove(index);
            }
            return list;
        }

        /// <summary>
        /// For the specific labs, get the closests labs to specified date (by ABS days)
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="date"></param>
        /// <param name="labs"></param>
        /// <returns></returns>
        public DataTable GetClosestLabs(int patientId, DateTime date, params string[] labs)
        {
            string sqlFormat =
@"
SELECT
    b.*
FROM
(
	SELECT
		LabTestId,
        -- closest # of days to test date
        ROW_NUMBER() OVER(Partition BY LabTest ORDER BY ABS(DATEDIFF(DAY, LabDate, @LabDate)) ASC) AS RowNum
	FROM LabTests
	WHERE
		PatientId = @PatientId
		AND LabDate BETWEEN @StartLabDate AND @EndLabDate
		AND LabTest IN ({0})
) a
INNER JOIN LabTests b
    ON a.LabTestId = b.LabTestId
WHERE
	a.RowNum = 1
";
            string[] labParams = new string[labs.Length];
            // build param names
            for (int i = 0; i < labs.Length; i++)
                labParams[i] = "@LabTest_" + i;
            string sql = string.Format(sqlFormat, string.Join(",", labParams));
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            // date params
            DataAccessHelper.AddDateTimeInputParam(com, "LabDate", date);
            // add buffer restriction : +/- 30 days
            DataAccessHelper.AddDateTimeInputParam(com, "StartLabDate", date.AddDays(-60));
            DataAccessHelper.AddDateTimeInputParam(com, "EndLabDate", date.AddDays(60));
            // add param values
            for (int i = 0; i < labs.Length; i++)
                DataAccessHelper.AddStringInputParam(com, "LabTest_" + i, labs[i]);           
            DataTable dt = DataAccessHelper.GetList(com).Tables[0];
            return dt;
        }
	}
}