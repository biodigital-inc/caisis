using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for GroupDatasetDa.
	/// 
	/// should make consistent with other Da's and create GroupDataset BizObject
	/// </summary>
	public class GroupDatasetDa : BaseDA
	{

		protected override void SetParams()  
		{
			this._GetStoredProc = "";
			this._InsertStoredProc = "";
			this._UpdateStoredProc = "";
			this._DeleteStoredProc = "";
			this._GetByParentStoredProc = "";
		}


		public DataSet GetGroupsByDatasetId(int datasetId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetGroupsByDatasetId");
			DataAccessHelper.AddIntInputParam(com, "DatasetId", datasetId);
			return DataAccessHelper.GetList(com);
		}

		public DataSet GetGroupsInDataset(int datasetId)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetGroupsInDataset");
			DataAccessHelper.AddIntInputParam(com, "DatasetId", datasetId);
			return DataAccessHelper.GetList(com);
		}

		
        //public bool InsertGroupDatasetsRecord(int datasetId, int groupId)  
        //{
        //    SqlCommand com = DataAccessHelper.CreateCommand("spInsertGroupDatasetsRecord");
        //    DataAccessHelper.AddIntInputParam(com, "DatasetId", datasetId);
        //    DataAccessHelper.AddIntInputParam(com, "GroupId", groupId);

        //    DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
        //    DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", DateTime.Now);
        //    DataAccessHelper.AddDateTimeInputParam(com, "DeactivatedTime", null);

        //    DataAccessHelper.ExecuteScalar(com);

        //    return true;
        //}

		public bool DeleteGroupDataset(int datasetId, int groupId)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spDeleteGroupDatasetsRecord");
			
			DataAccessHelper.AddIntInputParam(com, "DatasetId", datasetId);
			DataAccessHelper.AddIntInputParam(com, "GroupId", groupId);

			//DataAccessHelper.AddIntOutputParam(com, "Valid");
			
			DataAccessHelper.ExecuteScalar(com);

			return true;
		}
			
	}
}
