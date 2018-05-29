using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("LookupParentChildCodes")]
    [ParentTablename("LookupCodes")]
    [Disease("All")]
    [NoBaseColumns]
    public class LookupParentChildCode : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ParentChildCodeId = "ParentChildCodeId";

        [DataType(typeof(System.Int32))]
        public static readonly String ParentCodeId = "ParentCodeId";

        [DataType(typeof(System.Int32))]
        public static readonly String ChildCodeId = "ChildCodeId";

    }
}
