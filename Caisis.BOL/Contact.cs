using System;

namespace Caisis.BOL
{
    [Tablename("Contact")]
    [NoLock]
    public class Contact : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ContactId = "ContactId";

        [DataType(typeof(System.Int32))]
        public static readonly String UserId = "UserId";

        /*
        [DataType(typeof(System.Int32))]
        public static readonly String PatientId = "PatientId";  // added 4/28/2010 for McGill Caisis release
        */

        [DataType(typeof(System.String))]
        public static readonly String FirstName = "FirstName";

        [DataType(typeof(System.String))]
        public static readonly String LastName = "LastName";

        [DataType(typeof(System.String))]
        public static readonly String Address1 = "Address1";

        [DataType(typeof(System.String))]
        public static readonly String Address2 = "Address2";

        [DataType(typeof(System.String))]
        public static readonly String City = "City";

        [DataType(typeof(System.String))]
        public static readonly String State = "State";

        [DataType(typeof(System.String))]
        public static readonly String PostalCode = "PostalCode";

        [DataType(typeof(System.String))]
        public static readonly String Country = "Country";

        [DataType(typeof(System.String))]
        public static readonly String ContactType = "ContactType";

        [DataType(typeof(System.String))]
        public static readonly String Title = "Title";

        [DataType(typeof(System.String))]
        public static readonly String Degree = "Degree";

        [DataType(typeof(System.String))]
        public static readonly String Department = "Department";

        [DataType(typeof(System.String))]
        public static readonly String Occupation = "Occupation";

        [DataType(typeof(System.String))]
        public static readonly String Assistant = "Assistant";

        [DataType(typeof(System.String))]
        public static readonly String AssistantPhone = "AssistantPhone";

        [DataType(typeof(System.String))]
        public static readonly String AssistantFax = "AssistantFax";

        [DataType(typeof(System.String))]
        public static readonly String AssistantEmail = "AssistantEmail";

        [DataType(typeof(System.String))]
        public static readonly String Notes = "Notes";

    }
}
