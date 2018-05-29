using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Toxicities")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Toxicity : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.Int32))]
        public static readonly String OperatingRoomDetailId = "OperatingRoomDetailId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ToxicityId = "ToxicityId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String ToxDateText = "ToxDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ToxDate = "ToxDate";

        [DataType(typeof(System.String))]
        public static readonly String ToxName = "ToxName";

        [DataType(typeof(System.String))]
        public static readonly String ToxScale = "ToxScale";

        [DataType(typeof(System.String))]
        public static readonly String ToxClass = "ToxClass";

        [DataType(typeof(System.String))]
        public static readonly String ToxCategory = "ToxCategory";

        [DataType(typeof(System.String))]
        public static readonly String ToxGrade = "ToxGrade";

        [DataType(typeof(System.String))]
        public static readonly String ToxGradeCriteria = "ToxGradeCriteria";

        [DataType(typeof(System.String))]
        public static readonly String ToxRelatedTo = "ToxRelatedTo";

        [DataType(typeof(System.String))]
        public static readonly String ToxProbability = "ToxProbability";

        [DataType(typeof(System.String))]
        public static readonly String ToxIntervention = "ToxIntervention";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String ToxStopDateText = "ToxStopDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ToxStopDate = "ToxStopDate";

        [DataType(typeof(System.String))]
        public static readonly String ToxNotes = "ToxNotes";

        [DataType(typeof(System.String))]
        public static readonly String ToxDataSource = "ToxDataSource";

        [DataType(typeof(System.String))]
        public static readonly String ToxQuality = "ToxQuality";

        [DataType(typeof(System.Byte))]
        public static readonly String ToxExpected = "ToxExpected";

        [DataType(typeof(System.Byte))]
        public static readonly String ToxDiscontinueTherapy = "ToxDiscontinueTherapy";

        [DataType(typeof(System.Byte))]
        public static readonly String ToxBaseLine = "ToxBaseLine";

        [DataType(typeof(System.Byte))]
        public static readonly String ToxSAE = "ToxSAE";

        // v6.x
        [DataType(typeof(System.Byte))]
        public static readonly String ToxOngoing = "ToxOngoing";
    }
}
