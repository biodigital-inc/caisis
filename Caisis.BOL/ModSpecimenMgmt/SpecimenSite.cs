using System;

namespace Caisis.BOL
{
    [Tablename("SpecimenSites")]
    public class SpecimenSite : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String SiteId = "SiteId";

        [DataType(typeof(System.String))]
        public static readonly String SiteName = "SiteName";

        [DataType(typeof(System.String))]
        public static readonly String SiteAddress1 = "SiteAddress1";

        [DataType(typeof(System.String))]
        public static readonly String SiteAddress2 = "SiteAddress2";

        [DataType(typeof(System.String))]
        public static readonly String SiteCity = "SiteCity";

        [DataType(typeof(System.String))]
        public static readonly String SiteState = "SiteState";

        [DataType(typeof(System.String))]
        public static readonly String SitePostalCode = "SitePostalCode";

        [DataType(typeof(System.String))]
        public static readonly String SiteNotes = "SiteNotes";

    }
}
