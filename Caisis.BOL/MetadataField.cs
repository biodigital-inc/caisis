using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataFields")]
    [ParentTablename("MetadataTables")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class MetadataField : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String TableId = "TableId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String FieldId = "FieldId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String FieldName = "FieldName";

        [DataType(typeof(System.String))]
        public static readonly String FieldDataType = "FieldDataType";

        [NotNull]
        [DataType(typeof(System.Byte))]
        public static readonly String FieldIsVirtual = "FieldIsVirtual";

        [NotNull]
        [DataType(typeof(System.Byte))]
        public static readonly String FieldSuppress = "FieldSuppress";

        [DataType(typeof(System.Int32))]
        public static readonly String FieldOrder = "FieldOrder";

    }
}
