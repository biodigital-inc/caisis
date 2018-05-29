using System;

namespace Caisis.BOL
{
    [Tablename("PatientEdSection")]

    public class PatientEdSection : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SectionId = "SectionId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String SectionName = "SectionName";

        [DataType(typeof(System.String))]
        public static readonly String SectionDescription = "SectionDescription";

        [DataType(typeof(System.String))]
        public static readonly String OrderNumber = "OrderNumber";
    }
}
