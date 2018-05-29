using System;

namespace Caisis.BOL
{
    [Tablename("Project_ProjectOrganization")]
    [ParentTablename("ProjectOrganization")]
    [HasSiblings]
    [NoLock]
    public class Project_ProjectOrganization : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectId = "ProjectId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String OrganizationId = "OrganizationId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectOrganizationId = "ProjectOrganizationId";

        //[DataType(typeof(System.String))]
        //public static readonly String LeadOrganization = "OrganizationType";
        
        [DataType(typeof(System.String))]
        public static readonly String OrganizationType = "OrganizationType";
    }
}
