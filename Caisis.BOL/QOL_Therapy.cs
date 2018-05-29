using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("QOL_Therapy")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class QOL_Therapy : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String QOL_TherapyId = "QOL_TherapyId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String QOL_TxDateText = "QOL_TxDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String QOL_TxDate = "QOL_TxDate";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String QOL_TxIndication = "QOL_TxIndication";

        [DataType(typeof(System.String))]
        public static readonly String QOL_Therapy_Field = "QOL_Therapy";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String QOL_TxStopDateText = "QOL_TxStopDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String QOL_TxStopDate = "QOL_TxStopDate";

        [DataType(typeof(System.String))]
        public static readonly String QOL_TxNotes = "QOL_TxNotes";

        [DataType(typeof(System.String))]
        public static readonly String QOL_TxDataSource = "QOL_TxDataSource";

        [DataType(typeof(System.String))]
        public static readonly String QOL_TxQuality = "QOL_TxQuality";

    }
}
