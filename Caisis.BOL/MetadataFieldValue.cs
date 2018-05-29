using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataFieldValues")]
    [ParentTablename("MetadataFields")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class MetadataFieldValue : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String FieldId = "FieldId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String FieldValueId = "FieldValueId";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String PrimaryKey = "PrimaryKey";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String FieldValue = "FieldValue";

    }
}
