using System;

namespace Caisis.BOL
{
    [Tablename("ProjectStageEvent")]
    [ParentTablename("ProjectStage")]
    [HasSiblings]
    [NoLock]
    public class ProjectStageEvent : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String StageId = "StageId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String StageEventId = "StageEventId";

        [DataType(typeof(System.String))]
        public static readonly String Name = "Name";

        [DataType(typeof(System.DateTime))]
        public static readonly String EventStartDate = "EventStartDate";

        [DataType(typeof(System.DateTime))]
        public static readonly String EventEndDate = "EventEndDate";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";

        [DataType(typeof(System.Byte))]
        public static readonly String PendingEvent = "PendingEvent";

    }
}
