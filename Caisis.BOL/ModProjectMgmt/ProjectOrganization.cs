using System;

namespace Caisis.BOL
{
    [Tablename("ProjectOrganization")]
    [NoLock]
    public class ProjectOrganization : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String OrganizationId = "OrganizationId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Name = "Name";

        [DataType(typeof(System.String))]
        public static readonly String ShortName = "ShortName";

        [DataType(typeof(System.String))]
        public static readonly String Address1 = "Address1";

        [DataType(typeof(System.String))]
        public static readonly String Address2 = "Address2";

        [DataType(typeof(System.String))]
        public static readonly String City = "City";

        [DataType(typeof(System.String))]
        public static readonly String State = "State";

        [DataType(typeof(System.String))]
        public static readonly String Country = "Country";

        [DataType(typeof(System.String))]
        public static readonly String PostalCode = "PostalCode";

        [DataType(typeof(System.String))]
        public static readonly String ColorCode = "ColorCode";

        [DataType(typeof(System.Byte))]
        public static readonly String CoordinatingCenter = "CoordinatingCenter";

        // v6.1
        [DataType(typeof(System.String))]
        public static readonly String OrgNum = "OrgNum";
    }
}
