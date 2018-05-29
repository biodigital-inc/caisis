using System;

namespace Caisis.BOL
{
    [Tablename("ProtocolMgr_Timeline")]
	[ParentTablename("ProtocolMgr_ProtocolSchemas")]
    [HasSiblings]
    [NoLock]
    public class Timeline : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String TimelineId = "TimelineId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProtocolSchemaId = "ProtocolSchemaId";

        [DataType(typeof(System.Int32))]
        public static readonly String DisplayColumnPosition = "DisplayColumnPosition";

        [DataType(typeof(System.String))]
        public static readonly String DisplayUnitName = "DisplayUnitName";

        [DataType(typeof(System.Int32))]
        public static readonly String NumberOfUnits = "NumberOfUnits";

        [DataType(typeof(System.String))]
        public static readonly String BufferUnitName = "BufferUnitName";

        [DataType(typeof(System.Int32))]
        public static readonly String BufferNumberOfUnitsPlus = "BufferNumberOfUnitsPlus";

        [DataType(typeof(System.Int32))]
        public static readonly String BufferNumberOfUnitsMinus = "BufferNumberOfUnitsMinus";

        [DataType(typeof(System.String))]
        public static readonly String VisitLabel = "VisitLabel";

        [DataType(typeof(System.String))]
        public static readonly String ItemIntervalType = "ItemIntervalType";

        [DataType(typeof(System.Byte))]
        public static readonly String PreStudySchemaItem = "PreStudySchemaItem";
    }
}
