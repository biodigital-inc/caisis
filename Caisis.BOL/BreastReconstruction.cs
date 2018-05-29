using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("BreastReconstructionProc")]
    [ParentTablename("Procedures")]
    [Disease("Plastics")]
    [Exportable]
    [NoLock]
    public class BreastReconstruction : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcReconstructionType = "ProcReconstructionType";

        [DataType(typeof(System.String))]
        public static readonly String ProcTissueExpander = "ProcTissueExpander";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantStaging = "ProcImplantStaging";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantPlacement = "ProcImplantPlacement";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantCapsule = "ProcImplantCapsule";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantFilling = "ProcImplantFilling";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantShape = "ProcImplantShape";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantManufacturer = "ProcImplantManufacturer";

        [DataType(typeof(System.String))]
        public static readonly String ProcImplantCupSize = "ProcImplantCupSize";

        [DataType(typeof(System.String))]
        public static readonly String ProcContralateralBreast = "ProcContralateralBreast";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumberofDrains = "ProcNumberofDrains";

    }
}
