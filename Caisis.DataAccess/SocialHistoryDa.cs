using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for SocialHistory.
	/// 
	/// One to one relationship with Patients table and has patient Id.
	/// </summary>
	public class SocialHistoryDa : BaseDA
	{
		

		/*protected override void SuppressUpdateColumns(DataTable dt)
		{
			this._SuppressColumn(dt.Columns[BizObject.EnteredBy]);
			this._SuppressColumn(dt.Columns[BizObject.EnteredTime]);
		}*/

		public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spFormGetSocialHistoriesRecord");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
			DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
			DataSet ds = DataAccessHelper.GetList(com);

			return ds;
		}





	}
}