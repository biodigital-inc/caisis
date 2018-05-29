using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DxImageThyroid")]
    [ParentTablename("Diagnostics")]
    [Disease("Thyroid")]
    [Exportable]
    [NoLock]
    public class ImageThyroid : BusinessObject
    {
        
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiagnosticId = "DiagnosticId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DxImageThyroidId = "DxImageThyroidId"; // v 4.2 made one to many

        [DataType(typeof(System.String))]
        public static readonly String ImgTumorMaxDim = "ImgTumorMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String ImgTumorSide = "ImgTumorSide";

        [DataType(typeof(System.String))]
        public static readonly String ImgThyroidInv = "ImgThyroidInv";

        [DataType(typeof(System.String))]
        public static readonly String ImgExtension = "ImgExtension";

        [DataType(typeof(System.String))]
        public static readonly String ImgFibroadiposeTissueInv = "ImgFibroadiposeTissueInv";

        [DataType(typeof(System.String))]
        public static readonly String ImgLarynxInv = "ImgLarynxInv";

        [DataType(typeof(System.String))]
        public static readonly String ImgTracheaInv = "ImgTracheaInv";

        [DataType(typeof(System.String))]
        public static readonly String ImgEsophagusInv = "ImgEsophagusInv";

        [DataType(typeof(System.String))]
        public static readonly String ImgStrapMuscleInv = "ImgStrapMuscleInv";

        [DataType(typeof(System.String))]
        public static readonly String ImgIJV_Inv = "ImgIJV_Inv";

        [DataType(typeof(System.String))]
        public static readonly String ImgCarotidVesselInv = "ImgCarotidVesselInv";

        [DataType(typeof(System.String))]
        public static readonly String ImgTumorMorphology = "ImgTumorMorphology";

    }
}
