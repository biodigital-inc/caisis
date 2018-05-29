using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ThyroidProc")]
    [ParentTablename("Procedures")]
    [Disease("Thyroid")]
    [Exportable]
    [NoLock]
    public class ThyroidProcedure : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_Lobe = "ProcR_Lobe";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_Lobe = "ProcL_Lobe";

        [DataType(typeof(System.String))]
        public static readonly String ProcIsthmus = "ProcIsthmus";

        [DataType(typeof(System.String))]
        public static readonly String ProcTracheaMgmt = "ProcTracheaMgmt";

        [DataType(typeof(System.String))]
        public static readonly String ProcTracheaReconstruct = "ProcTracheaReconstruct";

        [DataType(typeof(System.String))]
        public static readonly String ProcTracheostomy = "ProcTracheostomy";

        [DataType(typeof(System.String))]
        public static readonly String ProcLarynxMgmt = "ProcLarynxMgmt";

        [DataType(typeof(System.String))]
        public static readonly String ProcEsophagusPharynxMgmt = "ProcEsophagusPharynxMgmt";

        [DataType(typeof(System.String))]
        public static readonly String ProcEsophagusPharynxReconstruct = "ProcEsophagusPharynxReconstruct";

        [DataType(typeof(System.String))]
        public static readonly String ProcLaryngealNerveRight = "ProcLaryngealNerveRight";

        [DataType(typeof(System.String))]
        public static readonly String ProcLaryngealNerveLeft = "ProcLaryngealNerveLeft";        

        [DataType(typeof(System.String))]
        public static readonly String ProcPalpableNodes = "ProcPalpableNodes";

        [DataType(typeof(System.String))]
        public static readonly String ProcNodeDissection = "ProcNodeDissection";

        [DataType(typeof(System.String))]
        public static readonly String ProcTotalThyroidectomy = "ProcTotalThyroidectomy";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_SuperiorParathyroid = "ProcR_SuperiorParathyroid";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_InferiorParathyroid = "ProcR_InferiorParathyroid";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_SuperiorParathyroid = "ProcL_SuperiorParathyroid";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_InferiorParathyroid = "ProcL_InferiorParathyroid";

        [DataType(typeof(System.String))]
        public static readonly String ProcStrapMuscle = "ProcStrapMuscle";

        [DataType(typeof(System.String))]
        public static readonly String ProcPositioningDraping = "ProcPositioningDraping";

        [DataType(typeof(System.String))]
        public static readonly String ProcIncisionFlaps = "ProcIncisionFlaps";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_Lobectomy = "ProcR_Lobectomy";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_Lobectomy = "ProcL_Lobectomy";

        [DataType(typeof(System.String))]
        public static readonly String ProcWoundClosure = "ProcWoundClosure";

        [DataType(typeof(System.String))]
        public static readonly String ProcDrain = "ProcDrain";

        // v 6+
        [DataType(typeof(System.String))]
        public static readonly String ProcIncisionLength = "ProcIncisionLength";

        [DataType(typeof(System.String))]
        public static readonly String ProcSuperiorLaryngealNerve = "ProcSuperiorLaryngealNerve";

    }
}
