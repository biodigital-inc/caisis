using System;

namespace Caisis.BOL
{
    [Tablename("ProjectOrganization_ProjectContact")]
    [ParentTablename("Contact")]
    [HasSiblings]
    [NoLock]
    public class ProjectOrganization_ProjectContact : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String OrganizationId = "OrganizationId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String OrganizationContactId = "OrganizationContactId";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactType = "ContactType";

        [DataType(typeof(System.String))]
        public static readonly String OrganizationRole = "OrganizationRole";
    }
}
