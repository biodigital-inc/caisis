using System;

namespace Caisis.BOL
{
    [Tablename("ProjectManuscript")]
    [ParentTablename("Project")]
    [HasSiblings]
    [NoLock]
    public class ProjectManuscript : BusinessObject
    {
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String JournalId = "JournalId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectId = "ProjectId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ManuscriptId = "ManuscriptId";

        [DataType(typeof(System.String))]
        public static readonly String Title = "Title";

        [DataType(typeof(System.String))]
        public static readonly String ResearchCategory = "ResearchCategory";

        [DataType(typeof(System.String))]
        public static readonly String Status = "Status";

        [DataType(typeof(System.String))]
        public static readonly String ManuscriptType = "ManuscriptType";

        [DataType(typeof(System.String))]
        public static readonly String DeadlineDate = "DeadlineDate";

        [DataType(typeof(System.String))]
        public static readonly String PublishedYear = "PublishedYear";

        [DataType(typeof(System.String))]
        public static readonly String OnlinePublishedDate = "OnlinePublishedDate";

        [DataType(typeof(System.String))]
        public static readonly String ConferenceTitle = "ConferenceTitle";

        [DataType(typeof(System.String))]
        public static readonly String ConferenceStartDate = "ConferenceStartDate";

        [DataType(typeof(System.String))]
        public static readonly String ConferenceEndDate = "ConferenceEndDate";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";

    }
}
