using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("FamilyMemberDiagnosis")]
    [ParentTablename("FamilyMembers")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class FamilyMemberDiagnosis : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String FamilyMemberId = "FamilyMemberId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String FamilyMemberDiagnosisId = "FamilyMemberDiagnosisId";

        [DataType(typeof(System.String))]
        public static readonly String FamMemDiagnosis = "FamMemDiagnosis";

        [DataType(typeof(System.String))]
        public static readonly String FamMemDiagnosisAge = "FamMemDiagnosisAge";

        [DataType(typeof(System.String))]
        public static readonly String FamMemNotes = "FamMemNotes";

    }
}
