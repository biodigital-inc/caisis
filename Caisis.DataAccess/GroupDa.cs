using System;
using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for DataSetDa.
	/// </summary>
	public class GroupDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetGroupsRecord";
			this._InsertStoredProc = "spInsertGroupsRecord";
			this._UpdateStoredProc = "spUpdateGroupsRecord";
			this._DeleteStoredProc = "spDeleteGroupsRecord";
			this._GetByParentStoredProc = "spGetGroups";
		}


		public DataSet GetGroups()  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetGroups");
			return DataAccessHelper.GetRecord(com);
		}
		
		public DataSet GetGroupsRecord(int groupId)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetGroupsRecord");
			DataAccessHelper.AddIntInputParam(com, "GroupId", groupId);
			return DataAccessHelper.GetRecord(com);
		}
		
		public DataSet GetUsersInGroup(int groupId)  
		{
				SqlCommand com = DataAccessHelper.CreateCommand("spGetUsersInGroup");
				DataAccessHelper.AddIntInputParam(com, "GroupId", groupId);
				return DataAccessHelper.GetRecord(com);
		}

		//public bool DeleteGroup(int groupId)  
		//{
		//	SqlCommand com = DataAccessHelper.CreateCommand("spDeleteGroupsRecord");
		//	DataAccessHelper.AddIntInputParam(com, "GroupId", groupId);
		//	DataAccessHelper.ExecuteScalar(com);

		//	return true;
		//}
		
		public DataSet GetGroupAccessCode(int userId, int datasetId)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetGroupAccessCode");
			DataAccessHelper.AddIntInputParam(com, "UserId", userId);	
			DataAccessHelper.AddIntInputParam(com, "DataSetId", datasetId);	

			return DataAccessHelper.GetRecord(com);
		}

		public bool UpdateGroupAccessCode(int groupId, string groupAccessCode)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdateGroupAccessCode");
			DataAccessHelper.AddIntInputParam(com, "GroupId", groupId);	
			DataAccessHelper.AddLongStringInputParam(com, "GroupAccessCode", groupAccessCode);	
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);

			DataAccessHelper.ExecuteScalar(com);

			return true;
		}

		//TODO: remove this and use Biz Object to update from admin
		//TODO: remove hardcoded group access code
		public bool InsertGroup(int roleId, string groupName, string groupDescription)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spInsertGroupsRecord");
			DataAccessHelper.AddIntInputParam(com, "RoleId", roleId);	
			DataAccessHelper.AddStringInputParam(com, "GroupName", groupName);	
			DataAccessHelper.AddLongStringInputParam(com, "GroupDescription", groupDescription);
			// This access code gives access to all standard tabs and menus
			// When admin is revised, this should no longer be hardcoded and should become part of the 
			// workflow
			DataAccessHelper.AddStringInputParam(com, "GroupAccessCode", "1FE1FC1F81C0000000");	
			DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
			DataAccessHelper.AddDateTimeInputParam(com, "DeactivatedTime", null);
			
			DataAccessHelper.ExecuteScalar(com);

			return true;
		}

		//TODO: remove this and use Biz Object to update from admin
		public bool UpdateGroup(int groupId, int roleId, string groupName, string groupDescription)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spUpdateGroupsRecord");
			DataAccessHelper.AddIntInputParam(com, "GroupId", groupId);	
			DataAccessHelper.AddIntInputParam(com, "RoleId", roleId);	
			DataAccessHelper.AddStringInputParam(com, "GroupName", groupName);	
			DataAccessHelper.AddLongStringInputParam(com, "GroupDescription", groupDescription);	
			//DataAccessHelper.AddStringInputParam(com, "GroupAccessCode", "");	
			DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
			DataAccessHelper.AddDateTimeInputParam(com, "DeactivatedTime", null);
			
			DataAccessHelper.ExecuteScalar(com);

			return true;
		}

		public DataSet GetUserGroups(string userName)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetUserGroups");
			DataAccessHelper.AddStringInputParam(com, "UserName", userName);
			return DataAccessHelper.GetList(com);
		}

        /// <summary>
        /// Returns a list of ALL Groups with optional UserGroupId for groups associated with User
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public DataTable GetGroupsByUser(int userId)
        {
            string sql =
            @"
            SELECT 
                a.*,
                b.UserGroupId
            FROM Groups a
            LEFT OUTER JOIN UserGroups b
                ON a.GroupId = b.GroupId AND b.UserId = @UserId
            ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);

            DataSet ds = DataAccessHelper.GetRecord(com);
            return ds.Tables[0];
        }

		public DataSet GetUserGroupsByUserId(int userId)  
		{
            string sql = "SELECT UserGroups.UserGroupId,Groups.* ";
            sql += "FROM UserGroups INNER JOIN ";
            sql += "Groups ON UserGroups.GroupId = Groups.GroupId ";
            sql += "WHERE UserId = @UserId";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "UserId", userId);

            DataSet ds = DataAccessHelper.GetRecord(com);
            return ds;
		}

	}
}
