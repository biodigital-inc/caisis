using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProstatectomyProcFinding")]
    [ParentTablename("Procedures")]
    [Disease("Prostate")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class ProstatectomyFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProstatectomyProcFindingId = "ProstatectomyProcFindingId";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindSide = "ProcFindSide";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindLevel = "ProcFindLevel";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindAP = "ProcFindAP";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindLaterality = "ProcFindLaterality";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindMargin = "ProcFindMargin";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindExtension = "ProcFindExtension";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindCancer = "ProcFindCancer";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindFrozen = "ProcFindFrozen";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindAddTissue = "ProcFindAddTissue";

    }
}
