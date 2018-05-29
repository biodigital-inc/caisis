using System;

namespace Caisis.BOL
{
    [Tablename("SpecimenDistributions")]
    [HasSiblings]  //does it?
    public class SpecimenDistribution : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DistributionId = "DistributionId";

        [DataType(typeof(System.Int32))]
        public static readonly String SpecimenRequestId = "SpecimenRequestId";

        [DataType(typeof(System.String))]
        public static readonly String DispatchedBy = "DispatchedBy";

        [DataType(typeof(System.DateTime))]
        public static readonly String DispatchedDate = "DispatchedDate";

        [DataType(typeof(System.String))]
        public static readonly String DispatchedTime = "DispatchedTime";

        [DataType(typeof(System.String))]
        public static readonly String DispatchedInstitution = "DispatchedInstitution";

        [DataType(typeof(System.String))]
        public static readonly String DispatchedContact = "DispatchedContact";

        [DataType(typeof(System.String))]
        public static readonly String DispatchedContainer = "DispatchedContainer";

        [DataType(typeof(System.String))]
        public static readonly String DispatchedLoggerN = "DispatchedLoggerNumber";

        [DataType(typeof(System.String))]
        public static readonly String DispatchedMethod = "DispatchedMethod";

        [DataType(typeof(System.String))]
        public static readonly String DispatchedTrackingN = "DispatchedTrackingNumber";

        [DataType(typeof(System.String))]
        public static readonly String DispatchedNotes = "DispatchedNotes";

        [DataType(typeof(System.DateTime))]
        public static readonly String ReceivedDate = "ReceivedDate";

        [DataType(typeof(System.String))]
        public static readonly String ReceivedTime = "ReceivedTime";

        [DataType(typeof(System.String))]
        public static readonly String ReceivedInstitution = "ReceivedInstitution";

        [DataType(typeof(System.String))]
        public static readonly String ReceivedContact = "ReceivedContact";

        [DataType(typeof(System.String))]
        public static readonly String ReceivedIntegrity = "ReceivedIntegrity";

        [DataType(typeof(System.String))]
        public static readonly String ReceivedNotes = "ReceivedNotes";

    }
}
