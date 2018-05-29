using System;

namespace Caisis.BOL
{
    [Tablename("ProjectDocument")]
    [ParentTablename("Contact")]
    [HasSiblings]
    [NoLock]
    public class ProjectDocument : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DocumentId = "DocumentId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Path = "Path";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String DocumentType = "DocumentType";

    }
}
