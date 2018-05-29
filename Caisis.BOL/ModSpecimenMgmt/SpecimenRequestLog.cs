using System;

namespace Caisis.BOL
{
    [Tablename("SpecimenRequestLog")]
    public class SpecimenRequestLog : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String LogId = "LogId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String SpecimenId = "SpecimenId";

        [DataType(typeof(System.Int32))]
        public static readonly String RequestId = "RequestId";

        [DataType(typeof(System.Int32))]
        public static readonly String IsFreezerAllocated = "IsFreezerAllocated";

        [DataType(typeof(System.Int32))]
        public static readonly String IsShelfAllocated = "IsShelfAllocated";

        [DataType(typeof(System.Int32))]
        public static readonly String IsBoxAllocated = "IsBoxAllocated";

        [DataType(typeof(System.Int32))]
        public static readonly String IsPositionAllocated = "IsPositionAllocated";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";

    }
}
