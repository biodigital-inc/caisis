using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProstatectomyPathSection")]
    [ParentTablename("Pathology")]
    [Disease("Prostate")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class ProstatectomyPathologySection : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProstatectomyPathSectionId = "ProstatectomyPathSectionId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String PathSection = "PathSection";

        [DataType(typeof(System.String))]
        public static readonly String PathSectionLevel = "PathSectionLevel";

        [DataType(typeof(System.String))]
        public static readonly String PathSectionArea = "PathSectionArea";

        [DataType(typeof(System.String))]
        public static readonly String PathSectionImg = "PathSectionImg";

    }
}
