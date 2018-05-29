using System;
using Caisis.DataAccess;

namespace Caisis.BOL
{
	/// <summary>
	/// Applies to members of extended BusinessObjects; prevents saving if the field with this attribute is null
	/// </summary>
	public class NotNullAttribute : Attribute
	{

	}

	/// <summary>
	/// Applies to members of extended BusinessObjects; identifies the field(s) composing the primary key
	/// </summary>
	public class PrimaryKeyAttribute : Attribute
	{

	}

	/// <summary>
	/// Applies to members of extended BusinessObjects; identifies the parent key, or field,
	/// common to both child and parent tables, that satisfies the foreign key relationship between these tables
	/// </summary>
	public class ForeignKeyAttribute : Attribute
	{

	}

	/// <summary>
	/// Applies to members of extended BusinessObjects that have the MultiAssociated attribute; 
	/// notifies ExportServices that this field links the BusinessObject's table with its lookup table 
	/// </summary>
	public class LookupKeyAttribute : Attribute
	{

	}

	/// <summary>
	/// Applies to extended BusinessObjects; informs clients that the BusinessObject's table has a many-to-one relationship with its parent.
	/// </summary>
	public class HasSiblingsAttribute : Attribute
	{

	}

	/// <summary>
	/// Applies to members of extended BusinessObjects; identifies the field(s) involved in a unique constraint on the BusinessObject's table 
	/// </summary>
	public class UniqueConstraintAttribute : Attribute
	{

	}

	/// <summary>
	/// Applies to extended BusinessObjects; prevents BusinessObject.BuildTable() 
	/// from adding LockedBy and LockedTime columns to the underlying DataTable
	/// </summary>
	public class NoLockAttribute : Attribute
	{

	}

	/// <summary>
	/// Applies to extended BusinessObjects; prevents BusinessObject.BuildTable() 
	/// from adding UpdatedBy and UpdatedTime columns to the underlying DataTable
	/// </summary>
	public class NoUpdateAttribute : Attribute
	{

	}

	/// <summary>
	/// Applies to extended BusinessObjects; prevents BusinessObject.BuildTable() 
	/// from adding EnteredBy, EnteredTime, UpdatedBy, UpdatedTime, 
	/// LockedBy and LockedTime columns to the underlying DataTable
	/// </summary>
	public class NoBaseColumnsAttribute : Attribute
	{

	}

	/// <summary>
	/// Applies to extended BusinessObjects; prevents BusinessObject.BuildTable() 
	/// from adding EnteredBy, UpdatedBy, and LockedBy columns to the underlying DataTable
	/// </summary>
	public class NoUserFieldsAttribute : Attribute
	{

	}

	/// <summary>
	/// Applies to extended BusinessObjects; notifies ExportServices that the BusinessObject's table can be exported in a dataset
	/// </summary>
	public class ExportableAttribute : Attribute
	{
		protected ExportRestrictions restriction;

		public ExportableAttribute()
		{
			restriction = ExportRestrictions.None;
		}

		public ExportableAttribute(ExportRestrictions restriction)
		{
			this.restriction = restriction;
		}

		public ExportRestrictions Restriction
		{
			get { return restriction; }
			set { restriction = value; }
		}
	}

	/// <summary>
	/// Applies to extended BusinessObjects; BusinessObject.Tablename will be set to this value upon initialization
	/// </summary>
	public class TablenameAttribute : Attribute
	{
		protected string tablename;

		public TablenameAttribute(string tablename)
		{
			this.tablename = tablename;
		}

		public string Tablename
		{
			get { return tablename; }
			set { tablename = value; }
		}
	}

	/// <summary>
	/// Applies to extended BusinessObjects; BusinessObject.ParentTablename will be set to this value upon initialization
	/// </summary>
	public class ParentTablenameAttribute : Attribute
	{
		protected string tablename;

		public ParentTablenameAttribute(string tablename)
		{
			this.tablename = tablename;
		}

		public string Tablename
		{
			get { return tablename; }
			set { tablename = value; }
		}
	}

	/// <summary>
	/// Applies to members of extended BusinessObjects; when adding a DataColumn for the associated field to the DataTable,
	/// BusinessObject initialization will set the DataType of the DataColumn to this value
	/// </summary>
	public class DataTypeAttribute : Attribute
	{
		protected Type type;

		public DataTypeAttribute(Type type)
		{
			this.type = type;
		}

		public Type Type
		{
			get { return type; }
			set { type = value; }
		}
	}

	/// <summary>
	/// Applies to extended BusinessObjects; allows categorization of BusinessObjects by disease
	/// </summary>
	public class DiseaseAttribute : Attribute
	{
		protected string diseaseName;

		public DiseaseAttribute(string diseaseName)
		{
			this.diseaseName = diseaseName;
		}

		public string Name
		{
			get { return diseaseName; }
			set { diseaseName = value; }
		}
	}

	/// <summary>
	/// Applies to members of extended BusinessObjects; ExportServices must deidentify the associated field using the specified DeidentifyOption
	/// </summary>
	public class DeidentifyAttribute : Attribute
	{
		protected DeidentifyOptions option;

		public DeidentifyAttribute(DeidentifyOptions option)
		{
			this.option = option;
		}

		public DeidentifyOptions Option
		{
			get { return option; }
			set { option = value; }
		}
	}

	/// <summary>
	/// Applies to members of extended BusinessObjects; ExportServices must limit identification of the associated field 
	/// using the specified LimitIdentificationOption
	/// </summary>
	public class LimitIdentificationAttribute : Attribute
	{
		protected LimitIdentificationOptions option;

		public LimitIdentificationAttribute(LimitIdentificationOptions option)
		{
			this.option = option;
		}

		public LimitIdentificationOptions Option
		{
			get { return option; }
			set { option = value; }
		}
	}

	/// <summary>
	/// Applies to extended BusinessObjects; notes that the BusinessObject's table is associated with two tables, 
	/// a parent table and lookup table (typically used to populate DropDowns and ComboBoxes)
	/// </summary>
	public class MultiAssociatedAttribute : Attribute
	{
		protected string parentTablename;
		protected string lookupTablename;

		public MultiAssociatedAttribute(string parentTablename, string lookupTablename)
		{
			this.parentTablename = parentTablename;
			this.lookupTablename = lookupTablename;
		}

		public string ParentTablename
		{
			get { return parentTablename; }
			set { parentTablename = value; }
		}

		public string LookupTablename
		{
			get { return lookupTablename; }
			set { lookupTablename = value; }
		}
	}
}