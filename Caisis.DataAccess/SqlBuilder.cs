using System;
using System.Collections.Generic;
using System.Text;

namespace Caisis.DataAccess
{
    public class SqlBuilder
    {
		// TODO: support virtual fields
        public static string BuildParameterizedDeleteStatement(string tablename, string restrictField)
        {
            StringBuilder b = new StringBuilder("DELETE FROM ");
            b.Append(tablename);
            AppendRestriction(b, restrictField);

            return b.ToString();
        }

		public static string BuildVirtualParameterizedDeleteStatement(string tablename, string primaryKey)
		{
			StringBuilder b = new StringBuilder(BuildParameterizedDeleteStatement(tablename, primaryKey));

			b.AppendLine();
			b.AppendLine(@"	
				DELETE MetadataFieldValues
				FROM MetadataFieldValues
				INNER JOIN MetadataFields ON MetadataFieldValues.FieldId = MetadataFields.FieldId
				INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId
				WHERE MetadataTables.TableName = @TableName
				AND MetadataFieldValues.PrimaryKey = @PrimaryKey"
			);

			return b.ToString();
		}

        public static string BuildParameterizedDeleteStatement(string tablename, IEnumerable<string> restrictFields)
        {
            StringBuilder b = new StringBuilder("DELETE FROM ");
            b.Append(tablename);

            AppendRestrictions(b, restrictFields);
            return b.ToString();
        }

		public static string BuildParameterizedInsertStatement(string tablename, IEnumerable<string> columns, bool returnIdentity, IEnumerable<string> virtualFields)
		{
			StringBuilder head = new StringBuilder();
			StringBuilder tail = new StringBuilder(") VALUES (");

			head.AppendLine();
			head.Append("INSERT INTO ");
			head.Append(tablename);
			head.Append(" (");

			bool firstColumn = true;

			foreach (string c in columns)
			{
				if (!firstColumn)
				{
					head.Append(",");
					tail.Append(",");
				}
				else
				{
					firstColumn = false;
				}

				head.Append(c);
				tail.Append("@");
				tail.Append(c);
			}

			tail.Append(");");

			if (returnIdentity)
			{
				tail.AppendLine();
				tail.AppendLine("DECLARE @NewPK int;");
				tail.AppendLine("SET @NewPK = CAST(scope_identity() AS int);");

				if (virtualFields != null)
				{
					bool beforeFirstVirtualInsert = true;
					int i = 1;

					tail.AppendLine();

					foreach (string f in virtualFields)
					{
						if (beforeFirstVirtualInsert)
						{
							tail.AppendLine("DECLARE @VirtualTableId int;");
							tail.AppendLine("SET @VirtualTableId = (SELECT TableId FROM MetadataTables WHERE TableName = @TableName);"); // clients must set @TableName
							beforeFirstVirtualInsert = false;
						}

						//INSERT INTO MetaDataFieldValues (FieldId, PrimaryKey, FieldValue)
						//SELECT FieldId, @NewPK, @FV1
						//FROM MetadataFields
						//WHERE TableId = @VirtualTableId
						//AND FieldName = @FN1

						tail.AppendLine();
						tail.AppendLine("INSERT INTO MetaDataFieldValues (FieldId, PrimaryKey, FieldValue)");
						tail.AppendLine();

						tail.AppendFormat("SELECT FieldId, @NewPK, @FV{0}", i); // clients must set appropriately
						tail.AppendLine();
						tail.AppendLine("From MetadataFields");
						tail.AppendLine("WHERE TableId = @VirtualTableId");
						tail.AppendFormat("AND FieldName = @FN{0};", i); // clients must set appropriately
						tail.AppendLine();

						i++;
					}
				}

				tail.AppendLine();
				tail.AppendLine("SELECT @NewPK;");
			}

			head.Append(tail.ToString());

			return head.ToString();
		}

		//public static string BuildParameterizedInsertStatement(string tablename, List<string> columns)
		//{
		//    return BuildParameterizedInsertStatement(tablename, columns, true);
		//}

        public static string BuildParameterizedSelectByStatement(string tablename, IEnumerable<string> columns, string restrictField)
        {
            StringBuilder b = new StringBuilder("SELECT ");

			bool prepend = false;
			
			// TODO: extension method in 5
			foreach (string c in columns)
			{
				if (prepend)
					b.Append(",");
				else
					prepend = true;

				b.Append(c);
			}

            b.Append(" FROM ");
            b.Append(tablename);

            AppendRestriction(b, restrictField);

            return b.ToString();
        }

        // TODO: we need some more intelligence here to deal w/ table aliases and table referencing

        private static StringBuilder BuildSelectAllBuffer(List<string> columns, bool distinct, 
            List<KeyValuePair<string, string>> map)
        {
            StringBuilder b = new StringBuilder("SELECT ");

            if (distinct)
            {
                b.Append("DISTINCT ");
            }

            b.Append(String.Join(",", columns.ToArray()));
            b.Append(" FROM ");

			// AppendTablePath(map, b);

			string t = map[0].Key;
			string f = map[0].Value;

			b.Append(t);

			if (map.Count > 1)
			{
				for (int i = 1; i < map.Count; i++)
				{
					string t2 = map[i].Key;

					b.Append(" JOIN ");
					b.Append(t2);
					b.Append(" ON ");
					b.Append(t);
					b.Append(".");
					b.Append(f);
					b.Append(" = ");

					if (t2.EndsWith("dset"))
					{
						b.Append("dset");
					}
					else
					{
						b.Append(t2);
					}

					b.Append(".");
					b.Append(f);

					t = t2;
					f = map[i].Value;
				}
			}

            return b;
        }

		//private static void AppendTablePath(IEnumerable<KeyValuePair<string, string>> map, StringBuilder buffer)
		//{
		//    bool once = true;
		//    string table, field;

		//    foreach (KeyValuePair<string, string> kvp in map)
		//    {
		//        if (once)
		//        {
		//            table = kvp.Key;
		//            field = kvp.Value;
		//            buffer.Append(table);
		//            once = false;
		//            continue;
		//        }

		//        string table2 = kvp.Key;

		//        buffer.AppendFormat(" JOIN {2} ON {0}.{1} = {3}.{1}", table, field, table2, (table2.EndsWith("dset") ? "dset": table2));

		//        table = table2;
		//        field = kvp.Value;
		//    }
		//}

        private static StringBuilder BuildSelectAllBuffer(List<string> columns, List<KeyValuePair<string, string>> map)
        {
            return BuildSelectAllBuffer(columns, false, map);
        }

        private static string BuildExportStatement(List<string> columns, List<KeyValuePair<string, string>> map,
            List<KeyValuePair<string, string>> restrictions, bool distinct)
        {
            StringBuilder b = BuildSelectAllBuffer(columns, distinct, map);

            if (restrictions.Count > 0)
            {
                b.Append(" WHERE ");

                for (int i = 0; i < restrictions.Count; i++)
                {
                    if (i > 0)
                    {
                        b.Append(" AND ");
                    }

                    b.Append(restrictions[i].Key);
                    b.Append(" = ");
                    b.Append(restrictions[i].Value);
                }
            }

            return b.ToString();
        }

        public static string BuildExportSelectAllStatement(List<string> columns, List<KeyValuePair<string, string>> map,
            List<KeyValuePair<string, string>> restrictions)
        {
            return BuildExportStatement(columns, map, restrictions, false);
        }

        public static string BuildExportDistinctStatement(List<string> columns, List<KeyValuePair<string, string>> map,
            List<KeyValuePair<string, string>> restrictions)
        {
            return BuildExportStatement(columns, map, restrictions, true);
        }

		public static string BuildVirtualValuesExportStatement(string tablename, string primaryKeyName, IEnumerable<KeyValuePair<string, string>> map, int exportId)
		{
			string initialSql =
				@"SELECT MetadataFieldValues.*
					FROM MetadataFieldValues
					JOIN MetadataFields ON
						MetadataFieldValues.FieldId = MetadataFields.FieldId
					JOIN MetadataTables ON
						MetadataFields.TableId = MetadataTables.TableId ";

			StringBuilder b = new StringBuilder(initialSql);

			// b.AppendFormat(" JOIN {0} ON MetadataFieldValues.PrimaryKey = {0}.{1}", tablename, primaryKeyName);

			string t = "MetadataFieldValues";
			string f = "PrimaryKey";
			string f2 = primaryKeyName;

			foreach (KeyValuePair<string, string> kvp in map)
			{
				string t2 = kvp.Key;

				b.AppendFormat(" JOIN {2} ON {0}.{1} = {2}.{3}", t, f, t2, f2);

				t = t2;
				f = kvp.Value;
				f2 = kvp.Value;
			}

			b.AppendFormat(" WHERE MetadataTables.TableName = '{0}' AND UserExportPatients.UserExportId = {1} ", tablename, exportId);

			return b.ToString();
		}

        public static string BuildDatasetSelectAllStatement(List<string> columns, List<KeyValuePair<string, string>> map)
        {
            return BuildSelectAllBuffer(columns, map).ToString();
        }

        public static string BuildParameterizedSelectByStatement(string tablename, string restrictField)
        {
            StringBuilder b = new StringBuilder("SELECT * FROM ");
            b.Append(tablename);

            AppendRestriction(b, restrictField);

            return b.ToString();
        }

        public static string BuildParameterizedSelectByStatement(string tablename, IEnumerable<string> restrictFields)
        {
            return BuildParameterizedStatement("SELECT * FROM ", tablename, restrictFields);
        }

		//public static string BuildParameterizedUpdateByStatement(string tablename, IEnumerable<string> columns, string restrictField)
		//{
		//    return BuildParameterizedUpdateByStatement(tablename, columns, restrictField, null);
		//}

		// TODO: the method below is not used

		//public static string BuildParameterizedUpdateByStatement(string tablename, IEnumerable<string> columns, 
		//    string restrictField, IEnumerable<string> virtualFields)
		//{
		//    StringBuilder b = new StringBuilder("UPDATE ");
		//    b.Append(tablename);
		//    b.Append(" SET ");

		//    List<string> setters = new List<string>();

		//    foreach (string s in columns)
		//    {
		//        if (s != restrictField)
		//        {
		//            StringBuilder temp = new StringBuilder(s);
		//            temp.Append(" = @");
		//            temp.Append(s);
		//            setters.Add(temp.ToString());
		//        }
		//    }

		//    b.Append(String.Join(",", setters.ToArray()));

		//    AppendRestriction(b, restrictField);

		//    return b.ToString();
		//}

        public static string BuildParameterizedUpdateByStatement(string tablename, IEnumerable<string> columns,
            IEnumerable<string> restrictFields, IEnumerable<string> virtualFields)
        {
			// TODO: filter out the virtual fields
            StringBuilder b = new StringBuilder("UPDATE ");
            b.Append(tablename);
            b.Append(" SET ");

            bool prependComma = false;

            foreach (string s in columns)
            {
                if (prependComma)
                {
                    b.Append(",");
                }
                else
                {
                    prependComma = true;
                }

                b.Append(s);
                b.Append(" = @");
                b.Append(s);
            }

            AppendRestrictions(b, restrictFields);

			b.AppendLine(";");

			if (virtualFields != null)
			{
				int n = 1;

				foreach (string virtualFieldName in virtualFields)
				{
					// TODO: updating a record w/o virtual field requires an insert
					b.AppendLine();
					b.AppendFormat(@"
						UPDATE MetadataFieldValues
						SET FieldValue = @FV{0}

						FROM MetadataFieldValues
						INNER JOIN MetadataFields
							ON MetadataFieldValues.FieldId = MetadataFields.FieldId 
							And MetadataFields.FieldName = @FN{0}
						INNER JOIN MetadataTables
							ON MetadataFields.TableId = MetadataTables.TableId 
							And TableName = @TableName
							
						WHERE MetadataFieldValues.PrimaryKey = @PrimaryKey;

						IF @@ROWCOUNT = 0
						INSERT INTO MetaDataFieldValues (FieldId, PrimaryKey, FieldValue) 
						SELECT MetadataFields.FieldId, @PrimaryKey, @FV{0} 
						From MetadataFields 
							INNER JOIN MetadataTables
							ON MetadataFields.TableId = MetadataTables.TableId
						WHERE MetadataTables.TableName = @TableName AND MetadataFields.FieldName = @FN{0}; 
					", n);
					b.AppendLine();

					n++;
				}
			}

            return b.ToString();
        }

		public static string BuildSelectAllStatement(string tablename)
		{
			return string.Format("SELECT * FROM {0}", tablename);
		}

        public static string BuildSelectDistinctStatement(string tablename)
        {
            StringBuilder b = new StringBuilder("SELECT DISTINCT * FROM ");
            b.Append(tablename);
            return b.ToString();
		}

		#region virtual field support

		public static void AppendVirtualFieldname(string fieldname, int index, StringBuilder buffer)
		{
			buffer.AppendFormat(", VF{0}.FieldValue As '{1}'", index, fieldname);
		}

		public static void JoinVirtualField(string tablename, string primaryKeyName, string virtualFieldname, int index, StringBuilder buffer)
		{
			buffer.AppendFormat(
				@" LEFT OUTER JOIN (MetadataFieldValues VF{0}
					INNER JOIN MetadataFields MF{0}
					 ON MF{0}.FieldId = VF{0}.FieldId And MF{0}.FieldName = '{1}'
					INNER JOIN MetadataTables MT{0}
					 ON MF{0}.TableId = MT{0}.TableId And MT{0}.TableName = '{2}')
				   ON {2}.{3} = VF{0}.PrimaryKey ", index, virtualFieldname, tablename, primaryKeyName);
		}

		public static void JoinVirtualFieldForAudit(string tablename, string primaryKeyName, string virtualFieldname, int index, StringBuilder buffer)
		{
			buffer.AppendFormat(
				@" LEFT OUTER JOIN (AuditLog_MetadataFieldValues VF{0}
					INNER JOIN MetadataFields MF{0}
						ON MF{0}.FieldId = VF{0}.FieldId And MF{0}.FieldName = '{1}'
					INNER JOIN MetadataTables MT{0}
						ON MF{0}.TableId = MT{0}.TableId AND MT{0}.TableName = '{2}') 
					ON AuditLog_{2}.{3} = VF{0}.PrimaryKey
					AND ABS(DATEDIFF(second, AuditLog_{2}.LoggedTime, VF{0}.LoggedTime)) <= 1
					AND AuditLog_{2}.LoggedOperation = VF{0}.LoggedOperation", index, virtualFieldname, tablename, primaryKeyName);
		}

		public static string BuildVirtualParameterizedSelectStatement(string tablename, string primaryKeyName, string restrictField, IEnumerable<string> virtualFields)
		{
			/* 
				e.g.:
				select LabTests.*, VF1.FieldValue As 'Has Fungus', VF2.FieldValue As 'Infection'
				from LabTests
					LEFT OUTER JOIN (MetadataFieldValues VF1 
					INNER JOIN MetadataFields MF1
						ON MF1.FieldId = VF1.FieldId And MF1.FieldName = 'Has Fungus' 
			        INNER JOIN MetadataTables MT1
						ON MF1.TableId = MT1.TableId AND MT1.TableName = 'LabTests') ON LabTests.LabTestId = VF1.PrimaryKey 
					LEFT OUTER JOIN (MetadataFieldValues VF2
					INNER JOIN MetadataFields MF2
						ON MF2.FieldId = VF2.FieldId And MF2.FieldName = 'Infection' 
					INNER JOIN MetadataTables MT2
						ON MF2.TableId = MT2.TableId AND MT2.TableName = 'LabTests') ON LabTests.LabTestId = VF2.PrimaryKey
				where labtests.labtestid = 8
			*/

			StringBuilder buffer = new StringBuilder();
			StringBuilder fromBuffer = new StringBuilder();

			buffer.AppendFormat("SELECT {0}.*", tablename);
			fromBuffer.AppendFormat(" FROM {0} ", tablename);

			int i = 1;

			foreach (string fieldname in virtualFields)
			{
				AppendVirtualFieldname(fieldname, i, buffer);
				JoinVirtualField(tablename, primaryKeyName, fieldname, i, fromBuffer);
				i++;
			}

			buffer.Append(fromBuffer.ToString());

			AppendRestriction(buffer, restrictField);

			return buffer.ToString();
		}

		public static string BuildVirtualAuditSelectStatement(string tablename, string primaryKeyName, int primaryKey, IEnumerable<string> normalFields, IEnumerable<string> virtualFields)
		{
			#region example sql
			/*
			SELECT AuditLog_LabTests.*, 
			VF1.FieldValue AS 'Funguss', VF2.FieldValue AS 'Infection', VF3.FieldValue AS 'Virtuality'
			FROM AuditLog_LabTests
				LEFT OUTER JOIN (AuditLog_MetadataFieldValues VF1 
				INNER JOIN MetadataFields MF1
					ON MF1.FieldId = VF1.FieldId And MF1.FieldName = 'Funguss'
				INNER JOIN MetadataTables MT1
					ON MF1.TableId = MT1.TableId AND MT1.TableName = 'LabTests') 
				ON AuditLog_LabTests.LabTestId = VF1.PrimaryKey
				AND ABS(DATEDIFF(second, AuditLog_LabTests.LoggedTime, VF1.LoggedTime)) <= 1
				AND AuditLog_LabTests.LoggedOperation = VF1.LoggedOperation
				
				LEFT OUTER JOIN (AuditLog_MetadataFieldValues VF2 
				INNER JOIN MetadataFields MF2
					ON MF2.FieldId = VF2.FieldId And MF2.FieldName = 'Infection'
				INNER JOIN MetadataTables MT2
					ON MF2.TableId = MT2.TableId AND MT2.TableName = 'LabTests') 
				ON AuditLog_LabTests.LabTestId = VF2.PrimaryKey
				AND ABS(DATEDIFF(second, AuditLog_LabTests.LoggedTime, VF2.LoggedTime)) <= 1
				AND AuditLog_LabTests.LoggedOperation = VF2.LoggedOperation
				
				LEFT OUTER JOIN (AuditLog_MetadataFieldValues VF3
				INNER JOIN MetadataFields MF3
					ON MF3.FieldId = VF3.FieldId And MF3.FieldName = 'Virtuality'
				INNER JOIN MetadataTables MT3
					ON MF3.TableId = MT3.TableId AND MT3.TableName = 'LabTests') 
				ON AuditLog_LabTests.LabTestId = VF3.PrimaryKey
				AND ABS(DATEDIFF(second, AuditLog_LabTests.LoggedTime, VF3.LoggedTime)) <= 1
				AND AuditLog_LabTests.LoggedOperation = VF3.LoggedOperation

			WHERE LabTestId = 170086
			ORDER BY LoggedTime DESC
			*/
			#endregion

			StringBuilder header = new StringBuilder();
			StringBuilder footer = new StringBuilder();

			header.AppendFormat("SELECT ");
			footer.AppendFormat(" FROM AuditLog_{0} ", tablename);

			bool prependComma = false;

			foreach (string normalField in normalFields)
			{
				if (prependComma)
				{
					header.Append(", ");
				}
				else
				{
					prependComma = true;
				}

				header.AppendFormat("AuditLog_{0}.{1}", tablename, normalField);
			}

			int i = 1;

			foreach (string virtualField in virtualFields)
			{
				AppendVirtualFieldname(virtualField, i, header);
				JoinVirtualFieldForAudit(tablename, primaryKeyName, virtualField, i, footer);
				i++;
			}

			footer.AppendFormat(" WHERE AuditLog_{0}.{1} = {2} ORDER BY AuditLog_{0}.LoggedTime DESC", tablename, primaryKeyName, primaryKey);

			header.Append(footer.ToString());

			return header.ToString();
		}

		#endregion

		public static string BuildLookupDistinctStatement(string tablename, string valuefield, string textfield, 
            string restrictions, string order)
        {
            StringBuilder b = new StringBuilder("SELECT DISTINCT ");
            b.Append(valuefield);
            b.Append(" AS DropDownValue, ");
            b.Append(textfield);
            b.Append(" AS DropDownText FROM ");
            b.Append(tablename);
            if (!String.IsNullOrEmpty(restrictions))
            {
                b.Append(" WHERE ");
                b.Append(restrictions);
            }
            if (!String.IsNullOrEmpty(order))
            {
                b.Append(" ORDER BY ");
                b.Append(order);
            }
            else
            {
                b.Append(" ORDER BY DropDownText ASC");
            }
            return b.ToString();
        }

        public static string BuildLookupDistinctStatement(string tablename, string valuefield, string textfield)
        {
            return BuildLookupDistinctStatement(tablename, valuefield, textfield, null, null);
        }

        private static string BuildParameterizedStatement(string prefix, string tablename, string restrictField)
        {
            StringBuilder b = new StringBuilder(prefix);
            b.Append(tablename);

            AppendRestriction(b, restrictField);

            return b.ToString();
        }

        private static string BuildParameterizedStatement(string prefix, string tablename, IEnumerable<string> restrictFields)
        {
            StringBuilder b = new StringBuilder(prefix);
            b.Append(tablename);

            AppendRestrictions(b, restrictFields);

            return b.ToString();
        }

        private static void AppendRestriction(StringBuilder buffer, string restrictField)
        {
            if (restrictField != null && restrictField != "")
            {
                buffer.Append(" WHERE ");
                buffer.Append(restrictField);
                buffer.Append(" = @");
                buffer.Append(restrictField);
            }
        }

        private static void AppendRestrictions(StringBuilder buffer, IEnumerable<string> restrictions)
        {
            bool prependAnd = false;

            foreach (string s in restrictions)
            {
                if (prependAnd)
                {
                    buffer.Append(" AND ");
                }
                else
                {
                    buffer.Append(" WHERE ");
                    prependAnd = true;
                }

                buffer.Append(s);
                buffer.Append(" = @");
                buffer.Append(s);
            }
        }
    }
}	
