using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DxImageEndorectalUltrasound")]
    [ParentTablename("Diagnostics")]
    [Disease("All")]
    [Exportable]
    [NoLock]
    public class ImageEndorectalUltrasound : BusinessObject
    {

        [ForeignKey]
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiagnosticId = "DiagnosticId";

        [DataType(typeof(System.String))]
        public static readonly String ImgLocation = "ImgLocation";

        [DataType(typeof(System.String))]
        public static readonly String ImgSide = "ImgCircumference";

        [DataType(typeof(System.String))]
        public static readonly String ImgDiameter = "ImgDiameter";

        [DataType(typeof(System.String))]
        public static readonly String ImgMorphology = "ImgMorphology";

        [DataType(typeof(System.String))]
        public static readonly String ImgDistalDistanceAnalVerge = "ImgDistalDistanceAnalVerge";

        [DataType(typeof(System.String))]
        public static readonly String ImgProximalDistanceAnalVerge = "ImgProximalDistanceAnalVerge";

        [DataType(typeof(System.String))]
        public static readonly String ImgAnalVergeExamineDistance = "ImgAnalVergeExamineDistance";

        [DataType(typeof(System.String))]
        public static readonly String ImgBalloonVolume = "ImgBalloonVolume";

        [DataType(typeof(System.String))]
        public static readonly String ImgWidth = "ImgWidth";

        [DataType(typeof(System.String))]
        public static readonly String ImgDepth = "ImgDepth";

        [DataType(typeof(System.String))]
        public static readonly String ImgDepthLevel = "ImgDepthLevel";

        [DataType(typeof(System.String))]
        public static readonly String ImgRadial = "ImgRadial";

        [DataType(typeof(System.String))]
        public static readonly String ImgIntSphincterInvolve = "ImgIntSphincterInvolve";

        [DataType(typeof(System.String))]
        public static readonly String ImgIntSphincterLoc = "ImgIntSphincterLoc";

        [DataType(typeof(System.String))]
        public static readonly String ImgExtSphincterInvolve = "ImgExtSphincterInvolve";

        [DataType(typeof(System.String))]
        public static readonly String ImgExtSphincterLoc = "ImgExtSphincterLoc";

        [DataType(typeof(System.String))]
        public static readonly String ImgNotes = "ImgNotes";
    }
}
