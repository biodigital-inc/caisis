using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace Caisis.DataAccess
{
    public class PatientProtocolResponseDa : BaseDA
    {

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public DataTable GetImagingAndResponseChronList(int patientId)
        {
            return GetImagingAndResponseChronList(patientId, new string[] { });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="imageTypes"></param>
        /// <param name="exactMatch"></param>
        /// <returns></returns>
        public DataTable GetImagingAndResponseChronList(int patientId, params string[] imageTypes)
        {
            string sql = @"
SELECT * FROM 
(
SELECT DxDateText AS VarDate, 
DxType AS VarName, LTRIM(ISNULL(DxSide,'') + ' ' + ISNULL(DxTarget,'') + ' ' + ISNULL(DxResult,'')) AS VarValue,  
DxDate AS SortDate, 1 SortNumber, 'Diagnostics' AS TableName, DiagnosticId AS PrimaryKey
FROM Diagnostics
WHERE PatientId = @PatientId {0}

UNION ALL

SELECT ResponseDateText, ResponseType,
Response, ResponseDate,2, 'ProtocolMgr_PatientResponse', PatientResponseId
FROM ProtocolMgr_PatientResponse INNER JOIN PatientProtocols
ON ProtocolMgr_PatientResponse.PatientProtocolId=PatientProtocols.PatientProtocolId 
WHERE PatientProtocols.PatientId = @PatientId
)
AS a
ORDER BY SortDate,SortNumber
";
            if (imageTypes.Length > 0)
            {
                string findExpr = "AND (DxType LIKE @Type" + string.Join(" OR DxType LIKE @Type", imageTypes) + ") ";
                sql = string.Format(sql, findExpr);
            }
            else
            {
                sql = string.Format(sql, string.Empty);
            }
            SqlCommand cmd = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(cmd, "PatientId", patientId);
            foreach (string imageType in imageTypes)
            {
                string key = "Type" + imageType;
                string value = "%" + imageType + "%";
                DataAccessHelper.AddStringInputParam(cmd, key, value);
            }
            DataTable dt = DataAccessHelper.GetRecord(cmd).Tables[0];
            return dt;
        }
    }
}
