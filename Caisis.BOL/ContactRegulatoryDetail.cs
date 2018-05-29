using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Caisis.BOL
{
    [Tablename("ContactRegulatoryDetail")]
    [ParentTablename("Contact")]
    [HasSiblings]
    [NoLock]
    public class ContactRegulatoryDetail : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactRegulatoryDetailId = "ContactRegulatoryDetailId";

        [DataType(typeof(System.DateTime))]
        public static readonly String RegDocApprovalDate = "RegDocApprovalDate";

        [DataType(typeof(System.DateTime))]
        public static readonly String RegDocExpirationDate = "RegDocExpirationDate";

        [DataType(typeof(System.String))]
        public static readonly String RegDocType = "RegDocType";

        [DataType(typeof(System.String))]
        public static readonly String RegDocName = "RegDocName";

        [DataType(typeof(System.String))]
        public static readonly String RegDocLocation = "RegDocLocation";

        [DataType(typeof(System.String))]
        public static readonly String RegDocNotes = "RegDocNotes";

    }
}
