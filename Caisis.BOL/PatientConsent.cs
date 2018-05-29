using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("PatientConsent")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [HasSiblings]
    public class PatientConsent : BusinessObject
    {
        [NotNull]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ConsentId = "ConsentId";

        [DataType(typeof(System.String))]
        public static readonly String ConsentProtocol = "ConsentProtocol";

        [DataType(typeof(System.String))]
        public static readonly String DBConsented = "DBConsented";

        [DataType(typeof(System.String))]
        public static readonly String ResearchConsented = "ResearchConsented";

        [DataType(typeof(System.String))]
        [Deidentify(DeidentifyOptions.Omit)]
        public static readonly String ConsentDateText = "ConsentDateText";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ConsentDate = "ConsentDate";

        [DataType(typeof(System.String))]
        public static readonly String ConsentedBy = "ConsentedBy";

        [DataType(typeof(System.String))]
        public static readonly String ConsentVer = "ConsentVer";

        [DataType(typeof(System.String))]
        public static readonly String AuthorizedPerson = "AuthorizedPerson";

        [DataType(typeof(System.String))]
        public static readonly String ConsentRelationship = "ConsentRelationship";

        [DataType(typeof(System.String))]
        public static readonly String CopyToPatient = "CopyToPatient";

        [DataType(typeof(System.String))]
        public static readonly String ObtainPerson = "ObtainPerson";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ObtainDate = "ObtainDate";

    }
}
