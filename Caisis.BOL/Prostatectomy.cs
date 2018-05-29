using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProstatectomyProc")]
    [ParentTablename("Procedures")]
    [Disease("Prostate")]
    [Exportable]
    [NoLock]
    public class Prostatectomy : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [DataType(typeof(System.String))]
        public static readonly String ProcStageSystem = "ProcStageSystem";

        [DataType(typeof(System.String))]
        public static readonly String ProcStageT = "ProcStageT";

        // v6.x 4/11/2013
        [DataType(typeof(System.String))]
        public static readonly String ProcStageN = "ProcStageN";

        // v6.x 4/11/2013
        [DataType(typeof(System.String))]
        public static readonly String ProcStageM = "ProcStageM";

        [DataType(typeof(System.String))]
        public static readonly String ProcBulldogClamps = "ProcBulldogClamps";

        [DataType(typeof(System.String))]
        public static readonly String ProcBladderClosure = "ProcBladderClosure";

        [DataType(typeof(System.String))]
        public static readonly String ProcAccessVessels = "ProcAccessVessels";

        [DataType(typeof(System.String))]
        public static readonly String ProcAV_Preserved = "ProcAV_Preserved";

        [DataType(typeof(System.String))]
        public static readonly String ProcPuboprostatics = "ProcPuboprostatics";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_AV_Site = "ProcR_AV_Site";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_AV_Diam = "ProcR_AV_Diam";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_AV_Site = "ProcL_AV_Site";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_AV_Diam = "ProcL_AV_Diam";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_DopplerStatus = "ProcR_DopplerStatus";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_DopplerVA = "ProcR_DopplerVA";

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
        public static readonly String ProcAnastQuality = "ProcAnastQuality";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnastNumSutures = "ProcAnastNumSutures";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnastSuturePattern = "ProcAnastSuturePattern";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnastWatertight = "ProcAnastWatertight"; // v4.2 

        [DataType(typeof(System.String))]
        public static readonly String ProcAnastSutureNotes = "ProcAnastSutureNotes";

        [DataType(typeof(System.String))]
        public static readonly String ProcBN_Diam = "ProcBN_Diam";

        [DataType(typeof(System.String))]
        public static readonly String ProcBN_DegreeEversion = "ProcBN_DegreeEversion";

        [DataType(typeof(System.String))]
        public static readonly String ProcSuspVeinComplex = "ProcSuspVeinComplex";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_Drain = "ProcL_Drain";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_Drain = "ProcR_Drain";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnteriorDrain = "ProcAnteriorDrain";

        [DataType(typeof(System.String))]
        public static readonly String ProcPosteriorDrain = "ProcPosteriorDrain";

        [DataType(typeof(System.String))]
        public static readonly String ProcCathTraction = "ProcCathTraction";

        [DataType(typeof(System.String))]
        public static readonly String ProcCathTractionDuration = "ProcCathTractionDuration";

        [DataType(typeof(System.String))]
        public static readonly String ProcSV_DissectFirst = "ProcSV_DissectFirst";

		[DataType(typeof(System.String))]
		public static readonly String ProcPeriprostaticVeins = "ProcPeriprostaticVeins";

		[DataType(typeof(System.String))]
		public static readonly String ProcBladderNeckPreservation = "ProcBladderNeckPreservation";

		[DataType(typeof(System.String))]
		public static readonly String ProcUrethralStumpScore = "ProcUrethralStumpScore";

		[DataType(typeof(System.String))]
		public static readonly String ProcPelvisAccessibility = "ProcPelvisAccessibility";

		[DataType(typeof(System.String))]
		public static readonly String ProcSkinIncisionLength = "ProcSkinIncisionLength";

		[DataType(typeof(System.String))]
		public static readonly String ProcFascialIncisionLength = "ProcFascialIncisionLength";

		[DataType(typeof(System.String))]
		public static readonly String ProcMedianLobe = "ProcMedianLobe";

		[DataType(typeof(System.String))]
		public static readonly String ProcUrachalSparing = "ProcUrachalSparing";

		[DataType(typeof(System.String))]
		public static readonly String ProcNumSize5Ports = "ProcNumSize5Ports";

		[DataType(typeof(System.String))]
		public static readonly String ProcNumSize8Ports = "ProcNumSize8Ports";

		[DataType(typeof(System.String))]
		public static readonly String ProcNumSize10Ports = "ProcNumSize10Ports";

		[DataType(typeof(System.String))]
		public static readonly String ProcNumSize12Ports = "ProcNumSize12Ports";

        // v5.1
        [DataType(typeof(System.String))]
        public static readonly String ProcMethodOfEntry = "ProcMethodOfEntry";

        [DataType(typeof(System.String))]
        public static readonly String ProcSkinClosure = "ProcSkinClosure";

        [DataType(typeof(System.String))]
        public static readonly String ProcFascialClosureMethod = "ProcFascialClosureMethod";

        [DataType(typeof(System.String))]
        public static readonly String ProcClosureMaterialsUsed = "ProcClosureMaterialsUsed";

        [DataType(typeof(System.String))]
        public static readonly String ProcSV_Excision = "ProcSV_Excision";

        [DataType(typeof(System.String))]
        public static readonly String ProcL_SV_Excision = "ProcL_SV_Excision";

        [DataType(typeof(System.String))]
        public static readonly String ProcR_SV_Excision = "ProcR_SV_Excision";

        [DataType(typeof(System.String))]
        public static readonly String ProcHypogastric = "ProcHypogastric";

        [DataType(typeof(System.String))]
        public static readonly String ProcPneumoperPressure = "ProcPneumoperPressure";

        [DataType(typeof(System.String))]
        public static readonly String ProcFoleyPlacement = "ProcFoleyPlacement";

        [DataType(typeof(System.String))]
        public static readonly String ProcBladderNeckReconstruction = "ProcBladderNeckReconstruction";
        // end 5.1 new fields: some should be rolled into Procedures table

        // 6.x
        [DataType(typeof(System.String))]
        public static readonly String ProcAnteriorFascialSuspension = "ProcAnteriorFascialSuspension";
    }
}
