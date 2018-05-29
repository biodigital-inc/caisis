using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Groups")]
    [ParentTablename("Roles")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class Group : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String RoleId = "RoleId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String GroupId = "GroupId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String GroupName = "GroupName";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String GroupDescription = "GroupDescription";

        [DataType(typeof(System.String))]
        public static readonly String GroupAccessCode = "GroupAccessCode";

        [DataType(typeof(System.DateTime))]
        public static readonly String DeactivatedTime = "DeactivatedTime";

    }
}
