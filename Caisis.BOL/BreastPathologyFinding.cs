using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("BreastPathFinding")]
    [ParentTablename("BreastPath")]
    [Disease("Breast")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class BreastPathologyFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String BreastPathFindingId = "BreastPathFindingId";

        [DataType(typeof(System.String))]
        public static readonly String PathFindLocation = "PathFindLocation";

        [DataType(typeof(System.String))]
        public static readonly String PathFindInvasive = "PathFindInvasive";

        [DataType(typeof(System.String))]
        public static readonly String PathFindInsitu = "PathFindInsitu";
    }
}

