using System;

namespace Caisis.BOL
{
    [Tablename("ProjectDocument_ProjectStageEvent")]
    [ParentTablename("ProjectStageEvent")]
    [HasSiblings]
    public class ProjectDocument_ProjectStageEvent : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DocumentId = "DocumentId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String StageEventId = "StageEventId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DocumentEventId = "DocumentEventId";

    }
}
