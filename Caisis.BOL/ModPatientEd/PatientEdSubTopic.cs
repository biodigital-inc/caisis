using System;

namespace Caisis.BOL
{
    [Tablename("PatientEdSubTopic")]

    public class PatientEdSubTopic : BusinessObject
    {
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String TopicId = "TopicId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SubTopicId = "SubTopicId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String SubTopicName = "SubTopicName";

        [DataType(typeof(System.String))]
        public static readonly String SubTopicContent = "SubTopicContent";

        [DataType(typeof(System.String))]
        public static readonly String ImageGraphicPath = "ImagePath";

        [DataType(typeof(System.Double))]
        public static readonly String SubTopicVersionNumber = "VersionNumber";

        [DataType(typeof(System.String))]
        public static readonly String SequenceNumber = "OrderNumber";
    }
}
