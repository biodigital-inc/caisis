using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for FileLoaderDa.
	/// </summary>
	public class FilesDa : BaseDA
	{
		public FilesDa()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		
		protected override void SetParams()  
		{
			this._GetStoredProc = "spGetFilesRecord";
			this._InsertStoredProc = "spInsertFilesRecord";
			this._UpdateStoredProc = "spUpdateFilesRecord";
			this._DeleteStoredProc = "spDeleteFilesRecord";
			this._GetByParentStoredProc = null;
		}

		
		
		/// <summary>
		/// Returns records of files that have the same table name and primary key of the table.
		/// </summary>
		/// <param name="tableName">table name</param>
		/// <param name="tablePrimaryKey">primary key of record in table</param>
		/// <returns></returns>
		public DataSet GetRecordsByTableAndTablePK(string tableName, int tablePrimaryKey)
		{
			SqlCommand com = DataAccessHelper.CreateCommand("spGetFiles");
			DataAccessHelper.AddStringInputParam(com, "TableName", tableName);
			DataAccessHelper.AddIntInputParam(com, "TablePrimaryKey", tablePrimaryKey);
			return DataAccessHelper.GetRecord(com);
		}

	}
}