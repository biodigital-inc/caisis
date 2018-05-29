using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Comorbidities")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class Comorbidity : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ComorbidityId = "ComorbidityId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String ComorbDateText = "ComorbDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ComorbDate = "ComorbDate";

        [DataType(typeof(System.String))]
        public static readonly String ComorbSystem = "ComorbSystem";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Comorbidity_Field = "Comorbidity";

        [DataType(typeof(System.String))]
        public static readonly String ComorbICD9_Code = "ComorbICD9_Code";

        [DataType(typeof(System.String))]
        public static readonly String ComorbICD0_Code = "ComorbICD0_Code";

        [DataType(typeof(System.String))]
        public static readonly String ComorbTreatment = "ComorbTreatment";

        [DataType(typeof(System.String))] // v 5.5
        public static readonly String ComorbGrade = "ComorbGrade";

        [DataType(typeof(System.String))] // v 5.5
        public static readonly String ComorbStatus = "ComorbStatus";

        [DataType(typeof(System.String))] // v 5.5
        public static readonly String ComorbDuration = "ComorbDuration";

        [DataType(typeof(System.String))]
        public static readonly String ComorbNotes = "ComorbNotes";

        [DataType(typeof(System.String))]
        public static readonly String ComorbDataSource = "ComorbDataSource";

        [DataType(typeof(System.String))]
        public static readonly String ComorbQuality = "ComorbQuality";

        // v6.x
        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String ComorbStopDateText = "ComorbStopDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ComorbStopDate = "ComorbStopDate";
    }
}
