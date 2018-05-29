using System;

namespace Caisis.BOL
{
    [Tablename("ProjectStage")]
    [ParentTablename("Project")]
    [HasSiblings]
    [NoLock]
    public class ProjectStage : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectId = "ProjectId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String StageId = "StageId";

        [DataType(typeof(System.Int32))]
        public static readonly String OrganizationId = "OrganizationId";

        [DataType(typeof(System.String))]
        public static readonly String Name = "Name";

        [DataType(typeof(System.String))]
        public static readonly String ColorCode = "ColorCode";

    }
}
