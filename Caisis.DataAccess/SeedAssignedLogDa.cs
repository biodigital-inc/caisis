using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for SeedAssignedLogDa.
	/// </summary>
	public class SeedAssignedLogDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetSeedsAssignedLogRecord";
			this._InsertStoredProc = "spInsertSeedsAssignedLogRecord";
			this._UpdateStoredProc = "spUpdateSeedsAssignedLogRecord";
			this._DeleteStoredProc = "spDeleteSeedsAssignedLogRecord";
			this._GetByParentStoredProc = "spGetSeedsAssignedLog";
		}

		

		public DataTable GetTransactionLog()
		{
			string cmdText = "SELECT * FROM SeedsAssignedLog, Seeds WHERE SeedsAssignedLog.SeedId = Seeds.SeedId";
			DataTable dt = new DataTable();
			DataAccessHelper.ExecuteSqlSelect(cmdText, dt);	

			return dt;
		}

        /* v4.0
		//SeedId and entered/locked fields are not provided on update
		protected override void SuppressUpdateColumns(DataTable dt)
		{
			//this._SuppressColumn(dt.Columns[SeedAssigned.PatientId]);
			this._SuppressColumn(dt.Columns[SeedAssigned.SeedId]);
			this._SuppressColumn(dt.Columns[BizObject.EnteredBy]);
			this._SuppressColumn(dt.Columns[BizObject.EnteredTime]);
			this._SuppressColumn(dt.Columns[BizObject.LockedBy]);
			this._SuppressColumn(dt.Columns[BizObject.LockedTime]);
		}
        */

		/* v4.0
        protected override void SuppressInsertColumns(DataTable dt)  
		{
			base.SuppressInsertColumns(dt);

			this._SuppressColumn(dt.Columns[BizObject.LockedBy]);
			this._SuppressColumn(dt.Columns[BizObject.LockedTime]);
		}
        */
	}
}
