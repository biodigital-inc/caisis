using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DxImageFindings")]
    [ParentTablename("Diagnostics")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class ImageFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiagnosticId = "DiagnosticId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DxImageFindingId = "DxImageFindingId";

        [DataType(typeof(System.Int32))]
        public static readonly String ImgFindGroupNum = "ImgFindGroupNum";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindSiteNum = "ImgFindSiteNum";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindSite = "ImgFindSite";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindSubsite = "ImgFindSubsite";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindSide = "ImgFindSide";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindAP = "ImgFindAP"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String ImgFindExtension = "ImgFindExtension";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindStatus = "ImgFindStatus";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindResult = "ImgFindResult";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindHeight = "ImgFindHeight";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindWidth = "ImgFindWidth";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindLength = "ImgFindLength";

        [DataType(typeof(System.String))]
        public static readonly String ImgFindSUV = "ImgFindSUV"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String ImgFindSliceNum = "ImgFindSliceNum"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String ImgFindSeriesNum = "ImgFindSeriesNum"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String ImgFindTarget = "ImgFindTarget"; // v5.0

        [DataType(typeof(System.String))]
        public static readonly String ImgFindNew = "ImgFindNew"; // v5.0

       [DataType(typeof(System.String))]
        public static readonly String ImgFindNotes = "ImgFindNotes";

    }
}
