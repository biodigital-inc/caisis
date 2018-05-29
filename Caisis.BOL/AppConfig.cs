using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("AppConfig")]
    [NoLock]
    public class AppConfig : BusinessObject
    {
       
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String AppConfigId = "AppConfigId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String ConfigType = "ConfigType";

        [DataType(typeof(System.String))]
        public static readonly String ConfigVariable = "ConfigVariable";

        [DataType(typeof(System.String))]
        public static readonly String ConfigValue = "ConfigValue";

        [DataType(typeof(System.String))] // actually XML datatype
        public static readonly String ConfigXmlDocument = "ConfigXmlDocument";

    }
}
