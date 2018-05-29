using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// DA for UserGroups table.
	/// 
	/// should make consistent with other Da's and create UserGroup BizObject
	/// </summary>
	public class UserGroupDa : BaseDA
	{

		protected override void SetParams()  
		{
			this._GetStoredProc = "";
			this._InsertStoredProc = "";
			this._UpdateStoredProc = "";
			this._DeleteStoredProc = "";
			this._GetByParentStoredProc = "";
		}


        //public bool InsertUserGroup(int userId, int groupId)
        //{
        //    SqlCommand com = DataAccessHelper.CreateCommand("spInsertUserGroupsRecord");
			
        //    DataAccessHelper.AddIntInputParam(com, "UserId", userId);
        //    DataAccessHelper.AddIntInputParam(com, "GroupId", groupId);

        //    DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
        //    DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
        //    DataAccessHelper.AddDateTimeInputParam(com, "DeactivatedTime", null);

        //    //DataAccessHelper.AddIntOutputParam(com, "Valid");
			
        //    DataAccessHelper.ExecuteScalar(com);

        //    return true;
        //}

        //public bool DeleteUserGroup(int userId, int groupId)
        //{
        //    SqlCommand com = DataAccessHelper.CreateCommand("spDeleteUserGroupsRecord");
			
        //    DataAccessHelper.AddIntInputParam(com, "UserId", userId);
        //    DataAccessHelper.AddIntInputParam(com, "GroupId", groupId);

        //    //DataAccessHelper.AddIntOutputParam(com, "Valid");
			
        //    DataAccessHelper.ExecuteScalar(com);

        //    return true;
        //}
			
	}
}
