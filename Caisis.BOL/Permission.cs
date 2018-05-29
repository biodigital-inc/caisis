using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Permissions")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class Permission : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PermissionId = "PermissionId";

        [NotNull]
        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String Permission_Field = "Permission";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String PermissionDescription = "PermissionDescription";

        [DataType(typeof(System.DateTime))]
        public static readonly String DeactivatedTime = "DeactivatedTime";

    }
}
