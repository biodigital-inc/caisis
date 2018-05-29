using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("UserLoginAttempts")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class UserLoginAttempt : BusinessObject
    {
        [DataType(typeof(System.Int32))]
        public static readonly String UserLoginId = "UserLoginId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String UserLoginAttemptId = "UserLoginAttemptId";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String UserName = "UserName";

        [NotNull]
        [DataType(typeof(System.DateTime))]
        public static readonly String UserLoginAttemptTime = "UserLoginAttemptTime";

        [DataType(typeof(System.String))]
        public static readonly String UserErrorMessage = "UserErrorMessage";

        [DataType(typeof(System.String))]
        public static readonly String UserIP = "UserIP";

        [DataType(typeof(System.String))]
        public static readonly String UserUserAgent = "UserUserAgent";

        [DataType(typeof(System.String))]
        public static readonly String UserBrowser = "UserBrowser";

        [DataType(typeof(System.String))]
        public static readonly String UserPlatform = "UserPlatform";

        [DataType(typeof(System.String))]
        public static readonly String UserCookies = "UserCookies";

        [DataType(typeof(System.String))]
        public static readonly String UserJavascript = "UserJavascript";

        [DataType(typeof(System.String))]
        public static readonly String UserScreenResolution = "UserScreenResolution";

        [DataType(typeof(System.String))]
        public static readonly String UserColorDepth = "UserColorDepth";

    }
}
