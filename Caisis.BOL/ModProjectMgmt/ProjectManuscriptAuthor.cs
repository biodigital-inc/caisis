using System;

namespace Caisis.BOL
{
    [Tablename("ProjectManuscriptAuthor")]
    [ParentTablename("ProjectManuscript")]
    [HasSiblings]
    [NoLock]
    public class ProjectManuscriptAuthor : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ManuscriptId = "ManuscriptId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String AuthorId = "AuthorId";

        [DataType(typeof(System.String))]
        public static readonly String AuthorRole = "AuthorRole";

        [DataType(typeof(System.String))]
        public static readonly String PrimaryAuthor = "PrimaryAuthor";

        [DataType(typeof(System.String))]
        public static readonly String AuthorOrder = "AuthorOrder";

    }
}
