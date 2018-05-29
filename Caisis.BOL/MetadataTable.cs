using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataTables")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class MetadataTable : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String TableId = "TableId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String TableName_Field = "TableName";

        [DataType(typeof(System.String))]
        public static readonly String TableDescription_Field = "TableDescription";

        [DataType(typeof(System.String))]
        public static readonly String TableLabel_Field = "TableLabel";
    }
}
