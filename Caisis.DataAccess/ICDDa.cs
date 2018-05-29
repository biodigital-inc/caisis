using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
    public class ICDDa: BaseDA
    {
        public DataTable GetICDGroups()
        {
            DataTable dt = new DataTable();
            //string sql = "SELECT ICDGroupID, COALESCE(ICD,'') + ', ' + COALESCE (PtMiddleName, '') + ' ' + COALESCE(PtFirstName, '') AS PatientName FROM Patients WHERE PtLastName Like '" + lastName + "' ORDER BY PtLastName ASC";
            string sql = "Select ICDGroupId, ' ' + ICDGroup + ' ' +  ShortDesc AS CONCATFIELD From ICDGroup";
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        public DataTable GetSubgroupsByGroupId(string groupId)
        {
            DataTable dt = new DataTable();
            string sql = "Select ICDSubGroupId, ' ' + ICDSubGroup + ' ' +  ShortDesc AS CONCATFIELD From ICDSubGroup WHERE ICDGroupId = " + groupId;
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        public DataTable GetICDCategoriesBySubGroupId(string subgroupId)
        {
            DataTable dt = new DataTable();
            string sql = "Select b.ICDCodeId, b.ICDCode,  ' ' + b.ICDCode + ' ' +  b.ShortDesc AS CONCATFIELD ";
            sql += "FROM ICDSubgroup_ICDCodes AS a INNER JOIN ICDCodes AS b ON a.ICDCodeId = b.ICDCodeId ";
            sql += "WHERE a.ICDCodeId = b.ICDCodeId AND a.ICDSubGroupId = " + subgroupId + " AND (b.ICDCategory = 1)";
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        public DataTable GetICDCodesByICDCategory(string ICDCategoryCode)
        {
            DataTable dt = new DataTable();
            string sql = "Select ICDCodeId, ICDCode,  ' ' + ICDCode + ' ' +  ShortDesc AS CONCATFIELD ";
            sql += "FROM ICDCodes ";
            sql += "WHERE ICDCode LIKE '" + ICDCategoryCode + "%' AND (ICDCategory = 0)";
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

    }
}
