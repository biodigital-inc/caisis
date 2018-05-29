using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("NodePathFinding")]
    [ParentTablename("Pathology")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class NodePathologyFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String NodePathFindingId = "NodePathFindingId";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSide = "PathFindSide";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSite = "PathFindSite";

        [DataType(typeof(System.String))]
        public static readonly String PathFindMaxDim = "PathFindMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathFindExtension = "PathFindExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathFindPosNodes = "PathFindPosNodes";

        [DataType(typeof(System.String))]
        public static readonly String PathFindNumNodes = "PathFindNumNodes";

        [DataType(typeof(System.String))]
        public static readonly String PathFindHistology = "PathFindHistology";

        //v6.1
        [DataType(typeof(System.String))]
        public static readonly String PathFindMetsFocusMaxDim = "PathFindMetsFocusMaxDim";
        //v6.1
        [DataType(typeof(System.String))]
        public static readonly String PathFindNotes = "PathFindNotes";

    }
}
