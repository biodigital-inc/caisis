using System;

namespace Caisis.BOL
{
    [Tablename("SpecimenEvents")]
    [ParentTablename("Specimens")]
    [HasSiblings]
    [Exportable]
    public class SpecimenEvents : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SpecimenId = "SpecimenId";

        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SpecimenEventId = "SpecimenEventId";

        [DataType(typeof(System.Byte))]
        public static readonly String EventPending = "EventPending";

        [DataType(typeof(System.String))]
        public static readonly String EventDateText = "EventDateText";

        [DataType(typeof(System.DateTime))]
        public static readonly String EventDate = "EventDate";

        [DataType(typeof(System.String))]
        public static readonly String EventTime = "EventTime";

        [DataType(typeof(System.String))]
        public static readonly String EventType = "EventType";

        [DataType(typeof(System.String))]
        public static readonly String EventSubType = "EventSubType";

        [DataType(typeof(System.String))]
        public static readonly String EventAnalyte = "EventAnalyte";

        [DataType(typeof(System.String))]
        public static readonly String EventResult = "EventResult";

        [DataType(typeof(System.String))]
        public static readonly String ProcessedBy = "ProcessedBy";

        [DataType(typeof(System.String))]
        public static readonly String QuantityUsed = "QuantityUsed";

        [DataType(typeof(System.String))]
        public static readonly String QuantityUnits = "QuantityUnits";

        [DataType(typeof(System.String))]
        public static readonly String EventExtReference = "EventExtReference";

        // v6.1
        [DataType(typeof(System.String))]
        public static readonly String ResultsReceivedDateText = "ResultsReceivedDateText";

        // v6.1
        [DataType(typeof(System.DateTime))]
        public static readonly String ResultsReceivedDate = "ResultsReceivedDate";

        [DataType(typeof(System.String))]
        public static readonly String EventNotes = "EventNotes";

    }
}
