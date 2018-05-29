using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Identifiers")]
    [ParentTablename("Patients")]
    [Disease("Identified")]
    [Exportable]
    [HasSiblings]
    public class Identifier : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String IdentifierId = "IdentifierId";

        [NotNull]
        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String IdType = "IdType";

        [NotNull]
        [UniqueConstraint]
        [DataType(typeof(System.String))]
        public static readonly String Identifier_Field = "Identifier";

    }
}
