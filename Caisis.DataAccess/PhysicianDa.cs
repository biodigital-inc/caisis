using System.Data;
using System.Data.SqlClient;


using System.Collections;

namespace Caisis.DataAccess
{
    /// <summary>
    /// Physician Da provides select, update, insert, delete. Plus retrieves distinct records.
    /// </summary>
    public class PhysicianDa : BaseDA
    {
        protected override void SetParams()
        {
            //this._GetStoredProc = "spGetPhysiciansRecord";
            //this._InsertStoredProc = "spInsertPhysiciansRecord";
            //this._UpdateStoredProc = "spUpdatePhysiciansRecord";
            //this._DeleteStoredProc = "spDeletePhysiciansRecord";
        }



        /*public DataSet GetPhysicians(int patientID)  
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPhysicians");
            DataAccessHelper.AddIntInputParam(com, "PatientID", patientID);
            return DataAccessHelper.GetList(com);
        }*/

        public DataSet GetDistinctPhysicians()
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetDistinctPhysicians");
            return DataAccessHelper.GetList(com);
        }

        /// <summary>
        /// Get a list of Distinct Physicians based on last name
        /// </summary>
        /// <param name="searchFilter">First letter of last name, "All" is entire list, "other" is NULL or non-letter last name</param>
        /// <returns></returns>
        public DataSet GetDistinctPhysicians(string searchFilter)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetDistinctPhysicians");
            DataAccessHelper.AddStringInputParam(com, "Search", searchFilter);
            return DataAccessHelper.GetList(com);
        }

        public DataSet GetPhysicianPatients(int physicianId)
        {
            SqlCommand cmd = DataAccessHelper.CreateCommand("spGetPhysicianPatients");
            DataAccessHelper.AddIntInputParam(cmd, "PhysicianID", physicianId);
            return DataAccessHelper.GetList(cmd);
        }

        //used on insert new patients into dimensions
        public int GetPrimKey(string physicianLastName, string physicianFirstName)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetDatasetDimensionValue");

            DataAccessHelper.AddStringInputParam(com, "Dimension", "Physicians");
            DataAccessHelper.AddStringInputParam(com, "LastName", physicianLastName);
            DataAccessHelper.AddStringInputParam(com, "FirstName", physicianFirstName);
            DataAccessHelper.AddIntOutputParam(com, "OutputValue");

            Hashtable outParams = DataAccessHelper.ExecuteScalar(com);

            if (outParams["OutputValue"] != System.DBNull.Value)
            {
                return (int)outParams["OutputValue"];
            }
            else
            {
                return -1;
            }
        }

        /// <summary>
        /// Returns a list of distinct ProcSurgeon from Procedures table.
        /// </summary>
        /// <returns></returns>
        public DataTable GetDistinctProcSurgeons()
        {
            string sql = "SELECT DISTINCT ProcSurgeon FROM Procedures ORDER BY ProcSurgeon ASC";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets a list of distinct physicians filterd by procedure and service
        /// </summary>
        /// <param name="serviceName"></param>
        /// <param name="procNames"></param>
        /// <returns></returns>
        public DataTable GetDistinctProcSurgeonsByServiceAndProc(string serviceName, string[] procNames)
        {
            string sql = "SELECT DISTINCT ProcSurgeon ";
            sql += "FROM Procedures WHERE ProcService = @ProcService AND ";
            sql += "ProcSurgeon IS NOT NULL AND ";
            sql += "ProcQuality = 'STD' AND ";
            sql += "ProcName IN ('" + string.Join("','", procNames) + "') ";
            sql += "ORDER By ProcSurgeon";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddStringInputParam(com, "ProcService", serviceName);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Returns a list of distinct Physicians from Appointments table.
        /// </summary>
        /// <returns></returns>
        public DataTable GetDistinctApptPhysicians()
        {
            DataTable dt = new DataTable();
            string sql = "SELECT DISTINCT ApptPhysician FROM Appointments ORDER BY ApptPhysician ASC "; 
            
            DataAccessHelper.ExecuteSqlSelect(sql, dt);
            return dt;
        }

        public DataSet GetPhysiciansRecord(int PhysicianId, string FormName, string FormType)
        {
            DataSet ds = new DataSet();

            if (FormType == "Dynamic")
            {
                string sql = "SELECT Physicians.* ";
                sql += "FROM Physicians ";
                sql += "WHERE (PhysicianId = @PhysicianId ) ";
                sql += "ORDER BY Physicians.PhysicianId ASC ";

                SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
                DataAccessHelper.AddIntInputParam(com, "PhysicianId", PhysicianId);

                ds = DataAccessHelper.GetRecord(com);
            }

            return ds;
        }
    }
}
