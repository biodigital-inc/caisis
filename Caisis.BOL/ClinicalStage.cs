using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ClinicalStages")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class ClinicalStage : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ClinicalStageId = "ClinicalStageId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String ClinStageDateText = "ClinStageDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ClinStageDate = "ClinStageDate";

        [DataType(typeof(System.String))]
        public static readonly String ClinStageDisease = "ClinStageDisease";

        [DataType(typeof(System.String))]
        public static readonly String ClinStageSide = "ClinStageSide"; //added for Breast on 7/1/08 (v4.2)

        [DataType(typeof(System.String))]
        public static readonly String ClinStageGroup = "ClinStageGroup";

        [DataType(typeof(System.String))]
        public static readonly String ClinStageSystem = "ClinStageSystem";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String ClinStageT = "ClinStageT";

        [DataType(typeof(System.String))]
        public static readonly String ClinStageN = "ClinStageN";

        [DataType(typeof(System.String))]
        public static readonly String ClinStageM = "ClinStageM";

        [DataType(typeof(System.String))]
        public static readonly String ClinStageS = "ClinStageS";

        [DataType(typeof(System.String))]
        public static readonly String ClinStagePhysician = "ClinStagePhysician";

        [DataType(typeof(System.String))]
        public static readonly String ClinStageNotes = "ClinStageNotes";

        [DataType(typeof(System.String))]
        public static readonly String ClinStageDataSource = "ClinStageDataSource";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String ClinStageQuality = "ClinStageQuality";

    }
}
