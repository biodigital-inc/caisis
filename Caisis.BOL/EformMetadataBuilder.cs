using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

using Caisis.Data;
using Caisis.Security;

namespace Caisis.BOL
{
	public class EformMetadataBuilder
	{
		private StringBuilder buf = new StringBuilder();

		private string eformName;
		private string eformVersion;
        private string eformDisease;

		private int nextPageNumber;
		private int nextSectionNumber;
		private int nextFieldOrder;

		private SecurityController sc;

		public EformMetadataBuilder(string eformName, string eformVersionNumber):this(eformName,string.Empty, eformVersionNumber)
		{

		}

        public EformMetadataBuilder(string eformName, string eformDisease, string eformVersionNumber)
        {
            this.eformName = eformName;
            this.eformVersion = eformVersionNumber;
            this.eformDisease = eformDisease;

            nextPageNumber = 1;
            nextSectionNumber = 1;
            nextFieldOrder = 1;

            sc = new SecurityController();

            DeclareVariables();

            NewEform();
        }

		/*
		DECLARE @MetadataEFormId int
		DECLARE @MetadataEFormPageId int
		DECLARE @MetadataEFormPageSectionId int
		DECLARE @FieldId int
		DECLARE @OrderNum int
		*/

		// MetadataEForms insert sql
		/*
		INSERT INTO MetadataEForms ( EFormName, EFormType, EFormVersionNum )
		VALUES ( @EFormName, 'Dynamic', @EFormVersionNum );

		SET @MetadataEFormId = CAST(scope_identity() AS int);
		*/

		#region vars

		private static readonly string var_MetadataEFormId = "MetadataEFormId";
		private static readonly string var_MetadataEFormPageId = "MetadataEFormPageId";
		private static readonly string var_MetadataEFormPageSectionId = "MetadataEFormPageSectionId";

		private static readonly string var_EFormName = "EFormName";
		private static readonly string var_EFormType = "EFormType";
		private static readonly string var_EFormVersionNum = "EFormVersionNum";
        private static readonly string var_EFormDisease = "EFormDisease";

		private static readonly string var_PageNum = "PageNum";
		private static readonly string var_PageTitle = "PageTitle";
		private static readonly string var_PageVersionNum = "PageVersionNum";

		private static readonly string var_SectionTitle = "SectionTitle";
		private static readonly string var_SectionOrderNum = "SectionOrderNum";
		private static readonly string var_SectionShowTitle = "SectionShowTitle";
		private static readonly string var_SectionNumColumns = "SectionNumColumns";
		private static readonly string var_SectionNumRows = "SectionNumRows";
		private static readonly string var_SectionVersionNum = "SectionVersionNum";
		private static readonly string var_EnteredBy = "EnteredBy";
		private static readonly string var_EnteredTime = "EnteredTime";

		private static readonly string var_TableName = "TableName";
		private static readonly string var_FieldName = "FieldName";

		private static readonly string var_FieldId = "FieldId";
		private static readonly string var_CellColumnNum = "CellColumnNum";
		private static readonly string var_CellRowNum = "CellRowNum";
		private static readonly string var_IsDataGrid = "IsDataGrid";
		private static readonly string var_OrderNum = "OrderNum";

		#endregion

		private void DeclareVariables()
		{
			DeclareInt(var_MetadataEFormId);
			DeclareInt(var_MetadataEFormPageId);
			DeclareInt(var_MetadataEFormPageSectionId);
			
			DeclareVarChar(var_EFormName);
			DeclareVarChar(var_EFormType);
			DeclareVarChar(var_EFormVersionNum);
            DeclareVarChar(var_EFormDisease);

			DeclareVarChar(var_PageNum);
			DeclareVarChar(var_PageTitle);
			DeclareVarChar(var_PageVersionNum);

			DeclareVarChar(var_SectionTitle);
			DeclareVarChar(var_SectionOrderNum);
			DeclareVarChar(var_SectionShowTitle);
			DeclareInt(var_SectionNumColumns);
			DeclareInt(var_SectionNumRows);
			DeclareVarChar(var_SectionVersionNum);
			DeclareVarChar(var_EnteredBy);
			Declare(var_EnteredTime, "datetime");

			DeclareVarChar(var_TableName);
			DeclareVarChar(var_FieldName);

			DeclareInt(var_FieldId);
			DeclareInt(var_CellColumnNum);
			DeclareInt(var_CellRowNum);
			Declare(var_IsDataGrid, "bit");
			DeclareInt(var_OrderNum);
		}

		private void NewEform()
		{
			SetString(var_EFormName, eformName);
			SetString(var_EFormType, "Dynamic");
			Set(var_EFormVersionNum, eformVersion);
            SetString(var_EFormDisease, eformDisease);

			Insert("MetadataEForms", var_EFormName, var_EFormType, var_EFormVersionNum, var_EFormDisease);

			SetId(var_MetadataEFormId);
		}

		#region MetadataEFormPages insert sql 
		/*
		INSERT INTO MetadataEFormPages ( MetadataEFormId, PageNum, PageTitle, PageVersionNum )
		VALUES ( @MetadataEFormId, 1, @PageTitle, @PageVersionNum );

		SET @MetadataEFormPageId = CAST(scope_identity() AS int);
		*/
		#endregion

		public void NewPage(string title, string pageVersionNumber)
		{
			Set(var_PageNum, nextPageNumber);
			SetString(var_PageTitle, title);
			Set(var_PageVersionNum, pageVersionNumber);

			Insert("MetadataEFormPages", var_MetadataEFormId, var_PageNum, var_PageTitle, var_PageVersionNum);

			SetId(var_MetadataEFormPageId);

			nextPageNumber++;
		}

		#region sections insert sql
		/*
		INSERT INTO MetadataEFormPageSections ( SectionTitle, SectionOrderNum, SectionShowTitle, SectionNumColumns, SectionNumRows, SectionVersionNum, EnteredBy, EnteredTime )
		VALUES ( 'Medication History', 1, 1, 1, 1, '1', 'user', GETDATE() );

		SET @MetadataEFormPageSectionId = CAST(scope_identity() AS int);

		INSERT INTO MetadataEFormPages_Sections ( MetadataEFormPageId, MetadataEFormPageSectionId)
		VALUES ( @MetadataEFormPageId, @MetadataEFormPageSectionId);

		SET @OrderNum = 1;
		*/
		#endregion

		public void NewGridSection(string title, bool showTitle, string sectionVersionNumber, string tablename, IEnumerable<string> fieldnames, int recordId, int parentRecordId)
		{
			NewSection(title, showTitle, sectionVersionNumber, 1, 1);

			Set(var_IsDataGrid, 1);

            // preserve column index by enumeration index 
            int colCount = fieldnames.Count();
            for (int colIndex = 0; colIndex < colCount; colIndex++)
            {
                string fieldname = fieldnames.ElementAt(colIndex);
                AddFieldToSection(tablename, fieldname, 0, colIndex, recordId, parentRecordId);
            }
		}

		public void NewSection(string title, bool showTitle, string sectionVersionNumber, int rows, int columns)
		{
			SetString(var_SectionTitle, title);
			Set(var_SectionOrderNum, nextSectionNumber);
			Set(var_SectionShowTitle, showTitle ? 1 : 0);
			Set(var_SectionNumColumns, columns);
			Set(var_SectionNumRows, rows);
            SetString(var_SectionVersionNum, sectionVersionNumber);
			SetString(var_EnteredBy, sc.GetUserName());
            Set(var_EnteredTime, "GETDATE()");

			Set(var_IsDataGrid, 0);

			Insert("MetadataEFormPageSections",
				var_SectionTitle,
				var_SectionOrderNum,
				var_SectionShowTitle,
				var_SectionNumColumns,
				var_SectionNumRows,
				var_SectionVersionNum,
				var_EnteredBy,
				var_EnteredTime);

			SetId(var_MetadataEFormPageSectionId);

			Insert("MetadataEFormPages_Sections", var_MetadataEFormPageId, var_MetadataEFormPageSectionId);
            
            // increment section order
            nextSectionNumber++;
        }

		#region field insert sql
		/*
		SET @FieldId =
		(
			SELECT MetadataFields.FieldId
			FROM MetadataFields INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId
			WHERE MetadataTables.TableName = 'Medications' AND MetadataFields.FieldName = 'MedDateText' 
		);

		INSERT INTO MetadataEFormPageSection_Fields ( MetadataEFormPageSectionId, FieldId, CellColumnNum, CellRowNum, IsDataGrid, OrderNum )
		VALUES ( @MetadataEFormPageSectionId, @FieldId, 0, 0, 1, @OrderNum );
		
		SET @OrderNum = @OrderNum + 1;
		*/
		#endregion

		public void AddFieldToSection(string tablename, string fieldname, int rowIndex, int columnIndex, int recordId, int parentRecordId)
		{
			SetString(var_TableName, tablename);
			SetString(var_FieldName, fieldname);
			Set(var_CellRowNum, rowIndex);
			Set(var_CellColumnNum, columnIndex);

			string sql =
				@"
				SET @FieldId =
				(
					SELECT MetadataFields.FieldId
					FROM MetadataFields INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId
					WHERE MetadataTables.TableName = @TableName AND MetadataFields.FieldName = @FieldName 
				);";

			buf.Append(sql);

			// TODO: handle record ids
			Insert("MetadataEFormPageSection_Fields", var_MetadataEFormPageSectionId, var_FieldId, var_CellColumnNum, var_CellRowNum, var_IsDataGrid, var_OrderNum);

			Increment(var_OrderNum);
		}

		public override string ToString()
		{
			return buf.ToString();
		}

		public void Save()
		{
			string sql = ToString();
#if TESTING
			Console.Out.WriteLine(sql);
#else
			using (SqlConnection connection = Database.GetSqlConnection())
			{
				SqlTransaction transaction = null;

				try
				{
                    connection.Open();
					transaction = connection.BeginTransaction();

					SqlCommand cmd = new SqlCommand(sql, connection);
                    cmd.Transaction = transaction;
					cmd.ExecuteNonQuery();

					transaction.Commit();
				}
				catch (Exception e)
				{
					if (transaction != null)
						transaction.Rollback();

					throw e;
				}
			}
#endif
		}

		// sections example
		/*
		INSERT INTO MetadataEFormPageSections ( SectionTitle, SectionOrderNum, SectionShowTitle, SectionNumColumns, SectionNumRows, SectionVersionNum, EnteredBy, EnteredTime )
		VALUES ( 'Medication History', 1, 1, 1, 1, '1', 'user', GETDATE() );

		SET @MetadataEFormPageSectionId = CAST(scope_identity() AS int);

		INSERT INTO MetadataEFormPages_Sections ( MetadataEFormPageId, MetadataEFormPageSectionId)
		VALUES ( @MetadataEFormPageId, @MetadataEFormPageSectionId);

		SET @OrderNum = 1;

		SET @FieldId =
		(
			SELECT MetadataFields.FieldId
			FROM MetadataFields INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId
			WHERE MetadataTables.TableName = 'Medications' AND MetadataFields.FieldName = 'MedDateText' 
		);

		INSERT INTO MetadataEFormPageSection_Fields ( MetadataEFormPageSectionId, FieldId, CellColumnNum, CellRowNum, IsDataGrid, OrderNum )
		VALUES ( @MetadataEFormPageSectionId, @FieldId, 0, 0, 1, @OrderNum );

		SET @OrderNum = @OrderNum + 1;

		SET @FieldId =
		(
			SELECT MetadataFields.FieldId
			FROM MetadataFields INNER JOIN MetadataTables ON MetadataFields.TableId = MetadataTables.TableId
			WHERE MetadataTables.TableName = 'Medications' AND MetadataFields.FieldName = 'MedDate'
		);
		*/

		#region utils

		private void Declare(string name, string type)
		{
			// DECLARE @[name] [type]
			buf.AppendFormat("DECLARE @{0} {1};", name, type).AppendLine();
		}

		private void DeclareInt(string name)
		{
			Declare(name, "int");
		}

		private void DeclareVarChar(string name)
		{
			Declare(name, "varchar(50)");
		}

		private void Set(string variable, object value)
		{
			buf.AppendFormat("SET @{0} = {1};", variable, value).AppendLine();
		}

		private void SetId(string variable)
		{
            Set(variable, "CAST(scope_identity() AS int)");
		}

		private void SetString(string variable, string value)
		{
            // single quotes need to be escaped
            string escapedParam = value.Replace("'","''");
            Set(variable, string.Format("'{0}'", escapedParam));
		}

		private void Increment(string variable)
		{
			buf.AppendFormat("SET @{0} = @{0} + 1;", variable).AppendLine();
		}

		private void Insert(string tablename, params string[] fields)
		{
			StringBuilder insert = new StringBuilder();
			StringBuilder values = new StringBuilder();

			bool first = true;

			foreach (string field in fields)
			{
				if (!first)
				{
					insert.Append(", ");
					values.Append(", ");
				}

				first = false;

				insert.Append(field);
				values.Append("@" + field);
			}

			buf.AppendFormat("INSERT INTO {0} ( {1} ) VALUES ( {2} );", tablename, insert, values).AppendLine();
		}

		private KeyValuePair<string, object> P(string name, object value)
		{
			return new KeyValuePair<string, object>(name, value);
		}

		#endregion
	}
}
