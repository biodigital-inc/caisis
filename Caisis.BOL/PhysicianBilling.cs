using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PhysicianBilling")]
    [ParentTablename("OperatingRoomDetails")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class PhysicianBilling : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String OperatingRoomDetailId = "OperatingRoomDetailId";

        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PhysicianBillingId = "PhysicianBillingId";

        [DataType(typeof(System.String))]
        public static readonly String PhysBillIDX_Code = "PhysBillIDX_Code";

        [DataType(typeof(System.String))]
        public static readonly String PhysBillIDX_Description = "PhysBillIDX_Description";

        [DataType(typeof(System.String))]
        public static readonly String PhysBillIDX_Notes = "PhysBillIDX_Notes";

    }
}
