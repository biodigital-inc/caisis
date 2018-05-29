using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;

namespace Caisis.Controller
{
	/// <summary>
	/// Extends PatientController, allowing us to encapsulate saving patient
	/// and appointment data within the same transaction
	/// </summary>
	public class PatientAppointmentController : PatientController
	{
		// in lieu of a business object
		private static readonly string APPT_SQL = "INSERT INTO Appointments (ApptPatientId, ApptFirstName, ApptLastName, ApptMRN, ApptPhysician, ApptClinicDate, ApptTime, ApptDept, ApptVisitType, ApptNotes, EnteredBy, EnteredTime, UpdatedBy, UpdatedTime) VALUES (@ApptPatientId, @ApptFirstName, @ApptLastName, @ApptMRN, @ApptPhysician, @ApptClinicDate, @ApptTime, @ApptDept, @ApptVisitType, @ApptNotes, @EnteredBy, @EnteredTime, @UpdatedBy, @UpdatedTime)";
		
		public PatientAppointmentController() : base() { }

		/// <summary>
		/// Allows us to encapsulate saving patient and appointment data within the same transaction
		/// </summary>
		/// <param name="args"></param>
		/// <param name="datasetId"></param>
		/// <returns></returns>
		public DataSet InsertPatientAndAppointmentRecord(DataSet args, int datasetId, Hashtable AppointmentArgs)
		{
			// much of this was stolen from PatientController.InsertRecord(..., ...)
			SqlTransaction trans = null;
			DataRow dr = args.Tables[0].Rows[0];
			try 
			{
				// removed temporarily until transactions tested -2/21 spy
				trans = DataAccessHelper.BeginTransaction();
				int patientId = (int)this._InsertRecord(dr, trans);
				DataTable dt = this.InsertDatasetDimensions(patientId, datasetId, trans);
				if (dt != null)  
				{
					args.Tables.Add(dt);
				}

				// now insert the appointment
				this.InsertAppointmentRecord(AppointmentArgs, patientId, trans);

				trans.Commit(); 
				dr[Patient.PatientId] = patientId;
			}
			catch (Exception ex)  
			{
				if (trans != null)  
				{
					trans.Rollback();
				}
				throw(ex);
			}
			finally
			{   
				if (trans != null)  
				{
					SqlConnection conn = trans.Connection;
					trans.Dispose();
					if (conn != null)  
					{
						conn.Close();
					}
				}
			}
			return args;
		}

		public void InsertAppointmentRecord(Hashtable appointmentArgs, int patientId)
		{
			SqlTransaction trans = null;
			try
			{
				trans = DataAccessHelper.BeginTransaction();
				InsertAppointmentRecord(appointmentArgs, patientId, trans);
				trans.Commit();
			}
			catch (Exception e)
			{
				if (trans != null)  
				{
					trans.Rollback();
				}
				throw(e);
			}
			finally
			{
				if (trans != null)  
				{
					SqlConnection conn = trans.Connection;
					trans.Dispose();
					if (conn != null)  
					{
						conn.Close();
					}
				}
			}
			
			
		}
		
		// sometimes occures in a transaction with insertion of new patient record
		public void InsertAppointmentRecord(Hashtable appointmentArgs, int patientId, SqlTransaction trans)
		{
			// add our appointment stuff here
			SqlCommand apptcmd = DataAccessHelper.CreateCommand(APPT_SQL, trans); // use the transaction from above, somehow
			apptcmd.CommandType = CommandType.Text;
			DataAccessHelper.AddIntInputParam(apptcmd, "ApptPatientId", patientId);
			DataAccessHelper.AddStringInputParam(apptcmd, "ApptFirstName", (string) appointmentArgs["ApptFirstName"]);
			DataAccessHelper.AddStringInputParam(apptcmd, "ApptLastName", (string) appointmentArgs["ApptLastName"]);
			DataAccessHelper.AddStringInputParam(apptcmd, "ApptMRN", (string) appointmentArgs["ApptMRN"]);
			DataAccessHelper.AddStringInputParam(apptcmd, "ApptPhysician", (string) appointmentArgs["ApptPhysician"]);
			DataAccessHelper.AddStringInputParam(apptcmd, "ApptVisitType", (string) appointmentArgs["ApptVisitType"]);
			DataAccessHelper.AddStringInputParam(apptcmd, "ApptDept", (string) appointmentArgs["ApptDept"]);
			DataAccessHelper.AddStringInputParam(apptcmd, "ApptNotes", (string) appointmentArgs["ApptNotes"]);
			DataAccessHelper.AddDateTimeInputParam(apptcmd, "ApptClinicDate", (DateTime) appointmentArgs["ApptClinicDate"]);
			DataAccessHelper.AddDateTimeInputParam(apptcmd, "ApptTime", (DateTime) appointmentArgs["ApptTime"]);

			SecurityController sc = new SecurityController();
			string username = sc.GetUserName();
			DateTime now = DateTime.Now;
			DataAccessHelper.AddStringInputParam(apptcmd, "EnteredBy", username);
			DataAccessHelper.AddDateTimeInputParam(apptcmd, "EnteredTime", now);
			DataAccessHelper.AddStringInputParam(apptcmd, "UpdatedBy", username);
			DataAccessHelper.AddDateTimeInputParam(apptcmd, "UpdatedTime", now);

			apptcmd.ExecuteNonQuery();
		}
		
	}
}
