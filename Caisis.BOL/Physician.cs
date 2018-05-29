using System;
using System.Data;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Physicians")]
    [Disease("All")]
    [HasSiblings]
    public class Physician : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PhysicianId = "PhysicianId";

        [DataType(typeof(System.String))]
        public static readonly String PhSpecialty = "PhSpecialty";

        [DataType(typeof(System.String))]
        public static readonly String PhLevel = "PhLevel";

        [DataType(typeof(System.String))]
        public static readonly String PhTitle = "PhTitle";

        [DataType(typeof(System.String))]
        public static readonly String PhFirstName = "PhFirstName";

        [DataType(typeof(System.String))]
        public static readonly String PhMiddleName = "PhMiddleName";

        [DataType(typeof(System.String))]
        public static readonly String PhLastName = "PhLastName";

        [DataType(typeof(System.String))]
        public static readonly String PhSuffix = "PhSuffix";

        [DataType(typeof(System.String))]
        public static readonly String PhAddress1 = "PhAddress1";

        [DataType(typeof(System.String))]
        public static readonly String PhAddress2 = "PhAddress2";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String PhCity = "PhCity";

        [DataType(typeof(System.String))]
        public static readonly String PhState = "PhState";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String PhPostalCode = "PhPostalCode";

        [DataType(typeof(System.String))]
        public static readonly String PhCountry = "PhCountry";

        [DataType(typeof(System.String))]
        public static readonly String PhWorkPhone = "PhWorkPhone";

        [DataType(typeof(System.String))]
        public static readonly String PhCellPhone = "PhCellPhone"; // v 4.2

        [DataType(typeof(System.String))]
        public static readonly String PhFax = "PhFax";

        [DataType(typeof(System.String))]
        public static readonly String PhEmail = "PhEmail";

        [DataType(typeof(System.String))]
        public static readonly String PhInstitution = "PhInstitution";
                                                                    /*
        [DataType(typeof(System.String))]
        public static readonly String PhLicenseNum = "PhLicenseNum"; // added 6/24/2010 for McGill Caisis release */

        [DataType(typeof(System.String))]
        public static readonly String PhDoNotContact = "PhDoNotContact";

        [DataType(typeof(System.String))]
        public static readonly String PhNotes = "PhNotes";

		//public override void Delete(int primaryKey)
		//{
		//    DeleteWithVerification(new PhysicianDa().GetPhysicianPatients, primaryKey, "physician",
		//        delegate(DataTable dt, string singularName)
		//        {
		//            if (dt.Rows.Count > 1)
		//            {
		//                return String.Format("You are unable to delete this physician record because there are {0} patients associated with this physician.\nPlease contact the system admin for help deleting this physician.", dt.Rows.Count);
		//            }
		//            else
		//            {
		//                return "You are unable to delete this physician record because there is a patient associated with this physician.\nPlease contact the system admin for help deleting this physician.";
		//            }
		//        });
		//}
    }
}
