using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess 
{
	/// <summary>
	/// Summary description for Actions Data Access.
	/// </summary>
	public class ActionDa : BaseDA
	{
			

		public DataSet ValidateActionItem(int patientId, string actionItem)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spValidateActionItem");
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			DataAccessHelper.AddStringInputParam(com, "ActionItem", actionItem);

			return DataAccessHelper.GetRecord(com);
		}

        /// <summary>
        /// get all actions with the number of patients assigned that action
        /// </summary>
        /// <param name="datasetsql"></param>
        /// <returns></returns>
        public DataTable GetDistinctPatientActions(string datasetsql)
        {
            string sql = string.Format(@"
            SELECT ActionItem, COUNT(Actions.PatientId) AS ActionCount FROM Actions
            INNER JOIN ({0}) p
            ON p.patientid = Actions.PatientId
            WHERE ActionItem IS NOT NULL
            GROUP BY ActionItem
            ORDER BY ActionItem", datasetsql);
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }
	}
}
