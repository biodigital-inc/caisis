using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("SocialHistories")]
    [ParentTablename("Patients")]
    [Disease("All")]
    [Exportable]
    public class SocialHistory : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.String))]
        public static readonly String SocHxOccupation = "SocHxOccupation";

        [DataType(typeof(System.String))]
        public static readonly String SocHxMaritalStatus = "SocHxMaritalStatus";

        [DataType(typeof(System.String))]
        public static readonly String SocHxChildren = "SocHxChildren";

        [DataType(typeof(System.String))]
        public static readonly String SocHxTobaccoType = "SocHxTobaccoType";

        [DataType(typeof(System.String))]
        public static readonly String SocHxTobaccoPacksPerDay = "SocHxTobaccoPacksPerDay";

        [DataType(typeof(System.String))]
        public static readonly String SocHxTobaccoPacksPerYear = "SocHxTobaccoPacksPerYear";

        [DataType(typeof(System.String))]
        public static readonly String SocHxTobaccoYears = "SocHxTobaccoYears";

        [DataType(typeof(System.String))]
        public static readonly String SocHxTobaccoQuitYear = "SocHxTobaccoQuitYear";

        [DataType(typeof(System.String))]
        public static readonly String SocHxCarcinogen = "SocHxCarcinogen";

        [DataType(typeof(System.String))]
        public static readonly String SocHxAlcohol = "SocHxAlcohol";

        // 5.1
        [DataType(typeof(System.String))]
        public static readonly String SocHxAlcoholDrinksPerDay = "SocHxAlcoholDrinksPerDay";

        [DataType(typeof(System.String))]
        public static readonly String SocHxAlcoholYears = "SocHxAlcoholYears";

        [DataType(typeof(System.String))]
        public static readonly String SocHxAlcoholQuitYear = "SocHxAlcoholQuitYear";

        // v4.2
        [DataType(typeof(System.String))]
        public static readonly String SocHxMenarcheAge = "SocHxMenarcheAge";

        [DataType(typeof(System.String))]
        public static readonly String SocHxMenopauseAge = "SocHxMenopauseAge";

        [DataType(typeof(System.String))]
        public static readonly String SocHxGravida = "SocHxGravida";

        [DataType(typeof(System.String))]
        public static readonly String SocHxParity = "SocHxParity";

        [DataType(typeof(System.String))]
        public static readonly String SocHxFirstBirthAge = "SocHxFirstBirthAge";

        [DataType(typeof(System.String))]
        public static readonly String SocHxOther = "SocHxOther";

        [DataType(typeof(System.String))]
        public static readonly String SocHxMenopauseStatus = "SocHxMenopauseStatus";

        [DataType(typeof(System.String))]
        public static readonly String SocHxNotes = "SocHxNotes";

        [DataType(typeof(System.String))]
        public static readonly String SocHxDataSource = "SocHxDataSource";

        [DataType(typeof(System.String))]
        public static readonly String SocHxQuality = "SocHxQuality";

    }
}
