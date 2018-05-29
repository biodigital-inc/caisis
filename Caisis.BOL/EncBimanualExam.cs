using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("EncBimanualExams")]
    [ParentTablename("Encounters")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class EncBimanualExam : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncounterId = "EncounterId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String EncBimanualExamId = "EncBimanualExamId";

        [DataType(typeof(System.String))]
        public static readonly String BimanualResult = "BimanualResult";

        [DataType(typeof(System.String))]
        public static readonly String BimanualSide = "BimanualSide";

        [DataType(typeof(System.String))]
        public static readonly String BimanualHeight = "BimanualHeight";

        [DataType(typeof(System.String))]
        public static readonly String BimanualWidth = "BimanualWidth";

        [DataType(typeof(System.String))]
        public static readonly String BimanualLength = "BimanualLength";

        [DataType(typeof(System.String))]
        public static readonly String BimanualVaginaInv = "BimanualVaginaInv";

        [DataType(typeof(System.String))]
        public static readonly String BimanualUrethraInv = "BimanualUrethraInv";

        [DataType(typeof(System.String))]
        public static readonly String BimanualRectumInv = "BimanualRectumInv";

        [DataType(typeof(System.String))]
        public static readonly String BimanualL_SidewallInv = "BimanualL_SidewallInv";

        [DataType(typeof(System.String))]
        public static readonly String BimanualR_SidewallInv = "BimanualR_SidewallInv";

        [DataType(typeof(System.String))]
        public static readonly String BimanualCervixInv = "BimanualCervixInv";

    }
}
