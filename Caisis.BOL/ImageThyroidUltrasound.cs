using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DxImageThyroidUltrasound")]
    [ParentTablename("Diagnostics")]
    [Disease("Thyroid")]
    [Exportable]
    [NoLock]
    public class ImageThyroidUltrasound : BusinessObject
    {

        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiagnosticId = "DiagnosticId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DxImageThyroidUltrasoundId = "DxImageThyroidUltrasoundId";

        [DataType(typeof(System.String))]
        public static readonly String ImgSide = "ImgSide";

        [DataType(typeof(System.String))]
        public static readonly String ImgSite = "ImgSite";

        [DataType(typeof(System.String))]
        public static readonly String ImgNodularity = "ImgNodularity";

        [DataType(typeof(System.String))]
        public static readonly String ImgExtension = "ImgExtension";

        [DataType(typeof(System.String))]
        public static readonly String ImgEchoTexture = "ImgEchoTexture";

        [DataType(typeof(System.String))]
        public static readonly String ImgArchitecture = "ImgArchitecture";

        [DataType(typeof(System.String))]
        public static readonly String ImgCalcification = "ImgCalcification";

        [DataType(typeof(System.String))]
        public static readonly String ImgMargin = "ImgMargin";

        [DataType(typeof(System.String))]
        public static readonly String ImgContour = "ImgContour";

        [DataType(typeof(System.String))]
        public static readonly String ImgVascularity = "ImgVascularity";

        [DataType(typeof(System.String))]
        public static readonly String ImgPerithyroid = "ImgPerithyroid";

        [DataType(typeof(System.String))]
        public static readonly String ImgLevel6 = "ImgLevel6";

        [DataType(typeof(System.String))]
        public static readonly String ImgLateralNeck = "ImgLateralNeck";

        // v4.2
        [DataType(typeof(System.String))]
        public static readonly String ImgPrimaryDimension = "ImgPrimaryDimension";

        [DataType(typeof(System.String))]
        public static readonly String ImgSecondaryDimension = "ImgSecondaryDimension";

        [DataType(typeof(System.String))]
        public static readonly String ImgTertiaryDimension = "ImgTertiaryDimension";

        [DataType(typeof(System.String))]
        public static readonly String ImgNotes = "ImgNotes";

    }
}
