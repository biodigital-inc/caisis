using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Caisis.BOL
{
	/// <summary>
	/// Encapsulates a database record
	/// </summary>
	public interface IBusinessObject
	{
		string TableName { get; }
		string ParentTableName { get; }

		string TableLabel { get; }
		string TableDescription { get; }

		IEnumerable<string> FieldNames { get; }
		string PrimaryKeyName { get; }
		IEnumerable<string> ForeignKeyNames { get; }
		string ParentKeyName { get; }

		bool PrimaryKeyHasValue { get; }

		IEnumerable<IBusinessObject> Children { get; } // TODO: how does this work with Get/AppendChildren(tablename)
		IBusinessObject Parent { get; } // FKM (ever more than one?)

		bool HasChildren { get; }
		bool HasField(string fieldname);
		int FieldCount { get; }

		bool HasSiblings { get; }
		bool IsLocked { get; }
		bool IsLockable { get; }
		IEnumerable<string> UniqueConstraints { get; }

		bool IsMultiAssociated { get; }
		string LookupKeyName { get; }
		string LookupTableName { get; }

		bool IsExportable { get; }

		object this[string fieldname] { get; set; }
		object this[int fieldIndex] { get; set; }

		bool IsEmpty { get; }
		bool IsNull(string fieldname);
		bool RequiredFieldsHaveData { get; }

		void Delete();
		void Delete(int primaryKey);
		void Get(int primaryKey);
		void Lock();
		void Unlock();
		void Save();
		void Clear();

		void EnableSaveValidation(int patientId);
		void AppendToUserName(string text);

		IDictionary<string, string> GetMetadataTableAttributes();
		string GetMetadataTableAttribute(string attributeName);
		bool HasMetadataTableAttribute(string attributeName);

		IDictionary<string, string> GetMetadataFieldAttributes(string fieldname); // 
		string GetMetadataFieldAttribute(string fieldname, string attributeName);
		bool HasMetadataFieldAttribute(string fieldname, string attributeName);

		bool HasDescription(string fieldname);
		string GetDescription(string fieldname);

		bool HasLabel(string fieldname);
		string GetLabel(string fieldname);

		bool HasControlType(string fieldname);
		string GetControlType(string fieldname);

		bool AllowsNullValues(string fieldname); // does the corresponding database column allow nulls?
		bool IsRequired(string fieldname); // has the Required attribute been applied to the field in Caisis metadata?
		bool IsSuppressed(string fieldname);

		bool HasFieldOrder(string fieldname);
		int? GetFieldOrder(string fieldname);

		int? GetFieldMaxLength(string fieldname);
	}
}
