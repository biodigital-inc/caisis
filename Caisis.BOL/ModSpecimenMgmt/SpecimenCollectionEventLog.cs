using System;

namespace Caisis.BOL
{
    [Tablename("SpecimenCollectionEventLog")]
    public class SpecimenCollectionEventLog : BusinessObject
    {
        [DataType(typeof(System.Int32))]
        public static readonly String CollectionId = "CollectionId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String CollectionEventId = "CollectionEventId";

        [DataType(typeof(System.String))]
        public static readonly String EventPending = "EventPending";

        [DataType(typeof(System.String))]
        public static readonly String EventDateText = "EventDateText";

        [DataType(typeof(System.DateTime))]
        public static readonly String EventTime = "EventTime";

        [DataType(typeof(System.String))]
        public static readonly String EventType = "EventType";

        [DataType(typeof(System.String))]
        public static readonly String EventResult = "EventResult";

        [DataType(typeof(System.String))]
        public static readonly String EventQtyUsed = "EventQtyUsed";

        [DataType(typeof(System.String))]
        public static readonly String EventQtyUsedUnits = "EventQtyUsedUnits";

    }
}
