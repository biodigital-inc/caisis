using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProstateBiopsyPath")]
    [ParentTablename("Pathology")]
    [Disease("Prostate")]
    [Exportable]
    [NoLock]
    public class BiopsyProstatePathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathPosCores = "PathPosCores";

        [DataType(typeof(System.String))]
        public static readonly String PathNumCores = "PathNumCores";

        [DataType(typeof(System.String))]
        public static readonly String PathSystematic = "PathSystematic";

        [DataType(typeof(System.String))]
        public static readonly String PathPosSites = "PathPosSites";

        [DataType(typeof(System.String))]
        public static readonly String PathNumSites = "PathNumSites";

        [DataType(typeof(System.String))]
        public static readonly String PathGG1 = "PathGG1";

        [DataType(typeof(System.String))]
        public static readonly String PathGG2 = "PathGG2";

        [DataType(typeof(System.String))]
        public static readonly String PathGG3 = "PathGG3"; // v 4.2

        [DataType(typeof(System.String))]
        public static readonly String PathGGS = "PathGGS";

        [DataType(typeof(System.String))]
        public static readonly String PathAtrophy = "PathAtrophy";

        [DataType(typeof(System.String))]
        public static readonly String PathProstatitis = "PathProstatitis";

        [DataType(typeof(System.String))]
        public static readonly String PathASAP = "PathASAP";

        [DataType(typeof(System.String))]
        public static readonly String PathPercCancer = "PathPercCancer";

        [DataType(typeof(System.String))]
        public static readonly String PathMaxPercCancer = "PathMaxPercCancer";

        [DataType(typeof(System.String))]
        public static readonly String PathTotalCancerLength = "PathTotalCancerLength";

        [DataType(typeof(System.String))]
        public static readonly String PathTotalCoreLength = "PathTotalCoreLength";

        [DataType(typeof(System.String))]
        public static readonly String PathHG_PIN = "PathHG_PIN";

        [DataType(typeof(System.String))]
        public static readonly String PathPerineuralInv = "PathPerineuralInv";

        [DataType(typeof(System.String))]
        public static readonly String PathExtension = "PathExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathGramsResected = "PathGramsResected";

        [DataType(typeof(System.String))]
        public static readonly String PathPercTissueExamined = "PathPercTissueExamined";

        [DataType(typeof(System.String))]
        public static readonly String PathPosChips = "PathPosChips";

        [DataType(typeof(System.String))]
        public static readonly String PathNumChips = "PathNumChips";

        [DataType(typeof(System.String))]
        public static readonly String PathNumFociCancer = "PathNumFociCancer";

    }
}
