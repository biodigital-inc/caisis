using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("ErrorLog")]
    [Disease("All")]
    [HasSiblings]
    [NoBaseColumns]
    public class ErrorLogEntry : BusinessObject
    {
        [DataType(typeof(System.Int32))]
        public static readonly String UserLoginId = "UserLoginId";

        [DataType(typeof(System.Int32))]
        public static readonly String DatasetId = "DatasetId";

        [DataType(typeof(System.Int32))]
        [Deidentify(DeidentifyOptions.Randomize)]
        [LimitIdentification(LimitIdentificationOptions.Randomize)]
        public static readonly String PatientId = "PatientId";

        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String ErrorLogId = "ErrorLogId";

        [DataType(typeof(System.String))]
        public static readonly String ErrUserName = "ErrUserName";

        [DataType(typeof(System.String))]
        public static readonly String ErrURL = "ErrURL";

        [DataType(typeof(System.String))]
        public static readonly String ErrFullPath = "ErrFullPath";

        [DataType(typeof(System.String))]
        public static readonly String ErrFileName = "ErrFileName";

        [DataType(typeof(System.String))]
        public static readonly String ErrForm = "ErrForm";

        [DataType(typeof(System.String))]
        public static readonly String ErrQueryString = "ErrQueryString";

        [DataType(typeof(System.String))]
        public static readonly String ErrBrowser = "ErrBrowser";

        [DataType(typeof(System.String))]
        public static readonly String ErrPlatform = "ErrPlatform";

        [DataType(typeof(System.String))]
        public static readonly String ErrJavascript = "ErrJavascript";

        [DataType(typeof(System.String))]
        public static readonly String ErrIP = "ErrIP";

        [DataType(typeof(System.String))]
        public static readonly String ErrAuthenticated = "ErrAuthenticated";

        [DataType(typeof(System.String))]
        public static readonly String ErrHostName = "ErrHostName";

        [DataType(typeof(System.String))]
        public static readonly String ErrRoleList = "ErrRoleList";

        [DataType(typeof(System.String))]
        public static readonly String ErrSessionIsNew = "ErrSessionIsNew";

        [DataType(typeof(System.Int32))]
        public static readonly String ErrSessionTimeOut = "ErrSessionTimeOut";

        [DataType(typeof(System.DateTime))]
        [Deidentify(DeidentifyOptions.MaskDate)]
        public static readonly String ErrTicketIssueDate = "ErrTicketIssueDate";

        [DataType(typeof(System.DateTime))]
        public static readonly String ErrTicketExpiration = "ErrTicketExpiration";

        [DataType(typeof(System.DateTime))]
        public static readonly String ErrorTime = "ErrorTime";

        [DataType(typeof(System.String))]
        public static readonly String ErrMachineName = "ErrMachineName";

        [DataType(typeof(System.String))]
        public static readonly String ErrorName = "ErrorName";

        [DataType(typeof(System.String))]
        public static readonly String ErrorMessage = "ErrorMessage";

        [DataType(typeof(System.String))]
        public static readonly String ErrStackTrace = "ErrStackTrace";

    }
}
