using System;

namespace Caisis.BOL
{
    [Tablename("SpecimenPositions")]
    [ParentTablename("SpecimenBoxes")]
    [HasSiblings]
    public class SpecimenPosition : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PositionId = "PositionId";

        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String BoxId = "BoxId";

       
        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Position = "Position";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String PositionStatus = "PositionStatus";

    }
}
