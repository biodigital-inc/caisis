using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataTableAttributeValues")]
    [ParentTablename("MetadataTableAttributes")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class MetadataTableAttributeValue : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        public static readonly String TableId = "TableId";

        [NotNull]
        [ForeignKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        public static readonly String TableAttributeId = "TableAttributeId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String TableAttributeValueId = "TableAttributeValueId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String TableAttributeValue = "TableAttributeValue";

    }
}
