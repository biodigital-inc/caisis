using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for SeedAssignedDa.
	/// </summary>
	public class SeedAssignedDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetSeedsAssignedRecord";
			this._InsertStoredProc = "spInsertSeedsAssignedRecord";
			this._UpdateStoredProc = "spUpdateSeedsAssignedRecord";
			this._DeleteStoredProc = "spDeleteSeedsAssignedRecord";
			this._GetByParentStoredProc = "spGetSeedsAssigned";
		}

		/// <summary>
		/// Returns record of Seed. Used to determine of record exists so update the Seed Number or insert new row.
		/// </summary>
		/// <param name="patientId"></param>
		/// <param name="seedId"></param>
		/// <returns></returns>
		public DataTable GetSeedAssigned(int patientId, int seedId)
		{
			string cmdText = "SELECT * FROM SeedsAssigned WHERE SeedsAssigned.PatientId = '" + patientId + "' AND SeedsAssigned.SeedId = '" + seedId + "'";
			DataTable dt = new DataTable();
			DataAccessHelper.ExecuteSqlSelect(cmdText, dt);	

			return dt;
		}

		public bool UpdateSeedsAssignedNumber(int seedsAssignedId, string seedNum, string updatedBy)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdateSeedsAssignedSeedNum");
			DataAccessHelper.AddIntInputParam(com, "SeedsAssignedId", seedsAssignedId);
			DataAccessHelper.AddStringInputParam(com, "SeedNum", seedNum);
			DataAccessHelper.AddStringInputParam(com, "UpdatedBy", updatedBy);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
			DataAccessHelper.ExecuteScalar(com);
			return true;
		}

		


		/* v4.0 PatientId, SeedId and entered/locked fields are not provided on update
		protected override void SuppressUpdateColumns(DataTable dt)
		{
			this._SuppressColumn(dt.Columns[SeedAssigned.PatientId]);
			this._SuppressColumn(dt.Columns[SeedAssigned.SeedId]);
			this._SuppressColumn(dt.Columns[BizObject.EnteredBy]);
			this._SuppressColumn(dt.Columns[BizObject.EnteredTime]);
			this._SuppressColumn(dt.Columns[BizObject.LockedBy]);
			this._SuppressColumn(dt.Columns[BizObject.LockedTime]);
		}

		protected override void SuppressInsertColumns(DataTable dt)  
		{
			base.SuppressInsertColumns(dt);

			this._SuppressColumn(dt.Columns[BizObject.LockedBy]);
			this._SuppressColumn(dt.Columns[BizObject.LockedTime]);
		}
        */
	}
}
