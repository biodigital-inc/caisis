using System;
using System.Data.SqlClient;
using System.Data;


namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for PermissionDa.
	/// </summary>
	public class PermissionDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = null;
			this._InsertStoredProc = null;
			this._UpdateStoredProc = null;
			this._DeleteStoredProc = null;
			this._GetByParentStoredProc = null;
		}

		public DataSet GetPermissions()  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetPermissions");
			DataSet ds = DataAccessHelper.GetRecord(com);
			return ds;
		}

		public DataSet GetByName(string permissionName)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetPermissionsRecord");
			DataAccessHelper.AddStringInputParam(com, "permission", permissionName);
			DataSet ds = DataAccessHelper.GetRecord(com);
			return ds;
		}

		public DataSet GetByUserDataset(string userName, int datasetId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetUserDatasetPermissions");
			DataAccessHelper.AddStringInputParam(com, "userName", userName);
			DataAccessHelper.AddIntInputParam(com, "datasetId", datasetId);
			DataSet ds = DataAccessHelper.GetList(com);
			return ds;
		}
			

	}
}
