using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DxImagePancreas")]
    [ParentTablename("Diagnostics")]
    [Disease("Pancreas")]
    [Exportable]
    [NoLock]
    public class ImagePancreas : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiagnosticId = "DiagnosticId";

        [DataType(typeof(System.String))]
        public static readonly String ImgCystMaxDim = "ImgCystMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String ImgMultiplicity = "ImgMultiplicity";

        [DataType(typeof(System.String))]
        public static readonly String ImgMaxMainDuctDiam = "ImgMaxMainDuctDiam";

        [DataType(typeof(System.String))]
        public static readonly String ImgMaxUncinateDuctDiam = "ImgMaxUncinateDuctDiam";

        [DataType(typeof(System.String))]
        public static readonly String ImgSideBranchMouthSize = "ImgSideBranchMouthSize";

        [DataType(typeof(System.String))]
        public static readonly String ImgEnhancingNodules = "ImgEnhancingNodules";

        [DataType(typeof(System.String))]
        public static readonly String ImgEnhancingNoduleSize = "ImgEnhancingNoduleSize";

        [DataType(typeof(System.String))]
        public static readonly String ImgPancreaticMass = "ImgPancreaticMass";

        [DataType(typeof(System.String))]
        public static readonly String ImgThickEnhancingSepta = "ImgThickEnhancingSepta";

        [DataType(typeof(System.String))]
        public static readonly String ImgBorders = "ImgBorders";

        [DataType(typeof(System.String))]
        public static readonly String ImgArterialProximityToLesion = "ImgArterialProximityToLesion";

        [DataType(typeof(System.String))]
        public static readonly String ImgVenousProximityToLesion = "ImgVenousProximityToLesion";

        [DataType(typeof(System.String))]
        public static readonly String ImgCystMorphology = "ImgCystMorphology";

        [DataType(typeof(System.String))]
        public static readonly String ImgCalcifications = "ImgCalcifications";
    }
}
