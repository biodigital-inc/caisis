using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProstatectomyPathFinding")]
    [ParentTablename("Pathology")]
    [Disease("Prostate")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class ProstatectomyPathologyFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.Int32))]
        public static readonly String ProstatectomyPathSectionId = "ProstatectomyPathSectionId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProstatectomyPathFindingId = "ProstatectomyPathFindingId";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSection = "PathFindSection";

        [DataType(typeof(System.String))]
        public static readonly String PathFindSide = "PathFindSide";

        [DataType(typeof(System.String))]
        public static readonly String PathFindLevel = "PathFindLevel";

        [DataType(typeof(System.String))]
        public static readonly String PathFindAP = "PathFindAP";

        [DataType(typeof(System.String))]
        public static readonly String PathFindLaterality = "PathFindLaterality";

        [DataType(typeof(System.String))]
        public static readonly String PathFindZone = "PathFindZone";

        [DataType(typeof(System.String))]
        public static readonly String PathFindIndex = "PathFindIndex";

        [DataType(typeof(System.String))]
        public static readonly String PathFindCancerMaxDim = "PathFindCancerMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathFindCancerArea = "PathFindCancerArea";

        [DataType(typeof(System.String))]
        public static readonly String PathFindCancerVolume = "PathFindCancerVolume";

        [DataType(typeof(System.String))]
        public static readonly String PathFindMargin = "PathFindMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathFindAddTissueMargin = "PathFindAddTissueMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathFindExtension = "PathFindExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathFindDominantTumor = "PathFindDominantTumor"; // v 4.2

        [DataType(typeof(System.String))]
        public static readonly String PathFindGG1 = "PathFindGG1";

        [DataType(typeof(System.String))]
        public static readonly String PathFindGG2 = "PathFindGG2";

        [DataType(typeof(System.String))]
        public static readonly String PathFindGG3 = "PathFindGG3"; // v 4.2

        [DataType(typeof(System.String))]
        public static readonly String PathFindGGS = "PathFindGGS";

        [DataType(typeof(System.String))]
        public static readonly String PathFindResult = "PathFindResult";

        [DataType(typeof(System.String))]
        public static readonly String PathFindPerineuralInv = "PathFindPerineuralInv";

        [DataType(typeof(System.String))]
        public static readonly String PathFindPNI_Diam = "PathFindPNI_Diam";

        [DataType(typeof(System.String))]
        public static readonly String PathFindVascularInv = "PathFindVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathFindNotes = "PathFindNotes";

    }
}
