using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MedAdministration")]
    [ParentTablename("Medications")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class MedAdministration : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MedicationId = "MedicationId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MedAdministrationId = "MedAdministrationId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String MedAdminDateText = "MedAdminDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String MedAdminDate = "MedAdminDate";

        [DataType(typeof(System.String))]
        public static readonly String MedAdminType = "MedAdminType";

        [DataType(typeof(System.String))]
        public static readonly String MedAdminMedication = "MedAdminMedication";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String MedAdminStopDateText = "MedAdminStopDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String MedAdminStopDate = "MedAdminStopDate";

        [DataType(typeof(System.String))]
        public static readonly String MedAdminDose = "MedAdminDose";

        [DataType(typeof(System.String))]
        public static readonly String MedAdminTotalDose = "MedAdminTotalDose";

        [DataType(typeof(System.String))]
        public static readonly String MedAdminUnits = "MedAdminUnits";

        [DataType(typeof(System.String))]
        public static readonly String MedAdminRoute = "MedAdminRoute";

        [DataType(typeof(System.String))]
        public static readonly String MedAdminSchedule = "MedAdminSchedule";

        [DataType(typeof(System.String))]
        public static readonly String MedAdminIndication = "MedAdminIndication";

        [DataType(typeof(System.String))]
        public static readonly String MedAdminNotes = "MedAdminNotes";

        [DataType(typeof(System.String))]
        public static readonly String MedAdminDataSource = "MedAdminDataSource";

        [DataType(typeof(System.String))]
        public static readonly String MedAdminQuality = "MedAdminQuality";

    }
}
