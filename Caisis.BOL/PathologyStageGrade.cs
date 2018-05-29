using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PathologyStageGrade")]
    [ParentTablename("Pathology")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class PathologyStageGrade : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyStageGradeId = "PathologyStageGradeId";

        [DataType(typeof(System.String))]
        public static readonly String PathStageDisease = "PathStageDisease";

        [DataType(typeof(System.String))]
        public static readonly String PathStageSystem = "PathStageSystem";

        [DataType(typeof(System.String))]
        public static readonly String PathStageT = "PathStageT";

        [DataType(typeof(System.String))]
        public static readonly String PathStageN = "PathStageN";

        [DataType(typeof(System.String))]
        public static readonly String PathStageM = "PathStageM";


        [DataType(typeof(System.String))]
        public static readonly String PathStageR = "PathStageR"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String PathStageGroup = "PathStageGroup";

        [DataType(typeof(System.String))]
        public static readonly String PathGrade = "PathGrade";

        [DataType(typeof(System.String))]
        public static readonly String PathNotes = "PathNotes";

        [DataType(typeof(System.String))]
        public static readonly String PathDataSource = "PathDataSource";

        [DataType(typeof(System.String))]
        public static readonly String PathQuality = "PathQuality";

    }
}
