using System;

namespace Caisis.BOL
{
    [Tablename("ProjectFundingSource")]
    [ParentTablename("Project")]
    [HasSiblings]
    [NoLock]
    public class ProjectFundingSource : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectId = "ProjectId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String FundingSourceId = "FundingSourceId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Source = "Source";

        [DataType(typeof(System.String))]
        public static readonly String SourceType = "SourceType";

        [DataType(typeof(System.DateTime))]
        public static readonly String StartDate = "StartDate";

        [DataType(typeof(System.DateTime))]
        public static readonly String EndDate = "EndDate";

        [DataType(typeof(System.String))]
        public static readonly String Amount = "Amount";

        [DataType(typeof(System.String))]
        public static readonly String AmountPerPatient = "AmountPerPatient";

        [DataType(typeof(System.String))]
        public static readonly String StartupCost = "StartupCost";

        [DataType(typeof(System.String))]
        public static readonly String TotalInvoicableCost = "TotalInvoicableCost";

        [DataType(typeof(System.String))]
        public static readonly String InitialPayment = "InitialPayment";
    }
}
