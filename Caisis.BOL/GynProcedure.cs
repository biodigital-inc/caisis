using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("GynProc")]
    [ParentTablename("Procedures")]
    [Disease("Gyn")]
    [Exportable]
    [NoLock]
    public class GynProcedure : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcDrains = "ProcDrains";

        [DataType(typeof(System.String))]
        public static readonly String ProcLymphNodeMapping = "ProcLymphNodeMapping";

        [DataType(typeof(System.String))]
        public static readonly String ProcDistensionMedia = "ProcDistensionMedia";

        [DataType(typeof(System.String))]
        public static readonly String ProcDistensionMediaInput = "ProcDistensionMediaInput";

        [DataType(typeof(System.String))]
        public static readonly String ProcDistensionMediaOutput = "ProcDistensionMediaOutput";

        [DataType(typeof(System.String))]
        public static readonly String ProcEntirePolypRemoved = "ProcEntirePolypRemoved";

        [DataType(typeof(System.String))]
        public static readonly String ProcIncisionType = "ProcIncisionType";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_InguinalExtent = "ProcL_InguinalExtent";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_InguinalExtent = "ProcR_InguinalExtent";

        [DataType(typeof(System.String))]
        public static readonly String ProcOtherFascialClosureSutureOptions = "ProcOtherFascialClosureSutureOptions";

        [DataType(typeof(System.String))]
        public static readonly String ProcFascialClosureMethod = "ProcFascialClosureMethod";

        [DataType(typeof(System.String))]
        public static readonly String ProcFascialClosureSutureOptions = "ProcFascialClosureSutureOptions";

        [DataType(typeof(System.String))]
        public static readonly String ProcUterusAdnexa = "ProcUterusAdnexa";

        [DataType(typeof(System.String))]
        public static readonly String ProcPeritonealSurface = "ProcPeritonealSurface";

        [DataType(typeof(System.String))]
        public static readonly String ProcUpperAbdominal = "ProcUpperAbdominal";

        [DataType(typeof(System.String))]
        public static readonly String ProcHemostasis = "ProcHemostasis";

        [DataType(typeof(System.String))]
        public static readonly String ProcHerniaRepairMesh = "ProcHerniaRepairMesh";

        [DataType(typeof(System.String))]
        public static readonly String ProcHerniaType = "ProcHerniaType";

        [DataType(typeof(System.String))]
        public static readonly String ProcHerniaIncisionEvent = "ProcHerniaIncisionEvent";

        [DataType(typeof(System.String))]
        public static readonly String ProcHeparinSaline_IP_PortTest = "ProcHeparinSaline_IP_PortTest";

        [DataType(typeof(System.String))]
        public static readonly String ProcLocFlosealPlacement = "ProcLocFlosealPlacement";

        [DataType(typeof(System.String))]
        public static readonly String ProcLocLymphazurinIntraOpInjection = "ProcLocLymphazurinIntraOpInjection";

        [DataType(typeof(System.String))]
        public static readonly String ProcLocOtherMaterialPlacement = "ProcLocOtherMaterialPlacement";

        [DataType(typeof(System.String))]
        public static readonly String ProcLocSeprafilmPlacement = "ProcLocSeprafilmPlacement";

        [DataType(typeof(System.String))]
        public static readonly String ProcLeepLoopSize = "ProcLeepLoopSize";

        [DataType(typeof(System.String))]
        public static readonly String ProcMaterialUsed = "ProcMaterialUsed";

        [DataType(typeof(System.String))]
        public static readonly String ProcMethodOfEntry = "ProcMethodOfEntry";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumPorts = "ProcNumPorts";

        [DataType(typeof(System.String))]
        public static readonly String ProcPreOpTechnetiumInjection = "ProcPreOpTechnetiumInjection";

        [DataType(typeof(System.String))]
        public static readonly String ProcConversionReason = "ProcConversionReason";

        [DataType(typeof(System.String))]
        public static readonly String ProcResectoscopeUsed = "ProcResectoscopeUsed";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_SaphonousVeinTransect = "ProcL_SaphonousVeinTransect";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_SaphonousVeinTransect = "ProcR_SaphonousVeinTransect";

        [DataType(typeof(System.String))]
        public static readonly String ProcSharpCurettage = "ProcSharpCurettage";

        [DataType(typeof(System.String))]
        public static readonly String ProcSkinClosure = "ProcSkinClosure";

        [DataType(typeof(System.String))]
        public static readonly String ProcSubcutaneousClosureMethod = "ProcSubcutaneousClosureMethod";

        [DataType(typeof(System.String))]
        public static readonly String ProcSubcutaneousClosureSuture = "ProcSubcutaneousClosureSuture";

        [DataType(typeof(System.String))]
        public static readonly String ProcSuctionCurettage = "ProcSuctionCurettage";

        [DataType(typeof(System.String))]
        public static readonly String ProcSutureType = "ProcSutureType";

        [DataType(typeof(System.String))]
        public static readonly String ProcUltraSoundGuidance = "ProcUltraSoundGuidance";

        [DataType(typeof(System.String))]
        public static readonly String ProcUterineManipulatorType = "ProcUterineManipulatorType";

        [DataType(typeof(System.String))]
        public static readonly String ProcUterineManipulator = "ProcUterineManipulator";

        [DataType(typeof(System.String))]
        public static readonly String ProcUterusSound = "ProcUterusSound";

        [DataType(typeof(System.String))]
        public static readonly String ProcLysisOfAdhesionTime = "ProcLysisOfAdhesionTime";

        [DataType(typeof(System.String))]
        public static readonly String ProcVaginalCuffClosureMethod = "ProcVaginalCuffClosureMethod";

        [DataType(typeof(System.String))]
        public static readonly String ProcVaginalCuffClosureSuture = "ProcVaginalCuffClosureSuture";

        [DataType(typeof(System.String))]
        public static readonly String ProcDenseAdhesionReason = "ProcDenseAdhesionReason";

        [DataType(typeof(System.String))]
        public static readonly String ProcFindingNotes = "ProcFindingNotes";

        [DataType(typeof(System.String))]
        public static readonly String ProcAdditionalProcedureNotes = "ProcAdditionalProcedureNotes";
    }
}
