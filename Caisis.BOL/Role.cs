using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Roles")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class Role : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String RoleId = "RoleId";

        [NotNull]
        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String Role_Field = "Role";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String RoleDescription = "RoleDescription";

        [DataType(typeof(System.DateTime))]
        public static readonly String DeactivatedTime = "DeactivatedTime";

    }
}
