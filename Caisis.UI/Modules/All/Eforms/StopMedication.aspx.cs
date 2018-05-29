using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.All.Eforms
{
	// called via ajax
	public partial class StopMedication : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			int medicationId;
			int patientId = int.Parse(Session[SessionKey.PatientId].ToString());
			
			if (int.TryParse(Request.Form["medicationId"], out medicationId))
			{
				Response.Write(StopMedicationToday(patientId, medicationId));
			}
		}

		private string StopMedicationToday(int patientId, int medicationId)
		{
			Medication medication = new Medication();

			medication.Get(medicationId);

			//if (medication.RecordCount < 1)
			if (medication.IsEmpty)
			{
				return ""; // should we return an error or nothing?
			}

			medication.EnableSaveValidation(patientId);

			DateTime today = DateTime.Now.Date;
			string todayStr = today.ToShortDateString();

			medication[Medication.MedStopDate] = today;
			medication[Medication.MedStopDateText] = todayStr;

			medication.Save();

			return todayStr;
		}
	}
}
