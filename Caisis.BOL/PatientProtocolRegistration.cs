using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PatientProtocolRegistration")]
    [ParentTablename("PatientProtocols")]
    [Disease("All")]
    [NoLock]
    public class PatientProtocolRegistration : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientProtocolId = "PatientProtocolId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientProtocolRegistrationId = "PatientProtocolRegistrationId";

        [DataType(typeof(System.String))]
        public static readonly String ConsentedBy = "ConsentedBy";

        [DataType(typeof(System.String))]
        public static readonly String ConsentedTo = "ConsentedTo";

        [DataType(typeof(System.String))]
        public static readonly String RegisteredBy = "RegisteredBy";

        [DataType(typeof(System.String))]
        public static readonly String PhysicianOfRecord = "PhysicianOfRecord";

        [DataType(typeof(System.String))]
        public static readonly String ResearchAuthorizationSigned = "ResearchAuthorizationSigned";

        [DataType(typeof(System.String))]
        public static readonly String PrivacyPracticeNoticeVerified = "PrivacyPracticeNoticeVerified";
        
        // v6.1
        [DataType(typeof(System.String))]
        public static readonly String PtRegistrationAge = "PtRegistrationAge";
     
    
    }
}
