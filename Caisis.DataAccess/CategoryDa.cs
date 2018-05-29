using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for CategoryDa.
	/// </summary>
	public class CategoryDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetCategoriesRecord";
			this._InsertStoredProc = "spInsertCategoriesRecord";
			this._UpdateStoredProc = "spUpdateCategoriesRecord";
			this._DeleteStoredProc = "spDeleteCategoriesRecord";
		}

		

		public DataSet GetCategories(int patientID)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetCategories");
			DataAccessHelper.AddIntInputParam(com, "PatientID", patientID);
			return DataAccessHelper.GetList(com);
		}

		public DataSet GetDistinctCategories(string userName)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetDistinctCategories");
			DataAccessHelper.AddStringInputParam(com, "UserName", userName);
			return DataAccessHelper.GetList(com);
		}


		public DataSet ValidateCategory(int PatientId, string Category, string CategoryType)  
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spValidateCategory");
			DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
			DataAccessHelper.AddStringInputParam(com, "Category", Category);
			DataAccessHelper.AddStringInputParam(com, "CategoryType", CategoryType);
			return DataAccessHelper.GetList(com);
		}

        public DataSet GetPatientCategories(int PatientId)
        {
            string sql = @"
              SELECT * FROM Categories WHERE PatientId = @PatientID ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            return DataAccessHelper.GetRecord(com);
        }



	}
}
