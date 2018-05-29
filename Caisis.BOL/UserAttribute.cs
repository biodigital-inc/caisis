using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("UserAttributes")]
    [ParentTablename("Users")]
    [Disease("None")]
    [NoLock]
    public class UserAttribute : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserId = "UserId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserAttributeId = "UserAttributeId";

        [DataType(typeof(System.String))]
        public static readonly String UserAttributeType = "UserAttributeType";

        [DataType(typeof(System.String))]
        public static readonly String UserAttributeName = "UserAttributeName";

        [DataType(typeof(System.String))]
        public static readonly String UserAttributeValue = "UserAttributeValue";
    }
}
