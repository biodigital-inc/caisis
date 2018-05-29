using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("LookupCodeAttributes")]
    [ParentTablename("LookupAttributes")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class LookupCodeAttribute : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String LookupCodeAttributeId = "LookupCodeAttributeId";

        [NotNull]
        [ForeignKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        public static readonly String LookupCodeId = "LookupCodeId";

        [NotNull]
        [ForeignKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        public static readonly String AttributeId = "AttributeId";

        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String AttributeValue = "AttributeValue";

        [DataType(typeof(System.Int32))]
        public static readonly String AttributeOrder = "AttributeOrder";

        [NotNull]
        [DataType(typeof(System.Byte))]
        public static readonly String AttributeSuppress = "AttributeSuppress";

    }
}
