using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("GynGI_UpperAbdominalProc")]
    [ParentTablename("Procedures")]
    [Disease("Gyn")]
    [Exportable]
    [NoLock]
    public class GynGI_UpperAbdominalProcedure : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcAirLeakTest = "ProcAirLeakTest";

        [DataType(typeof(System.String))]
        public static readonly String ProcSmallBowelAnastChecked = "ProcSmallBowelAnastChecked";

        [DataType(typeof(System.String))]
        public static readonly String ProcHemicolectomyAnastMethod = "ProcHemicolectomyAnastMethod";

        [DataType(typeof(System.String))]
        public static readonly String ProcHemicolectomyAnastType = "ProcHemicolectomyAnastType";

        [DataType(typeof(System.String))]
        public static readonly String ProcMesentericDefect = "ProcMesentericDefect";

        [DataType(typeof(System.String))]
        public static readonly String ProcLAR_Details = "ProcLAR_Details";

        [DataType(typeof(System.String))]
        public static readonly String ProcLenSmallBowelRemaining = "ProcLenSmallBowelRemaining";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_ColonManeuverAnast = "ProcL_ColonManeuverAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcMaxSizeDiaphragmRemoved = "ProcMaxSizeDiaphragmRemoved";

        [DataType(typeof(System.String))]
        public static readonly String ProcMethodOfAnast = "ProcMethodOfAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_PositivePressureBubbleResult = "ProcL_PositivePressureBubbleResult";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_PositivePressureBubbleResult = "ProcR_PositivePressureBubbleResult";

        [DataType(typeof(System.String))]
        public static readonly String ProcProximalIntestinalTransection = "ProcProximalIntestinalTransection";

        [DataType(typeof(System.String))]
        public static readonly String ProcReconType = "ProcReconType";

        [DataType(typeof(System.String))]
        public static readonly String ProcAirLeakTestResult = "ProcAirLeakTestResult";

        [DataType(typeof(System.String))]
        public static readonly String ProcStaplerSize = "ProcStaplerSize";

        [DataType(typeof(System.String))]
        public static readonly String ProcChestTubeSize = "ProcChestTubeSize";

        [DataType(typeof(System.String))]
        public static readonly String ProcStaplerType = "ProcStaplerType";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_DiaphragmResectionExtent = "ProcL_DiaphragmResectionExtent";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_DiaphragmResectionExtent = "ProcR_DiaphragmResectionExtent";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_DiaphragmSutureType = "ProcR_DiaphragmSutureType";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_DiaphragmSutureType = "ProcL_DiaphragmSutureType";

        [DataType(typeof(System.String))]
        public static readonly String ProcDiaphragmClosedMeshRight = "ProcDiaphragmClosedMeshRight";

        [DataType(typeof(System.String))]
        public static readonly String ProcDiaphragmClosedMeshLeft = "ProcDiaphragmClosedMeshLeft";

        [DataType(typeof(System.String))]
        public static readonly String ProcProximalIntestinalTtransection = "ProcProximalIntestinalTtransection";

        [DataType(typeof(System.String))]
        public static readonly String ProcLocAnastAnalVerge = "ProcLocAnastAnalVerge";

        [DataType(typeof(System.String))]
        public static readonly String ProcSatisfactoryAnast = "ProcSatisfactoryAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcLenFirstResectSmallBowel = "ProcLenFirstResectSmallBowel";

        [DataType(typeof(System.String))]
        public static readonly String ProcLenSecondResectSmallBowel = "ProcLenSecondResectSmallBowel";

        [DataType(typeof(System.String))]
        public static readonly String ProcStomachWallClosure = "ProcStomachWallClosure";

        [DataType(typeof(System.String))]
        public static readonly String ProcStomClosureMethod = "ProcStomClosureMethod";

        [DataType(typeof(System.String))]
        public static readonly String ProcStomaDiversionType = "ProcStomaDiversionType";

        [DataType(typeof(System.String))]
        public static readonly String ProcRemnantClosure = "ProcRemnantClosure";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String ProcBypassPerformed = "ProcBypassPerformed";
    }
}
