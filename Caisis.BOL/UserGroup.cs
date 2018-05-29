using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("UserGroups")]
    [Disease("All")]
    [NoLock]
    public class UserGroup : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserGroupId = "UserGroupId";

        [DataType(typeof(System.Int32))]
        public static readonly String UserId = "UserId";

        [DataType(typeof(System.Int32))]
        public static readonly String GroupId = "GroupId";

        [DataType(typeof(System.DateTime))]
        public static readonly String DeactivatedTime = "DeactivatedTime";
    }
}
