using System;
using System.Data;
using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Patients")]
    public class Patient : BusinessObject
    {
        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtMRN = "PtMRN";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtTitle = "PtTitle";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtFirstName = "PtFirstName";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtMiddleName = "PtMiddleName";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtLastName = "PtLastName";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtSuffix = "PtSuffix";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtAlias = "PtAlias";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtMaidenName = "PtMaidenName";

        [DataType(typeof(System.String))]
        public static readonly String PtGender = "PtGender";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtCompany = "PtCompany";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtBusinessCity = "PtBusinessCity";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtBusinessState = "PtBusinessState";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtAddress1 = "PtAddress1";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtAddress2 = "PtAddress2";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String PtCity = "PtCity";

        [DataType(typeof(System.String))]
        public static readonly String PtState = "PtState";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String PtPostalCode = "PtPostalCode";

        [DataType(typeof(System.String))]
        public static readonly String PtCountry = "PtCountry";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtEmail = "PtEmail";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String PtBirthDateText = "PtBirthDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String PtBirthDate = "PtBirthDate";

        [DataType(typeof(System.String))]
        public static readonly String PtBirthPlace = "PtBirthPlace";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String PtDeathDateText = "PtDeathDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String PtDeathDate = "PtDeathDate";

        [DataType(typeof(System.String))]
        public static readonly String PtDeathType = "PtDeathType";

        [DataType(typeof(System.String))]
        public static readonly String PtDeathCause = "PtDeathCause";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtContactPerson = "PtContactPerson";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtContactAddress1 = "PtContactAddress1";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtContactAddress2 = "PtContactAddress2";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtContactCity = "PtContactCity";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtContactState = "PtContactState";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtContactPostalCode = "PtContactPostalCode";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtContactPhone = "PtContactPhone";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtSpouse = "PtSpouse";

        [DataType(typeof(System.String))]
        public static readonly String PtRace = "PtRace";

        [DataType(typeof(System.String))]
        public static readonly String PtEthnicity = "PtEthnicity";

        [DataType(typeof(System.String))]
        public static readonly String PtLanguage = "PtLanguage";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtContactStatus = "PtContactStatus";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtContactPreference = "PtContactPreference";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        [LimitIdentification(LimitIdentificationOptions.Omit)]
        public static readonly String PtNotes = "PtNotes";

		//public override void Delete(int primaryKey)
		//{
		//    DeleteWithVerification(new PatientDa().ValidatePatientDeletion, primaryKey, "patient");
		//}
    }
}
