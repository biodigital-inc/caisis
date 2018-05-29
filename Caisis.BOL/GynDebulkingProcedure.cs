using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("GynDebulkingProc")]
    [ParentTablename("Procedures")]
    [Disease("Gyn")]
    [Exportable]
    [NoLock]
    public class GynDebulkingProcedure : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcPercentTumorRemoved = "ProcPercentTumorRemoved";

        [DataType(typeof(System.String))]
        public static readonly String ProcAscitesAmount = "ProcAscitesAmount";

        [DataType(typeof(System.String))]
        public static readonly String ProcDebulkingType = "ProcDebulkingType";

        [DataType(typeof(System.String))]
        public static readonly String ProcDebulkingStatus = "ProcDebulkingStatus";

        [DataType(typeof(System.String))]
        public static readonly String ProcDebulkingDetails = "ProcDebulkingDetails";

        [DataType(typeof(System.String))]
        public static readonly String ProcIntraOpHIPEC = "ProcIntraOpHIPEC";

        [DataType(typeof(System.String))]
        public static readonly String ProcActualNumMassRemain = "ProcActualNumMassRemain";

        [DataType(typeof(System.String))]
        public static readonly String ProcLocLargestMassRemain = "ProcLocLargestMassRemain";

        [DataType(typeof(System.String))]
        public static readonly String ProcLargestMassRemainMaxDiam = "ProcLargestMassRemainMaxDiam";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumOfMassRemain = "ProcNumOfMassRemain";

        [DataType(typeof(System.String))]
        public static readonly String ProcLocLargestMassFound = "ProcLocLargestMassFound";

        [DataType(typeof(System.String))]
        public static readonly String ProcLargestMassFoundMaxDiam = "ProcLargestMassFoundMaxDiam";

        [DataType(typeof(System.String))]
        public static readonly String ProcSuboptimalReason = "ProcSuboptimalReason";

        [DataType(typeof(System.String))]
        public static readonly String ProcLargestVisibleMassFoundMaxDiam = "ProcLargestVisibleMassFoundMaxDiam";

        [DataType(typeof(System.String))]
        public static readonly String ProcBulkyUpperAbdDisease = "ProcBulkyUpperAbdDisease";

        [DataType(typeof(System.String))]
        public static readonly String ProcCarcinomatosis = "ProcCarcinomatosis";
    }
}
