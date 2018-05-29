using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Caisis.BOL
{
	public interface IObjectDataSourceAdapter
	{
		void AddNewRows(int numRows);
		DataView GetTable();
		void Save(Dictionary<string, string> parameters);
		void Delete(Dictionary<string, string> parameters);
		int? SavedPrimaryKey { get; }
	}

	public class ObjectDataSourceAdapterArgs<B>
		where B : IBusinessObject, new()
	{
		IList<B> businessObjects;

		internal int AdditionalRows { get; set; }
		public IList<B> BusinessObjects 
		{
			get
			{
				return businessObjects;
			}
		}

		public ObjectDataSourceAdapterArgs(IList<B> businessObjects)
		{
			this.businessObjects = businessObjects;
		}
	}

	public class ObjectDataSourceAdapter<B> : IObjectDataSourceAdapter
		where B : IBusinessObject, new()
	{
		public static readonly string SESSION_PID_STR = "_session_validation_patientid";

		private ObjectDataSourceAdapterArgs<B> _args;
		private IList<B> businessObjects; // why not work with a table?
		private Dictionary<int, B> map = new Dictionary<int, B>(); // used to find bizos for saving

		public int? SavedPrimaryKey
		{
			get;
			private set;
		}

		private int AdditionalRows
		{
			get { return _args.AdditionalRows; }
			set { _args.AdditionalRows = value; }
		}

		//public ObjectDataSourceAdapter()
		//{
		//    businessObjects = new List<B>();
		//}

		// remember that this will be called by the data entry section with already populated bizos
		public ObjectDataSourceAdapter(ObjectDataSourceAdapterArgs<B> args)
		{
			_args = args;
			businessObjects = args.BusinessObjects;

			foreach (B b in businessObjects)
			{
				if (b.PrimaryKeyHasValue)
					map[(int) b[b.PrimaryKeyName]] = b;
			}
		}

		#region IObjectDataSourceAdapter Members

		public void AddNewRows(int numRows)
		{
			AdditionalRows += numRows;
		}

		public DataView GetTable()
		{
			return BuildDataView(businessObjects, AdditionalRows);
		}

		// saves ONE record given the field->value pairs in the dictionary
		public void Save(Dictionary<string, string> parameters)
		{
			// find business object in map or create a new one (and add it to the list)
			B b = Find(parameters);

			if (b == null)
			{
				b = new B();
				businessObjects.Add(b);
			}

			// copy params to business object
			foreach (string fieldname in parameters.Keys)
			{
				if (fieldname == SESSION_PID_STR)
					continue;

				if (b.HasField(fieldname))
					b[fieldname] = parameters[fieldname];
			}

			// save business object
			b.Save();

			SavedPrimaryKey = (int) b[b.PrimaryKeyName];
		}

		// deletes ONE record given the identifying field->value pairs in the dictionary
		public void Delete(Dictionary<string, string> parameters)
		{
			B b = Find(parameters);

			if (b != null)
				b.Delete();
		}

		#endregion

		// for legacy support, builds a DataView based on the list of business objects
		private DataView BuildDataView(IEnumerable<B> BusinessObjects, int addRows)
		{
			// clone the table schema for a business object
			DataTable table = BusinessObject.GetPrototypeTable<B>();
			ClearTableConstraints(table);

			int? parentKey = null;
			string parentKeyName = null; // only necessary if parentKey has a value
			string primaryKeyName = BusinessObject.GetPrimaryKeyName(table.TableName);

			// add rows (each containing data from a BO) to a table, setting parent key if available
			foreach (B b in BusinessObjects)
			{
				if (!parentKey.HasValue && parentKeyName == null)
				{
					parentKeyName = b.ParentKeyName;

					if (!b.IsNull(parentKeyName))
						parentKey = (int) b[parentKeyName];
				}

				DataRow row = table.NewRow();

				for (int i = 0; i < b.FieldCount; i++)
					row[i] = b[i];

				table.Rows.Add(row);
			}

			// add additional, empty (except for parenty key) rows to the table
			if (addRows > 0)
			{
                // create computed sorting column to sort empty items to bottom
                DataColumn sortColumn = new DataColumn("SortColumn", typeof(int), "ISNULL(" + primaryKeyName + ",-1) - ISNULL(" + primaryKeyName + ",0) + 1");
                //sortColumn.DefaultValue = 1;
                table.Columns.Add(sortColumn);

				for (int i = 0; i < addRows; i++)
				{
					DataRow row = table.NewRow();
					//row[sortColumn] = 0; // sort empty rows at the bottom
					
					// copy parent key if it exists
					if (parentKey.HasValue)
						row[parentKeyName] = parentKey.Value;

					table.Rows.Add(row);
				}

                table.DefaultView.Sort = sortColumn.ColumnName + " DESC," +
                                         primaryKeyName + " ASC";
			}

			// export the table as a DataView
			return table.DefaultView;
		}

		private void ClearTableConstraints(DataTable table)
		{
			table.Constraints.Clear();
			table.PrimaryKey = null;

			foreach (DataColumn column in table.Columns)
				column.AllowDBNull = true;
		}

		private B Find(IDictionary<string, string> parameters)
		{
			B b = new B();
			string primaryKeyName = b.PrimaryKeyName;

			if (parameters.ContainsKey(primaryKeyName))
			{
				string p = parameters[primaryKeyName];
				int pKey;

				if (int.TryParse(p, out pKey))
					return map[pKey];
			}

			return default(B);
		}
	}
}
