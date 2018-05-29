using System;

namespace Caisis.BOL
{
    [Tablename("ProjectPublicationAuthor")]
    [ParentTablename("ProjectPublication")]
    [HasSiblings]
    [NoLock]
    public class ProjectPublicationAuthor : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

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
