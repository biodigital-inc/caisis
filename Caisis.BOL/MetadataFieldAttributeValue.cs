using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataFieldAttributeValues")]
    [ParentTablename("MetadataFieldAttributes")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class MetadataFieldAttributeValue : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        public static readonly String FieldId = "FieldId";

        [NotNull]
        [ForeignKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        public static readonly String AttributeId = "AttributeId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String FieldAttributeId = "FieldAttributeId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String AttributeValue = "AttributeValue";

    }
}
