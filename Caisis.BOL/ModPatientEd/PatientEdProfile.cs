using System;

namespace Caisis.BOL
{
    [Tablename("PatientEdProfile")]

    public class PatientEdProfile : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ProfileId = "ProfileId";

        [NotNull]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.Int32))]
        public static readonly String ProfileVisitTypeId = "ProfileVisitTypeId";

        [DataType(typeof(System.Int32))]
        public static readonly String ProfileDiseaseId = "ProfileDiseaseId";

        [NotNull]
        [DataType(typeof(System.DateTime))]
        public static readonly String ProfileCreateDate = "ProfileCreateDate";

        [DataType(typeof(System.Int32))]
		public static readonly String ProfileDocument = "ProfileDocument";

        [DataType(typeof(System.String))]
        public static readonly String LastPrintedBy = "LastPrintedBy";

        [DataType(typeof(System.DateTime))]
        public static readonly String LastPrintedTime = "LastPrintedTime";
    }
}
