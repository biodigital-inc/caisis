using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DxImageFindingsKidney")]
    [ParentTablename("Diagnostics")]
    [Disease("Kidney")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class ImageFindingKidney : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiagnosticId = "DiagnosticId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DxImageFindingKidneyId = "DxImageFindingKidneyId";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindSide = "ImgFindSide";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindPole = "ImgFindPole";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindAP = "ImgFindAP";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindSite = "ImgFindSite";

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

        [DataType(typeof(System.String))]
        public static readonly String ImgFindRV_Inv = "ImgFindRV_Inv";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindIVC_Inv = "ImgFindIVC_Inv";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindIVC_WallInv = "ImgFindIVC_WallInv";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindTumorType = "ImgFindTumorType";

    }
}
