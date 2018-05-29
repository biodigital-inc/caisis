using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.DataAccess;
using Caisis.Security;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities
{
	/// <summary>
	/// Summary description for AddNewPatientAndAppt.
	/// </summary>
	public partial class AddNewPatientAndAppt : BasePage
	{
		#region controls from the page
        //2.0 protected Repeater rptToolTip;
		private AppointmentDa aptDa = new AppointmentDa();
		#endregion

		private SessionHandler sessionHandler;

		protected override void Page_Load(object sender, EventArgs e)
		{
			base.Page_Load (sender, e);

			sessionHandler = new SessionHandler(this.Page);

			errMsg.Message = null;
			saveBtn.Attributes.Add("onClick","if(!validateRequiredFields()){return false;};");

			// shouldn't we check for add patient permissions here?
			PopulatePhysicians();  // d/n match the physicians in the Appointments table - SOLUTION = SELECT DISTINCT(ApptPhysician) ?
			PopulateClinicDate();
			PopulateDepartments();
			PopulateVisitTypes();
//			PopulateHelpBubbles();

			if ("addnew".Equals(Request["confirm"]))
			{
				PageText.Text = "The patient and appointment were added to the database.  You may add another patient below, or <a href=\"\" onClick=\"parent.ClosePopup();\">close this screen</a> using the close button at the top right of this window.";
			}
			else if ("addold".Equals(Request["confirm"]))
			{
				PageText.Text = "The appointment was added to the database.  You may add another patient below, or <a href=\"\" onClick=\"parent.ClosePopup();\">close this screen</a> using the close button at the top right of this window.";
			}

			PageUtil.AddCalendarFunction(AppointmentDateCal, AppointmentDate);
			Page.RegisterArrayDeclaration("requiredFieldArray","'"+PtLastName.ClientID+"', '"+PtMRN.ClientID+"', '"+ApptPhysician.ClientID+"', '"+AppointmentDate.ClientID+"', '"+AppointmentTime.ClientID+"' ");
		}

/*		protected BusinessObject GetParams()
		{
			Patient biz = new Patient();
			DataRow dr = biz.Tables[Patient.Table_Patients].NewRow();
			
			dr[Patient.PtMRN] = PtMRN.Value;
			dr[Patient.PtFirstName] = PtFirstName.Value;
			dr[Patient.PtLastName] = PtLastName.Value;
			

			biz.Tables[Patient.Table_Patients].Rows.Add(dr);
			biz.AcceptChanges();
			return biz;
		}
*/


        protected Patient GetParams()
        {

            Patient biz = new Patient();

            //biz.NewRow();



            biz[Patient.PtMRN] = PtMRN.Value;

            biz[Patient.PtFirstName] = PtFirstName.Value;

            biz[Patient.PtLastName] = PtLastName.Value;



//            biz.Save(); // Not sure if you need to call??

            return biz;

        }

		protected void onBtn_Click(object sender, CommandEventArgs e)
		{
			if (PermissionManager.HasPermission("AddPatient"))  
			{
				bool validDates = this.ValidateApptDateTime();

				if (validDates)
				{
					// load the hashtable with values
					Hashtable apptParams = new Hashtable();
					apptParams["ApptMRN"] = PtMRN.Value;
					apptParams["ApptFirstName"] = PtFirstName.Value;
					apptParams["ApptLastName"] = PtLastName.Value;
                    apptParams["ApptPhysician"] = ApptPhysician.Value;// Request.Form[ApptPhysician.ID];
					apptParams["ApptDept"] = Request.Form[ApptDept.ID];
					apptParams["ApptVisitType"] = Request.Form[ApptVisitType.ID];
					apptParams["ApptNotes"] = ApptNotes.Value;
					apptParams["ApptClinicDate"] = DateTime.Parse(AppointmentDate.Value);
					apptParams["ApptTime"] = DateTime.Parse(AppointmentDate.Value + " " + AppointmentTime.Value);
			
					PatientDa pda = new PatientDa();
					DataTable pdt = pda.GetPatientByMRN(PtMRN.Value);
				
					PatientAppointmentController apct = new PatientAppointmentController();
						
					// verify new MRN
/*					if (pdt.Rows.Count == 0)
					{
						// insert new patient record and the appointment
						BusinessObject bz = GetParams();
						DataSet ds = apct.InsertPatientAndAppointmentRecord(bz, (int) Session[SessionKey.DatasetId], apptParams);
						UpdateSession(ds.Tables[0].Rows[0]);

						// reload page - can we pass a confirmation message to the page?
						Response.Redirect("AddNewPatientAndAppt.aspx?confirm=addnew");
					
					}
 */

                    // verify new MRN

                    if (pdt.Rows.Count == 0)
                    {

                        // insert new patient record and the appointment

                        Patient bz = GetParams();

                        DataSet ds = apct.InsertNewPatientRecord(bz, (int)Session[SessionKey.DatasetId]);

                        apct.InsertAppointmentRecord(apptParams, int.Parse(bz[Patient.PatientId].ToString()));

                      // UpdateSession(ds.Tables[0].Rows[0]);



                        // reload page - can we pass a confirmation message to the page?

                        Response.Redirect("AddNewPatientAndAppt.aspx?confirm=addnew");



                    }
					else // mrn is already in database
					{
						// mrn already exists.. is the last name a match? 
						if( PtLastName.Value != "" && pdt.Rows[0][Patient.PtLastName].ToString().ToUpper().Equals(PtLastName.Value.ToUpper()) )
						{
							int pid = Convert.ToInt32(pdt.Rows[0][Patient.PatientId]);

							// use first name from database if it was not provided
							if(PtFirstName.Value.Equals(""))
							{
								apptParams["ApptFirstName"] = pdt.Rows[0][Patient.PtFirstName].ToString();
							}

							// last name and MRN are a match, add patient to appointments table
							apct.InsertAppointmentRecord(apptParams, pid);


                            UpdateSession(pid);

							// reload page and display confirmation message
							Response.Redirect("AddNewPatientAndAppt.aspx?confirm=addold");
						}
						else if( PtLastName.Value == "" )
						{
							// last name was blanks so lets find out if this is the right patient
							errMsg.Message = "Please enter the patients last name and MRN.";
						}
						else // tell user they can't use this combination of last name and mrn
						{
							errMsg.Message = "This MRN is already in use by patient " + pdt.Rows[0][Patient.PtFirstName].ToString() + " " + pdt.Rows[0][Patient.PtLastName].ToString() + ".";
						}
					}
				}
			}
		}

		#region various utility methods
		private void PopulateDepartments()
		{
			// datasource for department should be select distinct(apptdept) from appointments
			// DataTable departments = GetDataTable(DEPT_SQL);
			DataTable departments = aptDa.GetDistinctAppointmentDepartments();
			ApptDept.DataSource = departments.DefaultView;
			ApptDept.DataTextField = "ApptDept";
			ApptDept.DataValueField = "ApptDept"; // does this need to be escaped?
			ApptDept.DataBind();
			ApptDept.Items.Insert(0, new ListItem("",""));
		}

		private void PopulatePhysicians()
		{
			// only populate when item is not already selected
			if(Request.Form[ApptPhysician.ID] == null || Request.Form[ApptPhysician.ID].Equals(""))
			{
				/* v3.5
                // Page.RegisterClientScriptBlock("ApptPhysician", PageUtil.FillComboDropDown(ApptPhysician.RefBy, "ApptPhysician"));
				aptDa = new AppointmentDa();
				// Page.RegisterClientScriptBlock("ApptPhysician", PageUtil.FillComboDropDown(ApptPhysician.RefBy, aptDa.GetDistinctAppointmentPhysicians().Tables[0].DefaultView, "ApptPhysician", "ApptPhysician"));
				ApptPhysician.DataSource = aptDa.GetDistinctAppointmentPhysicians().Tables[0].DefaultView;
				ApptPhysician.DataTextField = "ApptPhysician";
				ApptPhysician.DataValueField = "ApptPhysician";
				ApptPhysician.DataBind();
				ApptPhysician.Items.Insert(0, new ListItem("",""));

				// default to clinic physician when no value present
				if( Session[SessionKey.CurrentListCrit] != null )
				{
					string clinicDoc = Session[SessionKey.CurrentListCrit].ToString();
					if(clinicDoc.Length > 0 && ApptPhysician.Items.FindByValue(clinicDoc) != null )
					{
					
						ApptPhysician.Items.FindByValue(clinicDoc).Selected = true;
					}
				}
                */

                // v4
                if (Session[SessionKey.CurrentListCrit] != null && Session[SessionKey.CurrentListCrit].ToString().Length > 0)
                {
                    ApptPhysician.Value = Session[SessionKey.CurrentListCrit].ToString();
                }
                
			}
		}

		private void PopulateClinicDate()
		{
			if(Session[SessionKey.CurrentClinicDate] != null && AppointmentDate.Value.Equals("") )
			{
				AppointmentDate.Value = Session[SessionKey.CurrentClinicDate].ToString();
			}
		}

		private void PopulateVisitTypes()
		{
			// change this to select distinct
			PageUtil.FillLkpDropDown(ApptVisitType, "EncType", ViewState);
		}

		private void PopulateHelpBubbles()
		{
			//DataTable dt = GetDataTable(AddNewPatientAndAppt.HELP_SQL);
			DataTable dt = aptDa.GetAppointmentsMetadata();

			if (dt != null)  
			{
				rptToolTip.DataSource = dt;
				rptToolTip.DataBind();
			}
		}
		
		private bool ValidateApptDateTime()
		{
			DateTime basedate = DateTime.MinValue;
			DateTime parsedDateTime = DateTime.MinValue;
			try
			{
				// validate dates
				basedate = DateTime.Parse(AppointmentDate.Value);
				parsedDateTime = DateTime.Parse(AppointmentDate.Value + " " + AppointmentTime.Value);
				return true;
			}
			catch
			{
				errMsg.Message = "Please enter a valid date and time";
				return false;
			}
	
		}

        /// <summary>
        /// Places patient in session and log patient view
        /// </summary>
        /// <param name="ptId"></param>
		private void UpdateSession(int ptId)
		{
            PatientController ptController = new PatientController();
            ptController.PutPatientInSession(Page, ptId);
		}

		
		#endregion
	}

	#region utility exception class
	/// <summary>
	/// Allows some custom error handling
	/// </summary>
	#endregion
}
