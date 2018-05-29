using System;

namespace Caisis.BOL
{
    [Tablename("ProjectPublication")]
    [ParentTablename("Project")]
    [HasSiblings]
    [NoLock]
    public class ProjectPublication : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String JournalId = "JournalId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectId = "ProjectId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PublicationId = "PublicationId";

        [DataType(typeof(System.String))]
        public static readonly String Attending = "Attending";

        [DataType(typeof(System.String))]
        public static readonly String AttendingSearch = "AttendingSearch";

        [DataType(typeof(System.String))]
        public static readonly String PublicationType = "PublicationType";

        [DataType(typeof(System.String))]
        public static readonly String PublicationYear = "PublicationYear";

        [DataType(typeof(System.String))]
        public static readonly String PublicationTitle = "PublicationTitle";

        [DataType(typeof(System.String))]
        public static readonly String PublicationCategory = "PublicationCategory";

        [DataType(typeof(System.String))]
        public static readonly String PublicationAction = "PublicationAction";

        [DataType(typeof(System.String))]
        public static readonly String Flags = "Flags";

    }
}
