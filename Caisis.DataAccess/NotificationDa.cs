using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
    class NotificationDa : BaseDA
    {
        
        public DataTable GetNotifications(string tableName, int recordId)
        {
            string sql = "SELECT * FROM Notifications WHERE TableName = '" + tableName + "' AND recordId = " + recordId + " ";
            DataTable dt = new DataTable();
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }
    }
}
