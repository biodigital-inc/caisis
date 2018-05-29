using System;

namespace Caisis.BOL
{
    [Tablename("ContactMethod")]
    [ParentTablename("Contact")]
    [HasSiblings]
    [NoLock]
    public class ContactMethod : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactMethodId = "ContactMethodId";

        [DataType(typeof(System.String))]
        public static readonly String Type = "Type";
        
        [DataType(typeof(System.String))]
        public static readonly String ContactData = "ContactData";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";

        [DataType(typeof(System.Int32))]
        public static readonly String Priority = "Priority";

    }
}
