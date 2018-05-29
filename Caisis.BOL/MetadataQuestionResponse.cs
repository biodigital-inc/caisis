using System;
using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataQuestionResponses")]
    [ParentTablename("MetadataSurveyQuestions")]
    [NoLock]
    public class MetadataQuestionResponse : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MetadataSurveyQuestionId = "MetadataSurveyQuestionId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MetadataQuestionResponseId = "MetadataQuestionResponseId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String ResponseText = "ResponseText";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String ResponseValue = "ResponseValue";

    }
}
