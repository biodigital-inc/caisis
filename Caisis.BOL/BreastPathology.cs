using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("BreastPath")]
    [ParentTablename("Pathology")]
    [Disease("Breast")]
    [Exportable]
    [NoLock]
    public class BreastPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathMargin = "PathMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathSuperiorMargin = "PathSuperiorMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathInferiorMargin = "PathInferiorMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathAnteriorMargin = "PathAnteriorMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathPosteriorMargin = "PathPosteriorMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathIntraductal = "PathIntraductal";

        [DataType(typeof(System.String))]
        public static readonly String PathMultifocal = "PathMultifocal";

        [DataType(typeof(System.String))]
        public static readonly String PathLocation = "PathLocation";

        [DataType(typeof(System.String))]
        public static readonly String PathLocation2 = "PathLocation2";

        [DataType(typeof(System.String))]
        public static readonly String PathExtension = "PathExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathNumFociCancer = "PathNumFociCancer";

        [DataType(typeof(System.String))]
        public static readonly String PathNucPleo = "PathNucPleo";

        [DataType(typeof(System.String))]
        public static readonly String PathTubForm = "PathTubForm";

        [DataType(typeof(System.String))]
        public static readonly String PathMitIdx = "PathMitIdx";

        [DataType(typeof(System.String))]
        public static readonly String PathAngloInv = "PathAngloInv";

        [DataType(typeof(System.String))]
        public static readonly String PathAssInSitu = "PathAssInSitu";

        [DataType(typeof(System.String))]
        public static readonly String PathExtentInSitu = "PathExtentInSitu";

        [DataType(typeof(System.String))]
        public static readonly String PathNuclearGrade = "PathNuclearGrade"; // renamed from PathInSituNuclearGrade on 7/1/08 (v4.2)
    
        [DataType(typeof(System.String))]
        public static readonly String PathInSituNecrosis = "PathInSituNecrosis";

        [DataType(typeof(System.String))]
        public static readonly String PathCalcifications = "PathCalcifications";

        [DataType(typeof(System.String))]
        public static readonly String PathBenign = "PathBenign";

        [DataType(typeof(System.String))]
        public static readonly String PathTumorMaxDim = "PathTumorMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathLymphaticInv = "PathLymphaticInv";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathPerineuralInv = "PathPerineuralInv";

        // v4.2
        [DataType(typeof(System.String))]
        public static readonly String PathNumReExcision = "PathNumReExcision";

        [DataType(typeof(System.String))]
        public static readonly String PathNumPositiveMargins = "PathNumPositiveMargins";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String PathOverallGrade = "PathOverallGrade";

        [DataType(typeof(System.String))]
        public static readonly String PathMulticentric = "PathMulticentric";
    }
}
