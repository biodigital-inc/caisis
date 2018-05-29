using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("CystoscopyPathFinding")]
    [ParentTablename("Pathology")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class CystoscopyPathologyFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String CystoscopyPathFindingId = "CystoscopyPathFindingId";

        [DataType(typeof(System.String))]
        public static readonly String PathFindProc = "PathFindProc";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSide = "PathFindSide";

        [DataType(typeof(System.String))]
        public static readonly String PathFindLaterality = "PathFindLaterality";

        [DataType(typeof(System.String))]
        public static readonly String PathFindLevel = "PathFindLevel";

        [DataType(typeof(System.String))]
        public static readonly String PathFindAP = "PathFindAP";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSite = "PathFindSite";

        [DataType(typeof(System.String))]
        public static readonly String PathFindPattern = "PathFindPattern";

        [DataType(typeof(System.String))]
        public static readonly String PathFindHistology = "PathFindHistology";

        [DataType(typeof(System.String))]
        public static readonly String PathFindStageT = "PathFindStageT";

        [DataType(typeof(System.String))]
        public static readonly String PathFindGrade = "PathFindGrade";

        [DataType(typeof(System.String))]
        public static readonly String PathFindMaxDim = "PathFindMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathFindNum = "PathFindNum";

        [DataType(typeof(System.String))]
        public static readonly String PathFindMucosa = "PathFindMucosa";

    }
}
