using System;
using System.Collections.Generic;
using System.Text;

namespace Caisis.DataAccess
{
	/// <summary>
	/// SqlBuilder with better encapsulation and support for complex queries, initially only a "complex select".
	/// It may replace SqlBuilder in a future version of Caisis.
	/// </summary>
	public class QueryBuilder
	{
		// Is there a way to cache this for all eforms?
		// Perhaps we should put params in a map, so we can reuse the generated query string?

		string tablename = null;
		List<KeyValuePair<string, string>> constraints = new List<KeyValuePair<string, string>>();
		List<KeyValuePair<string, string>> orderFields = new List<KeyValuePair<string, string>>();
		Dictionary<string, object> parameters = new Dictionary<string, object>();

		// TODO: support virtual fields
		string primaryKeyName = null; // we only need this for virtual fields
		IEnumerable<string> virtualFields = null;

		public string Tablename
		{
			get { return tablename; }
			set { tablename = value; }
		}

		public Dictionary<string, object> Parameters
		{
			get { return parameters; }
		}

		public string PrimaryKeyName
		{
			get { return primaryKeyName; }
			set { primaryKeyName = value; }
		}

		public IEnumerable<string> VirtualFields
		{
			get { return virtualFields; }
			set { virtualFields = value; }
		}

		public void AddConstraint(string fieldname, object value)
		{
			AddConstraint(fieldname, "{0} = @{0}", value);
		}

		public void AddDateConstraint(string fieldname, object value)
		{
			AddConstraint(fieldname, "DATEDIFF(day, {0}, @{0}) = 0", value);
		}

		public void AddWildcardConstraint(string fieldname, object value)
		{
			AddConstraint(fieldname, "{0} LIKE ('%' + @{0} + '%')", value);
		}

		public void AddConstraint(string fieldname, string formatString, object value)
		{
			constraints.Add(new KeyValuePair<string, string>(fieldname, formatString));
			parameters[fieldname] = value;
		}

		public void AddOrderByField(string fieldname, bool ascending)
		{
			orderFields.Add(new KeyValuePair<string, string>(fieldname, ascending ? "ASC" : "DESC"));
		}

		public string ToSql()
		{
			// sanity check for tablename?
			if (tablename == null)
			{
				return null;
			}

			StringBuilder buff = new StringBuilder();
			StringBuilder fromBuff = new StringBuilder();

			// in the mysterious future, SELECT/UPDATE... (INSERTS are trickier) will be parameters...
			buff.AppendFormat("SELECT {0}.*", tablename);
			fromBuff.AppendFormat(" FROM {0} ", tablename);

			if (virtualFields != null && primaryKeyName != null)
			{
				int i = 1;

				foreach (string fieldname in virtualFields)
				{
					SqlBuilder.AppendVirtualFieldname(fieldname, i, buff);
					SqlBuilder.JoinVirtualField(tablename, primaryKeyName, fieldname, i, fromBuff);
					i++;
				}
			}

			buff.Append(fromBuff.ToString());

			bool prependWhere = true;

			foreach (KeyValuePair<string, string> constraint in constraints)
			{
				if (prependWhere)
				{
					buff.Append(" WHERE ");
					prependWhere = false;
				}
				else
				{
					buff.Append(" AND ");
				}

				buff.AppendFormat(constraint.Value, constraint.Key);
			}

			bool prependOrder = true;

			// only makes sense for select... in the mysterious future these sections -> methods
			foreach (KeyValuePair<string, string> order in orderFields)
			{
				if (prependOrder)
				{
					buff.Append(" ORDER BY ");
					prependOrder = false;
				}
				else
				{
					buff.Append(", ");
				}

				//buff.Append(tablename);
				//buff.Append(".");
				//buff.Append(order.Key);
				//buff.Append(" ");
				//buff.Append(order.Value);

				buff.AppendFormat("{0}.{1} {2}", tablename, order.Key, order.Value);
			}

			return buff.ToString();
		}
	}
}
