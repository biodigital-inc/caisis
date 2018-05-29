using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("GastricProc")]
    [ParentTablename("Procedures")]
    [Disease("Gastric")]
    [Exportable]
    [NoLock]
    public class GastricProcedure : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcIntent = "ProcIntent";

        [DataType(typeof(System.String))]
        public static readonly String ProcReconstruction = "ProcReconstruction";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnast = "ProcAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcCompleteResection = "ProcCompleteResection";

        [DataType(typeof(System.String))]
        public static readonly String ProcResidualTumor = "ProcResidualTumor";

        [DataType(typeof(System.String))]
        public static readonly String ProcDrains = "ProcDrains";

        [DataType(typeof(System.String))]
        public static readonly String ProcProximalMarginFrozen = "ProcProximalMarginFrozen";

        [DataType(typeof(System.String))]
        public static readonly String ProcDistalMarginFrozen = "ProcDistalMarginFrozen";

        [DataType(typeof(System.String))]
        public static readonly String ProcStageSystem = "ProcStageSystem";

        [DataType(typeof(System.String))]
        public static readonly String ProcStageT = "ProcStageT";

        [DataType(typeof(System.String))]
        public static readonly String ProcStageN = "ProcStageN";

        [DataType(typeof(System.String))]
        public static readonly String ProcStageM = "ProcStageM";
        
        [DataType(typeof(System.String))]
        public static readonly String ProcIntraOpUS = "ProcIntraOpUS";
        
        [DataType(typeof(System.String))]
        public static readonly String ProcAddMargin = "ProcAddMargin";
        
        [DataType(typeof(System.String))]
        public static readonly String ProcDeepOtherMarginFrozen = "ProcDeepOtherMarginFrozen";
        
    }
}
