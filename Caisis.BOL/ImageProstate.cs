using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DxImageProstate")]
    [ParentTablename("Diagnostics")]
    [Disease("Prostate")]
    [Exportable]
    [NoLock]
    public class ImageProstate : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiagnosticId = "DiagnosticId";

        [DataType(typeof(System.Byte))]
        public static readonly String ImgUseForDosimetry = "ImgUseForDosimetry";

        [DataType(typeof(System.String))]
        public static readonly String ImgAvgDim = "ImgAvgDim";

        [DataType(typeof(System.String))]
        public static readonly String ImgProstateHeight = "ImgProstateHeight";

        [DataType(typeof(System.String))]
        public static readonly String ImgProstateWidth = "ImgProstateWidth";

        [DataType(typeof(System.String))]
        public static readonly String ImgProstateLength = "ImgProstateLength";

        [DataType(typeof(System.String))]
        public static readonly String ImgProstateVolume = "ImgProstateVolume";

        [DataType(typeof(System.String))]
        public static readonly String ImgTZ_Height = "ImgTZ_Height";

        [DataType(typeof(System.String))]
        public static readonly String ImgTZ_Width = "ImgTZ_Width";

        [DataType(typeof(System.String))]
        public static readonly String ImgTZ_Length = "ImgTZ_Length";

        [DataType(typeof(System.String))]
        public static readonly String ImgTZ_Volume = "ImgTZ_Volume";

        [DataType(typeof(System.String))]
        public static readonly String ImgUrethraLength = "ImgUrethraLength";

        [DataType(typeof(System.String))]
        public static readonly String ImgMRI_Veins = "ImgMRI_Veins";

        // v4.2
        [DataType(typeof(System.String))]
        public static readonly String ImgProstateContour = "ImgProstateContour";

        [DataType(typeof(System.String))]
        public static readonly String ImgClinStageT = "ImgClinStageT";

    }
}
