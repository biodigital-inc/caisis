using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DiseaseAttributes")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class DiseaseAttribute_Table : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiseaseAttributeId = "DiseaseAttributeId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String DiseaseAttributeName = "DiseaseAttributeName";

    }
}
