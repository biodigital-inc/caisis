using System;

namespace Caisis.BOL
{
    [Tablename("ProjectEventAttributes")]
    [ParentTablename("ProjectStageEvent")]
    [HasSiblings]
    [NoLock]
    public class ProjectEventAttribute : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String StageEventId = "StageEventId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EventAttributeId = "EventAttributeId";

        [DataType(typeof(System.String))]
        public static readonly String AttributeName = "AttributeName";

        [DataType(typeof(System.String))]
        public static readonly String AttributeValue = "AttributeValue";

    }
}