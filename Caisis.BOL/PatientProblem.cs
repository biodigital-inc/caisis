using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PatientProblems")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class PatientProblem : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientProblemId = "PatientProblemId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String ProblemName = "ProblemName";

        [DataType(typeof(System.String))]
        public static readonly String ProblemStatus = "ProblemStatus";

        [DataType(typeof(System.String))]
        public static readonly String ProblemNotes = "ProblemNotes";

        [DataType(typeof(System.String))]
        public static readonly String ProblemICD_Code = "ProblemICD_Code";

        [DataType(typeof(System.String))]
        public static readonly String ProblemICD_Description = "ProblemICD_Description";

        // v 6.0
        [DataType(typeof(System.String))]
        public static readonly String ProblemDateText = "ProblemDateText";

        [DataType(typeof(System.DateTime))]
        public static readonly String ProblemDate = "ProblemDate";

        [DataType(typeof(System.String))]
        public static readonly String ProblemResolvedDateText = "ProblemResolvedDateText";

        [DataType(typeof(System.DateTime))]
        public static readonly String ProblemResolvedDate = "ProblemResolvedDate";


    }
}
