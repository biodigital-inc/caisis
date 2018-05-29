using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("LookupCodes")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class LookupCode : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String LookupCodeId = "LookupCodeId";

        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String LkpFieldName = "LkpFieldName";

        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String LkpCode = "LkpCode";

        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String LkpDescription = "LkpDescription";

        [DataType(typeof(System.Int32))]
        public static readonly String LkpOrder = "LkpOrder";

        [NotNull]
        [DataType(typeof(System.Byte))]
        public static readonly String LkpSuppress = "LkpSuppress";

    }
}
