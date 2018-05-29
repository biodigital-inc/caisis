using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("EncNodeExamFinding")]
    [ParentTablename("Encounters")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class EncNodeExamFinding : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncounterId = "EncounterId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncNodeExamFindingId = "EncNodeExamFindingId";

        [DataType(typeof(System.String))]
        public static readonly String ExamFindSide = "ExamFindSide";

        [DataType(typeof(System.String))]
        public static readonly String ExamFindSite = "ExamFindSite";

        [DataType(typeof(System.String))]
        public static readonly String ExamFindMaxDim = "ExamFindMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String ExamFindExtension = "ExamFindExtension";

        [DataType(typeof(System.String))]
        public static readonly String ExamFindResult = "ExamFindResult";

    }
}
