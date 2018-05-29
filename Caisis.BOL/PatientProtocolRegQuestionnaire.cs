using System;
using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PatientProtocolRegQuestionnaires")]
    [ParentTablename("PatientProtocolRegistration")]
    [Disease("All")]
    [NoLock]
    public class PatientProtocolRegQuestionnaire : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientProtocolRegistrationId = "PatientProtocolRegistrationId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientProtocolRegQuestionnaireId = "PatientProtocolRegQuestionnaireId";

        [DataType(typeof(System.String))]
        public static readonly String QuestionNum = "QuestionNum";

        [DataType(typeof(System.String))]
        public static readonly String Question = "Question";

        [DataType(typeof(System.String))]
        public static readonly String Response = "Response";

        [DataType(typeof(System.Byte))]
        public static readonly String IneligibleResponseOverride = "IneligibleResponseOverride";

        [DataType(typeof(System.String))]
        public static readonly String IneligibleOverrideReason = "IneligibleOverrideReason";
    }
}
