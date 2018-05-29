using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("EncExams")]
    [ParentTablename("Encounters")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class EncExam : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        public static readonly String EncounterId = "EncounterId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncExamId = "EncExamId";

        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String ExamSystem = "ExamSystem";

        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String Exam = "Exam";

        [DataType(typeof(System.String))]
        public static readonly String ExamResult = "ExamResult";

        [DataType(typeof(System.Byte))]
        public static readonly String ExamAttendingPerformed = "ExamAttendingPerformed";

        [DataType(typeof(System.String))]
        public static readonly String ExamNotes = "ExamNotes";

    }
}
