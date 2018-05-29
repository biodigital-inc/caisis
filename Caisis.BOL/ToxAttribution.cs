using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ToxAttribution")]
    [ParentTablename("Toxicities")]
    [Disease("All")]
    [Exportable]
    [NoLock]
    public class ToxAttribution : BusinessObject
    {
        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ToxicityId = "ToxicityId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ToxAttributionId = "ToxAttributionId";

        [DataType(typeof(System.String))]
        public static readonly String ToxAttribution_Field = "ToxAttribution";

        [DataType(typeof(System.String))]
        public static readonly String ToxAttributionProbability = "ToxAttributionProbability";

        [DataType(typeof(System.String))]
        public static readonly String ToxAttributionAction = "ToxAttributionAction";

        [DataType(typeof(System.String))]
        public static readonly String ToxEventAbated = "ToxEventAbated";

        [DataType(typeof(System.String))]
        public static readonly String ToxEventReappeared = "ToxEventReappeared";
    }
}
