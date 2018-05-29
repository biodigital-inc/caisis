using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MedTxAdministration")]
    [ParentTablename("MedicalTherapy")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class MedTxAdministration : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MedicalTherapyId = "MedicalTherapyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MedTxAdministrationId = "MedTxAdministrationId";
 
        [DataType(typeof(System.Byte))]
        public static readonly String MedTxAdminPending = "MedTxAdminPending";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String MedTxAdminStartDateText = "MedTxAdminStartDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String MedTxAdminStartDate = "MedTxAdminStartDate";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String MedTxAdminStopDateText = "MedTxAdminStopDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String MedTxAdminStopDate = "MedTxAdminStopDate";


        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminAgent = "MedTxAdminAgent";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminType = "MedTxAdminType";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminDose = "MedTxAdminDose";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminTotalDose = "MedTxAdminTotalDose";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminUnits = "MedTxAdminUnits";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminRoute = "MedTxAdminRoute";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminSchedule = "MedTxAdminSchedule";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminCycle = "MedTxAdminCycle";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminWeek = "MedTxAdminWeek";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminBy = "MedTxAdminBy";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminInstitution = "MedTxAdminInstitution";

        [DataType(typeof(System.String))]
        public static readonly String MedTxLotNumber = "MedTxLotNumber";

        [DataType(typeof(System.String))]
        public static readonly String MedTxLotExpirationDateText = "MedTxLotExpirationDateText";

        [DataType(typeof(System.DateTime))]
        public static readonly String MedTxLotExpirationDate = "MedTxLotExpirationDate";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAdminNotes = "MedTxAdminNotes";

    }
}
