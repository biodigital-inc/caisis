using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

namespace Caisis.DataAccess
{
    /// <summary>
    /// Summary description for PathologyDa
	/// </summary>
    public class PathologyDa : BaseDA
    {
        public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT * ";
                sql += "FROM Pathology ";
                sql += "WHERE (PatientId = @PatientId ) ";
                sql += "ORDER BY PathDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }


        public DataSet FormGetPathFindingRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT a.*, b.* FROM Pathology a ";
                sql += "INNER JOIN PathologyFinding b ON a.PathologyId=b.PathologyId ";
                sql += "WHERE (a.PatientId = @PatientId ) ";
                sql += "ORDER BY b.PathologyFindingId ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }



        public DataSet FormGetPathAndORDetails(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT a.*, b.* ";
                sql += "FROM Pathology a ";
                sql += "LEFT JOIN  OperatingRoomDetails b ON a.OperatingRoomDetailId = b.OperatingRoomDetailId ";
                sql += "WHERE (a.PatientId = @PatientId  ) ";
                sql += "ORDER BY a.PathDate ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

        //gets all PathTests of each Pathology
        public DataSet FormGetPathTestRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT  a.PatientId, b.PathologyId, b.PathTestId, b.PathDateText, b.PathDate, b.PathTest, b.PathResult, b.PathNotes, b.PathQuality ";
                sql += "FROM Pathology a ";
                sql += "INNER JOIN PathTest b ON a.PathologyId=b.PathologyId ";
                sql += "WHERE (a.PatientId = @PatientId ) ";
                sql += "ORDER BY b.PathTest ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }

        //gets PathGrade of each Pathology
        public DataSet FormGetPathGradeRecords(int PatientId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            string sql = "";
            if (FormType == "Dynamic")
            {
                sql = "SELECT a.PatientId, b.PathologyId, b.PathologyStageGradeId, b.PathStageDisease, b.PathGrade, b.PathNotes, b.PathQuality ";
                sql += "FROM Pathology a ";
                sql += "INNER JOIN PathologyStageGrade b ON a.PathologyId=b.PathologyId ";
                sql += "WHERE (a.PatientId = @PatientId ) ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }
    }
}
