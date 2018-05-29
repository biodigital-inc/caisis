using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

using Caisis.DataAccess;

namespace Caisis.BOL
{
	public class AuditServices
	{
		public static DataTable GetAuditLog(string tablename, int primaryKey, IEnumerable<string> selectedFields)
		{
			if (!BusinessObjectFactory.CanBuildBusinessObject(tablename))
				throw new ArgumentException(string.Format("No business object has the tablename '{0}'.", tablename), "tablename");

			AuditLogDa da = new AuditLogDa();

			string primaryKeyName = BusinessObject.GetPrimaryKeyName(tablename);

			if (BusinessObject.TableHasVirtualFields(tablename))
			{
				IEnumerable<string> selectedRealFields = selectedFields.Where(f => !BusinessObject.IsVirtualField(tablename, f));
				IEnumerable<string> virtualFields = BusinessObject.GetVirtualFields(tablename);
				
				return da.GetVirtualAuditByTableAndPrimaryKey(tablename, primaryKeyName, primaryKey, selectedRealFields, virtualFields);
			}
			else
			{
				return da.GetAuditByTableAndPrimaryKey(tablename, primaryKeyName, primaryKey, selectedFields);
			}
		}
	}
}
