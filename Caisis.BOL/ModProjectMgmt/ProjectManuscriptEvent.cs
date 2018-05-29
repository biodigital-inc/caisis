using System;

namespace Caisis.BOL
{
    [Tablename("ProjectManuscriptEvent")]
    [ParentTablename("ProjectManuscript")]
    [HasSiblings]
    [NoLock]
    public class ProjectManuscriptEvent : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ManuscriptId = "ManuscriptId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ManuscriptEventId = "ManuscriptEventId";

        [DataType(typeof(System.String))]
        public static readonly String EventName = "EventName";

        [DataType(typeof(System.DateTime))]
        public static readonly String EventDate = "EventDate";

        [DataType(typeof(System.String))]
        public static readonly String DocumentName = "DocumentName";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";

        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

    }
}
