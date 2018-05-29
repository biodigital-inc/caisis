using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ColorectalPathFinding")]
    [ParentTablename("Pathology")]
    [Disease("Colorectal")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class ColorectalPathologyFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ColorectalPathFindingId = "ColorectalPathFindingId";

        [DataType(typeof(System.String))]
        public static readonly String PathFindGrade = "PathFindGrade";

        [DataType(typeof(System.String))]
        public static readonly String PathFindDistalMargin = "PathFindDistalMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathFindPerineuralInv = "PathFindPerineuralInv";

        [DataType(typeof(System.String))]
        public static readonly String PathFindPolypsAwayFromCancer = "PathFindPolypsAwayFromCancer";

        [DataType(typeof(System.String))]
        public static readonly String PathFindConfiguration = "PathFindConfiguration";

        [DataType(typeof(System.String))]
        public static readonly String PathFindDistalMarginSize = "PathFindDistalMarginSize";

        [DataType(typeof(System.String))]
        public static readonly String PathFindVascularInv = "PathFindVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathFindTumorMaxDim = "PathFindTumorMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathFindLateralMargin = "PathFindLateralMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathFindProximalMargin = "PathFindProximalMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathFindNonNeoplasticBowel = "PathFindNonNeoplasticBowel";

		[DataType(typeof(System.String))]
		public static readonly String PathFindPolypAwayNum = "PathFindPolypAwayNum";

		[DataType(typeof(System.String))]
		public static readonly String PathFindPolypAwayType = "PathFindPolypAwayType";

		[DataType(typeof(System.String))]
		public static readonly String PathFindPolypPreExisting = "PathFindPolypPreExisting";

		[DataType(typeof(System.String))]
		public static readonly String PathFindPolypPreExistingNum = "PathFindPolypPreExistingNum";

		[DataType(typeof(System.String))]
		public static readonly String PathFindPolypPreExistingType = "PathFindPolypPreExistingType";
    }
}
