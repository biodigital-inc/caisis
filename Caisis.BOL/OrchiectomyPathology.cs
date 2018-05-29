using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("OrchiectomyPath")]
    [ParentTablename("Pathology")]
    [Disease("Prostate")]
    [Exportable]
    [NoLock]
    public class OrchiectomyPathology : BusinessObject
    {
        [PrimaryKey]
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PathologyId = "PathologyId";

       // DataType(typeof(System.String))]
       // public static readonly String PathExtension = "PathExtension";

        [DataType(typeof(System.String))]
        public static readonly String PathVascularInv = "PathVascularInv";

        [DataType(typeof(System.String))]
        public static readonly String PathSpermaticCordInv = "PathSpermaticCordInv";

        [DataType(typeof(System.String))]
        public static readonly String PathScrotalInv = "PathScrotalInv";

        [DataType(typeof(System.String))]
        public static readonly String PathEpididymisInv = "PathEpididymisInv";

        [DataType(typeof(System.String))]
        public static readonly String PathReteTestisInv = "PathReteTestisInv";

        [DataType(typeof(System.String))]
        public static readonly String PathTunicaAlbugineaInv = "PathTunicaAlbugineaInv";

        [DataType(typeof(System.String))]
        public static readonly String PathCancerMaxDim = "PathCancerMaxDim";

        [DataType(typeof(System.String))]
        public static readonly String PathCarcinomaInSitu = "PathCarcinomaInSitu";

        [DataType(typeof(System.String))]
        public static readonly String PathOtherTestis = "PathOtherTestis";

    }
}
