using System;

namespace Caisis.BOL
{
    [Tablename("Project_Contact")]
    [ParentTablename("Contact")]
    [HasSiblings]
    [NoLock]
    public class Project_Contact : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectId = "ProjectId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectContactId = "ProjectContactId";

    }
}
