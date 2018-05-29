using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Reflection;
using System.Text;
using System.Xml;

using Caisis.DataAccess;
using Caisis.Security;

namespace Caisis.BOL
{
    public class ExportServices
    {
        class TableComparer : IComparer<string>
        {
            public int Compare(string x, string y)
            {
                //return BOFactory.GetChildDepth(x).CompareTo(BOFactory.GetChildDepth(y));
				return BusinessObject.GetTableDepth(x).CompareTo(BusinessObject.GetTableDepth(y));
            }
        }

        public delegate void AppendFilenameHeaderDelegate(int userExportId);
        public delegate void ExceptionHandlerDelegate(Exception e);

        delegate string SqlSelectDelegate(string tablename, SqlConnection connection);
		delegate string MetadataSelectDelegate(IEnumerable<string> tablenames);
        public delegate bool EvaluateAttributesDelegate(object[] rawAttributes, string tablename, 
            string fieldname, out string maskedFieldname);

        Dictionary<string, string> parentKeyHistory = new Dictionary<string, string>();
        Dictionary<string, BusinessObject> bizObjectHistory = new Dictionary<string, BusinessObject>();

        UserExport userExport;

        #region private members and properties
        public string datasetSql;
        private int userLoginId;
        private string diseaseType;
        private string privacyLevel;
        private DateTime? irbApprovalDate;
        private string irbApprovalType;
        private string purpose;
        private AppendFilenameHeaderDelegate appendFilenameHeaderCallback;
        private ExceptionHandlerDelegate exceptionHandler;

        public string DatasetSql
        {
            get { return datasetSql; }
            set { datasetSql = value; }
        }

        public int UserLoginId
        {
            get { return userLoginId; }
            set { userLoginId = value; }
        }
        
        public string DiseaseType
        {
            get { return diseaseType; }
            set { diseaseType = value; }
        }

        public string PrivacyLevel
        {
            get { return privacyLevel; }
            set { privacyLevel = value; }
        }

        public DateTime IrbApprovalDate
        {
            get
            {
                if (irbApprovalDate == null)
                {
                    return DateTime.MinValue;
                }
                else
                {
                    return irbApprovalDate.Value;
                }
            }

            set { irbApprovalDate = value; }
        }

        public string IrbApprovalType
        {
            get { return irbApprovalType; }
            set { irbApprovalType = value; }
        }

        public string Purpose
        {
            get { return purpose; }
            set { purpose = value; }
        }

        public AppendFilenameHeaderDelegate AppendFilenameHeaderCallback
        {
            get { return appendFilenameHeaderCallback; }
            set { appendFilenameHeaderCallback = value; }
        }

        public ExceptionHandlerDelegate ExceptionHandler
        {
            get { return exceptionHandler; }
            set { exceptionHandler = value; }
        }
        #endregion

        public ExportServices()
        {
            userExport = new UserExport();
        }

        private int InitializeExport()
        {
            userExport[UserExport.DiseaseType] = diseaseType;
            userExport[UserExport.ExportDate] = DateTime.Now;
            userExport[UserExport.IRB_ApprovalDate] = irbApprovalDate;
            userExport[UserExport.IRB_ApprovalType] = irbApprovalType;
            userExport[UserExport.PrivacyLevel] = privacyLevel;
            userExport[UserExport.Purpose] = purpose;
            userExport[UserExport.UserLoginId] = userLoginId;

            userExport.Save();

            int userExportId = (int) userExport[UserExport.UserExportId];

            UserExportPatientsDa da = new UserExportPatientsDa();
            da.CreateTable(datasetSql, userExportId);

            return userExportId;
        }

        public void Export(XmlWriter xw, List<string> tablenames)
        {
            string exceptionMessage;

            if (!ValidatePrivacyLevel(privacyLevel, purpose, irbApprovalDate, irbApprovalType, out exceptionMessage))
            {
                throw new DataExportException(exceptionMessage);
            }

            int userExportId = InitializeExport();

            if (appendFilenameHeaderCallback != null)
            {
                appendFilenameHeaderCallback(userExportId);
            }

            switch (privacyLevel)
            {
                case "Identified":
                    ExportIdentified(xw, tablenames, userExportId);
                    break;
                case "Deidentified":
                    ExportDeidentified(xw, tablenames, userExportId);
                    break;
                case "Limited":
                    ExportLimited(xw, tablenames, userExportId);
                    break;
            }
        }

        private bool ValidatePrivacyLevel(string privacyLevel, string purpose, DateTime? irbApprovalDate, string irbApprovalType,
            out string exceptionMessage)
        {
            bool validated = false;
            exceptionMessage = null;

            switch (privacyLevel)
            {
                case "Deidentified":
                    validated = true;
                    break;

                case "Limited":
                    if (purpose == "Operations Data Analysis")
                    {
                        validated = true;
                    }
                    else
                    {
                        if (irbApprovalDate == null)
                        {
                            exceptionMessage = "Approval date cannot be null for limited privacy level.";
                        }
                        else if (irbApprovalType == "Research Authorization" || irbApprovalType == "Waiver of Authorization" || 
                            irbApprovalType == "Data Review Preparatory To Research" || irbApprovalType == "Data Use Agreement")
                        {
                            validated = true;
                        }
                        else
                        {
                            exceptionMessage = "Wrong approval type for limited privacy level.";
                        }
                    } 
                    break;

                case "Identified":
                    if (purpose == "Operations Data Analysis")
                    {
                        validated = true;
                    }
                    else
                    {
                        if (irbApprovalDate == null)
                        {
                            exceptionMessage = "Approval date cannot be null for identified privacy level.";
                        }
                        else if (irbApprovalType == "Research Authorization" || irbApprovalType == "Waiver of Authorization" || 
                            irbApprovalType == "Data Review Preparatory To Research")
                        {
                            validated = true;
                        }
                        else
                        {
                            exceptionMessage = "Wrong approval type for identified privacy level.";
                        }
                    }
                    break;
            }

            return validated;
        }

        private void ExportIdentified(XmlWriter writer, List<string> tablenames, int userExportId)
        {
            Export(writer, tablenames, EvaluateAttributesForIdentified, false, userExportId);
        }

        private void ExportDeidentified(XmlWriter writer, List<string> tablenames, int userExportId)
        {
            Export(writer, tablenames, EvaluateAttributesForDeidentified, true, userExportId);
        }

        private void ExportLimited(XmlWriter writer, List<string> tablenames, int userExportId)
        {
            Export(writer, tablenames, EvaluateAttributesForLimited, true, userExportId);
        }

        private void Export(XmlWriter writer, List<string> tablenames, EvaluateAttributesDelegate eval, 
            bool encryptPatientId, int userExportId)
        {
            ExportXml(
                writer,
                tablenames,
                delegate(string tablename, SqlConnection connection)
                {
                    List<string> columns = GetExportColumns(tablename, eval, connection);
                    string parentKey = GetParentKey(tablename);
                    List<KeyValuePair<string, string>> parentTableKeyMap = GetParentTableKeyMap(tablename);

                    List<KeyValuePair<string, string>> restrictions = new List<KeyValuePair<string, string>>();
                    restrictions.Add(new KeyValuePair<string, string>("UserExportPatients.UserExportId", userExportId.ToString()));

                    return SqlBuilder.BuildExportSelectAllStatement(columns, parentTableKeyMap, restrictions);
                },
				delegate(IEnumerable<string> selectedTables)
				{
					StringBuilder union = new StringBuilder();
					bool prependUnion = false;

					foreach (string tablename in selectedTables)
					{
						IEnumerable<KeyValuePair<string, string>> map = GetParentTableKeyMap(tablename);
						string primaryKeyName = BusinessObject.GetPrimaryKeyName(tablename);
						string sql = SqlBuilder.BuildVirtualValuesExportStatement(tablename, primaryKeyName, map, userExportId);

						if (prependUnion)
						{
							union.AppendLine("UNION");
						}
						else
						{
							prependUnion = true;
						}

						union.AppendLine(sql);
					}

					return union.ToString();
				},
                encryptPatientId);
        }

		//private void Export(XmlWriter writer, List<string> tablenames, EvaluateAttributesDelegate eval, bool encryptPatientId)
		//{
		//    ExportXml(
		//        writer,
		//        tablenames,
		//        delegate(string tablename)
		//        {
		//            List<string> columns = GetExportColumns(tablename, eval);
		//            string parentKey = GetParentKey(tablename);
		//            List<KeyValuePair<string, string>> parentTableKeyMap = GetParentTableKeyMap(tablename);
		//            return SqlBuilder.BuildDatasetSelectAllStatement(columns, parentTableKeyMap);
		//        },
		//        encryptPatientId);
		//}

        private string GetLookupSql(string tablename, int userExportId, SqlConnection connection)
        {
            EvaluateAttributesDelegate eval = null;

            switch (privacyLevel)
            {
                case "Identified":
                    eval = EvaluateAttributesForIdentified;
                    break;
                case "Deidentified":
                    eval = EvaluateAttributesForDeidentified;
                    break;
                case "Limited":
                    eval = EvaluateAttributesForLimited;
                    break;
            }

            string lookupTable = GetLookupTablename(tablename);
            string lookupKey = GetLookupKeyName(tablename);

            List<string> columns = GetExportColumns(lookupTable, eval, connection);

            List<KeyValuePair<string, string>> lookupMap = new List<KeyValuePair<string, string>>();
            lookupMap.Add(new KeyValuePair<string, string>(lookupTable, lookupKey));
            lookupMap.Add(new KeyValuePair<string, string>(tablename, GetParentKey(tablename)));
            lookupMap.Add(new KeyValuePair<string, string>("UserExportPatients", "PatientId"));

            List<KeyValuePair<string, string>> restrictions = new List<KeyValuePair<string, string>>();
            restrictions.Add(new KeyValuePair<string, string>("UserExportPatients.UserExportId", userExportId.ToString()));

            return SqlBuilder.BuildExportDistinctStatement(columns, lookupMap, restrictions);
        }

        private void ExportXml(XmlWriter writer, List<string> tablenames, SqlSelectDelegate sqlSelect, MetadataSelectDelegate metaSelect, bool encryptPatientId)
        {
            List<string> expandedTablenames = ExpandAndSortTablenames(tablenames);

            using (SqlConnection connection = Connectivity.GetConnection())
            {
                connection.Open();

                writer.WriteStartDocument();  
                writer.WriteStartElement("data");

                int userExportId = (int) userExport[UserExport.UserExportId];

                StringBuilder comment = new StringBuilder(" UserExportId = ");
                comment.Append(userExportId.ToString());
                comment.Append(" ");
                writer.WriteComment(comment.ToString());

                foreach (string tablename in expandedTablenames)
                {
                    if (HasLookupTable(tablename))
                    {
                        SqlCommand lookupCmd = new SqlCommand(GetLookupSql(tablename, userExportId, connection), connection);

                        using (SqlDataReader r = lookupCmd.ExecuteReader())
                        {
                            WriteXml(r, writer, GetLookupTablename(tablename), encryptPatientId);
                        }
                    }
    
                    SqlCommand cmd = new SqlCommand(sqlSelect(tablename, connection), connection);

					// TODO: fix command; can we validate a command with the server?

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        WriteXml(reader, writer, tablename, encryptPatientId);
                    }
                }

				ExportEntireTable("MetaDataTables", connection, writer);
				ExportEntireTable("MetaDataFields", connection, writer);

				SqlCommand metaCmd = new SqlCommand(metaSelect(expandedTablenames), connection);

				using (SqlDataReader metaReader = metaCmd.ExecuteReader())
				{
					WriteXml(metaReader, writer, "MetaDataFieldValues", encryptPatientId);
				}

                writer.WriteEndElement();
                writer.WriteEndDocument();
            }
        }

		private void ExportEntireTable(string tablename, SqlConnection connection, XmlWriter writer)
		{
			SqlCommand cmd = new SqlCommand(SqlBuilder.BuildSelectAllStatement(tablename), connection);

			using (SqlDataReader reader = cmd.ExecuteReader())
			{
				WriteXml(reader, writer, tablename, false);
			}
		}

		//private void WritePrototypeXml(XmlWriter writer, string tablename)
		//{
		//    writer.WriteStartElement(tablename);

		//    foreach (string fieldname in BusinessObject.GetFieldNames(tablename))
		//    {
		//        writer.WriteStartElement(fieldname);
		//        writer.WriteEndElement();
		//    }

		//    writer.WriteEndElement();
		//}

        private void WriteXml(SqlDataReader reader, XmlWriter writer, string tablename, bool encryptPatientId)
        {
			bool afterFirstIteration = false;

            while (reader.Read())
            {
                writer.WriteStartElement(tablename);

                for (int i = 0; i < reader.FieldCount; i++)
                {
                    // skip nulls for Access
					if (afterFirstIteration && reader.IsDBNull(i))
					{
						continue;
					}

                    string fieldname = reader.GetName(i);
                    string value = reader.GetValue(i).ToString();

					if (afterFirstIteration && (value == null || value == ""))
					{
						continue;
					}

                    writer.WriteStartElement(fieldname);

                    if (ScanForErrors(value))
                    {
                        writer.WriteString("BAD EXPORT DATA");
                        if (exceptionHandler != null)
                        {
                            try
                            {
                                exceptionHandler(BuildException(reader, tablename, fieldname));
                            }
                            catch { }
                        }
                    }
                    else
                    {
                        writer.WriteString(value);
                    }

                    writer.WriteEndElement();
                }

                writer.WriteEndElement();

				if (!afterFirstIteration)
					afterFirstIteration = true;
            }
        }

        private bool AcceptChar(char c)
        {
            if (c == 0x9 || c == 0xa || c == 0xd ||
                (c >= 0x20 && c <= 0xd7ff) || (c >= 0xe000 && c <= 0xfffd))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private bool ScanForErrors(string s)
        {
            foreach (char c in s)
            {
                if (!AcceptChar(c))
                {
                    return true;
                }
            }

            return false;
        }

        private DataExportException BuildException(SqlDataReader r, string tablename, string problemField)
        {
            StringBuilder b = new StringBuilder();

            b.AppendLine("PROBLEMATIC RECORD ENCOUNTERED DURING DATA EXPORT");
            b.Append("UserExportId: ");
            b.AppendLine(userExport[UserExport.UserExportId].ToString());
            b.Append("Tablename: ");
            b.AppendLine(tablename);

            DumpRecord(r, b, problemField);

            return new DataExportException(b.ToString());
        }

        private void DumpRecord(SqlDataReader r, StringBuilder b, string problemField)
        {
            for (int i = 0; i < r.FieldCount; i++)
            {
                string fieldname = r.GetName(i);

                b.Append(fieldname);
                b.Append(": ");

                if (fieldname == problemField)
                {
                    b.AppendLine("THIS FIELD CONTAINS THE BAD DATA");
                }
                else
                {
                    b.AppendLine(r.GetValue(i).ToString());
                }
            }
        }

        private List<string> ExpandAndSortTablenames(List<string> tablenames)
        {
            Dictionary<string, string> tempSet = new Dictionary<string, string>();

            foreach (string tablename in tablenames)
            {
                // build a list of the tablename and its ancestors
                List<string> branch = new List<string>();
                AscendTree(tablename, branch, tempSet);

                // add each member of branch to results if not already inside (AscendTree does this for us)
                foreach (string t in branch)
                {
                    tempSet[t] = null;
                }
            }

            List<string> expanded = new List<string>(tempSet.Keys);
            expanded.Sort(new TableComparer());

            return expanded;
        }

        private void AscendTree(string tablename, List<string> list, Dictionary<string, string> existing)
        {
            if (!existing.ContainsKey(tablename))
            {
                list.Add(tablename);
            }
            
            if (BusinessObject.HasParentTable(tablename))
            {
                AscendTree(BusinessObject.GetParentTablename(tablename), list, existing);
            }
        }

        private List<string> GetExportColumns(string tablename, EvaluateAttributesDelegate eval, SqlConnection connection)
        {
            List<string> exportColumns = new List<string>();
            BusinessObject b = GetBizObject(tablename);
            FieldInfo[] fields = b.GetType().GetFields(BindingFlags.Static | BindingFlags.Public | BindingFlags.FlattenHierarchy);

			string sql =
				@"SELECT COUNT(COLUMN_NAME) AS Count
				FROM information_schema.columns
				WHERE TABLE_NAME = @TableName
				AND COLUMN_NAME = @ColumnName";

			using (SqlCommand validationCommand = new SqlCommand(sql, connection))
			{
				foreach (FieldInfo f in fields)
				{
					string fieldname = f.GetValue(b).ToString();
					string maskedFieldname;

					if ((!b.UseEnteredBy && fieldname == BusinessObject.EnteredBy) ||
						(!b.UseEnteredTime && fieldname == BusinessObject.EnteredTime) ||
						(!b.UseUpdatedBy && fieldname == BusinessObject.UpdatedBy) ||
						(!b.UseUpdatedTime && fieldname == BusinessObject.UpdatedTime) ||
						(!b.UseLockedBy && fieldname == BusinessObject.LockedBy) ||
						(!b.UseLockedTime && fieldname == BusinessObject.LockedTime))
					{
						continue;
					}

					// validate each field (tablename, fieldname) vs database
					// can we combine these fields into one query (per table) or one big query?
					validationCommand.Parameters.Clear();
					validationCommand.Parameters.AddWithValue("@TableName", tablename);
					validationCommand.Parameters.AddWithValue("@ColumnName", fieldname);

					int valid = (int) validationCommand.ExecuteScalar();

					// skip invalid fields
					if (valid == 0)
						continue;

					object[] atts = f.GetCustomAttributes(true);

					if (eval(atts, tablename, fieldname, out maskedFieldname))
					{
						if (maskedFieldname != null)
						{
							exportColumns.Add(maskedFieldname);
						}
						else
						{
							StringBuilder temp = new StringBuilder(tablename);
							temp.Append(".");
							temp.Append(fieldname);
							exportColumns.Add(temp.ToString());
						}
					}
				}
			}

            return exportColumns;
        }

        private BusinessObject GetBizObject(string tablename)
        {
            if (bizObjectHistory.ContainsKey(tablename))
            {
                return bizObjectHistory[tablename];
            }
            else
            {
                //BizObject b = BOFactory.GetBO(tablename);
				BusinessObject b = BusinessObjectFactory.BuildBusinessObject(tablename);
                bizObjectHistory[tablename] = b;
                return b;
            }
        }

        private bool HasLookupTable(string tablename)
        {
            return GetBizObject(tablename).IsMultiAssociated;
        }

        private string GetLookupKeyName(string tablename)
        {
            return GetBizObject(tablename).LookupKeyName;
        }

        private string GetLookupTablename(string tablename)
        {
            return GetBizObject(tablename).LookupTableName;
        }

        private bool EvaluateAttributesForIdentified(object[] rawAttributes, string tablename, 
            string fieldname, out string maskedFieldname)
        {
            maskedFieldname = null;
            return true;
        }

        private bool EvaluateAttributesForLimited(object[] rawAttributes, string tablename,
            string fieldname, out string maskedFieldname)
        {
            maskedFieldname = null;

            if (fieldname == "PatientId")
            {
                maskedFieldname = "AnonymousId";
                return true;
            }

            foreach (object o in rawAttributes)
            {
                LimitIdentificationAttribute lAtt = o as LimitIdentificationAttribute;

                if (lAtt != null)
                {
                    switch (lAtt.Option)
                    {
                        case LimitIdentificationOptions.Omit:
                            return false;
                    }
                }
            }

            return true;
        }

        private bool EvaluateAttributesForDeidentified(object[] rawAttributes, string tablename,
            string fieldname, out string maskedFieldname)
        {
            maskedFieldname = null;

            if (fieldname == "PatientId")
            {
                maskedFieldname = "AnonymousId";
                return true;
            }

            foreach (object o in rawAttributes)
            {
                DeidentifyAttribute dAtt = o as DeidentifyAttribute;

                if (dAtt != null)
                {
                    switch (dAtt.Option)
                    {
                        case DeidentifyOptions.MaskDate:
                            StringBuilder temp = new StringBuilder("YEAR (");
                            temp.Append(tablename);
                            temp.Append(".");
                            temp.Append(fieldname);
                            temp.Append(") AS ");
                            temp.Append(fieldname);
                            maskedFieldname = temp.ToString();
                            return true;
                        case DeidentifyOptions.Omit:
                            return false;
                    }
                }
            }

            return true;
        }

        private string GetParentKey(string tablename)
        {
            if (parentKeyHistory.ContainsKey(tablename))
            {
                return parentKeyHistory[tablename];
            }
            else
            {
                string parentKey = GetBizObject(tablename).ParentKeyName;
                parentKeyHistory[tablename] = parentKey;
                return parentKey;
            }
        }

        private List<KeyValuePair<string, string>> GetParentTableKeyMap(string tablename)
        {
            List<KeyValuePair<string, string>> list = new List<KeyValuePair<string, string>>();

            if (tablename == "Patients")
            {
                list.Add(new KeyValuePair<string, string>("Patients", "PatientId"));
                list.Add(new KeyValuePair<string, string>("UserExportPatients", "PatientId"));
            }
            else
            {
                FillMap(tablename, list); 
            }

            return list;
        }

        private void FillMap(string tablename, List<KeyValuePair<string, string>> list)
        {
            if (tablename == "Patients")
            {
                list.Add(new KeyValuePair<string, string>("UserExportPatients", "PatientId"));

                return; // recursion will end here if Patients is one of the ancestors of the original tablename
            }

			// TODO: support virtual fields? we need to write a custom metadatafieldvalues query to limit results to a dataset

            if (BusinessObject.HasParentTable(tablename))
            {
                list.Add(new KeyValuePair<string, string>(tablename, GetParentKey(tablename)));
                FillMap(BusinessObject.GetParentTablename(tablename), list);
            }
        }
    }

    public class DataExportException : Exception
    {
        public DataExportException(string message) : base(message) { }

        public DataExportException(string message, Exception innerException) : base(message, innerException) { }
    }
}
