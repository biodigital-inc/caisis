using System;
using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("SurgeryAppointment")]
    [NoLock]
    [NoUpdate]
    public class SurgeryAppointment : BusinessObject
    {
        [NotNull]
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SurgeryAppointmentId = "SurgeryAppointmentId";

        [DataType(typeof(System.Int32))]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.String))]
        public static readonly String ApptMRN = "ApptMRN";

        [DataType(typeof(System.String))]
        public static readonly String ApptFirstName = "ApptFirstName";

        [DataType(typeof(System.String))]
        public static readonly String ApptLastName = "ApptLastName";

        [DataType(typeof(System.String))]
        public static readonly String ApptCaseSurgeon = "ApptCaseSurgeon";

        [DataType(typeof(System.String))]
        public static readonly String ApptEform = "ApptEform";

        [DataType(typeof(System.String))]
        public static readonly String ApptSurgeonEmail = "ApptSurgeonEmail";

        [DataType(typeof(System.DateTime))]
        public static readonly String ApptSurgeryDate = "ApptSurgeryDate";

        [DataType(typeof(System.String))]
        public static readonly String ApptCPT_Code = "ApptCPT_Code";

        [DataType(typeof(System.String))]
        public static readonly String ApptCPT_Description = "ApptCPT_Description";

        [DataType(typeof(System.DateTime))]
        public static readonly String LastNotificationSent = "LastNotificationSent";
    }
}
