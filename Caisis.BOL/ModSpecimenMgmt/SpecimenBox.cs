using System;

namespace Caisis.BOL
{
    [Tablename("SpecimenBoxes")]
    [ParentTablename("SpecimenContainers")]
    [HasSiblings]
    public class SpecimenBox : BusinessObject
    {
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContainerId = "ContainerId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String BoxId = "BoxId";

        [DataType(typeof(System.String))]
        public static readonly String BoxName = "BoxName";

        [DataType(typeof(System.String))]
        public static readonly String BoxType = "BoxType";

        [DataType(typeof(System.String))]
        public static readonly String BoxStatus = "BoxStatus";

        [DataType(typeof(System.Int32))]
        public static readonly String NoOfColumns = "NoOfColumns";

        [DataType(typeof(System.Int32))]
        public static readonly String NoOfRows = "NoOfRows";

        [DataType(typeof(System.Int32))]
        public static readonly String MaxPositionNo = "MaxPositionNo";

        [DataType(typeof(System.Int32))]
        public static readonly String CurPositionNo = "CurPositionNo";

    }
}
