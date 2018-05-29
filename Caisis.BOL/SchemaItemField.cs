using System;

namespace Caisis.BOL
{
    [Tablename("ProtocolMgr_SchemaItemFields")]
	[ParentTablename("ProtocolMgr_SchemaItems")]
    [HasSiblings]
	[NoLock]
    public class SchemaItemField : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SchemaItemFieldId = "SchemaItemFieldId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SchemaItemId = "SchemaItemId";

        [DataType(typeof(System.String))]
        public static readonly String DestTable = "DestTable";

        [DataType(typeof(System.String))]
        public static readonly String DestField = "DestField";

        [DataType(typeof(System.String))]
        public static readonly String DestValue = "DestValue";

        [DataType(typeof(System.Int32))]
        public static readonly String DisplayOrder = "DisplayOrder";

        [DataType(typeof(System.Int32))]
        public static readonly String FieldRowIndex = "FieldRowIndex";

    }
}
