using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DiseaseAttributeValues")]
    [ParentTablename("DiseaseAttributes")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class DiseaseAttributeValue : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        public static readonly String DiseaseId = "DiseaseId";

        [NotNull]
        [ForeignKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        public static readonly String DiseaseAttributeId = "DiseaseAttributeId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiseaseAttributeValueId = "DiseaseAttributeValueId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String DiseaseAttributeValue_Field = "DiseaseAttributeValue";

    }
}