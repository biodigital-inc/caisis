using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("DietaryIntakeItems")]
    [ParentTablename("DietaryIntake")]
    [Disease("All")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class DietaryIntakeItem : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DietaryIntakeId = "DietaryIntakeId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DietaryIntakeItemId = "DietaryIntakeItemId";

        [DataType(typeof(System.String))]
        public static readonly String IntakeType = "IntakeType";

        [DataType(typeof(System.String))]
        public static readonly String IntakeItem = "IntakeItem";

        [DataType(typeof(System.String))]
        public static readonly String IntakeServing = "IntakeServing";

        [DataType(typeof(System.String))]
        public static readonly String IntakeServingNum = "IntakeServingNum";

        [DataType(typeof(System.String))]
        public static readonly String IntakeUnits = "IntakeUnits";

        [DataType(typeof(System.String))]
        public static readonly String IntakeSchedule = "IntakeSchedule";

        [DataType(typeof(System.String))]
        public static readonly String IntakeTotalServingAmount = "IntakeTotalServingAmount";

        [DataType(typeof(System.String))]
        public static readonly String IntakeNotes = "IntakeNotes";

    }
}
