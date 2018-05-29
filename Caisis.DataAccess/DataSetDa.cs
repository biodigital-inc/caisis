using System;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for DataSetDa.
    /// </summary>
    public class DataSetDa : BaseDA
    {
        protected override void SetParams()
        {
            this._GetStoredProc = "spGetDatasetsRecord";
            this._InsertStoredProc = "";
            this._UpdateStoredProc = "";
            this._DeleteStoredProc = "spDeleteDatasetsRecord";
            this._GetByParentStoredProc = "";
        }

        public DataSet GetByUser(string userName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetUserDatasets");
            DataAccessHelper.AddStringInputParam(com, "userName", userName);
            return DataAccessHelper.GetList(com);
        }

        public DataSet GetDatasets()
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetDatasets");
            return DataAccessHelper.GetList(com);
        }

        public DataSet GetDataset(int datasetId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetDatasetsRecord");
            DataAccessHelper.AddIntInputParam(com, "DatasetId", datasetId);
            return DataAccessHelper.GetList(com);
        }

        //public bool UpdateDataset(int datasetId, int newDatasetId, string datasetName, byte active)  
        //{
        //    SqlCommand com = DataAccessHelper.CreateCommand("spUpdateDatasetsRecord");
        //    DataAccessHelper.AddIntInputParam(com, "DatasetId", datasetId);	
        //    DataAccessHelper.AddIntInputParam(com, "NewDatasetId", newDatasetId);	
        //    DataAccessHelper.AddStringInputParam(com, "DatasetName", datasetName);	
        //    DataAccessHelper.AddStringInputParam(com, "DatasetView", "");	
        //    DataAccessHelper.AddBitInputParam(com, "DatasetActive", active);	
        //    DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

        //    DataAccessHelper.ExecuteScalar(com);

        //    return true;
        //}

        //public bool InsertDataset(int datasetId, string datasetName, byte active)  
        //{
        //    SqlCommand com = DataAccessHelper.CreateCommand("spInsertDatasetsRecord");
        //    DataAccessHelper.AddIntInputParam(com, "DatasetId", datasetId);	
        //    DataAccessHelper.AddStringInputParam(com, "DatasetName", datasetName);	
        //    //view could be used again if XML fails
        //    DataAccessHelper.AddStringInputParam(com, "DatasetView", "");	
        //    DataAccessHelper.AddBitInputParam(com, "DatasetActive", active);	
        //    DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
        //    DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

        //    DataAccessHelper.ExecuteScalar(com);

        //    return true;
        //}

        public int GetMaxDatasetId()
        {
            string sqlStmt = "SELECT Max(DatasetId) FROM Datasets";
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSql(sqlStmt, dt);
            if (dt.Rows.Count > 0)
            {
                return (int)dt.Rows[0][0];
            }
            else return -1;
        }

        public DataSet GetUserIdByFirstAndLastName(string firstName, string lastName)
        {
            string sqlStmt = "SELECT * FROM Users WHERE UserFirstName = '" + firstName + "' AND UserLastName = '" + lastName + "'";
            SqlCommand cmd = DataAccessHelper.CreateCommand(sqlStmt);
            cmd.CommandType = CommandType.Text;

            return DataAccessHelper.GetRecord(cmd);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="datasetSQL"></param>
        /// <returns></returns>
        public DataTable GetDataSetStatsPastYear(string datasetSQL)
        {
            return GetDataSetStats(datasetSQL, 1);
        }

        /// <summary>
        /// Gets stats about the specified Dataset.
        /// </summary>
        /// <param name="datasetSQL"></param>
        /// <returns></returns>
        public DataTable GetAllDataSetStats(string datasetSQL)
        {
            return GetDataSetStats(datasetSQL, null);
        }

        /// <summary>
        /// Gets stats about the specified Dataset (optinally filtered by previous years).
        /// SELECT
        ///     Count (patients added this month+year),
        ///     Year,
        ///     Month
        ///     TotalCount (running total of patients added to this month)
        /// FROM @Dataset
        /// </summary>
        /// <param name="datasetSQL"></param>
        /// <param name="previousYears"></param>
        /// <returns></returns>
        public DataTable GetDataSetStats(string datasetSQL, int? previousYears)
        {
            // determine starting point
            DateTime? prevDate = null;
            if (previousYears.HasValue)
            {
                // Noramlize Date: Jan 7, 2012 -> 2 years -> Jan 7, 2010 -> Jan 1, 2010 00:00:00
                prevDate = DateTime.Now.AddYears(-previousYears.Value);
                prevDate = new DateTime(prevDate.Value.Year, prevDate.Value.Month, 1, 0, 0, 0);
            }

            // GET COUNT BY MONTH
            string sql =
            @"
            SELECT
	            COUNT(p.PatientId) [Count],
	            YEAR(p.EnteredTime) [Year],
	            MONTH(p.EnteredTime) [Month]
            FROM Patients p
            INNER JOIN ({0}) ds
	            ON p.PatientId = ds.PatientId
            WHERE
	            {1}
            GROUP BY
	            YEAR(p.EnteredTime),
	            MONTH(p.EnteredTime)
            ORDER BY
	            YEAR(p.EnteredTime) ASC,
	            MONTH(p.EnteredTime) ASC
            ";
            string whereSQL = "";
            // build where clause
            if (prevDate.HasValue)
            {
                whereSQL = "p.EnteredTime > @PreviousDate";
            }
            else
            {
                whereSQL = "p.EnteredTime IS NOT NULL";
            }
            // build group by date SQL
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(string.Format(sql, datasetSQL, whereSQL));
            DataAccessHelper.AddStringInputParam(cmd, "DatasetSQL", datasetSQL);
            if (prevDate.HasValue)
            {
                DataAccessHelper.AddDateTimeInputParam(cmd, "PreviousDate", prevDate.Value);
            }
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];

            // GET STARTING COUNT (if using previous date, get count upto @date)
            int startCount = 0;
            if (prevDate.HasValue)
            {
                string getStartingMaxSQL =
                @"
                SELECT
	                COUNT(p.PatientId)
                FROM Patients p
                INNER JOIN ({0}) ds
	                ON p.PatientId = ds.PatientId
                WHERE
	                p.EnteredTime <= @PreviousDate
                ";

                SqlCommand getCountCMD = DataAccessHelper.CreateSqlCommand(string.Format(getStartingMaxSQL, datasetSQL));
                DataAccessHelper.AddStringInputParam(getCountCMD, "DatasetSQL", datasetSQL);
                DataAccessHelper.AddDateTimeInputParam(getCountCMD, "PreviousDate", prevDate.Value);
                DataTable startCountTable = DataAccessHelper.GetRecord(getCountCMD).Tables[0];
                startCount = (int)startCountTable.Rows[0][0];
            }

            // ADD COMPUTED TOTAL COUNT
            DataColumn totalCountColumn = new DataColumn("TotalCount", typeof(int));
            dt.Columns.Add(totalCountColumn);
            int runningCount = startCount;
            // normalize row count to capture running total
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow row = dt.Rows[i];
                int rowCount = (int)row["Count"];
                int prevRowCount = 0;
                if (i > 0)
                {
                    prevRowCount = (int)dt.Rows[i - 1][totalCountColumn];
                }
                runningCount += rowCount;
                row[totalCountColumn] = runningCount;
            }
            return dt;
        }

    }
}
