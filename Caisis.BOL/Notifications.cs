using System;

using Caisis.DataAccess;

namespace Caisis.BOL
{
    [Tablename("Notifications")]
	[ParentTablename("Patients")]
    [Disease("All")]
    [HasSiblings]
    [NoLock]
    public class Notifications : BusinessObject
    {
        [PrimaryKey]
        [DataType(typeof(System.Int32))]
        public static readonly String NotificationId = "NotificationId";

        [ForeignKey]
        [DataType(typeof(System.Int32))]
        public static readonly String PatientId = "PatientId";

        [DataType(typeof(System.Int32))]
        public static readonly String AssignedUserId = "AssignedUserId";
     
        [DataType(typeof(System.String))]
        public static readonly String TableName = "TableName";
 
        [DataType(typeof(System.Int32))]
        public static readonly String TablePrimaryKey = "TablePrimaryKey";

        [NotNull]
        [DataType(typeof(System.String))]
        public static readonly String Notification = "Notification";

        [DataType(typeof(System.String))]
        public static readonly String Reason = "Reason";
 
        [DataType(typeof(System.String))]
        public static readonly String Response = "Response";
    }
}
