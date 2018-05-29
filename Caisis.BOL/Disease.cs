using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Diseases")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]   
    [NoUserFields]
    public class Disease : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String DiseaseId = "DiseaseId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String DiseaseName = "DiseaseName";

    }
}
