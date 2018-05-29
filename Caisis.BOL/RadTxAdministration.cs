using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("RadTxAdministration")]
    [ParentTablename("RadiationTherapy")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class RadTxAdministration : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String RadiationTherapyId = "RadiationTherapyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String RadTxAdministrationId = "RadTxAdministrationId";

        [DataType(typeof(System.Byte))]
        public static readonly String RadTxAdminPending = "RadTxAdminPending";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String RadTxAdminStartDateText = "RadTxAdminStartDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String RadTxAdminStartDate = "RadTxAdminStartDate";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String RadTxAdminStopDateText = "RadTxAdminStopDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String RadTxAdminStopDate = "RadTxAdminStopDate";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminType = "RadTxAdminType";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminTarget = "RadTxAdminTarget";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminDosePerFraction = "RadTxAdminDosePerFraction";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminTotalDose = "RadTxAdminTotalDose";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminUnits = "RadTxAdminUnits";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminIsotope = "RadTxAdminIsotope";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminNumFractions = "RadTxAdminNumFractions";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminNumFields = "RadTxAdminNumFields";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminSchedule = "RadTxAdminSchedule";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminBy = "RadTxAdminBy";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminInstitution = "RadTxAdminInstitution";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminIndication = "RadTxAdminIndication";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminIntent = "RadTxAdminIntent";

        [DataType(typeof(System.String))]
        public static readonly String RadTxAdminNotes = "RadTxAdminNotes";
    }
}
