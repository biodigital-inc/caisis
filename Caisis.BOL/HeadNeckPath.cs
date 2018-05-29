using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("HeadNeckPath")]
    [ParentTablename("Pathology")]
    [Disease("Head & Neck")]
    [Exportable]
    [NoLock]
    public class HeadNeckPath : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathTumorInv = "PathTumorInv";

        [DataType(typeof(System.String))]
        public static readonly String PathInvasionDepth = "PathInvasionDepth";

        [DataType(typeof(System.String))]
        public static readonly String PathMorphology = "PathMorphology";

        [DataType(typeof(System.String))]
        public static readonly String PathNecrosis = "PathNecrosis";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathPerineuralInv = "PathPerineuralInv";

        [DataType(typeof(System.String))]
        public static readonly String PathInvasionPattern = "PathInvasionPattern";

        [DataType(typeof(System.String))]
        public static readonly String PathMultiCentricity = "PathMultiCentricity";

        [DataType(typeof(System.String))]
        public static readonly String PathCarcinomaInSitu = "PathCarcinomaInSitu";

        [DataType(typeof(System.String))]
        public static readonly String PathNonNeoplasticMucosa = "PathNonNeoplasticMucosa";

        [DataType(typeof(System.String))]
        public static readonly String PathMargin = "PathMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathMarginSite = "PathMarginSite";

        [DataType(typeof(System.String))]
        public static readonly String PathExtension = "PathExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathBoneInv = "PathBoneInv";

        [DataType(typeof(System.String))]
        public static readonly String PathBoneMargin = "PathBoneMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathTumorMaxDim = "PathTumorMaxDim";
    }
}