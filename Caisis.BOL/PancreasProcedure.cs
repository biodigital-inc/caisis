using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PancreasProc")]
    [ParentTablename("Procedures")]
    [Disease("Pancreas")]
    [Exportable]
    [NoLock]
    public class PancreasProcedure : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcIntent = "ProcIntent";

        [DataType(typeof(System.String))]
        public static readonly String ProcStent = "ProcStent";

        [DataType(typeof(System.String))]
        public static readonly String ProcPortalVeinResection = "ProcPortalVeinResection";

        [DataType(typeof(System.String))]
        public static readonly String ProcMarginFrozen = "ProcMarginFrozen";

        [DataType(typeof(System.String))]
        public static readonly String ProcReconstruction = "ProcReconstruction";

        [DataType(typeof(System.String))]
        public static readonly String ProcPancreas = "ProcPancreas";

        [DataType(typeof(System.String))]
        public static readonly String ProcPancreaticDuctSize = "ProcPancreaticDuctSize";

        [DataType(typeof(System.String))]
        public static readonly String ProcBileDuctSize = "ProcBileDuctSize";

        [DataType(typeof(System.String))]
        public static readonly String ProcDrains = "ProcDrains";

        [DataType(typeof(System.String))]
        public static readonly String ProcBiliaryBypass = "ProcBiliaryBypass";

        [DataType(typeof(System.String))]
        public static readonly String ProcBiliaryBypassOrigin = "ProcBiliaryBypassOrigin";

        [DataType(typeof(System.String))]
        public static readonly String ProcBiliaryBypassDestination = "ProcBiliaryBypassDestination";

        [DataType(typeof(System.String))]
        public static readonly String ProcGastricBypass = "ProcGastricBypass";

        [DataType(typeof(System.String))]
        public static readonly String ProcPlexusBlock = "ProcPlexusBlock";

        [DataType(typeof(System.String))]
        public static readonly String ProcSkinClosure = "ProcSkinClosure";

        // Added right after v5.0 release at MSK!
       // [DataType(typeof(System.String))]
       // public static readonly String ProcPancreaticAnastamosis = "ProcPancreaticAnastamosis";

        // not in the MSK release; leave commented
        //[DataType(typeof(System.String))]
        // public static readonly String ProcAddOrgansResected = "ProcAddOrgansResected";  

        [DataType(typeof(System.String))]
        public static readonly String ProcAnast = "ProcAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcPancreaticAnast = "ProcPancreaticAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcBiliaryAnast = "ProcBiliaryAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcDuodenalAnast = "ProcDuodenalAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcGastricAnast = "ProcGastricAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcDuodenumResectedSegment = "ProcDuodenumResectedSegment";

        [DataType(typeof(System.String))]
        public static readonly String ProcLaparotomyIncision = "ProcLaparotomyIncision";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumDrains = "ProcNumDrains";

        [DataType(typeof(System.String))]
        public static readonly String ProcNumPorts = "ProcNumPorts";

        [DataType(typeof(System.String))]
        public static readonly String ProcPortalVeinReconstruction = "ProcPortalVeinReconstruction";

        [DataType(typeof(System.String))]
        public static readonly String ProcFascialClosure = "ProcFascialClosure";

        [DataType(typeof(System.String))]
        public static readonly String ProcRemnantClosure = "ProcRemnantClosure";

    }
}
