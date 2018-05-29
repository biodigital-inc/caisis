using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataFieldAttributes")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class MetadataFieldAttribute : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String AttributeId = "AttributeId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String AttributeName = "AttributeName";

        [DataType(typeof(System.String))]
        public static readonly String FieldAttributeDescription = "FieldAttributeDescription";
    }
}
