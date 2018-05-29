using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Categories")]
    [ParentTablename("Patients")]
    [Disease("Identified")]
    [HasSiblings]
    public class Category : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [UniqueConstraint]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String CategoryId = "CategoryId";

        [NotNull]
        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String Category_Field = "Category";

        [NotNull]
        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String CategoryType = "CategoryType";

    }
}
