using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Surveys")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Survey : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SurveyId = "SurveyId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String SurveyDateText = "SurveyDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String SurveyDate = "SurveyDate";

        [DataType(typeof(System.String))]
        public static readonly String SurveyType = "SurveyType";

        [DataType(typeof(System.String))]
        public static readonly String SurveyResult = "SurveyResult";

        [DataType(typeof(System.String))]
        public static readonly String SurveyTotal = "SurveyTotal";

        [DataType(typeof(System.String))]
        public static readonly String SurveyVersion = "SurveyVersion";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String SurveyStatus = "SurveyStatus";

        [DataType(typeof(System.String))]
        public static readonly String SurveyNotes = "SurveyNotes";

        [DataType(typeof(System.String))]
        public static readonly String SurveyDataSource = "SurveyDataSource";

        [DataType(typeof(System.String))]
        public static readonly String SurveyQuality = "SurveyQuality";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String SurveyClinician = "SurveyClinician";
    }
}
