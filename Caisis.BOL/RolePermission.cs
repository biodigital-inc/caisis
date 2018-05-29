using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("RolePermissions")]
    [Disease("All")]
    [NoLock]
    public class RolePermission : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String RolePermissionId = "RolePermissionId";

        [DataType(typeof(System.Int32))]
        public static readonly String RoleId = "RoleId";

        [DataType(typeof(System.Int32))]
        public static readonly String PermissionId = "PermissionId";

        [DataType(typeof(System.DateTime))]
        public static readonly String DeactivatedTime = "DeactivatedTime";
    }
}
