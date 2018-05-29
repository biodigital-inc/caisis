using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("SurveyItems")]
    [ParentTablename("Surveys")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class SurveyItem : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SurveyId = "SurveyId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SurveyItemId = "SurveyItemId";

        [DataType(typeof(System.String))]
        public static readonly String SurveyItemNum = "SurveyItemNum";

        [DataType(typeof(System.String))]
        public static readonly String SurveyItem_Field = "SurveyItem";

        [DataType(typeof(System.String))]
        public static readonly String SurveyItemResult = "SurveyItemResult";

        [DataType(typeof(System.String))]
        public static readonly String SurveyItemTotal = "SurveyItemTotal";

        [DataType(typeof(System.String))]
        public static readonly String SurveyItemNotes = "SurveyItemNotes";

    }
}
