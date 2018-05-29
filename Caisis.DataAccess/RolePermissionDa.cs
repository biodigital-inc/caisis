using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for RolePermissionDa.
    /// </summary>
    public class RolePermissionDa : BaseDA
    {
        protected override void SetParams()
        {
            this._GetStoredProc = null;
            this._InsertStoredProc = null;
            this._UpdateStoredProc = null;
            this._DeleteStoredProc = null;
            this._GetByParentStoredProc = null;
        }

        public DataTable GetRolePermissions(int roleId)
        {
            string sql = "SELECT RolePermissions.RolePermissionId,RolePermissions.RoleId,RolePermissions.PermissionId,Permissions.Permission,Permissions.PermissionDescription ";
            sql += "FROM Permissions ";
            sql += "INNER JOIN RolePermissions ON Permissions.PermissionId=RolePermissions.PermissionId ";
            sql += "WHERE RolePermissions.RoleId=@RoleId ";
            sql += "ORDER BY Permissions.Permission";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "RoleId", roleId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;

        }

        ///// <summary>
        ///// Return one row; columns RoleId, PermissionId, Entered, Updated, and Deacactivatd Time
        ///// </summary>
        ///// <param name="roleId">Role Id</param>
        ///// <param name="permissionId">Permission Id</param>
        ///// <returns>Dataset</returns>
        //public DataSet GetRolePermissionsRecord(int roleId, int permissionId)
        //{
        //    SqlCommand com = DataAccessHelper.CreateCommand("spGetRolePermissions");
        //    DataAccessHelper.AddIntInputParam(com, "RoleId", roleId);
        //    DataAccessHelper.AddIntInputParam(com, "PermissionId", roleId);
        //    DataSet ds = DataAccessHelper.GetRecord(com);
        //    return ds;
        //}

        //public int InsertRolePermissionsRecord(int roleId, int permissionId)
        //{
        //    SqlCommand com = DataAccessHelper.CreateCommand("spInsertRolePermissionsRecord");

        //    DataAccessHelper.AddIntInputParam(com, "RoleId", roleId);
        //    DataAccessHelper.AddIntInputParam(com, "PermissionId", permissionId);

        //    DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
        //    DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
        //    DataAccessHelper.AddDateTimeInputParam(com, "DeactivatedTime", null);

        //    DataAccessHelper.AddIntOutputParam(com, "NewPrimaryKey");

        //    Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

        //    if (outParams["NewPrimaryKey"] != System.DBNull.Value)
        //    {
        //        return (int)outParams["NewPrimaryKey"];
        //    }
        //    else
        //    {
        //        return -1;
        //    }
        //}

        //public bool DeleteRolePermissions(int roleId)
        //{
        //    SqlCommand com = DataAccessHelper.CreateCommand("spDeleteRolePermissions");
        //    DataAccessHelper.AddIntInputParam(com, "RoleId", roleId);

        //    DataAccessHelper.ExecuteScalar(com);
        //    return true;
        //}

        public bool DeleteRolePermissionsRecord(int roleId, int permissionId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spDeleteRolePermissionsRecord");
            DataAccessHelper.AddIntInputParam(com, "RoleId", roleId);
            DataAccessHelper.AddIntInputParam(com, "PermissionId", roleId);

            DataAccessHelper.ExecuteScalar(com);
            return true;
        }
    }
}
