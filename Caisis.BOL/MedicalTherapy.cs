using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MedicalTherapy")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class MedicalTherapy : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolId = "ProtocolId";

        [DataType(typeof(System.Int32))]
        public static readonly String OperatingRoomDetailId = "OperatingRoomDetailId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MedicalTherapyId = "MedicalTherapyId";

        [DataType(typeof(System.Byte))]
        public static readonly String MedTxPending = "MedTxPending";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String MedTxDateText = "MedTxDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String MedTxDate = "MedTxDate";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String MedTxType = "MedTxType";

        [DataType(typeof(System.String))]
        public static readonly String MedTxIndication = "MedTxIndication";

        [DataType(typeof(System.String))]
        public static readonly String MedTxIntent = "MedTxIntent";

        [DataType(typeof(System.String))]
        public static readonly String MedTxAgent = "MedTxAgent";

        [DataType(typeof(System.String))]
        public static readonly String MedTxDisease = "MedTxDisease"; // v 4.2

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String MedTxStopDateText = "MedTxStopDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String MedTxStopDate = "MedTxStopDate";

        [DataType(typeof(System.String))]
        public static readonly String MedTxDose = "MedTxDose";

        [DataType(typeof(System.String))]
        public static readonly String MedTxTotalDose = "MedTxTotalDose";

        [DataType(typeof(System.String))]
        public static readonly String MedTxUnits = "MedTxUnits";

        [DataType(typeof(System.String))]
        public static readonly String MedTxRoute = "MedTxRoute";

        [DataType(typeof(System.String))]
        public static readonly String MedTxSchedule = "MedTxSchedule";

        [DataType(typeof(System.String))]
        public static readonly String MedTxCycle = "MedTxCycle";

        [DataType(typeof(System.String))]
        public static readonly String MedTxWeek = "MedTxWeek";

        [DataType(typeof(System.String))]
        public static readonly String MedTxInstitution = "MedTxInstitution";

         /*
        [DataType(typeof(System.String))]
        public static readonly String MedTxStopReason = "MedTxStopReason";      // added 4/19/2010 for McGill Caisis release

        [DataType(typeof(System.String))]
        public static readonly String MedTxFormulation = "MedTxFormulation";    // added 4/19/2010 for McGill Caisis release

        [DataType(typeof(System.String))]
        public static readonly String MedTxPrescribedBy = "MedTxPrescribedBy";  // added 4/19/2010 for McGill Caisis release
        */

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String MedTxSite = "MedTxSite";

        [DataType(typeof(System.String))]
        public static readonly String MedTxNotes = "MedTxNotes";

        [DataType(typeof(System.String))]
        public static readonly String MedTxDataSource = "MedTxDataSource";

        [DataType(typeof(System.String))]
        public static readonly String MedTxQuality = "MedTxQuality";
    }
}
