using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

using Caisis.BOL;
using Caisis.Extensions;

namespace Caisis.UI.Core.Classes.CustomControls
{
	public class BusinessObjectDataSourceView : DataSourceView
	{
		// TODO: map the bos by primary key for later retrieval?
		IEnumerable<IBusinessObject> businessObjects;
		XElement metadata;

		public BusinessObjectDataSourceView(IDataSource owner, string viewName, IEnumerable<IBusinessObject> businessObjects, XElement metadata)
			: base(owner, viewName)
		{
			this.businessObjects = businessObjects;
			this.metadata = metadata;
		}

		// inserts and updates will be handle by the business object data structure (Save(...)), not GridView event handlers...

		public override bool CanInsert
		{
			get { return false; }
		}

		public override bool CanUpdate
		{
			get { return false; }
		}

		protected override int ExecuteInsert(IDictionary values)
		{
			//IBusinessObject b = FindFirstNew(businessObjects);

			//CopyValues(b, values);

			//b.Save();

			//return 1;

			throw new NotImplementedException();
		}

		private IBusinessObject FindFirstNew(IEnumerable<IBusinessObject> list)
		{
			foreach (IBusinessObject b in list)
			{
				if (!b.PrimaryKeyHasValue)
					return b;
			}

			throw new ArgumentException("Data store does not contain any unsaved business objects");
		}

		protected override int ExecuteUpdate(IDictionary keys, IDictionary values, IDictionary oldValues)
		{
			// how do we know which business object this action is associated with? -> do a find based on key value
			// no need to add a bizo to businessObjects
			// TODO: use the arguments to update the appropriate business object tree and call save

			//IBusinessObject b = Find(businessObjects, keys);

			//CopyValues(b, values); // DEBUG: see if primary key is in values ...

			//b.Save();

			//return 1;

			throw new NotImplementedException();
		}

		private IBusinessObject Find(IEnumerable<IBusinessObject> list, IDictionary keys)
		{
			if (keys.Count > 1)
				throw new ArgumentException("The BusinessObject model does not support compound primary keys.", "keys");

			string primaryKeyName = null;

			foreach (IBusinessObject b in list)
			{
				if (primaryKeyName == null)
					primaryKeyName = b.PrimaryKeyName;

				if (!keys.Contains(primaryKeyName))
					throw new ArgumentException(string.Format("The keys argument does not contain the primary key for the business object representing the {0} table.", b.TableName), "keys");

				object pk = keys[primaryKeyName];

				if (pk != null && b[primaryKeyName] == keys[pk])
					return b;
			}

			throw new ArgumentException("The data store does not contain a business object identified by the keys argument", "keys");
		}

		private void CopyValues(IBusinessObject b, IDictionary values)
		{
			foreach (object key in values.Keys)
			{
				string fieldname = key as string;

				if (fieldname != null)
					b[fieldname] = values[key];
			}
		}

		protected override IEnumerable ExecuteSelect(DataSourceSelectArguments arguments)
		{
			// return a DataTable containing the queried fields from each business object
			DataTable table = new DataTable();

			string tablename = metadata.Name.LocalName;

			string primaryKeyName = Caisis.BOL.BusinessObject.GetPrimaryKeyName(tablename);
			IEnumerable<string> foreignKeyNames = Caisis.BOL.BusinessObject.GetForeignKeyNames(tablename);

			// columns <- fieldnames from query
			// TraverseQueryFieldnames(metadata).Union(new string[] { primaryKeyName }.Concat(foreignKeyNames)).ForEach(s => table.Columns.Add(s));

            /*
			Caisis.BOL.BusinessObject.GetFieldNames(tablename).ForEach(s => table.Columns.Add(s));

			// row <- queried path from each business object tree
			businessObjects.ForEach(b => table.Rows.Add(CopyRowData(SubPath(b, metadata), table.NewRow())));
            */
            // get ordered field names
            string[] fields = BOL.BusinessObject.GetFieldNames(tablename).ToArray();
            // add columns
            fields.ForEach(f => table.Columns.Add(f));
            // each bizo -> add bizo data to new row
            businessObjects.ForEach(b => table.Rows.Add(fields.Select(f => b[f]).ToArray()));

			return table.DefaultView;
		}

		private IEnumerable<string> TraverseQueryFieldnames(XElement metadata)
		{
			// return query.Fieldnames.Union(query.Children.SelectMany(q => TraverseQueryFieldnames(q))); // :D
			// mimic BusinessObject.Convert(...)

			// moved to BusinessObject
			//string tablename = metadata.Name.LocalName;

			//foreach (XElement child in metadata.Elements())
			//{
			//    string s = child.Name.LocalName;

			//    if (Caisis.BOL.BusinessObject.HasField(tablename, s))
			//    {
			//        yield return s;
			//    }
			//    else
			//    {
			//        foreach (string f in TraverseQueryFieldnames(child))
			//            yield return f;
			//    }
			//}

			return Caisis.BOL.BusinessObject.EnumerateFieldnames(metadata);
		}

		// shouldn't this be a member of BusinessObject?
		private IEnumerable<object> SubPath(IBusinessObject b, XElement metadata)
		{
			// traverse the query (recursively) and yield the matching field of the BusinessObject
			int i = 0;

			//return 
			//    query.Fieldnames.Select(f => b[f]).Union(
			//        query.Children.SelectMany(q => SubPath(b.Children.ElementAt(i++), q)));

			// TODO: algorithm is redundant with above; extract and use delegates
			foreach (XElement child in metadata.Elements())
			{
				string s = child.Name.LocalName;

				if (b.HasField(s))
				{
					yield return b[s];
				}
				else
				{
					// child represents a table
					foreach (object o in SubPath(b.Children.ElementAt(i++), child))
						yield return o;
				}
			}
		}

		private DataRow CopyRowData(IEnumerable<object> list, DataRow row)
		{
			int i = 0;

			list.ForEach(s => row[i++] = s);

			return row;
		}
	}
}
