using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("CystectomyPath")]
    [ParentTablename("Pathology")]
    [Disease("Bladder")]
    [Exportable]
    [NoLock]
    public class CystectomyPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathNumLesions = "PathNumLesions";

        [DataType(typeof(System.String))]
        public static readonly String PathExtension = "PathExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathPattern = "PathPattern";

        [DataType(typeof(System.String))]
        public static readonly String PathBladderMargin = "PathBladderMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathBladderWallMargin = "PathBladderWallMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathL_UreterMargin = "PathL_UreterMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathR_UreterMargin = "PathR_UreterMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathL_UreterInv = "PathL_UreterInv";

        [DataType(typeof(System.String))]
        public static readonly String PathR_UreterInv = "PathR_UreterInv";

        [DataType(typeof(System.String))]
        public static readonly String PathUrethraMargin = "PathUrethraMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathUrethraInv = "PathUrethraInv";

        [DataType(typeof(System.String))]
        public static readonly String PathSoftTissueMargin = "PathSoftTissueMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathMucosaMargin = "PathMucosaMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathMultifocal = "PathMultifocal";

        [DataType(typeof(System.String))]
        public static readonly String PathCarcinomaInSitu = "PathCarcinomaInSitu";

        [DataType(typeof(System.String))]
        public static readonly String PathPerineuralInv = "PathPerineuralInv";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathProstateInv = "PathProstateInv";

        [DataType(typeof(System.String))] //added in v 5.5
        public static readonly String PathPatternInvasive = "PathPatternInvasive";

    }
}
