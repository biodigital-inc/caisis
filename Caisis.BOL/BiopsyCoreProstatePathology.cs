using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProstateBiopsyCorePath")]
    [ParentTablename("Pathology")]
    [Disease("Prostate")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class BiopsyCoreProstatePathology : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProstateBiopsyCorePathId = "ProstateBiopsyCorePathId";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreSide = "PathCoreSide";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreLevel = "PathCoreLevel";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreLaterality = "PathCoreLaterality";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreZone = "PathCoreZone";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreNumCores = "PathCoreNumCores";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreNumFragments = "PathCoreNumFragments";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreLength = "PathCoreLength";

        [DataType(typeof(System.String))]
        public static readonly String PathCorePercCancer = "PathCorePercCancer";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreMaxCancerLength = "PathCoreMaxCancerLength";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreCancerLength = "PathCoreCancerLength";

        [DataType(typeof(System.String))]
        public static readonly String PathCorePercHG_Cancer = "PathCorePercHG_Cancer";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreHG_Length = "PathCoreHG_Length";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreGG1 = "PathCoreGG1";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreGG2 = "PathCoreGG2";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreGG3 = "PathCoreGG3";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreGGS = "PathCoreGGS";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreResult = "PathCoreResult";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreExtension = "PathCoreExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreProstatitis = "PathCoreProstatitis";

        [DataType(typeof(System.String))]
        public static readonly String PathCorePerineuralInv = "PathCorePerineuralInv";

        [DataType(typeof(System.String))]
        public static readonly String PathCorePNI_Diam = "PathCorePNI_Diam";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreHG_PIN = "PathCoreHG_PIN";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreType = "PathCoreType";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreCapsule = "PathCoreCapsule";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreFat = "PathCoreFat";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreASAP = "PathCoreASAP";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreAtrophy = "PathCoreAtrophy";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreStroma = "PathCoreStroma";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String PathCoreNotes = "PathCoreNotes";

        [DataType(typeof(System.String))]
        public static readonly String PathCoreNumTotalCores = "PathCoreNumTotalCores";
    }
}
