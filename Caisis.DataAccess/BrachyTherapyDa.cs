using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for BrachyTherapyDa.
	/// </summary>
	public class BrachyTherapyDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetBrachyTherapyRecord";
			this._InsertStoredProc = "spInsertBrachyTherapyRecord";
			this._UpdateStoredProc = "spUpdateBrachyTherapyRecord";
			this._DeleteStoredProc = "spDeleteBrachyTherapyRecord";
			this._GetByParentStoredProc = null;
		}

		

		/* v4.0 PatientId is prim key in Brachy table. Override suppress method so patient id is not suppressed on update
		protected override void SuppressUpdateColumns(DataTable dt)
		{
			this._SuppressColumn(dt.Columns[BizObject.EnteredBy]);
			this._SuppressColumn(dt.Columns[BizObject.EnteredTime]);
		}*/

		//
		//Below Procedure calls are for the BrachyTherapy Reports and Booking Form: Could move these out
		//
		public DataSet GetBookedPatients()  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spRptBrachyBookedPatients");
			return DataAccessHelper.GetList(com);
		}

		public DataSet GetBrachyImplants(string beginDate, string endDate)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spRptBrachyImplants");
			DataAccessHelper.AddDateTimeInputParam(com, "BeginDate", Convert.ToDateTime(beginDate));
			DataAccessHelper.AddDateTimeInputParam(com, "EndDate", Convert.ToDateTime(endDate));
			
			return DataAccessHelper.GetList(com);
		}

		public DataSet GetBrachyPatientReportFields(int patientId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spRptBrachyCommonFields");
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
			
			return DataAccessHelper.GetList(com);
		}
		
		// Update the activity calculations only; leaves previous updated by person and time
		//
		public bool UpdateBrachytherapyActivities(int patientId, string brachyRecTotActivity, string brachyTotalActivity, string brachyPercentActivity)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdateBrachyActivitiesRecord");
			DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddStringInputParam(com, "BrachyRecTotalActivity", brachyRecTotActivity);
			DataAccessHelper.AddStringInputParam(com, "BrachyTotalActivity", brachyTotalActivity);
			DataAccessHelper.AddStringInputParam(com, "BrachyPercActivity", brachyPercentActivity);			
			
			DataAccessHelper.ExecuteScalar(com);

			return true;
		}
	}
}
