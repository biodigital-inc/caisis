using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Hospitalizations")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Hospitalization : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId"; 

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String HospitalizationId = "HospitalizationId";

        [LookupKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolId = "ProtocolId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String HospAdmitDateText = "HospAdmitDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String HospAdmitDate = "HospAdmitDate";

        [DataType(typeof(System.String))]
        public static readonly String HospAdmitReason = "HospAdmitReason";

        [DataType(typeof(System.String))]
        public static readonly String HospInstitution = "HospInstitution";

        [DataType(typeof(System.String))]
        public static readonly String HospDepartment = "HospDepartment";

        [DataType(typeof(System.String))]
        public static readonly String HospFloor = "HospFloor";

        [DataType(typeof(System.String))]
        public static readonly String HospRoom = "HospRoom";

        [DataType(typeof(System.String))]
        public static readonly String HospICUStay = "HospICUStay";

        [DataType(typeof(System.String))]
        public static readonly String HospAdmitPhysician = "HospAdmitPhysician";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String HospDischargeDateText = "HospDischargeDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String HospDischargeDate = "HospDischargeDate";

        [DataType(typeof(System.String))]
        public static readonly String HospDischargeStatus = "HospDischargeStatus";

        [DataType(typeof(System.String))]
        public static readonly String HospLivingArrangmentPre = "HospLivingArrangmentPre";

        [DataType(typeof(System.String))]
        public static readonly String HospLivingArrangmentPost = "HospLivingArrangmentPost";

        [DataType(typeof(System.String))]
        public static readonly String HospAmbulationPre = "HospAmbulationPre";

        [DataType(typeof(System.String))]
        public static readonly String HospAmbulationPost = "HospAmbulationPost";

        [DataType(typeof(System.String))]
        public static readonly String HospNotes = "HospNotes";

        [DataType(typeof(System.String))]
        public static readonly String HospDataSource = "HospDataSource";

        [DataType(typeof(System.String))]
        public static readonly String HospDataQuality = "HospDataQuality";
    }
}
