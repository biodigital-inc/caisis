using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("LookupAttributes")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class LookupAttribute : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String AttributeId = "AttributeId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String AttributeName = "AttributeName";

    }
}
