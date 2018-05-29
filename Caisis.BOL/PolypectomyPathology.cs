using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PolypectomyPath")]
    [ParentTablename("Pathology")]
    [Disease("Colorectal")]
    [Exportable]
    [NoLock]
    public class PolypectomyPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathConfiguration = "PathConfiguration";

        [DataType(typeof(System.String))]
        public static readonly String PathPolypMaxDim = "PathPolypMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathPerineuralInv = "PathPerineuralInv";

        [DataType(typeof(System.String))]
        public static readonly String PathStalkMargin = "PathStalkMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathLateralMargin = "PathLateralMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathLateralMarginSize = "PathLateralMarginSize";

        [DataType(typeof(System.String))]
        public static readonly String PathDeepMargin = "PathDeepMargin";

        [DataType(typeof(System.String))]
        public static readonly String PathDeepMarginSize = "PathDeepMarginSize";

    }
}
