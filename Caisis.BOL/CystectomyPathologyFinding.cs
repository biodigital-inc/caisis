using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("CystectomyPathFinding")]
    [ParentTablename("Pathology")]
    [Disease("Bladder")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class CystectomyPathologyFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String CystectomyPathFindingId = "CystectomyPathFindingId";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSide = "PathFindSide";

        [DataType(typeof(System.String))]
        public static readonly String PathFindLevel = "PathFindLevel";

        [DataType(typeof(System.String))]
        public static readonly String PathFindLaterality = "PathFindLaterality";

        [DataType(typeof(System.String))]
        public static readonly String PathFindAP = "PathFindAP";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSite = "PathFindSite";

        [DataType(typeof(System.String))]
        public static readonly String PathFindStageT = "PathFindStageT";

        [DataType(typeof(System.String))]
        public static readonly String PathFindGrade = "PathFindGrade";

        [DataType(typeof(System.String))]
        public static readonly String PathFindNum = "PathFindNum";

        [DataType(typeof(System.String))]
        public static readonly String PathFindMaxDim = "PathFindMaxDim";

		//[DataType(typeof(System.String))]
		//public static readonly String PathFindMuscularisPropria = "PathFindMuscularisPropria"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String PathFindNotes = "PathFindNotes";

    }
}
