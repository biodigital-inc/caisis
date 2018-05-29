using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("SpineProc")]
    [ParentTablename("Procedures")]
    [Disease("Neuro")]
    [Exportable]
    [NoLock]
    public class SpineProcedure : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcTumorResection = "ProcTumorResection";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumLaminectomyLevel = "ProcNumLaminectomyLevel";

        [DataType(typeof(System.String))]
        public static readonly String ProcLaminectomyLevels = "ProcLaminectomyLevels";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumVertebrectomyLevels = "ProcNumVertebrectomyLevels";

        [DataType(typeof(System.String))]
        public static readonly String ProcVertebrectomyLevels = "ProcVertebrectomyLevels";

        [DataType(typeof(System.String))]
        public static readonly String ProcPercVertebralBodyRemoved = "ProcPercVertebralBodyRemoved";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnteriorReconstruction = "ProcAnteriorReconstruction";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnteriorReconstructionType = "ProcAnteriorReconstructionType";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumPediclesRemoved = "ProcNumPediclesRemoved";

        [DataType(typeof(System.String))]
        public static readonly String ProcPediclesRemovedLevel = "ProcPediclesRemovedLevel";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumInstrumentedLevel = "ProcNumInstrumentedLevel";

        [DataType(typeof(System.String))]
        public static readonly String ProcInstrumentedLevel = "ProcInstrumentedLevel";

        [DataType(typeof(System.String))]
        public static readonly String ProcPreOpEmbolization = "ProcPreOpEmbolization";

        [DataType(typeof(System.String))]
        public static readonly String ProcCementAugmentation = "ProcCementAugmentation";

        [DataType(typeof(System.String))]
        public static readonly String ProcCementLevel = "ProcCementLevel";

        // v6.1x
        [DataType(typeof(System.String))]
        public static readonly String ProcCementVolume = "ProcCementVolume";

        [DataType(typeof(System.String))]
        public static readonly String ProcMISProcedure = "ProcMISProcedure";

        [DataType(typeof(System.String))]
        public static readonly String ProcInflationPressure = "ProcInflationPressure";

        [DataType(typeof(System.String))]
        public static readonly String ProcGraftMaterialUsed = "ProcGraftMaterialUsed";
    }
}
