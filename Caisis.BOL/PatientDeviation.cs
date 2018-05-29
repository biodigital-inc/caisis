using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProtocolMgr_PatientDeviations")]
    [ParentTablename("ProtocolMgr_PatientItems")]
    [HasSiblings]
    [NoLock]
    public class PatientDeviation : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientDeviationId = "PatientDeviationId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientItemId = "PatientItemId";

        [DataType(typeof(System.String))]
        public static readonly String DeviationType = "DeviationType";

        [DataType(typeof(System.String))]
        public static readonly String DeviationDescription = "DeviationDescription";

        [DataType(typeof(System.String))]
        public static readonly String DeviationReason = "DeviationReason";

        [DataType(typeof(System.String))]
        public static readonly String DeviationScheduleChange = "DeviationScheduleChange";

        [DataType(typeof(System.DateTime))]
        public static readonly String DeviationDateReportedIRB = "DeviationDateReportedIRB";

        [DataType(typeof(System.DateTime))]
        public static readonly String DeviationDateReportedSponsor = "DeviationDateReportedSponsor";

        [DataType(typeof(System.DateTime))]
        public static readonly String DeviationDateReportedFDA = "DeviationDateReportedFDA";

        [DataType(typeof(System.String))]
        public static readonly String DeviationNotes = "DeviationNotes";

    }
}