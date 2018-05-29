using System;

namespace Caisis.BOL
{
    [Tablename("PatientEdDisease")]
	[NoBaseColumns]

    public class PatientEdDisease : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiseaseId = "DiseaseId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String DiseaseName = "DiseaseName";
    }
}
