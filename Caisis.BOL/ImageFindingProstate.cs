using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DxImageFindingsProstate")]
    [ParentTablename("Diagnostics")]
    [Disease("Prostate")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class ImageFindingProstate : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiagnosticId = "DiagnosticId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DxImageFindingProstateId = "DxImageFindingProstateId";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindSide = "ImgFindSide";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindLevel = "ImgFindLevel";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindAP = "ImgFindAP";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindZone = "ImgFindZone";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindHeight = "ImgFindHeight";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindWidth = "ImgFindWidth";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindLength = "ImgFindLength";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindResult = "ImgFindResult";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindExtension = "ImgFindExtension";

        // v6.1
        [DataType(typeof(System.String))]
        public static readonly String ImgFindLaterality = "ImgFindLaterality";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String ImgFindStatus = "ImgFindStatus";

        [DataType(typeof(System.Double))]
        public static readonly String ImgFindDistanceToCortex = "ImgFindDistanceToCortex";

        [DataType(typeof(System.Double))]
        public static readonly String ImgFindDistanceToSkin = "ImgFindDistanceToSkin";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindBoneScanCorrelate = "ImgFindBoneScanCorrelate";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindPETScanCorrelate = "ImgFindPETScanCorrelate";

        // v4.2
        [DataType(typeof(System.String))]
        public static readonly String ImgNotes = "ImgNotes";

    }
}
