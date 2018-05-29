using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("NephrectomyProc")]
    [ParentTablename("Procedures")]
    [Disease("Kidney")]
    [Exportable]
    [NoLock]
    public class Nephrectomy : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcPlannedType = "ProcPlannedType";

        [DataType(typeof(System.String))]
        public static readonly String ProcCaseQuality = "ProcCaseQuality";

        [DataType(typeof(System.String))]
        public static readonly String ProcCompleteResection = "ProcCompleteResection";

        [DataType(typeof(System.String))]
        public static readonly String ProcPartialReason = "ProcPartialReason";

        [DataType(typeof(System.String))]
        public static readonly String ProcPartialIschemia = "ProcPartialIschemia";

        [DataType(typeof(System.String))]
        public static readonly String ProcPartialIceSlush = "ProcPartialIceSlush";

        [DataType(typeof(System.String))]
        public static readonly String ProcPartialClampStartTime = "ProcPartialClampStartTime";

        [DataType(typeof(System.String))]
        public static readonly String ProcPartialClampStopTime = "ProcPartialClampStopTime";

        [DataType(typeof(System.String))]
        public static readonly String ProcPartialClampDuration = "ProcPartialClampDuration";

		[DataType(typeof(System.String))]
		public static readonly String ProcPreOpDiagnosis = "ProcPreOpDiagnosis";

		[DataType(typeof(System.String))]
		public static readonly String ProcPostOpDiagnosis = "ProcPostOpDiagnosis";

		[DataType(typeof(System.String))]
		public static readonly String ProcTumorLocation = "ProcTumorLocation";

		[DataType(typeof(System.String))]
		public static readonly String ProcNumTumors = "ProcNumTumors";

		[DataType(typeof(System.String))]
		public static readonly String ProcConversionReason = "ProcConversionReason";

		[DataType(typeof(System.String))]
		public static readonly String ProcExcisionTechnique = "ProcExcisionTechnique";

		[DataType(typeof(System.String))]
		public static readonly String ProcIntraOpUS = "ProcIntraOpUS";

		[DataType(typeof(System.String))]
		public static readonly String ProcIntraOpUS_Lesions = "ProcIntraOpUS_Lesions";

		[DataType(typeof(System.String))]
		public static readonly String ProcIVC_Inv = "ProcIVC_Inv";

		[DataType(typeof(System.String))]
		public static readonly String ProcHypothermia = "ProcHypothermia";

		[DataType(typeof(System.String))]
		public static readonly String ProcRenalHypothermiaType = "ProcRenalHypothermiaType";

		[DataType(typeof(System.String))]
		public static readonly String ProcUreteralStent = "ProcUreteralStent";

		[DataType(typeof(System.String))]
		public static readonly String ProcCollectingSystemRepair = "ProcCollectingSystemRepair";

		[DataType(typeof(System.String))]
		public static readonly String ProcRenalVeinClamping = "ProcRenalVeinClamping";

		[DataType(typeof(System.String))]
		public static readonly String ProcNumRenalArteries = "ProcNumRenalArteries";

		[DataType(typeof(System.String))]
		public static readonly String ProcNumRenalArteriesOccluded = "ProcNumRenalArteriesOccluded";

		[DataType(typeof(System.String))]
		public static readonly String ProcSinusFatExtension = "ProcSinusFatExtension";

		[DataType(typeof(System.String))]
		public static readonly String ProcFrozenSections = "ProcFrozenSections";

		[DataType(typeof(System.String))]
		public static readonly String ProcAddTissue = "ProcAddTissue";

		[DataType(typeof(System.String))]
		public static readonly String ProcDrains = "ProcDrains";

		[DataType(typeof(System.String))]
		public static readonly String ProcCO2_PressureDuration = "ProcCO2_PressureDuration";

		[DataType(typeof(System.String))]
		public static readonly String ProcPercKidneySpared = "ProcPercKidneySpared";

		[DataType(typeof(System.String))]
        public static readonly String ProcComplication = "ProcComplication";

        [DataType(typeof(System.String))]
        public static readonly String ProcCollectingSystemEntry = "ProcCollectingSystemEntry";

        [DataType(typeof(System.String))]
        public static readonly String ProcInfusionType = "ProcInfusionType";

        [DataType(typeof(System.String))]
        public static readonly String ProcInfusionBeforeClamping = "ProcInfusionBeforeClamping";

        [DataType(typeof(System.String))]
        public static readonly String ProcInfusionToRenalVeinClampingTime = "ProcInfusionToRenalVeinClampingTime";

        [DataType(typeof(System.String))]
        public static readonly String ProcInfusionDetails = "ProcInfusionDetails";

        
        
 

    }
}
