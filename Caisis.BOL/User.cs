using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Users")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class User : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserId = "UserId";

        [NotNull]
        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String UserName = "UserName";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String UserPassword = "UserPassword";

        [DataType(typeof(System.String))]
        public static readonly String UserFirstName = "UserFirstName";

        [DataType(typeof(System.String))]
        public static readonly String UserLastName = "UserLastName";

        [DataType(typeof(System.String))]
        public static readonly String UserEmail = "UserEmail";

        // v5.0
        [DataType(typeof(System.String))]
        public static readonly String UserEmployeeId = "UserEmployeeId";

        [DataType(typeof(System.DateTime))]
        public static readonly String DeactivatedTime = "DeactivatedTime";

    }
}
