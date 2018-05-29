using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("HelpSectionFields")]
    [Disease("All")]
    [NoBaseColumns]
    public class HelpSectionFields : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String HelpSectionFieldId = "HelpSectionFieldId";
        
        [DataType(typeof(System.Int32))]
        public static readonly String HelpSectionId = "HelpSectionId";

        [DataType(typeof(System.Int32))]
        public static readonly String FieldId = "FieldId";

        [DataType(typeof(System.Int32))]
        public static readonly String HelpOrder = "HelpOrder";

    }
}
