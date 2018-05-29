using System;

namespace Caisis.BOL
{
    [Tablename("ProjectManuscriptCitation")]
    [ParentTablename("ProjectManuscript")]
    [HasSiblings]
    [NoLock]
    public class ProjectManuscriptCitation : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PublicationId = "ManuscriptId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String CitationId = "CitationId";

        [DataType(typeof(System.String))]
        public static readonly String CitationYear = "CitationYear";

        [DataType(typeof(System.Int32))]
        public static readonly String CitationCount = "CitationCount";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";

    }
}
