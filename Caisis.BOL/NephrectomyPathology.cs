using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("NephrectomyPath")]
    [ParentTablename("Pathology")]
    [Disease("Kidney")]
    [Exportable]
    [NoLock]
    public class NephrectomyPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathExtension = "PathExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathMargin = "PathMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathAdrenalInv = "PathAdrenalInv";

        [DataType(typeof(System.String))]
        public static readonly String PathAdrenalSide = "PathAdrenalSide";

        [DataType(typeof(System.String))]
        public static readonly String PathMultifocal = "PathMultifocal";

        [DataType(typeof(System.String))]
        public static readonly String PathNuclearGrade = "PathNuclearGrade";

        [DataType(typeof(System.String))]
        public static readonly String PathPattern = "PathPattern";

        [DataType(typeof(System.String))]
        public static readonly String PathCancerMaxDim = "PathCancerMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathOtherKidney = "PathOtherKidney";

        [DataType(typeof(System.String))]
        public static readonly String PathAngiolymphaticInv = "PathAngiolymphaticInv";

        [DataType(typeof(System.String))]
        public static readonly String PathRenalSinusFatInv = "PathRenalSinusFatInv";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String PathMarginClearance = "PathMarginClearance";
    }
}
