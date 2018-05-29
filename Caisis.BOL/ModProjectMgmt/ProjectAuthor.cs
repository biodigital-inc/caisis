using System;

namespace Caisis.BOL
{
    [Tablename("ProjectAuthor")]
    [ParentTablename("ProjectPublication")]
    [HasSiblings]
    public class ProjectAuthor : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ManuscriptId = "ManuscriptId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PublicationId = "PublicationId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String AuthorId = "AuthorId";

        [DataType(typeof(System.String))]
        public static readonly String AuthorRole = "AuthorRole";

        [DataType(typeof(System.String))]
        public static readonly String AuthorOrder = "AuthorOrder";

    }
}
