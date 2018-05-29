using System;
using System.Data;

using Caisis.Security;
using Caisis.BOL;
using Caisis.Controller;
using Caisis.DataAccess;

namespace Caisis.UI.Core.Classes
{
    /// <summary>
    /// Main outer frame page in each section inherits from FramePage. Handles putting new patients in session. 
    /// </summary>
    /// <remarks>FramePage takes patientId in QueryString, checks that 
    /// patient is in database if user is coming from the clinic, logs that 
    /// the user viewed the patient and sets the patient session variables.
    /// </remarks>
    public class FramePage : BasePage
    {

        override protected void Page_Load(object sender, System.EventArgs e)
        {

            // this logic can be moved someplace else if better suited
            //Should take encrypted patientId and returns patientMRN, Last Name, First Name
            if (Request.QueryString.Get("epid") != null && !Request.QueryString.Get("epid").Equals(""))
            {
                int patientId = int.Parse(CustomCryptoHelper.Decrypt((string)Request.QueryString.Get("epid")));
                // this clause is true only if you are arriving at this page by clicking on a patient
                // in a clinic list.  Checks if the patient is in the Patients table, possibly not true since
                // patients can be deleted from the patients table
                if (Request.QueryString["verifyPatientId"] != null && Request.QueryString["verifyPatientId"].ToUpper() == "TRUE")
                {
                    Patient pt = new Patient();
                    pt.Get(patientId);
                    //if (pt.DataSourceView.Table.Rows.Count > 0)
					if (!pt.IsEmpty)
                    {
                        this.SetPatientSessionVariables(patientId);
                    }
                    else
                    {
                        //Response.Redirect("../PatientList/PatientListPage.aspx?selectedPatientDeleted=true");
                        Server.Transfer("../PatientLists/PatientListPage.aspx?selectedPatientDeleted=true");
                    }
                }
                else
                {
                    this.SetPatientSessionVariables(patientId);
                }
            }

            base.Page_Load(sender, e); // disables view state
        }

        /// <summary>
        /// Logs view of patient and updates session with current patient information
        /// </summary>
        /// <param name="patientId"></param>
        protected void SetPatientSessionVariables(int patientId)
        {
            if (patientId != 0)
            {
                PatientController ptController = new PatientController();
                ptController.PutPatientInSession(Page, patientId);
            }
        }
    }
}
