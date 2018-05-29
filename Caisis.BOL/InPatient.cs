using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("InPatients")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class InPatient : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String InPatientId = "InPatientId";

        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.String))]
        public static readonly String InPtMrn = "InPtMrn";

        [DataType(typeof(System.String))]
        public static readonly String InPtFirstName = "InPtFirstName";

        [DataType(typeof(System.String))]
        public static readonly String InPtLastName = "InPtLastName";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String InPtBirthDate = "InPtBirthDate";

        [DataType(typeof(System.String))]
        public static readonly String InPtAccountNum = "InPtAccountNum";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String InPtAdmitDate = "InPtAdmitDate";

        [DataType(typeof(System.String))]
        public static readonly String InPtAdmitReason = "InPtAdmitReason";

        [DataType(typeof(System.String))]
        public static readonly String InPtBedNum = "InPtBedNum";

        [DataType(typeof(System.String))]
        public static readonly String InPtService = "InPtService";

        [DataType(typeof(System.String))]
        public static readonly String InPtAdmitingPhysician = "InPtAdmitingPhysician";

        [DataType(typeof(System.String))]
        public static readonly String InPtAttendingPhysician = "InPtAttendingPhysician";

    }
}
