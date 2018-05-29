using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("CystectomyProc")]
    [ParentTablename("Procedures")]
    [Disease("Bladder")]
    [Exportable]
    [NoLock]
    public class Cystectomy : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcCompleteResection = "ProcCompleteResection";

        [DataType(typeof(System.String))]
        public static readonly String ProcBladderMargin = "ProcBladderMargin";

        [DataType(typeof(System.String))]
        public static readonly String ProcBladderMarginFrozen = "ProcBladderMarginFrozen";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_UreterMargin = "ProcL_UreterMargin";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_UreterMarginFrozen = "ProcL_UreterMarginFrozen";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_UreterMargin = "ProcR_UreterMargin";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_UreterMarginFrozen = "ProcR_UreterMarginFrozen";

        [DataType(typeof(System.String))]
        public static readonly String ProcUrethraMargin = "ProcUrethraMargin";

        [DataType(typeof(System.String))]
        public static readonly String ProcUrethraMarginFrozen = "ProcUrethraMarginFrozen";

        [DataType(typeof(System.String))]
        public static readonly String ProcUrethrectomy = "ProcUrethrectomy";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_UreterAnast = "ProcR_UreterAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_UreterAnast = "ProcL_UreterAnast";

        [DataType(typeof(System.String))]
        public static readonly String ProcLateralPedicleClips = "ProcLateralPedicleClips";

        [DataType(typeof(System.String))]
        public static readonly String ProcLateralPedicleStaples = "ProcLateralPedicleStaples";

        [DataType(typeof(System.String))]
        public static readonly String ProcLateralPedicleTies = "ProcLateralPedicleTies";

        [DataType(typeof(System.String))]
        public static readonly String ProcPosteriorPedicleClips = "ProcPosteriorPedicleClips";

        [DataType(typeof(System.String))]
        public static readonly String ProcPosteriorPedicleStaples = "ProcPosteriorPedicleStaples";

        [DataType(typeof(System.String))]
        public static readonly String ProcPosteriorPedicleTies = "ProcPosteriorPedicleTies";

        [DataType(typeof(System.String))]
        public static readonly String ProcHypogastricArteryLigation = "ProcHypogastricArteryLigation";

        [DataType(typeof(System.String))]
        public static readonly String ProcIncompletePelvicFloor = "ProcIncompletePelvicFloor";

        [DataType(typeof(System.String))]
        public static readonly String ProcIncompleteSideWall = "ProcIncompleteSideWall";

        [DataType(typeof(System.String))]
        public static readonly String ProcIncompleteRectum = "ProcIncompleteRectum";

        [DataType(typeof(System.String))]
        public static readonly String ProcGrossEVD = "ProcGrossEVD";

        [DataType(typeof(System.String))]
        public static readonly String ProcVaginaResection = "ProcVaginaResection";

        [DataType(typeof(System.String))]
        public static readonly String ProcVaginaResectionAnterior = "ProcVaginaResectionAnterior";

        [DataType(typeof(System.String))]
        public static readonly String ProcVaginaResectionLateral = "ProcVaginaResectionLateral";

        [DataType(typeof(System.String))]
        public static readonly String ProcVaginaReconstruction = "ProcVaginaReconstruction";

        [DataType(typeof(System.String))]
        public static readonly String ProcRectum = "ProcRectum";

        [DataType(typeof(System.String))]
        public static readonly String ProcColon = "ProcColon";

        [DataType(typeof(System.String))]
        public static readonly String ProcSmallBowel = "ProcSmallBowel";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnastQuality = "ProcAnastQuality";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnastNumSutures = "ProcAnastNumSutures";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnastSuturePattern = "ProcAnastSuturePattern";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnastSutureNotes = "ProcAnastSutureNotes";

        [DataType(typeof(System.String))]
        public static readonly String ProcBN_Diam = "ProcBN_Diam";

        [DataType(typeof(System.String))]
        public static readonly String ProcBN_DegreeEversion = "ProcBN_DegreeEversion";

        [DataType(typeof(System.String))]
        public static readonly String ProcSuspVeinComplex = "ProcSuspVeinComplex";

        [DataType(typeof(System.String))]
        public static readonly String ProcBladderSparingQuality = "ProcBladderSparingQuality";

        [DataType(typeof(System.String))]
        public static readonly String ProcUrethralStump = "ProcUrethralStump";

        [DataType(typeof(System.String))]
        public static readonly String ProcBladderClosure = "ProcBladderClosure";

        [DataType(typeof(System.String))]
        public static readonly String ProcNerveSparing = "ProcNerveSparing";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_DopplerStatus = "ProcL_DopplerStatus";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_DopplerVA = "ProcL_DopplerVA";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_NVB_DissectionType = "ProcL_NVB_DissectionType";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_NVB_Status = "ProcL_NVB_Status";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_NVB_Graft = "ProcL_NVB_Graft";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_NVB_Donor = "ProcL_NVB_Donor";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_NVB_Quality = "ProcL_NVB_Quality";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_DopplerStatus = "ProcR_DopplerStatus";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_DopplerVA = "ProcR_DopplerVA";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_NVB_DissectionType = "ProcR_NVB_DissectionType";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_NVB_Status = "ProcR_NVB_Status";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_NVB_Graft = "ProcR_NVB_Graft";

		[DataType(typeof(System.String))]
		public static readonly String ProcR_NVB_Donor = "ProcR_NVB_Donor";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_NVB_Quality = "ProcR_NVB_Quality";

		[DataType(typeof(System.String))]
		public static readonly String ProcRectalInjury = "ProcRectalInjury";
    }
}
