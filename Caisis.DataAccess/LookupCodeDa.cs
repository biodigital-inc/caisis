using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;




namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for LookupCodeDa.
    /// </summary>
    public class LookupCodeDa : BaseDA
    {
        protected override void SetParams()
        {
            this._GetStoredProc = "spGetLookupCodesRecord";
            this._InsertStoredProc = "spInsertLookupCodesRecord";
            this._UpdateStoredProc = "spUpdateLookupCodesRecord";
            this._DeleteStoredProc = "spDeleteLookupCodesRecord";
            //if parent id is the same as primkey then know its one to one

            this._GetByParentStoredProc = "spGetLookupCodes";
        }

        public static DataView GetLookupData(string tablename, string valueFieldname, string textFieldname,
            string restrictions, string order)
        {
            DataTable table = new DataTable();
            Connectivity.GetDistinctForLookup(tablename, valueFieldname, textFieldname, restrictions, order, table);
            return table.DefaultView;
        }

        //used to populate combo and select boxes
        public DataTable GetLookupCodes(string lkpName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetLkpCodes");
            string[] lkpArray = lkpName.Split(new char[] { ',' });
            DataAccessHelper.AddStringInputParam(com, "LkpFieldName", lkpArray[0].Trim());
            if (lkpArray.Length > 1)
            {
                DataAccessHelper.AddStringInputParam(com, "AttributeName", lkpArray[1].Trim());
            }

            if (lkpArray.Length > 2)
            {
                DataAccessHelper.AddStringInputParam(com, "AttributeValue", lkpArray[2].Trim());
            }
            DataSet ds = DataAccessHelper.GetRecord(com);

            return ds.Tables[0];
        }

        /// <summary>
        /// Removes lookupcodeid from ParentChildCodes table before deleting form LookupCodes table
        /// </summary>
        /// <param name="lkpCodeId">LookupCodeId to delete</param>
        public void DeleteLookupCode(int lkpCodeId)
        {
            string sql = "IF EXISTS (SELECT ChildCodeId FROM LookupParentChildCodes WHERE ChildCodeId= @LookupCodeId) ";
            sql += " BEGIN ";
            sql += "DELETE LookupParentChildCodes WHERE ChildCodeId= @LookupCodeId ";
            sql += "DELETE FROM LookupCodes WHERE LookUpCodeId=@LookupCodeId ";
            sql += "END ";
            sql += "ELSE DELETE FROM LookupCodes WHERE LookUpCodeId=@LookupCodeId";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "LookupCodeId", lkpCodeId);
            DataAccessHelper.ExecuteScalar(com);
        }

        //used for admin utilities
        public DataSet GetLookupCodesRecord(int lookupCodeId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetLookupCodesRecord");
            DataAccessHelper.AddIntInputParam(com, "LookupCodeId", lookupCodeId);
            return DataAccessHelper.GetRecord(com);
        }

        public DataSet GetLookupsByFieldName(string lkpFieldName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetFieldNameLkpCodes");
            DataAccessHelper.AddStringInputParam(com, "LkpFieldName", lkpFieldName);
            return DataAccessHelper.GetRecord(com);
        }

        public DataSet GetLookupFieldNames()
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spListLkpFieldNames");
            return DataAccessHelper.GetRecord(com);
        }

        /// <summary>
        /// Returns a list of all child lookup codes
        /// </summary>
        /// <param name="parentLookupId"></param>
        /// <returns></returns>
        public DataTable GetChildsCodeByLookupId(int parentLookupId)
        {
            string sql = "SELECT LookupCodes.* FROM LookupParentChildCodes INNER JOIN LookupCodes ON LookupParentChildCodes.ChildCodeId = LookupCodes.LookupCodeId WHERE LookupParentChildCodes.ParentCodeId = @LookupCodeId ORDER BY LookupCodes.LkpFieldName";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "LookupCodeId", parentLookupId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets a List of Lookup Codes by name, excluding those which are child codes of a parent lookup code.
        /// </summary>
        /// <param name="parentLookupId">The LookupCodeId of the parent code to exclude from results</param>
        /// <param name="childLookupFieldName">The LkpField name of the child codes to return</param>
        /// <returns></returns>
        public DataTable GetLookupCodesExcludingCodesByParentLookupId(int parentLookupId, string childLookupFieldName)
        {
            string sql = "SELECT LookupCodes.* FROM LookupCodes WHERE LookupCodes.LookupCodeId NOT IN (SELECT LookupCodes.LookupCodeId FROM LookupParentChildCodes INNER JOIN LookupCodes ON LookupParentChildCodes.ChildCodeId = LookupCodes.LookupCodeId WHERE LookupParentChildCodes.ParentCodeId = @LookupCodeId AND LookupCodes.LkpFieldName = @LkpFieldName) AND LkpFieldName = @LkpFieldName";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "LookupCodeId", parentLookupId);
            DataAccessHelper.AddStringInputParam(com, "LkpFieldName", childLookupFieldName);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of child lookup codes based on child lookup code fieldname
        /// </summary>
        /// <param name="parentLookupId"></param>
        /// <param name="childLookupFieldName"></param>
        /// <returns></returns>
        public DataTable GetChildCodesByLookupIdAndChildLookupName(int parentLookupId, string childLookupFieldName)
        {
            string sql = "SELECT  LookupParentChildCodes.*,LookupCodes.* FROM LookupParentChildCodes INNER JOIN LookupCodes ON LookupParentChildCodes.ChildCodeId = LookupCodes.LookupCodeId WHERE LookupParentChildCodes.ParentCodeId = @LookupCodeId AND LookupCodes.LkpFieldName = @LkpFieldName";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "LookupCodeId", parentLookupId);
            DataAccessHelper.AddStringInputParam(com, "LkpFieldName", childLookupFieldName);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of parent lookup codes of the child lookp code value.
        /// </summary>
        /// <param name="parentLkpField">The name of the parent LkpFieldName</param>
        /// <param name="childLkpField">The name of the child LkpFieldName</param>
        /// <param name="childLkpCode">The LkpCode of the child</param>
        /// <returns></returns>
        public DataTable GetParentLookupCodeByChildCode(string parentLkpField, string childLkpField, string childLkpCode)
        {
            string sql =
            @"
            SELECT
                a.LookupCodeId,
	            a.LkpCode
            FROM LookupCodes a
            INNER JOIN LookupParentChildCodes b
	            ON a.LookupCodeId = b.ParentCodeId
            INNER JOIN LookupCodes c
	            ON b.ChildCodeId = c.LookupCodeId
            WHERE
	            a.LkpFieldName = @ParentLkpFieldName
	            AND c.LkpFieldName = @ChildLkpFieldName
	            AND c.LkpCode = @ChildLkpCode
            ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "ParentLkpFieldName", parentLkpField);
            DataAccessHelper.AddStringInputParam(com, "ChildLkpFieldName", childLkpField);
            DataAccessHelper.AddStringInputParam(com, "ChildLkpCode", childLkpCode);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public void InsertChildCodes(int parentLookupId, string[] childLookupCodeList)
        {
            string sql = "";
            foreach (string priKey in childLookupCodeList)
            {
                sql += " INSERT INTO LookupParentChildCodes (ParentCodeId,ChildCodeId) Values(" + parentLookupId + "," + priKey + "); ";
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
        }

        public void RemoveChildCodes(int parentLookupId, string[] childLookupCodeList)
        {
            string builder = "";
            foreach (string key in childLookupCodeList)
            {
                builder += key + ",";
            }
            builder = builder.TrimEnd(",".ToCharArray());
            string sql = "DELETE FROM LookupParentChildCodes WHERE ParentCodeId = " + parentLookupId + " AND ChildCodeId IN (" + builder + ")";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.ExecuteScalar(com);
        }

        /// <summary>
        /// Gets a list of lookup codes and attribute values by lookupfieldname and attribute name
        /// </summary>
        /// <param name="lookupFieldName"></param>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        public DataTable GetLookupCodesAttributeValues(string lookupFieldName, string attributeName)
        {
            string sql = "SELECT LookupCodes.LookupCodeId, LookupCodes.LkpCode, LookupCodeAttributes.AttributeValue ";
            sql += "FROM LookupCodes ";
            sql += "INNER JOIN LookupCodeAttributes ";
            sql += "ON LookupCodes.LookupCodeId = LookupCodeAttributes.LookupCodeId ";
            sql += "INNER JOIN LookupAttributes ";
            sql += "ON LookupCodeAttributes.AttributeId = LookupAttributes.AttributeId ";
            sql += "WHERE LkpFieldName = @LkpFieldName AND AttributeName = @AttributeName";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "LkpFieldName", lookupFieldName);
            DataAccessHelper.AddStringInputParam(com, "AttributeName", attributeName);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns lookup codes for a field name with associated name/value 
        /// </summary>
        /// <param name="lookupFieldName">The name of the lookup code</param>
        /// <param name="attributeName">The AttributeName to match</param>
        /// <param name="attributeValue">The AttributeValue to match</param>
        /// <returns>DataTable</returns>
        public DataTable GetLookupCodesByAttributeByNameAndValue(string lookupFieldName, string attributeName, string attributeValue)
        {
            string sql = "SELECT LookupCodes.LookupCodeId, LookupCodes.LkpCode ";
            sql += "FROM LookupCodes ";
            sql += "INNER JOIN LookupCodeAttributes ";
            sql += "ON LookupCodes.LookupCodeId = LookupCodeAttributes.LookupCodeId ";
            sql += "INNER JOIN LookupAttributes ";
            sql += "ON LookupCodeAttributes.AttributeId = LookupAttributes.AttributeId ";
            sql += "WHERE LkpFieldName = @LkpFieldName AND AttributeName = @AttributeName AND AttributeValue = @AttributeValue ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "LkpFieldName", lookupFieldName);
            DataAccessHelper.AddStringInputParam(com, "AttributeName", attributeName);
            DataAccessHelper.AddStringInputParam(com, "AttributeValue", attributeValue);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of Lookup Codes Where LookupCodes.LkpFieldName = lookupFieldName AND LookupAttributes.AttributeName != attributeName
        /// </summary>
        /// <param name="lookupFieldName"></param>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        public DataTable GetLookupCodesWithoutAttribute(string lookupFieldName, string attributeName)
        {
            string sql = "SELECT LookupCodes.* FROM LookupCodes ";
            sql += "WHERE LkpFieldName = @LkpFieldName AND LookupCodeId NOT IN ";
            sql += "(SELECT DISTINCT(LookupCodeId) FROM LookupCodeAttributes ";
            sql += "INNER JOIN LookupAttributes ";
            sql += "ON LookupCodeAttributes.AttributeId = LookupAttributes.AttributeId  ";
            sql += "WHERE AttributeName = @AttributeName)";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "LkpFieldName", lookupFieldName);
            DataAccessHelper.AddStringInputParam(com, "AttributeName", attributeName);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns lookup attibute by AttributeName
        /// </summary>
        /// <param name="attributeName">The AttributeName to match</param>
        /// <returns></returns>
        public DataTable GetLookupAttributeByName(string attributeName)
        {
            string sql = "SELECT * FROM LookupAttributes WHERE AttributeName = @AttributeName";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "AttributeName", attributeName);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of lookup code attributes based on attribute id, i.e. all records with
        /// foreign key AttributeId= attributeId
        /// </summary>
        /// <param name="attributeId"></param>
        /// <returns></returns>
        public DataTable GetLookupCodeAttributesByAttributeId(int attributeId)
        {
            string sql = "select * FROM LookupCodeAttributes WHERE AttributeId = @AttributeId";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "AttributeId", attributeId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Return a list of attributes for a Lookup code based on the attribute name
        /// </summary>
        /// <param name="lkpCodeId"></param>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        public DataTable GetLookupAttributesByLookupCodeIdAndLookupAttributeName(int lkpCodeId, string attributeName)
        {
            string sql = "select LookupAttributes.*,LookupCodeAttributes.* from LookupCodeAttributes INNER JOIN ";
            sql += "LookupAttributes ON LookupAttributes.AttributeId = LookupCodeAttributes.AttributeId WHERE ";
            sql += "LookupCodeAttributes.LookupCodeId = @LookupCodeId AND LookupAttributes.AttributeName = @AttributeName ";
            sql += "order by LookupCodeAttributes.LookupCodeId";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "LookupCodeId", lkpCodeId);
            DataAccessHelper.AddStringInputParam(com, "AttributeName", attributeName);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Return a list of attributes for a Lookup code based on the attribute id
        /// </summary>
        /// <param name="lkpCodeId"></param>
        /// <param name="attributeId"></param>
        /// <returns></returns>
        public DataTable GetLookupAttributesByLookupCodeIdAndAttributeId(int lkpCodeId, int attributeId)
        {
            string sql = "select LookupAttributes.*,LookupCodeAttributes.* from LookupCodeAttributes ";
            sql += "INNER JOIN LookupAttributes ON LookupAttributes.AttributeId = LookupCodeAttributes.AttributeId ";
            sql += "WHERE LookupCodeAttributes.LookupCodeId = @LookupCodeId AND ";
            sql += "LookupAttributes.AttributeId = @AttributeId order by LookupCodeAttributes.LookupCodeId";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "LookupCodeId", lkpCodeId);
            DataAccessHelper.AddIntInputParam(com, "AttributeId", attributeId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="lkpFieldName"></param>
        /// <param name="attributeId"></param>
        /// <returns></returns>
        public DataTable GetLookupCodeAttributesByLkpFieldAndAttribute(string lkpFieldName, int attributeId)
        {
            return GetLookupCodeAttributesByLkpFieldAndAttribute(lkpFieldName, attributeId, string.Empty);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="lkpFieldName"></param>
        /// <param name="attributeId"></param>
        /// <param name="optinalValueFilter"></param>
        /// <returns></returns>
        public DataTable GetLookupCodeAttributesByLkpFieldAndAttribute(string lkpFieldName, int attributeId, string optinalValueFilter)
        {
            string templateSQL =
            @"
            SELECT
                a.LookupCodeId,
                a.LkpCode,
                a.LkpDescription,
                a.LkpOrder,
                a.LkpSuppress,
                b.AttributeId,
                b.LookupCodeAttributeId    
            FROM LookupCodes a
            LEFT OUTER JOIN	LookupCodeAttributes b
                ON b.LookupCodeId = a.LookupCodeId
                AND b.AttributeId = @AttributeId
                {0}                
            WHERE
                a.LkpFieldName = @LkpFieldName
            ORDER BY
                ISNULL(b.LookupCodeAttributeId, 1) - ISNULL(b.LookupCodeAttributeId,0) ASC,
                LkpCode ASC
            ";
            string sql = templateSQL;
            bool useValueFilter = !string.IsNullOrEmpty(optinalValueFilter);
            // add filter by value if needed
            if (useValueFilter)
            {
                sql = string.Format(templateSQL, "AND b.AttributeValue = @AttributeValue"); 
            }
            else 
            {
                sql = string.Format(templateSQL, string.Empty); 
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "LkpFieldName", lkpFieldName);
            DataAccessHelper.AddIntInputParam(com, "AttributeId", attributeId);
            if (useValueFilter)
            {
                DataAccessHelper.AddStringInputParam(com, "AttributeValue", optinalValueFilter);
            }
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of distinct LookupCodeAttribute.AttributeValue
        /// </summary>
        /// <param name="lkpFieldName"></param>
        /// <param name="attributeId"></param>
        /// <returns></returns>
        public DataTable GetDistinctLookupCodeAttributes(string lkpFieldName, int attributeId)
        {
            string sql = "SELECT DISTINCT AttributeValue ";
            sql += "FROM LookupCodeAttributes ";
            sql += "INNER JOIN LookupCodes ";
            sql += "ON LookupCodes.LookupCodeId = LookupCodeAttributes.LookupCodeId ";
            sql += "WHERE LookupCodeAttributes.AttributeId = @AttributeId AND LookupCodes.LkpFieldName = @LkpFieldName ";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "LkpFieldName", lkpFieldName);
            DataAccessHelper.AddIntInputParam(com, "AttributeId", attributeId);

            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns true is the specified lookup code exists for the specified lookup field name
        /// </summary>
        /// <param name="lkpFieldName"></param>
        /// <param name="lkpCodeName"></param>
        /// <returns></returns>
        public Boolean LookupCodeExists(string lkpFieldName, string lkpCode)
        {
            string sql = @"
                SELECT * FROM LookupCodes WHERE LkpFieldName = @LkpFieldName AND LkpCode = @LkpCode ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "LkpFieldName", lkpFieldName);
            DataAccessHelper.AddStringInputParam(com, "LkpCode", lkpCode);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];

            if (dt.Rows.Count > 0)
                return true;
            else
                return false;
        }

        #region stats

        /// <summary>
        /// Returns a DataSet containing Lookup Code stats.
        /// Table 1: TableName, FieldName, LkpFieldNameCount representing metadata fields associated with lookup code.
        /// Table 2: count of lookup code by lkpFieldName.
        /// Table 3: count of lookup codes tagged with diseaseName.
        /// </summary>
        /// <param name="lkpFieldName"></param>
        /// <param name="diseaseName"></param>
        /// <returns></returns>
        public DataSet GetLookupCodeStats(string lkpFieldName, string diseaseName)
        {
            string sql =
            @"
            SELECT
	            b.TableName,
	            a.FieldName,
	            COUNT(e.LkpFieldName) AS LkpFieldNameCount
            FROM MetadataFields a
            INNER JOIN MetadataTables b
	            ON a.TableId = b.TableId
            INNER JOIN MetadataFieldAttributeValues c
	            ON a.FieldId = c.FieldId
            INNER JOIN MetadataFieldAttributes d
	            ON d.AttributeId = c.AttributeId
            INNER JOIN LookupCodes e
	            ON e.LkpFieldName = c.AttributeValue
            WHERE
	            d.AttributeName = 'LookupCode'
	            AND e.LkpFieldName = @LkpFieldName
            GROUP BY
	            b.TableName,
	            a.FieldName,
	            e.LkpFieldName
            		
            SELECT
	            COUNT(LookupCodeId) AS LookupCount
            FROM LookupCodes 
            WHERE LkpFieldName = @LkpFieldName

            SELECT
	            COUNT(c.AttributeId) AS LookupDiseaseCount
            FROM LookupCodes a
            LEFT OUTER JOIN LookupCodeAttributes b
	            ON  b.LookupCodeId = a.LookupCodeId
		            AND b.AttributeValue = @DiseaseName
            LEFT OUTER JOIN LookupAttributes c
	            ON  c.AttributeId = b.AttributeId
		            AND c.AttributeName = 'Disease' 
            WHERE
	            a.LkpFieldName = @LkpFieldName
	            AND b.LookupCodeAttributeId IS NOT NULL
            GROUP BY
	            c.AttributeId
            ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "LkpFieldName", lkpFieldName);
            DataAccessHelper.AddStringInputParam(com, "DiseaseName", diseaseName);
            DataSet ds = DataAccessHelper.GetList(com);

            // normalize data sets
            var diseaseCount = ds.Tables[2];
            if (diseaseCount.Rows.Count == 0)
            {
                var countRow = diseaseCount.NewRow();
                countRow[0] = 0;
                diseaseCount.Rows.Add(countRow);
            }
            return ds;
        }

        #endregion
    }
}
