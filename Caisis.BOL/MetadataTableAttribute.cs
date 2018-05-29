using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataTableAttributes")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class MetadataTableAttribute : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String TableAttributeId = "TableAttributeId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String TableAttributeName = "TableAttributeName";

        [DataType(typeof(System.String))]
        public static readonly String TableAttributeDescription = "TableAttributeDescription";
    }
}
