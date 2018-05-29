using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;



namespace Caisis.DataAccess
{
    /// <summary>
    /// Patient Protocol DataAccess calls procedures.
    /// </summary>
    public class PatientProtocolDa : BaseDA
    {

        public DataSet ValidatePatientProtocol(int PatientId, int ProtocolId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spValidatePatientProtocol");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", ProtocolId);
            return DataAccessHelper.GetList(com);
        }

        //following two methods are used in inserting new patients using dimension from XML- 
        //called from PatientController
        [Obsolete]
        public void InsertPatientProtocolDimension(int patientId, int protocolId, string username, SqlTransaction trans)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spInsertPatientProtocolsRecord", trans);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataAccessHelper.AddStringInputParam(com, "PtProtocolStatus", "");
            DataAccessHelper.AddStringInputParam(com, "PtProtocolNotes", "");
            DataAccessHelper.AddStringInputParam(com, "PtProtocolDataSource", "");
            DataAccessHelper.AddStringInputParam(com, "PtProtocolQuality", "");
            DataAccessHelper.AddStringInputParam(com, "EnteredBy", username);
            DataAccessHelper.AddDateTimeInputParam(com, "EnteredTime", DateTime.Now);
            DataAccessHelper.AddStringInputParam(com, "UpdatedBy", "");
            DataAccessHelper.AddDateTimeInputParam(com, "UpdatedTime", null);
            DataAccessHelper.AddStringInputParam(com, "LockedBy", "");
            DataAccessHelper.AddDateTimeInputParam(com, "LockedTime", null);

            DataAccessHelper.ExecuteScalar(com);
        }

        public DataSet GetPatientProtocol(int patientProtocolId)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientProtocolsRecord");
            DataAccessHelper.AddIntInputParam(com, "PatientProtocolId", patientProtocolId);

            return DataAccessHelper.GetRecord(com);

        }

        public DataTable GetPatientProtocol(int patientId, int protocolId)
        {
            string sql = "SELECT * FROM PatientProtocols WHERE PatientId = @PatientId AND ProtocolId = @ProtocolId";
            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", patientId);
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        public DataSet FormGetRecords(int PatientId, string FormName, string FormType)
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spFormListProtocols");
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "FormName", FormName);
            DataAccessHelper.AddStringInputParam(com, "FormType", FormType);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        public DataTable GetPatientProtocols(int protocolId)
        {
            string sql = "SELECT PatientProtocols.*,Patients.PtFirstName,Patients.PtMiddleName,Patients.PtLastName ";
            sql += "FROM PatientProtocols ";
            sql += "INNER JOIN Patients ";
            sql += "ON PatientProtocols.PatientId = Patients.PatientId ";
            sql += "WHERE PatientProtocols.ProtocolId = @ProtocolId";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "ProtocolId", protocolId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }

        /// <summary>
        /// Gets patient records of protocol and status for Thoracic eform
        /// </summary>
        /// <param name="PatientId"></param>
        /// <param name="Status"></param>
        /// <returns></returns>
        public DataSet GetPatientProtocolsByStatus(int PatientId, string ProtocolNum1, string ProtocolNum2, string PtProtocolStatus)
        {
            string sql = @"
                SELECT * FROM PatientProtocolStatus pps
                INNER JOIN PatientProtocols pp ON pp.PatientProtocolId=pps.PatientProtocolId
                INNER JOIN Protocols p ON p.ProtocolId=pp.ProtocolId
                WHERE pp.PatientId=@PatientId 
                AND (p.ProtocolNum=@ProtocolNum1 OR p.ProtocolNum=@ProtocolNum2) 
                AND pps.PtProtocolStatus=@PtProtocolStatus
                ORDER BY pps.PtProtocolStatusDateText,p.ProtocolNum,pps.PtProtocolStatus ";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataAccessHelper.AddStringInputParam(com, "ProtocolNum1", ProtocolNum1);
            DataAccessHelper.AddStringInputParam(com, "ProtocolNum2", ProtocolNum2);
            DataAccessHelper.AddStringInputParam(com, "PtProtocolStatus", PtProtocolStatus);
            DataSet ds = DataAccessHelper.GetList(com);

            return ds;
        }

        /// <summary>
        /// Gets protocols and their statuses by patient, for 'Spine Details' eform
        /// </summary>
        /// <param name="PatientId"></param>
        /// <returns></returns>
        public DataTable GetPatientProtocolStatus(int PatientId)
        {
            string sql = "select DISTINCT pt.PatientId,ProtocolNum,ProtocolTitle,pps.* from Patients pt ";
            sql += "INNER JOIN patientprotocols pp ON pp.PatientId=pt.PatientId ";
            sql += "INNER JOIN protocols p on p.ProtocolId=pp.ProtocolId ";
            sql += "INNER JOIN patientprotocolstatus pps on pp.PatientProtocolId=pps.PatientProtocolId ";
            sql += "WHERE pt.PatientId = @PatientId ORDER BY ProtocolNum,pps.PtProtocolStatusDate";

            SqlCommand com = DataAccessHelper.CreateSqlCommand(sql);
            DataAccessHelper.AddIntInputParam(com, "PatientId", PatientId);
            DataTable dt = DataAccessHelper.GetRecord(com).Tables[0];
            return dt;
        }


        /* patient protocols now has primary key so no need to add methods
        public DataSet GetPatientPhysicianRecord(int primKey, int primKeyTwo)  
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spGetPatientPhysicianRecord");
            DataAccessHelper.AddIntInputParam(com, "PatientId", primKey);
            DataAccessHelper.AddIntInputParam(com, "PhysicianId", primKeyTwo);
            return DataAccessHelper.GetRecord(com);
        }

        public bool DeletePatientPhysicianRecord(int primKey, int primKeyTwo)  
        {
            SqlCommand com = DataAccessHelper.CreateCommand("spDeletePatientPhysicianRecord");
            DataAccessHelper.AddIntInputParam(com, "PatientId", primKey);
            DataAccessHelper.AddIntInputParam(com, "PhysicianId", primKeyTwo);
            DataAccessHelper.ExecuteScalar(com);
            return true;
        }
        */
    }
}