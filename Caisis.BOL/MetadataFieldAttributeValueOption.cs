using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataFieldAttributeValueOptions")]
    [ParentTablename("MetadataFieldAttributes")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class MetadataFieldAttributeValueOption : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String AttributeId = "AttributeId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String AttributeOptionId = "AttributeOptionId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String AttributeOptionValue = "AttributeOptionValue";

    }
}
