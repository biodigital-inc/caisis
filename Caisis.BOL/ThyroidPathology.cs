using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ThyroidPath")]
    [ParentTablename("Pathology")]
    [Disease("Thyroid")]
    [Exportable]
	//[HasSiblings]
    [NoLock]
    public class ThyroidPathology : BusinessObject
    {
		[PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

		//[PrimaryKey]
		//[DataType(typeof(System.Int32))]
		//public static readonly String ThyroidPathId = "ThyroidPathId";

        [DataType(typeof(System.String))]
        public static readonly String PathTumorType = "PathTumorType";

        [DataType(typeof(System.String))]
        public static readonly String PathMitoticActivity = "PathMitoticActivity";

        [DataType(typeof(System.String))]
        public static readonly String PathNecrosis = "PathNecrosis";

		//[DataType(typeof(System.String))]
		//public static readonly String PathTumorFeatures = "PathTumorFeatures";

        [DataType(typeof(System.String))]
        public static readonly String PathR_Lobe = "PathR_Lobe";

        [DataType(typeof(System.String))]
        public static readonly String PathL_Lobe = "PathL_Lobe";

        [DataType(typeof(System.String))]
        public static readonly String PathIsthmus = "PathIsthmus";

        [DataType(typeof(System.String))]
        public static readonly String PathTumorMaxDim = "PathTumorMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathTumorEncapsulation = "PathTumorEncapsulation";

        [DataType(typeof(System.String))]
        public static readonly String PathNumFociCapsularInv = "PathNumFociCapsularInv"; // was PathCapsularInv

        [DataType(typeof(System.String))]
        public static readonly String PathNumFociVascularInv = "PathNumFociVascularInv"; // was PathVascularInv

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInvLocation = "PathVascularInvLocation";

        [DataType(typeof(System.String))]
        public static readonly String PathExtension = "PathExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathExtensionSites = "PathExtensionSites";

        [DataType(typeof(System.String))]
        public static readonly String PathMargin = "PathMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathMarginSites = "PathMarginSites";

		//[DataType(typeof(System.String))]
		//public static readonly String PathMulticentric = "PathMulticentric";

        [DataType(typeof(System.String))]
        public static readonly String PathCCellHyperplasia = "PathCCellHyperplasia";

        [DataType(typeof(System.String))]
        public static readonly String PathAdenoma = "PathAdenoma";

        [DataType(typeof(System.String))]
        public static readonly String PathNonNeoplastic = "PathNonNeoplastic";

        [DataType(typeof(System.String))]
        public static readonly String PathParathyroidGlands = "PathParathyroidGlands";

		[DataType(typeof(System.String))]
		public static readonly String PathMicrocarcinoma = "PathMicrocarcinoma";

		[DataType(typeof(System.String))]
        public static readonly String PathMultiCentricity = "PathMultiCentricity";

		[DataType(typeof(System.String))]
		public static readonly String PathInfiltrative = "PathInfiltrative";

		[DataType(typeof(System.String))]
		public static readonly String PathSizeRange = "PathSizeRange";

		[DataType(typeof(System.String))]
		public static readonly String PathIntraThyroidInfiltration = "PathIntraThyroidInfiltration";

		[DataType(typeof(System.String))]
		public static readonly String PathNumSlides = "PathNumSlides";

		[DataType(typeof(System.String))]
		public static readonly String PathNumSections = "PathNumSections";

        [DataType(typeof(System.String))]
        public static readonly String PathNodePredominantHistology = "PathNodePredominantHistology";

        [DataType(typeof(System.String))]
        public static readonly String PathNodeHighestGradeHistology = "PathNodeHighestGradeHistology";

    }
}
