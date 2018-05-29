using System;

namespace Caisis.BOL
{
    [Tablename("ProjectInvoice")]
    [ParentTablename("ProjectFundingSource")]
    [HasSiblings]
    [NoLock]
    public class ProjectInvoice : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String FundingSourceId = "FundingSourceId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProjectInvoiceId = "ProjectInvoiceId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String InvoiceService = "InvoiceService";

        [DataType(typeof(System.String))]
        public static readonly String InvoiceCost = "InvoiceCost";

        [DataType(typeof(System.String))]
        public static readonly String InvoiceCondition = "InvoiceCondition";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";
    }
}
