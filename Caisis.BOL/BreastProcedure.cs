using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("BreastProc")]
    [ParentTablename("Procedures")]
    [Disease("Breast")]
    [Exportable]
    [NoLock]
    public class BreastProcedure : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcSentinelNodeMapping = "ProcSentinelNodeMapping";

        [DataType(typeof(System.String))]
        public static readonly String ProcAxillaryClearance = "ProcAxillaryClearance";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumFoci = "ProcNumFoci";

        [DataType(typeof(System.String))]
        public static readonly String ProcLocClock = "ProcLocClock";

        [DataType(typeof(System.String))]
        public static readonly String ProcLocQuadrant = "ProcLocQuadrant";

        [DataType(typeof(System.String))]
        public static readonly String ProcLocRegion = "ProcLocRegion";

        [DataType(typeof(System.String))]
        public static readonly String ProcLocDepth = "ProcLocDepth";

    }
}
