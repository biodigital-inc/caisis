using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for DiagnosticDa.
    /// </summary>
    public class DiagnosticDa : BaseDA
    {
        protected override void SetParams()
        {
            this._GetStoredProc = "spGetDiagnosticsRecord";
            this._InsertStoredProc = "spInsertDiagnosticsRecord";
            this._UpdateStoredProc = "spUpdateDiagnosticsRecord";
            this._DeleteStoredProc = "spDeleteDiagnosticsRecord";
            this._GetByParentStoredProc = "spGetDiagnostics";
        }




        public DataSet FormGetDxImages(int PatientId, string FormName, string FormType)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormListDxImages");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
            DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        // This overload takes Modifier for CT/MRI, etc...
        public DataSet FormGetDxImages(int PatientId, string FormName, string FormType, string Modifier)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormListDxImages");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
            DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
            DataAccessHelper.AddStringInputParam(com, "Modifier", Modifier);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="types"></param>
        /// <returns></returns>
        public DataTable GetDiagnosticsByType(int patientId, params string[] types)
        {
            string sql = "SELECT * FROM Diagnostics";
            SqlCommand com = GetFilteredDiagnosticType(sql, patientId, types);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="dxtypes"></param>
        /// <returns></returns>
        public DataTable GetDiagnosticsByTypeString(int patientId, string dxtypes)
        {
            string sql = String.Empty;

            if (!String.IsNullOrEmpty(dxtypes))
            {
                sql = "SELECT * FROM Diagnostics ";
                sql += "WHERE Diagnostics.PatientId = @PatientId ";
                sql += "AND Diagnostics.DxType IN (" + dxtypes + ") ";
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetList(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="types"></param>
        /// <returns></returns>
        public DataTable GetDiagnosticAndImgFindNewByType(int patientId, params string[] types)
        {
            string sql = "SELECT Diagnostics.*,CalculatedLesions.ImgFindNew ";
            sql += "FROM Diagnostics ";
            sql += "LEFT OUTER JOIN  ";
            sql += "(SELECT Diagnostics.DiagnosticId, ISNULL(DxImageFindings.ImgFindNew,0) AS ImgFindNew ";
            sql += "FROM Diagnostics, DxImageFindings ";
            sql += "WHERE Diagnostics.DiagnosticId = DxImageFindings.DiagnosticId AND DxImageFindings.ImgFindAP IS NULL AND DxImageFindings.ImgFindSide IS NULL AND DxImageFindings.ImgFindSubsite IS NULL ";
            sql += "GROUP BY Diagnostics.DiagnosticId,ImgFindNew) ";
            sql += "AS CalculatedLesions ";
            sql += "ON Diagnostics.DiagnosticId = CalculatedLesions.DiagnosticId ";
            SqlCommand com = GetFilteredDiagnosticType(sql, patientId, types);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public DataTable GetDxImages(int patientId)
        {
            string sql = "SELECT * FROM DxImageFindings ";
            sql += "INNER JOIN Diagnostics ON ";
            sql += "DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId ";
            sql += "WHERE Diagnostics.PatientId = @PatientId";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public DataTable GetImagingAll(int patientId)
        {
            string sql = "SELECT * FROM Diagnostics ";
            sql += "WHERE PatientId = @PatientId ";
            sql += "ORDER BY DxDate ASC, DxType ASC";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="diagnostic"></param>
        /// <returns></returns>
        public DataSet GetDxImagesByDiagnosticId(int patientId, int diagnosticId)
        {
            string sql = "SELECT * FROM Diagnostics ";
            sql += "LEFT JOIN DxImageFindings ON ";
            sql += "DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId ";
            sql += "WHERE Diagnostics.PatientId = @PatientId ";
            sql += "AND Diagnostics.DiagnosticId = @DiagnosticId ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddIntInputParam(com, "DiagnosticId", diagnosticId);
            DataSet ds = DataAccessHelper.GetList(com);
            return ds;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="diagnosticIds"></param>
        /// <returns></returns>
        public DataTable GetDxImagesByDiagnosticIds(int patientId, string diagnosticIds)
        {
            string sql = String.Empty;

            if (!String.IsNullOrEmpty(diagnosticIds))
            {
                sql = "SELECT * FROM Diagnostics ";
                sql += "LEFT JOIN DxImageFindings ON ";
                sql += "DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId ";
                sql += "WHERE Diagnostics.PatientId = @PatientId ";
                sql += "AND Diagnostics.DiagnosticId IN (" + diagnosticIds + ") ";
            }
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetList(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public DataTable GetDxImagesByType(int patientId, params string[] types)
        {
            string sql = "SELECT Diagnostics.*,DxImageFindings.* FROM DxImageFindings ";
            sql += "INNER JOIN Diagnostics ON ";
            sql += "DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId ";

            //string sql = "SELECT Diagnostics.DxDate,DxImageFindings.DxImageFindingId,DxImageFindings.DiagnosticId,DxImageFindings.ImgFindTarget,DxImageFindings.ImgFindHeight,DxImageFindings.ImgFindWidth,DxImageFindings.ImgFindLength,DxImageFindings.ImgFindSite, DxImageFindings.ImgFindSubsite, DxImageFindings.ImgFindSUV,DxImageFindings.ImgFindGroupNum FROM DxImageFindings ";
            //sql += "INNER JOIN Diagnostics ON ";
            //sql += "DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId ";

            SqlCommand com = GetFilteredDiagnosticType(sql, patientId, types);
            //com.CommandText += "GROUP BY DxImageFindings.DxImageFindingId,DxImageFindings.DiagnosticId,DxImageFindings.ImgFindTarget,DxImageFindings.ImgFindHeight,DxImageFindings.ImgFindWidth,DxImageFindings.ImgFindLength, DxImageFindings.ImgFindSite,DxImageFindings.ImgFindSubsite, DxImageFindings.ImgFindSUV ";
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public DataTable GetDxImagesByOneType(int patientId, string type)
        {

            string sql = "SELECT * FROM Diagnostics ";
            sql += " WHERE Diagnostics.PatientId = " + patientId + " ";
            sql += "AND Diagnostics.DxType LIKE '%" + type + "%' ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];

            return dt;
        }

        public DataTable GetDxImagesByGroupNum(int patientId, params string[] types)
        {
            string sql = "SELECT ImgFindGroupNum,MAX(DxDate) DxDate ";
            sql += "FROM DxImageFindings ";
            sql += "INNER JOIN Diagnostics ";
            sql += "ON Diagnostics.DiagnosticId = DxImageFindings.DiagnosticId ";
            SqlCommand com = GetFilteredDiagnosticType(sql, patientId, types);
            com.CommandText += " AND ImgFindGroupNum IS NOT NULL ";
            com.CommandText += " GROUP BY ImgFindGroupNum";
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets the next ImgGroupNum based on type of scan
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="types"></param>
        /// <returns></returns>
        public int GetNextDxImgGroupNum(int patientId, params string[] types)
        {
            string sql = "SELECT ISNULL(MAX(ImgFindGroupNum),0) + 1 FROM DxImageFindings ";
            sql += "INNER JOIN Diagnostics ";
            sql += "ON Diagnostics.DiagnosticId = DxImageFindings.DiagnosticId ";
            SqlCommand com = GetFilteredDiagnosticType(sql, patientId, types);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return (int)dt.Rows[0][0];
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        public DataTable GetDiagnosticsWithDxImagesByType(int patientId, params string[] types)
        {
            string sql = "SELECT Diagnostics.*,DxImageFindings.* FROM Diagnostics ";
            sql += "INNER JOIN DxImageFindings ON ";
            sql += "DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId ";

            //string sql = "SELECT Diagnostics.DxDate,DxImageFindings.DxImageFindingId,DxImageFindings.DiagnosticId,DxImageFindings.ImgFindTarget,DxImageFindings.ImgFindHeight,DxImageFindings.ImgFindWidth,DxImageFindings.ImgFindLength,DxImageFindings.ImgFindSite, DxImageFindings.ImgFindSubsite, DxImageFindings.ImgFindSUV,DxImageFindings.ImgFindGroupNum FROM DxImageFindings ";
            //sql += "INNER JOIN Diagnostics ON ";
            //sql += "DxImageFindings.DiagnosticId = Diagnostics.DiagnosticId ";

            SqlCommand com = GetFilteredDiagnosticType(sql, patientId, types);
            //com.CommandText += "GROUP BY DxImageFindings.DxImageFindingId,DxImageFindings.DiagnosticId,DxImageFindings.ImgFindTarget,DxImageFindings.ImgFindHeight,DxImageFindings.ImgFindWidth,DxImageFindings.ImgFindLength, DxImageFindings.ImgFindSite,DxImageFindings.ImgFindSubsite, DxImageFindings.ImgFindSUV ";
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Takes a Diagnostic SQL Query and filters Diagnostics by list of DxTypes
        /// </summary>
        /// <param name="baseSQL"></param>
        /// <returns></returns>
        private static SqlCommand GetFilteredDiagnosticType(string baseSQL, int patientId, params string[] types)
        {
            string sql = baseSQL;
            sql += " WHERE Diagnostics.PatientId = @PatientId ";
            sql += "AND (";
            string[] paramList = new string[types.Length];
            for (int i = 0; i < types.Length; i++)
            {
                string paramName = "DxType_" + i;
                paramList[i] = " Diagnostics.DxType LIKE '%' + @" + paramName + " + '%' ";
            }
            sql += string.Join(" OR ", paramList);
            sql += ")";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            for (int i = 0; i < types.Length; i++)
            {
                string paramName = "DxType_" + i;
                string paramValue = types[i];
                DataAccessHelper.AddStringInputParam(com, paramName, paramValue);
            }
            return com;
        }




        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <param name="diagnostic"></param>
        /// <returns></returns>
        public DataTable GetDxImageFindingsKidneyByDiagnosticId(int diagnosticId)
        {
            string sql = "SELECT * FROM DxImageFindingsKidney ";
            sql += "WHERE DxImageFindingsKidney.DiagnosticId = @DiagnosticId ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "DiagnosticId", diagnosticId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public DataTable GetProstateMRIFindings(int patientId)
        {
            string sql = "SELECT Diagnostics.*,DxImageFindings.* FROM Diagnostics ";
            sql += "LEFT JOIN DxImageFindings ON ";
            sql += "Diagnostics.DiagnosticId = DxImageFindings.DiagnosticId ";
            sql += "WHERE Diagnostics.PatientId = @PatientId ";
            sql += "AND Diagnostics.DxType IN ('MRI','EMRI','MRSI') ";
            sql += "AND Diagnostics.DxTarget = 'Prostate' ";
            sql += "ORDER BY Diagnostics.DxDate";


            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }




        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public DataTable GetProstateImageFindings(int patientId)
        {
            string sql = "SELECT Diagnostics.*,DxImageProstate.* FROM Diagnostics ";
            sql += "INNER JOIN DxImageProstate ON ";
            sql += "Diagnostics.DiagnosticId = DxImageProstate.DiagnosticId ";
            sql += "WHERE Diagnostics.PatientId = @PatientId ";
            sql += "ORDER BY Diagnostics.DxDate";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }



    }
}
