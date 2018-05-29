using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ProblemPlans")]
    [ParentTablename("PatientProblems")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class ProblemPlan : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientProblemId = "PatientProblemId";

        [DataType(typeof(System.Int32))]
        public static readonly String EncounterId = "EncounterId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProblemPlanId = "ProblemPlanId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String PlanName = "PlanName";

        [DataType(typeof(System.String))]
        public static readonly String PlanStatus = "PlanStatus";

        [DataType(typeof(System.String))]
        public static readonly String PlanType = "PlanType";

        [DataType(typeof(System.String))]
        public static readonly String PlanNotes = "PlanNotes";

    }
}
