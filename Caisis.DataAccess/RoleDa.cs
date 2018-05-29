using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for RoleDa.
	/// </summary>
	public class RoleDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetRoles";
			this._InsertStoredProc = null;
			this._UpdateStoredProc = null;
			this._DeleteStoredProc = "spDeleteRolesRecord";
			this._GetByParentStoredProc = "spGetPermissionRoles";
		}

		public DataSet GetByPermission(int permissionId)  
		{
			DataSet ds = new DataSet();
			DataTable dt = new DataTable();
            
			this._GetChildRecords(permissionId, "PermissionId", dt);
            
			ds.Tables.Add(dt);
			return ds;
		}

        // moved from BaseDataAccess during v4.0 port
        private void _GetChildRecords(int parentId, string parentKeyName, DataTable dt)
        {
            SqlCommand com = DataAccessHelper.CreateCommand(this._GetByParentStoredProc);
            DataAccessHelper.AddIntInputParam(com, parentKeyName, parentId);
            DataAccessHelper.GetRecord(com, dt);
        }

		public DataSet GetRoles()
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetRoles");
			return DataAccessHelper.GetRecord(com);
		}

		public DataSet GetRolesRecord(int roleId)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetRolesRecord");
			DataAccessHelper.AddIntInputParam(com, "RoleId", roleId);
			return DataAccessHelper.GetRecord(com);
		}

        //public int InsertRole(string role, string roleDescription)  
        //{
        //    SqlCommand com = DataAccessHelper.CreateCommand("spInsertRolesRecord");
        //    DataAccessHelper.AddStringInputParam(com, "Role", role);	
        //    DataAccessHelper.AddLongStringInputParam(com, "RoleDescription", roleDescription);	
        //    DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
        //    DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
        //    DataAccessHelper.AddDateTimeInputParam(com, "DeactivatedTime", null);
			
        //    DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");

        //    Hashtable outParams = DataAccessHelper.ExecuteScalar(com);
			
        //    if(outParams["NewPrimaryKey"] != System.DBNull.Value)
        //    {
        //        return (int)outParams["NewPrimaryKey"];
        //    }
        //    else
        //    {
        //        return -1;
        //    }
        //}

		public bool UpdateRole(int roleId, string role, string roleDescription)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdateRolesRecord");
			DataAccessHelper.AddIntInputParam(com, "RoleId", roleId);	
			//DataAccessHelper.AddIntInputParam(com, "RoleId", roleId);	
			DataAccessHelper.AddStringInputParam(com, "Role", role);	
			DataAccessHelper.AddLongStringInputParam(com, "RoleDescription", roleDescription);	
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
			DataAccessHelper.AddDateTimeInputParam(com, "DeactivatedTime", null);
			
			DataAccessHelper.ExecuteScalar(com);

			return true;
		}
	}
}
