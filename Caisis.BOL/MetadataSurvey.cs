using System;
using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("MetadataSurveys")]
    [NoLock]
    public class MetadataSurvey : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String MetadataSurveyId = "MetadataSurveyId";

        [DataType(typeof(System.String))]
        public static readonly String SurveyType = "SurveyType";

        [DataType(typeof(System.String))]
        public static readonly String SurveyCategory = "SurveyCategory";

        [DataType(typeof(System.String))]
        public static readonly String SendCondition = "SendCondition";

        [DataType(typeof(System.String))]
        public static readonly String VersionNumber = "VersionNumber";
    }
}
