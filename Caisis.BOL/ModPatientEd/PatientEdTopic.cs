using System;

namespace Caisis.BOL
{
    [Tablename("PatientEdTopic")]

    public class PatientEdTopic : BusinessObject
    {
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SectionId = "SectionId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String TopicId = "TopicId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String TopicName = "TopicName";

        [DataType(typeof(System.String))]
        public static readonly String TopicDescription = "TopicDescription";

        [DataType(typeof(System.String))]
        public static readonly String OrderNumber = "OrderNumber";
    }
}
