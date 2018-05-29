using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("UserLogins")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class UserLogin : BusinessObject
    {
        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String UserId = "UserId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserLoginId = "UserLoginId";

        [NotNull]
        [DataType(typeof(System.DateTime))]
        public static readonly String UserLoginTime = "UserLoginTime";

        [DataType(typeof(System.DateTime))]
        public static readonly String UserLogoutTime = "UserLogoutTime";

    }
}
