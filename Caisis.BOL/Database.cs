using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;

using Caisis.DataAccess;
using Caisis.Extensions;

namespace Caisis.Data
{
	// Connectivity, updated and streamlined
	public class Database
	{
		// support the following programming model
		// 1. class requires object instantiation for use
		// 2. after a call to BeginTransaction(...), all db calls are executed w/i the context of the encapsulated transaction
		// 3. transaction context is closed/finished by a call to CommitTransaction(...)
		// 4. allow RollbackTransaction(...)
		// 5. absent an existing transaction context, db calls are "one-shot"
		// 6. allow multiple transactions per connection?

		private bool inTransaction = false;
		private SqlConnection transConnection = null;
		private SqlTransaction transaction = null;

		~Database()
		{
			// implicit commit of uncommited transactions
			CommitTransaction();
		}

		#region connection

		private SqlCommand ConnectCommand(SqlCommand command)
		{
			if (inTransaction)
			{
				command.Connection = transConnection;
				command.Transaction = transaction;
			}
			else
			{
				SqlConnection conn = GetSqlConnection();
				command.Connection = conn;
				conn.Open();
			}

			return command;
		}

		private void DisconnectCommand(SqlCommand command)
		{
			if (!inTransaction && command.Connection != null)
			{
				try
				{
					command.Connection.Close();
				}
				catch { } // noise
			}
		}

		public static SqlConnection GetSqlConnection()
		{
			return new SqlConnection(ConfigurationManager.AppSettings["dbConnectionString"]);
		}

		#endregion

		#region transaction

		public void BeginTransaction()
		{
			if (inTransaction)
				return; // perhaps we want an exception ...

			transConnection = GetSqlConnection();
			transConnection.Open();

			transaction = transConnection.BeginTransaction();

			inTransaction = true;
		}

		public void CommitTransaction()
		{
			if (!inTransaction)
				return; // exception?

			try
			{
				transaction.Commit();
			}
			finally
			{
				TransactionCleanup();
			}
		}

		public void RollbackTransaction()
		{
			if (!inTransaction)
				return;

			try
			{
				transaction.Rollback();
			}
			finally
			{
				TransactionCleanup();
			}
		}

		private void TransactionCleanup()
		{
			try
			{
				transConnection.Close();
			}
			catch { } // noise

			transaction = null;
			transConnection = null;
			inTransaction = false;
		}

		#endregion

		// TODO: a Foo(SqlCommand ...) interface for programmers?

		private void Do(SqlCommand command, Action<SqlCommand> a)
		{
			ConnectCommand(command);

			a(command);

			DisconnectCommand(command);
		}

		// TODO: ConsumeReader static method

		#region select

		public void Select(string tablename,
						   string primaryKeyName,
						   IEnumerable<string> physicalColumns,
						   IEnumerable<string> virtualColumns,
						   IDictionary<string, object> restrictions,
						   Func<IDataRecord, bool> consumer)
		{
			SqlCommand command = new SqlCommand(BuildSelectSql(tablename, primaryKeyName, physicalColumns, virtualColumns, restrictions.Keys));
			restrictions.Keys.ForEach(x => AddParameter(command, x, restrictions[x]));

			Select(command, consumer);
		}

		internal void Select(SqlCommand command, Func<IDataRecord, bool> consumer)
		{
			Do(command,
				cmd =>
				{
					using (SqlDataReader reader = cmd.ExecuteReader())
					{
						while (reader.Read())
						{
							if (!consumer(reader))
								break;
						}
					}
				});
		}

		#region sql

		private string BuildSelectSql(string tablename, 
									  string primaryKeyName, 
									  IEnumerable<string> columns, 
									  IEnumerable<string> virtualColumns, 
									  IEnumerable<string> restrictions)
		{
			StringBuilder s = new StringBuilder("SELECT ");
			StringBuilder f = new StringBuilder(" FROM ").Append(tablename);

			AppendColumns(s, columns.Select(c => string.Format("{0}.{1}", tablename, c)));

			//s.Append(" FROM ")
			// .Append(tablename);

			AppendVirtualColumns(s, f, tablename, virtualColumns, primaryKeyName);
			AppendRestrictions(f, restrictions);

			return s.Append(f).ToString();
		}

		private StringBuilder AppendColumns(StringBuilder b, IEnumerable<string> columns)
		{
			var prepend = PrependComma();

			columns.ForEach(c => b.Append(prepend()).Append(c));

			return b;
		}

		private void AppendVirtualColumns(StringBuilder select, StringBuilder from, string tablename, IEnumerable<string> virtualColumns, string keyName)
		{
			int i = 1;

			foreach (string v in virtualColumns)
			{
				select.AppendFormat(", VF{0}.FieldValue As '{1}'", i, v);

				from.AppendFormat(
					@" LEFT OUTER JOIN (MetadataFieldValues VF{0}
						INNER JOIN MetadataFields MF{0}
						 ON MF{0}.FieldId = VF{0}.FieldId And MF{0}.FieldName = '{1}'
						INNER JOIN MetadataTables MT{0}
						 ON MF{0}.TableId = MT{0}.TableId And MT{0}.TableName = '{2}')
					   ON {2}.{3} = VF{0}.PrimaryKey ",
					i++, v, tablename, keyName);
			}
		}

		private StringBuilder AppendRestrictions(StringBuilder b, IEnumerable<string> restrictions)
		{
			bool prepend = false;

			foreach (string r in restrictions)
			{
				if (prepend)
				{
					b.Append(" AND ");
				}
				else
				{
					b.Append(" WHERE ");
					prepend = true;
				}

				b.Append(r)
				 .Append(" = @")
				 .Append(r);
			}

			return b;
		}

		#endregion

		#endregion

		#region multi-select

		internal class MultiSelectBuilder
		{
			// tablename ("driving table")
			// select fields
			// clear/reset?
			// JoinTable(tablename, fromField, toField)
			// AddConstraint(fieldname, value)

			Database db = null;
			string tablename; 
			List<string> fieldnames = new List<string>();
			List<KeyValuePair<string, KeyValuePair<string, string>>> joins = new List<KeyValuePair<string, KeyValuePair<string, string>>>();
			List<KeyValuePair<string, KeyValuePair<string, object>>> constraints = new List<KeyValuePair<string, KeyValuePair<string, object>>>();

			public MultiSelectBuilder(string tablename)
			{
				this.tablename = tablename;
				db = new Database();
			}

			public MultiSelectBuilder(string tablename, Database database)
			{
				this.tablename = tablename;
				db = database;
			}

			public void AddField(string tablename, string fieldname)
			{
				string s = null;

				if (string.IsNullOrEmpty(tablename))
					s = fieldname;
				else
					s = tablename + "." + fieldname;

				fieldnames.Add(s);
			}

			public void JoinTable(string tablename, string fromField, string toField)
			{
				var eq = new KeyValuePair<string, string>(fromField, toField);
				joins.Add(new KeyValuePair<string, KeyValuePair<string, string>>(tablename, eq));
			}

			public void AddConstraint(string tablename, string fieldname, object value)
			{
				var field = new KeyValuePair<string, object>(fieldname, value);
				constraints.Add(new KeyValuePair<string, KeyValuePair<string, object>>(tablename, field));
			}

			public void Select(Func<IDataRecord, bool> consumer)
			{
				SqlCommand cmd = new SqlCommand(ToSql());

				constraints.ForEach(kvp => cmd.Parameters.Add(new SqlParameter("@" + kvp.Value.Key, kvp.Value.Value)));

				db.Select(cmd, consumer);
			}

			private string ToSql()
			{
				StringBuilder b = new StringBuilder();
				bool prependComma = false;
				bool prependAnd = false;

				b.Append("SELECT ");

				foreach (string f in fieldnames)
				{
					if (prependComma)
						b.Append(", ");
					else
						prependComma = true;

					b.Append(f);
				}

				b.AppendLine();
				b.Append("FROM ").Append(tablename).AppendLine(" ");

				foreach (var k in joins)
				{
					b.Append("INNER JOIN ").Append(k.Key)
					 .Append(" ON ").Append(k.Value.Key).Append(" = ").Append(k.Value.Value)
					 .AppendLine();
				}

				if (constraints.Count > 0)
				{
					b.Append("WHERE ");

					foreach (var k in constraints)
					{
						if (prependAnd)
							b.Append(" AND ");
						else
							prependAnd = true;

						string tn = k.Key;
						string fn = k.Value.Key;

						b.Append(tn).Append(".").Append(fn).Append(" = ").Append("@").Append(fn);
					}
				}

				return b.ToString();
			}
		}

		#endregion

		#region count

		public int Count(string tablename, string primaryKeyName, IDictionary<string, object> restrictions)
		{
			SqlCommand command = new SqlCommand(BuildCountSql(tablename, primaryKeyName, restrictions.Keys));
			restrictions.ForEach(kvp => AddParameter(command, kvp.Key, kvp.Value));

			int count = 0;

			Func<IDataRecord, bool> consumer =
				r =>
				{
					count = r.GetInt32(0);
					return false;
				};

			Select(command, consumer);

			return count;
		}

		#region sql

		private string BuildCountSql(string tablename, string primaryKeyName, IEnumerable<string> restrictions)
		{
			StringBuilder b = new StringBuilder("SELECT COUNT(");

			b.Append(primaryKeyName).Append(")").AppendLine()
			 .Append("FROM ").AppendLine(tablename);

			AppendRestrictions(b, restrictions);

			return b.ToString();
		}

		#endregion

		#endregion

		#region insert

		public int? Insert(string tablename, 
						   Func<string, object> getter, 
						   IEnumerable<string> physicalColumns, 
						   IEnumerable<string> virtualColumns,
						   bool isOneToOne,
						   string primaryKeyName)
		{
			SqlCommand command = new SqlCommand(BuildInsertSql(tablename, physicalColumns, virtualColumns, isOneToOne, primaryKeyName));

			physicalColumns.ForEach(c => AddParameter(command, c, getter(c)));

			bool preamble = true;
			int i = 1;
			
			foreach (string v in virtualColumns)
			{
				if (preamble)
				{
					command.Parameters.Add(new SqlParameter("@TableName", tablename));
					preamble = false;
				}

				// set @FNi, @FVi for i in [1, vf count]
				command.Parameters.Add(new SqlParameter(string.Format("@FN{0}", i), v));
				command.Parameters.Add(new SqlParameter(string.Format("@FV{0}", i), getter(v).ToString()));

				i++;
			}

			int? identity = null;

			Do(command, cmd => identity = cmd.ExecuteScalar() as int?);

			return identity;
		}

		#region sql
		private string BuildInsertSql(string tablename, 
									  IEnumerable<string> physicalColumns, 
									  IEnumerable<string> virtualColumns, 
									  bool isOneToOne, 
									  string primaryKeyName)
		{
			StringBuilder head = new StringBuilder();
			StringBuilder tail = new StringBuilder(") VALUES (");

			head.AppendFormat("INSERT INTO {0} (", tablename);

			string prepend = "";

			foreach (string c in physicalColumns)
			{
				head.Append(prepend)
					.Append(c);

				tail.Append(prepend)
					.Append("@")
					.Append(c);

				if (prepend == "")
					prepend = ",";
			}

			tail.AppendLine(");")
				.Append("DECLARE @NewPK int;");

			if (isOneToOne)
				tail.Append("SET @NewPK = @").Append(primaryKeyName).Append(";");
			else
				tail.Append("SET @NewPK = CAST(scope_identity() AS int);");
				
			tail.AppendLine();

			bool preamble = true;
			int i = 1;
			
			foreach (string v in virtualColumns)
			{
				if (preamble)
				{
					preamble = false;

					tail.AppendLine("DECLARE @VirtualTableId int;")
						.AppendLine("SET @VirtualTableId = (SELECT TableId FROM MetadataTables WHERE TableName = @TableName);");
				}

				tail.AppendLine()
					.AppendLine("INSERT INTO MetaDataFieldValues (FieldId, PrimaryKey, FieldValue)")
					.AppendFormat("SELECT FieldId, @NewPK, @FV{0} ", i)
					.AppendLine("FROM MetadataFields")
					.AppendLine("WHERE TableId = @VirtualTableId")
					.AppendFormat("AND FieldName = @FN{0};", i)
					.AppendLine();

				i++;
			}

			tail.AppendLine()
				.AppendLine("SELECT @NewPK;");

			return head.Append(tail.ToString()).ToString();
		}
		#endregion

		#endregion

		#region update

		public int Update(string tablename, Func<string, object> getter, IEnumerable<string> physicalColumns, IEnumerable<string> virtualColumns, string keyName)
		{
			SqlCommand command = new SqlCommand(BuildUpdateSql(tablename, physicalColumns, virtualColumns, keyName));

			object primaryKey = getter(keyName);

			physicalColumns.ForEach(c => AddParameter(command, c, getter(c)));
			AddParameter(command, keyName, primaryKey);

			bool once = true;
			int i = 1;

			foreach (string v in virtualColumns)
			{
				if (once)
				{
					command.Parameters.Add(new SqlParameter("@TableName", tablename));
					command.Parameters.Add(new SqlParameter("@PrimaryKey", primaryKey));
					once = false;
				}

				command.Parameters.Add(new SqlParameter(string.Format("@FN{0}", i), v));
				command.Parameters.Add(new SqlParameter(string.Format("@FV{0}", i), getter(v).ToString()));

				i++;
			}

			int updated = 0;

			Do(command, cmd => updated = cmd.ExecuteNonQuery());

			return updated;
		}

		#region sql
		private string BuildUpdateSql(string tablename, IEnumerable<string> physicalColumns, IEnumerable<string> virtualColumns, string keyName)
		{
			StringBuilder s = new StringBuilder();

			s.AppendFormat("UPDATE {0} SET ", tablename);

			var prepend = PrependComma();

			physicalColumns.ForEach(c => s.AppendFormat("{0}{1} = @{1}", prepend(), c));

			AppendRestrictions(s, new string[] { keyName }).AppendLine(";");

			#region virtual update format string
			string formatString = @"

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

			";
			#endregion

			int n = 1;

			virtualColumns.ForEach(vc => s.AppendFormat(formatString, n++));

			return s.ToString();
		}
		#endregion

		#endregion

		#region delete

		public int Delete(string tablename, string username, string keyName, int keyValue, bool deleteVirtualValues)
		{
			SqlCommand command = new SqlCommand(BuildDeleteSql(tablename, keyName, deleteVirtualValues));
			SqlCommand audit = BuildAuditDeleteCommand(tablename, username, keyName, keyValue);

			AddParameter(command, keyName, keyValue);

			if (deleteVirtualValues)
			{
				command.Parameters.Add(new SqlParameter("@TableName", tablename));
				command.Parameters.Add(new SqlParameter("@PrimaryKey", keyValue));
			}

			int deleted = 0;

			Do(command,
				cmd =>
				{
					deleted = cmd.ExecuteNonQuery();
				});

			Do(audit, cmd => cmd.ExecuteNonQuery());

			return deleted;
		}

		#region sql
		public string BuildDeleteSql(string tablename, string keyName, bool deleteVirtualValues)
		{
			StringBuilder s = new StringBuilder();

			s.AppendFormat("DELETE FROM {0} WHERE {1} = @{1};", tablename, keyName);

			if (deleteVirtualValues)
				s.AppendLine(@"	
					DELETE MetadataFieldValues
					FROM MetadataFieldValues
					INNER JOIN MetadataFields ON MetadataFieldValues.FieldId = MetadataFields.FieldId
					INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId
					WHERE MetadataTables.TableName = @TableName
					AND MetadataFieldValues.PrimaryKey = @PrimaryKey");

			return s.ToString();
		}
		#endregion

		#region audit
		private SqlCommand BuildAuditDeleteCommand(string tablename, string username, string keyName, object keyValue)
		{
			SqlCommand cmd = new SqlCommand("spUpdateAuditLogDeletedBy");
			cmd.CommandType = CommandType.StoredProcedure;

			AddParameter(cmd, "TableName", tablename);
			AddParameter(cmd, "UserName", username);
			AddParameter(cmd, "PKColumnName1", keyName);
			AddParameter(cmd, "PKColumnValue1", keyValue);

			return cmd;
		}
		#endregion

		#endregion

		private SqlParameter AddParameter(SqlCommand cmd, string name, object value)
		{
			return cmd.Parameters.Add(new SqlParameter("@" + name, value));
		}

		private Func<string> PrependComma()
		{
			bool prepend = false;

			return
				() =>
				{
					if (prepend)
						return ",";

					prepend = true;
					return "";
				};
		}
	}
}
