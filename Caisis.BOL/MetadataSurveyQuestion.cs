using System;
using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataSurveyQuestions")]
    [ParentTablename("MetadataSurveys")]
    [NoLock]
    public class MetadataSurveyQuestion : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MetadataSurveyId = "MetadataSurveyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MetadataSurveyQuestionId = "MetadataSurveyQuestionId";

        [DataType(typeof(System.String))]
        public static readonly String QuestionNumber = "QuestionNumber";

        [DataType(typeof(System.Int32))]
        public static readonly String SortNumber = "SortNumber";

        [DataType(typeof(System.String))]
        public static readonly String Question = "Question";

        [DataType(typeof(System.String))]
        public static readonly String Page = "Page";

        [DataType(typeof(System.String))]
        public static readonly String Section = "Section";

        [DataType(typeof(System.String))]
        public static readonly String ResponseType = "ResponseType";

        [DataType(typeof(System.String))]
        public static readonly String ResponseRequired = "ResponseRequired";

        [DataType(typeof(System.String))]
        public static readonly String ResponseLayout = "ResponseLayout";

        [DataType(typeof(System.String))]
        public static readonly String ResponseControlType = "ResponseControlType";

        [DataType(typeof(System.String))]
        public static readonly String ReponseEligibilityCriteria = "ReponseEligibilityCriteria";
    }
}
