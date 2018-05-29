using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Appointments")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class Appointment : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String AppointmentId = "AppointmentId";

        [DataType(typeof(System.Int32))]
        public static readonly String ApptPatientId = "ApptPatientId";

        [DataType(typeof(System.String))]
        public static readonly String ApptMRN = "ApptMRN";

        [DataType(typeof(System.DateTime))]
        public static readonly String ApptTime = "ApptTime";

        [DataType(typeof(System.String))]
        public static readonly String ApptLastName = "ApptLastName";

        [DataType(typeof(System.String))]
        public static readonly String ApptFirstName = "ApptFirstName";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ApptBirthDate = "ApptBirthDate";

        [DataType(typeof(System.String))]
        public static readonly String ApptPhysician = "ApptPhysician";

        [DataType(typeof(System.String))]
        public static readonly String ApptVisitType = "ApptVisitType";

        [DataType(typeof(System.String))]
        public static readonly String ApptDept = "ApptDept";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ApptClinicDate = "ApptClinicDate";

        [DataType(typeof(System.String))]
        public static readonly String ApptNotes = "ApptNotes";

        [DataType(typeof(System.String))]
        public static readonly String ApptICD_Code = "ApptICD_Code";

        [DataType(typeof(System.String))]
        public static readonly String ApptICD_CodeDescription = "ApptICD_CodeDescription";

        [DataType(typeof(System.String))]
        public static readonly String ApptHide = "ApptHide";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String ApptStatus = "ApptStatus";
    }
}
