using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Xml.Linq;

using Caisis.Data;

namespace Caisis.BOL
{
	public class EformMetadata
	{
		#region sql
		private static readonly string sql =
			@"SELECT
				MetadataEForms.EFormName,

				MetadataEFormPages.PageTitle,
				MetadataEFormPages.PageNum,
				
				MetadataEFormPageSections.SectionTitle,
				MetadataEFormPageSections.SectionShowTitle,
				MetadataEFormPageSections.SectionStaticFileName,
				MetadataEFormPageSections.SectionNumRows,
				MetadataEFormPageSections.SectionNumColumns,
				MetadataEFormPageSections.SectionOrderNum,

				MetadataTables.TableName,
				MetadataFields.FieldName,

				MetadataEFormPageSection_Fields.CellRowNum,
				MetadataEFormPageSection_Fields.CellColumnNum,
				MetadataEFormPageSection_Fields.IsDataGrid,
				MetadataEFormPageSection_Fields.OrderNum,

				1 AS FieldRecordId,
				1 AS FieldParentRecordId
			FROM
				MetadataEForms 
					INNER JOIN MetadataEFormPages 
						ON MetadataEForms.MetadataEFormId = MetadataEFormPages.MetadataEFormId
					INNER JOIN MetadataEFormPages_Sections 
						ON MetadataEFormPages.MetadataEFormPageId = MetadataEFormPages_Sections.MetadataEFormPageId
					INNER JOIN MetadataEFormPageSections 
						ON MetadataEFormPages_Sections.MetadataEFormPageSectionId = MetadataEFormPageSections.MetadataEFormPageSectionId
					LEFT OUTER JOIN MetadataEFormPageSection_Fields
						ON MetadataEFormPageSections.MetadataEFormPageSectionId = MetadataEFormPageSection_Fields.MetadataEFormPageSectionId
					LEFT OUTER JOIN MetadataFields
						ON MetadataEformPageSection_Fields.FieldId = MetadataFields.FieldId
					LEFT OUTER JOIN MetadataTables
						ON MetadataFields.TableId = MetadataTables.TableId
			WHERE MetadataEForms.EFormName = @EFormName
			ORDER BY PageNum, SectionOrderNum, CellRowNum, CellColumnNum";
		#endregion

		// TODO: reorder table to build XEl metadata?

		// use DI (Action) to dump query results into
		// BuildPage
		// BuildSection
		// InsertControl

		// order query results by page, section, row, column

		// input: eformid
		// no output (callbacks) ? return XElement metadata maybe?
		public static void ConsumeMetadata(
			string eformName,
			Action<string, int> buildPage, // page title, page number
			Action<string, bool, int, int> buildDynamicSection, // page dynamic section: title, show title, num rows, num columns
			Action<string, bool, string> buildStaticSection, // page static section: title, show title, filename
			Action<string, string, int, int> buildControl)
		{
			SqlCommand cmd = new SqlCommand(sql);
			cmd.Parameters.Add(new SqlParameter("@EFormName", eformName));

			bool initialized = false;

			#region data reader initialization (uninteresting)
			int pageTitleIndex = -1;
			int pageNumIndex = -1;
			int sectionTitleIndex = -1;
			int sectionShowTitleIndex = -1;
			int sectionStaticFileNameIndex = -1;
			int sectionNumRowsIndex = -1;
			int sectionNumColumnsIndex = -1;
			int sectionOrderNumIndex = -1;
			int tableNameIndex = -1;
			int fieldNameIndex = -1;
			int cellRowNumIndex = -1;
			int cellColumnNumIndex = -1;

			Action<IDataRecord> init =
				(r) =>
				{
					pageTitleIndex = r.GetOrdinal("PageTitle");
					pageNumIndex = r.GetOrdinal("PageNum");
					sectionTitleIndex = r.GetOrdinal("SectionTitle");
					sectionShowTitleIndex = r.GetOrdinal("SectionShowTitle");
					sectionStaticFileNameIndex = r.GetOrdinal("SectionStaticFileName");
					sectionNumRowsIndex = r.GetOrdinal("SectionNumRows");
					sectionNumColumnsIndex = r.GetOrdinal("SectionNumColumns");
					sectionOrderNumIndex = r.GetOrdinal("SectionOrderNum");
					tableNameIndex = r.GetOrdinal("TableName");
					fieldNameIndex = r.GetOrdinal("FieldName");
					cellRowNumIndex = r.GetOrdinal("CellRowNum");
					cellColumnNumIndex = r.GetOrdinal("CellColumnNum");
				};
			#endregion

			int oldPageNum = -1;
			int oldSectionNum = -1;

			Func<IDataRecord, bool> consumer =
				(r) =>
				{
					if (!initialized)
						init(r);  // see above region

					// query fields: page title, section title, table, field, row, column
					string pageTitle = Retrieve(r, pageTitleIndex, r.GetString, "");
					int pageNum = Retrieve(r, pageNumIndex, r.GetInt32, -1);

					string sectionTitle = Retrieve(r, sectionTitleIndex, r.GetString, "");
					bool sectionShowTitle = Retrieve(r, sectionShowTitleIndex, r.GetBoolean, true);
					string sectionStaticFileName = Retrieve(r, sectionStaticFileNameIndex, r.GetString, "");
					int sectionNumRows = Retrieve(r, sectionNumRowsIndex, r.GetInt32, -1);
					int sectionNumColumns = Retrieve(r, sectionNumColumnsIndex, r.GetInt32, -1);
					int sectionOrderNum = Retrieve(r, sectionOrderNumIndex, r.GetInt32, -1);

					string tableName = Retrieve(r, tableNameIndex, r.GetString, "");
					string fieldName = Retrieve(r, fieldNameIndex, r.GetString, "");

					int cellRowNum = Retrieve(r, cellRowNumIndex, r.GetInt32, -1);
					int cellColumnNum = Retrieve(r, cellColumnNumIndex, r.GetInt32, -1);

					if (pageNum < 0) throw new EformMetadataException("PageNumber cannot be negative or null.");
					if (sectionNumRows < 0) throw new EformMetadataException("SectionNumRows cannot be negative or null.");
					if (sectionNumColumns < 0) throw new EformMetadataException("SectionNumColumns cannot be negative or null.");
					if (cellRowNum < 0) throw new EformMetadataException("CellRowNum cannot be negative or null.");
					if (cellColumnNum < 0) throw new EformMetadataException("CellColumnNum cannot be negative or null.");

					if (pageNum > oldPageNum)
					{
						if (buildPage != null)
							buildPage(pageTitle, pageNum);

						oldPageNum = pageNum;
						oldSectionNum = -1;
					}

					if (sectionOrderNum > oldSectionNum)
					{
						if (string.IsNullOrEmpty(sectionStaticFileName))
						{
							if (buildStaticSection != null)
								buildStaticSection(sectionTitle, sectionShowTitle, sectionStaticFileName);
							
							return true; // ignore any controls on the line
							// TODO: need some bookkeeping here to prevent any further work with this section...
						}
						else
						{
							if (buildDynamicSection != null)
								buildDynamicSection(sectionTitle, sectionShowTitle, sectionNumRows, sectionNumColumns);
						}

						oldSectionNum = sectionOrderNum;
					}

					// TODO: this must be handled by BusinessObject.Convert(...)
					// TODO: idiocy: multiple fields per cell? we know it will happen
					if (buildControl != null)
						buildControl(tableName, fieldName, cellRowNum, cellColumnNum);
					
					return true;
				};

			Database db = new Database();
			db.Select(cmd, consumer);
		}

		
		public static IEnumerable<XElement> GetMetadata(
			string eformName,
			Action<string, int> buildPage, // page title, page number
			Action<string, bool, int, int> buildDynamicSection, // page dynamic section: title, show title, num rows, num columns
			Action<string, bool, string> buildStaticSection) // page static section: title, show title, filename
		{
			SqlCommand cmd = new SqlCommand(sql);
			cmd.Parameters.Add(new SqlParameter("@EFormName", eformName));

			DataTable table = new DataTable();

			using (SqlConnection conn = Database.GetSqlConnection())
			{
				conn.Open();
				cmd.Connection = conn;

				SqlDataAdapter adapter = new SqlDataAdapter(cmd);
				adapter.Fill(table);
			}

			int oldPageNum = -1;
			int oldSectionNum = -1;

			// traverse table in query order to build pages/sections
			foreach (DataRow row in table.Rows)
			{
				string pageTitle = Retrieve(row, "PageTitle", "");
				int pageNum = Retrieve(row, "PageNum", -1);

				string sectionTitle = Retrieve(row, "SectionTitle", "");
				bool sectionShowTitle = Retrieve(row, "SectionShowTitle", true);
				string sectionStaticFileName = Retrieve(row, "SectionStaticFileName", "");
				int sectionNumRows = Retrieve(row, "SectionNumRows", -1);
				int sectionNumColumns = Retrieve(row, "SectionNumColumns", -1);
				int sectionOrderNum = Retrieve(row, "SectionOrderNum", -1);

				string tableName = Retrieve(row, "TableName", "");
				string fieldName = Retrieve(row, "FieldName", "");

				int cellRowNum = Retrieve(row, "CellRowNum", -1);
				int cellColumnNum = Retrieve(row, "CellColumnNum", -1);
				bool isDataGrid = Retrieve(row, "IsDataGrid", true);
				int orderNum = Retrieve(row, "OrderNum", -1);

				if (pageNum < 0) throw new EformMetadataException("PageNumber cannot be negative or null.");
				if (sectionNumRows < 0) throw new EformMetadataException("SectionNumRows cannot be negative or null.");
				if (sectionNumColumns < 0) throw new EformMetadataException("SectionNumColumns cannot be negative or null.");
				if (cellRowNum < 0) throw new EformMetadataException("CellRowNum cannot be negative or null.");
				if (cellColumnNum < 0) throw new EformMetadataException("CellColumnNum cannot be negative or null.");

				if (pageNum > oldPageNum)
				{
					if (buildPage != null)
						buildPage(pageTitle, pageNum);

					oldPageNum = pageNum;
					oldSectionNum = -1;
				}

				if (sectionOrderNum > oldSectionNum)
				{
					if (!string.IsNullOrEmpty(sectionStaticFileName))
					{
						if (buildStaticSection != null)
							buildStaticSection(sectionTitle, sectionShowTitle, sectionStaticFileName);
						
						continue; // ignore any controls on the line
						// TODO: need some bookkeeping here to prevent any further work with this section...
					}
					else
					{
						if (buildDynamicSection != null)
							buildDynamicSection(sectionTitle, sectionShowTitle, sectionNumRows, sectionNumColumns);
					}

					oldSectionNum = sectionOrderNum;
				}
			}

			// traverse table in custom order to build metadata
			var rows =
				from r in table.AsEnumerable()
				let tablename = r["TableName"] as string
				let fieldname = r["FieldName"] as string
				let recordid = (int) r["FieldRecordId"]
				let parentrecordid = (int) r["FieldParentRecordId"]
				orderby 
					BusinessObject.GetTableDepth(tablename) ascending,
					tablename ascending,
					recordid ascending,
					parentrecordid ascending
                    //,
                    //fieldname ascending
				select r;

			Dictionary<string, List<XElement>> map = new Dictionary<string, List<XElement>>();
			List<XElement> root = new List<XElement>();

			foreach (DataRow row in rows)
			{
				string pageTitle = Retrieve(row, "PageTitle", "");
				int pageNum = Retrieve(row, "PageNum", -1);

				string sectionTitle = Retrieve(row, "SectionTitle", "");
				bool sectionShowTitle = Retrieve(row, "SectionShowTitle", true);
				string sectionStaticFileName = Retrieve(row, "SectionStaticFileName", "");
				int sectionNumRows = Retrieve(row, "SectionNumRows", -1);
				int sectionNumColumns = Retrieve(row, "SectionNumColumns", -1);
				int sectionOrderNum = Retrieve(row, "SectionOrderNum", -1);

				string tableName = Retrieve(row, "TableName", "");
				string fieldName = Retrieve(row, "FieldName", "");

				int cellRowNum = Retrieve(row, "CellRowNum", -1);
				int cellColumnNum = Retrieve(row, "CellColumnNum", -1);
				bool isDataGrid = Retrieve(row, "IsDataGrid", true);
				int orderNum = Retrieve(row, "OrderNum", -1);

				int fieldRecordId = Retrieve(row, "FieldRecordId", 1);
				int fieldParentRecordId = Retrieve(row, "FieldParentRecordId", 1);

				List<XElement> list;
				
				if (!map.ContainsKey(tableName))
				{
					list = new List<XElement>();
					map[tableName] = list;
				}
				else
				{
					list = map[tableName];
				}

				XElement el;

				// handle XEl
				// m[t][recid] = ...
				// m[parent][parecid].Els.Add(...)
				if (fieldRecordId > list.Count)
				{
					if (isDataGrid)
					{
						el = new XElement(tableName,
								new XAttribute("GridView", "True"),
								new XAttribute("Page", pageNum),
								new XAttribute("Section", sectionOrderNum),
								new XAttribute("Row", cellRowNum),
								new XAttribute("Column", cellColumnNum));
					}
					else
					{
						el = new XElement(tableName, new XAttribute("GridView", "False"));
					}

					list.Add(el);

					// handle parent table rx
					string parentTableName = BusinessObject.GetParentTablename(tableName);

					if (map.ContainsKey(parentTableName))
					{
						map[parentTableName][fieldParentRecordId - 1].Add(el);
					}
					else
					{
						root.Add(el);
					}
				}
				else
				{
					el = list[fieldRecordId - 1];
				}

				XElement fieldEl;

				// append field
				if (isDataGrid)
				{
					// ignore extra attributes
					fieldEl = new XElement(fieldName);
				}
				else
				{
					fieldEl = 
						new XElement(fieldName,
							new XAttribute("Page", pageNum),
							new XAttribute("Section", sectionOrderNum),
							new XAttribute("Row", cellRowNum),
							new XAttribute("Column", cellColumnNum));
				}

				el.Add(fieldEl);
			}

			// export?
			return root;
		}
		
		private static T Retrieve<T>(DataRow r, string fieldname, T valueIfNull)
		{
			if (r.IsNull(fieldname))
				return valueIfNull;
			else
				return (T) r[fieldname];
		}

		// TODO: extension method candidate?
		private static T Retrieve<T>(IDataRecord r, int ordinal, Func<int, T> getter, T valueIfNull)
		{
			if (r.IsDBNull(ordinal))
				return valueIfNull;
			else
				return getter(ordinal);
		}
	}

	public class EformMetadataException : ApplicationException
	{
		public EformMetadataException(string msg) : base(msg) { }
	}
}
