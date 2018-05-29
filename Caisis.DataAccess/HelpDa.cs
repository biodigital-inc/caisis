using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;

namespace Caisis.DataAccess
{
	/// <summary>
	/// Summary description for HelpDa.
	/// </summary>
	public class HelpDa : BaseDA
	{
		protected override void SetParams()  
		{
			this._GetStoredProc = null;
			this._InsertStoredProc = null;
			this._UpdateStoredProc = null;
			this._DeleteStoredProc = null;
			this._GetByParentStoredProc = null;
		}

		//select HelpTableDescription from HelpTables where HelpTableName ='"+tableName+"'"
        [Obsolete("Use MetadataDa")]
		public DataSet GetHelpTableDescription(string helpTableName)
		{
			//SqlCommand com = DataAccessHelper.CreateCommand("spGetHelpTableDescription");
			//DataAccessHelper.AddStringInputParam(com, "TableName", helpTableName);
			//return DataAccessHelper.GetRecord(com);

            string sql = "SELECT * FROM MetadataTables WHERE TableName = '" + helpTableName + "'";
            return ReturnADataset(sql);
		}

		//select HelpFieldName, HelpFieldDescription from helpfields f, helptables t where f.helptableid = t.helptableid and t.helptablename='"+tableName+"'";
		/* No reference to this function in solution
        public DataSet GetHelpFieldDescriptions(string helpTableName)
		{
			//SqlCommand com = DataAccessHelper.CreateCommand("spGetHelpFieldDescriptions");
			//DataAccessHelper.AddStringInputParam(com, "TableName", helpTableName);
			//return DataAccessHelper.GetRecord(com);

            //string sql = "SELECT MetadataFields.* FROM MetadataFields INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId WHERE TableName = '" + helpTableName + "'";
            //return ReturnADataset(sql);
        }*/


        [Obsolete("Use MetadataDa")]
		public DataSet GetHelpFieldDescriptionsWithLabels(string helpTableName)
		{
			//SqlCommand com = DataAccessHelper.CreateCommand("spGetHelpFieldDescriptionsWithLabels");
			//DataAccessHelper.AddStringInputParam(com, "TableName", helpTableName);
			//return DataAccessHelper.GetRecord(com);

            //string sql = "SELECT MetadataFields.* FROM MetadataFields INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId WHERE TableName = '" + helpTableName + "' AND FieldLabel IS NOT NULL";
            //Meta table field must have both Label and Description attribute or record for that row will not be returned
            string sql = "SELECT mf.FieldName 'FieldName', mfav1.AttributeValue 'FieldLabel', mfav2.AttributeValue 'FieldDescription' FROM MetadataFieldAttributeValues mfav1, MetadataFieldAttributeValues mfav2, MetadataFields mf WHERE mfav1.FieldId = mfav2.FieldId AND mfav1.FieldId = mf.FieldId AND mfav1.AttributeId IN (SELECT AttributeId FROM MetadataFieldAttributes WHERE AttributeName = 'FieldLabel') AND mfav2.AttributeId IN (SELECT AttributeId FROM MetadataFieldAttributes WHERE AttributeName = 'FieldDescription') AND mf.TableId = (SELECT TableId FROM MetadataTables WHERE TableName = '" + helpTableName + "')";
            return ReturnADataset(sql);

		}

        public DataSet GetHelpSectionName(string helpSectionName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetHelpSectionName");
            DataAccessHelper.AddStringInputParam(com, "HelpSectionName", helpSectionName);
            return DataAccessHelper.GetRecord(com);
        }

        //Helper functions
        private DataTable ReturnATable(string sql)
        {
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataSet ds = DataAccessHelper.GetRecord(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            return ds.Tables[0];
        }
  
        private DataSet ReturnADataset(string sql)
        {
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataSet ds = DataAccessHelper.GetRecord(com);
            if (com.Connection.State != ConnectionState.Closed) com.Connection.Close();
            return ds;
        }



	}
}



