using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PathologyFinding")]
    [ParentTablename("Pathology")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class PathologyFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyFindingId = "PathologyFindingId";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSide = "PathFindSide";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSite = "PathFindSite";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSubsite = "PathFindSubsite";

        [DataType(typeof(System.String))]
        public static readonly String PathFindIndex = "PathFindIndex";

        [DataType(typeof(System.String))]
        public static readonly String PathFindHistology = "PathFindHistology";

        [DataType(typeof(System.String))]
        public static readonly String PathFindHeight = "PathFindHeight";

        [DataType(typeof(System.String))]
        public static readonly String PathFindWidth = "PathFindWidth";

        [DataType(typeof(System.String))]
        public static readonly String PathFindLength = "PathFindLength";

        [DataType(typeof(System.String))]
        public static readonly String PathFindGrade = "PathFindGrade";

        [DataType(typeof(System.String))]
        public static readonly String PathFindResult = "PathFindResult";

        // v6.0
        [DataType(typeof(System.String))]
        public static readonly String PathFinding = "PathFinding";


        // v6.0
        [DataType(typeof(System.String))]
        public static readonly String PathFindNotes = "PathFindNotes";


    }
}
