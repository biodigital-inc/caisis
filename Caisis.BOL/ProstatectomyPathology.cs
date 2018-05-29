using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProstatectomyPath")]
    [ParentTablename("Pathology")]
    [Disease("Prostate")]
    [Exportable]
    [NoLock]
    public class ProstatectomyPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathGG1 = "PathGG1";

        [DataType(typeof(System.String))]
        public static readonly String PathGG2 = "PathGG2";

        [DataType(typeof(System.String))]
        public static readonly String PathGG3 = "PathGG3";

        [DataType(typeof(System.String))]
        public static readonly String PathGGS = "PathGGS";

        [DataType(typeof(System.String))]
        public static readonly String PathPercCancer = "PathPercCancer";

        [DataType(typeof(System.String))]
        public static readonly String PathHG_Volume = "PathHG_Volume";

        [DataType(typeof(System.String))]
        public static readonly String PathPercHG_Cancer = "PathPercHG_Cancer";

        [DataType(typeof(System.String))]
        public static readonly String PathCancerMaxDim = "PathCancerMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathCancerVolume = "PathCancerVolume";

        [DataType(typeof(System.String))]
        public static readonly String PathProstateVolume = "PathProstateVolume";

        [DataType(typeof(System.String))]
        public static readonly String PathWholeMount = "PathWholeMount";

        [DataType(typeof(System.String))]
        public static readonly String PathMargin = "PathMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathAddTissueMargin = "PathAddTissueMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathExtension = "PathExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathSV_Inv = "PathSV_Inv";

        [DataType(typeof(System.String))]
        public static readonly String PathHG_PIN = "PathHG_PIN";

        [DataType(typeof(System.String))]
        public static readonly String PathHG_PIN_Extent = "PathHG_PIN_Extent";

        [DataType(typeof(System.String))]
        public static readonly String PathPerineuralInv = "PathPerineuralInv";

        [DataType(typeof(System.String))]
        public static readonly String PathPNI_Diam = "PathPNI_Diam";

        [DataType(typeof(System.String))]
        public static readonly String PathIntraductal = "PathIntraductal";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathBN_Inv = "PathBN_Inv";

        [DataType(typeof(System.String))]
        public static readonly String PathMultifocal = "PathMultifocal";

    }
}
