using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProtocolMgr_PatientResponse")]
    [ParentTablename("PatientProtocols")]
    [Disease("All")]
    public class PatientProtocolResponse : BusinessObject
    {
        [NotNull]
        [DataType(typeof(System.Int32))]
        [ForeignKey]
        public static readonly String PatientProtocolId = "PatientProtocolId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientResponseId = "PatientResponseId";

        [DataType(typeof(System.DateTime))]
        public static readonly String ResponseDate = "ResponseDate";

        [DataType(typeof(System.String))]
        public static readonly String ResponseDateText = "ResponseDateText";

        [DataType(typeof(System.String))]
        public static readonly String ResponseType = "ResponseType";

        [DataType(typeof(System.String))]
        public static readonly String ResponseCriteria = "ResponseCriteria";
        
        [DataType(typeof(System.String))]
        public static readonly String Response = "Response";

        [DataType(typeof(System.String))]
        public static readonly String ResponseNotes = "ResponseNotes";
     }
}
