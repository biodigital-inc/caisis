using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PlasticFreeFlapProc")]
    [ParentTablename("Procedures")]
    [Disease("Plastics")]
    [Exportable]
    [HasSiblings]
    [NoLock]
    public class PlasticFreeFlapProcedure : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProcedureId = "ProcedureId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PlasticFreeFlapProcId = "PlasticFreeFlapProcId";

        [DataType(typeof(System.String))]
        public static readonly String ProcDonorSite = "ProcDonorSite";

        [DataType(typeof(System.String))]
        public static readonly String ProcDonorType = "ProcDonorType";

        [DataType(typeof(System.String))]
        public static readonly String ProcDonorSide = "ProcDonorSide";

        [DataType(typeof(System.String))]
        public static readonly String ProcRecipientVein1 = "ProcRecipientVein1";

        [DataType(typeof(System.String))]
        public static readonly String ProcRecipientVein2 = "ProcRecipientVein2";

        [DataType(typeof(System.String))]
        public static readonly String ProcRecipientArtery = "ProcRecipientArtery";

        [DataType(typeof(System.String))]
        public static readonly String ProcDonorVein1 = "ProcDonorVein1";

        [DataType(typeof(System.String))]
        public static readonly String ProcDonorVein2 = "ProcDonorVein2";

        [DataType(typeof(System.String))]
        public static readonly String ProcDonorArtery = "ProcDonorArtery";

        [DataType(typeof(System.String))]
        public static readonly String ProcArterialOrientation = "ProcArterialOrientation";

        [DataType(typeof(System.String))]
        public static readonly String ProcVenousOrientation = "ProcVenousOrientation";

        [DataType(typeof(System.String))]
        public static readonly String ProcAnastomosisTechnique = "ProcAnastomosisTechnique";

        [DataType(typeof(System.String))]
        public static readonly String ProcVeinGraft = "ProcVeinGraft";

        [DataType(typeof(System.String))]
        public static readonly String ProcVenousSuture = "ProcVenousSuture";

        [DataType(typeof(System.String))]
        public static readonly String ProcArterialSuture = "ProcArterialSuture";
    }
}
