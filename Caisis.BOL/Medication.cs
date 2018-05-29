using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Medications")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Medication : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MedicationId = "MedicationId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String MedDateText = "MedDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String MedDate = "MedDate";

        [DataType(typeof(System.String))]
        public static readonly String MedType = "MedType";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Medication_Field = "Medication";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String MedStopDateText = "MedStopDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String MedStopDate = "MedStopDate";

        [DataType(typeof(System.String))]
        public static readonly String MedDose = "MedDose";

        [DataType(typeof(System.String))]
        public static readonly String MedTotalDose = "MedTotalDose";

        [DataType(typeof(System.String))]
        public static readonly String MedUnits = "MedUnits";

        [DataType(typeof(System.String))]
        public static readonly String MedRoute = "MedRoute";

        [DataType(typeof(System.String))]
        public static readonly String MedSchedule = "MedSchedule";

        [DataType(typeof(System.String))]
        public static readonly String MedIndication = "MedIndication";

        [DataType(typeof(System.String))]
        public static readonly String MedNotes = "MedNotes";

        [DataType(typeof(System.String))]
        public static readonly String MedDataSource = "MedDataSource";

        [DataType(typeof(System.String))]
        public static readonly String MedQuality = "MedQuality";

    }
}
