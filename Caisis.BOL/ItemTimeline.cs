using System;

namespace Caisis.BOL
{
    [Tablename("ProtocolMgr_ItemTimeline")]
	[ParentTablename("ProtocolMgr_SchemaItems")]
    [HasSiblings]
	[NoLock]
    public class ItemTimeline : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ItemTimelineId = "ItemTimelineId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String TimelineId = "TimelineId";

        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SchemaItemId = "SchemaItemId";

    }
}
