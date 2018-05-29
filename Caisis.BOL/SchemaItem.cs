using System;

namespace Caisis.BOL
{
    [Tablename("ProtocolMgr_SchemaItems")]
    [ParentTablename("ProtocolMgr_ProtocolSchemas")]
    [HasSiblings]
    [NoLock]
    public class SchemaItem : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SchemaItemId = "SchemaItemId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolSchemaId = "ProtocolSchemaId";

        [DataType(typeof(System.Boolean))]
        public static readonly String ItemIsTemplate = "ItemIsTemplate";

        [DataType(typeof(System.String))]
        public static readonly String ItemDescription = "ItemDescription";

        // v6.x
        [DataType(typeof(System.Int32))]
        public static readonly String ItemOrder = "ItemOrder";
    }
}
