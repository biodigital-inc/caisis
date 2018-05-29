using System;

namespace Caisis.BOL
{
    [Tablename("SpecimenRequests")]
    [HasSiblings] //does it?
    public class SpecimenRequest : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SpecimenRequestId = "SpecimenRequestId";

        [DataType(typeof(System.String))]
        public static readonly String RequestIdentifier = "RequestIdentifier";

        [DataType(typeof(System.DateTime))]
        public static readonly String RequestDate = "RequestDate";

        [DataType(typeof(System.String))]
        public static readonly String RequestType = "RequestType";

        [DataType(typeof(System.String))]
        public static readonly String RequestGenInstitution = "RequestGenInstitution";

        [DataType(typeof(System.String))]
        public static readonly String RequestGenContactName = "RequestGenContactName";

        [DataType(typeof(System.String))]
        public static readonly String RequestRecInstitution = "RequestRecInstitution";

        [DataType(typeof(System.String))]
        public static readonly String RequestRecContactName = "RequestRecContactName";

        [DataType(typeof(System.String))]
        public static readonly String RequestRecContactInfo = "RequestRecContactInfo";

        [DataType(typeof(System.String))]
        public static readonly String RequestProject = "RequestProject";

        [DataType(typeof(System.String))]
        public static readonly String RequestStatus = "RequestStatus";

        [DataType(typeof(System.String))]
        public static readonly String RequestNotes = "RequestNotes";
    }
}
