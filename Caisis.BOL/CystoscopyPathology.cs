using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("CystoscopyPath")]
    [ParentTablename("Pathology")]
    [Disease("All")]
    [Exportable]
    [NoLock]
    public class CystoscopyPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

        [DataType(typeof(System.String))]
        public static readonly String PathMorphology = "PathMorphology";

        [DataType(typeof(System.String))]
        public static readonly String PathCarcinomaInSitu = "PathCarcinomaInSitu";

        [DataType(typeof(System.String))]
        public static readonly String PathPattern = "PathPattern";

        [DataType(typeof(System.String))]
        public static readonly String PathExtension = "PathExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathMucosaInv = "PathMucosaInv";

        [DataType(typeof(System.String))]
        public static readonly String PathUrethra = "PathUrethra";

        // v6.x
        [DataType(typeof(System.String))]
        public static readonly String PathMusclePresentStatement = "PathMusclePresentStatement";
    }
}
