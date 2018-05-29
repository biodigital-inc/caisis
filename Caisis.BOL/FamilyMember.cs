using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("FamilyMembers")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    public class FamilyMember : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String FamilyMemberId = "FamilyMemberId";

        [DataType(typeof(System.String))]
        public static readonly String FamMemNum = "FamMemNum";

        [DataType(typeof(System.String))]
        public static readonly String FamMemSide = "FamMemSide";

        [DataType(typeof(System.String))]
        public static readonly String FamMemRelation = "FamMemRelation";

        [DataType(typeof(System.String))]
        public static readonly String FamMemDeathAge = "FamMemDeathAge";

    }
}
