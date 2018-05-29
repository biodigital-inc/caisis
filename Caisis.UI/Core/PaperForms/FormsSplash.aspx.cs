using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.PaperForms
{
	/// <summary>
	/// Summary description for FormsSplash.
	/// </summary>
	public partial class FormsSplash : BasePage
	{
		protected string currentClinicDate;
// EFormLink;


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			// check if new clinic date was submitted
			if (Request.Form.HasKeys() && Request.Form["clinicDate"] != null)
			{
				currentClinicDate = Request.Form["clinicDate"].ToString();
				Session[SessionKey.CurrentClinicDate] = Request.Form["clinicDate"].ToString();
			}
			else
			{
                SessionHandler sh = new SessionHandler(this.Page.Session);
                currentClinicDate = sh.GetCurrentClinicDate();
			}

			clinicDate.Value = currentClinicDate;





			if (Session[SessionKey.CurrentListCrit] != null &&  Session[SessionKey.CurrentListCrit].ToString().Length > 0 && Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().Length > 0)  
			{
				string listType = Session[SessionKey.CurrentListType].ToString();
				string listCrit = Session[SessionKey.CurrentListCrit].ToString();
				string listCritName = "";

				if (Session[SessionKey.CurrentListCritName] != null)
				{
					listCritName = Session[SessionKey.CurrentListCritName].ToString();
				}


				switch (listType)
				{
					case "Clinic":
						formSplashCurrentClinic.Text = listCrit + "<br/>on " + currentClinicDate;
						break;
					case "Protocol":
						if(!listCritName.Equals(""))
						{
							formSplashCurrentClinic.Text = "Patients in<br/>" + listType + " " + listCritName;
						}
						else
						{
							formSplashCurrentClinic.Text = listType;
						}
						clinicDateCal.Visible = false;
						break;
					case "Physician":
						if(!listCritName.Equals(""))
						{
							formSplashCurrentClinic.Text = "Patients who have visited<br/>"+ listCritName;
						}
						else
						{
							formSplashCurrentClinic.Text = listType;
						}
						clinicDateCal.Visible = false;
						break;
					case "lastname":
						if(listCrit.Equals("All"))
						{
							formSplashCurrentClinic.Text = "All Patients";
						}
						else
						{
							formSplashCurrentClinic.Text = "Patients with Last Names<br/>Beginning with the Letter \"" + listCrit + "\"";

						}
						clinicDateCal.Visible = false;
						break;
					case "ContactStatus":
						formSplashCurrentClinic.Text = "Patients on the Following List:<br/>Contact Status -  " + listCrit;
						clinicDateCal.Visible = false;
						break;
					case "ItemsMissing":
						formSplashCurrentClinic.Text = "Patients with Missing Items";
						clinicDateCal.Visible = false;
						break;
					case "ItemsPending":
						formSplashCurrentClinic.Text = "Patients with Pending Items";
						clinicDateCal.Visible = false;
						break;
					default:
						formSplashCurrentClinic.Text = "Patients on the Following List:<br/>" + listType + " -  " + listCrit;
						clinicDateCal.Visible = false;
						break;
				}

			}
			else
			{
				clinicDateCal.Visible = false;
				batchPrintLink.HRef = "javascript:;";
				batchPrintLink.Attributes["onclick"] = "top.window.location='../PatientLists/PatientListPage.aspx';";
				printForms.Src = "../../Images/PrintFormsForAListOfPatients.gif";
				printForms.Width = 88;
				printForms.Height = 75;
			}


			if (Session[SessionKey.PatientId] == null || Session[SessionKey.PatientId].ToString() == "")
			{
				//				currentPatientLink.HRef = "javascript:top.noPatientInSessionRedirect();";
				//				currentPatientLink.Attributes.Add("onclick", "top.noPatientInSessionRedirect();");
				printFormForCurrentPatient.Attributes.Add("onclick", "top.noPatientInSessionRedirect();");
				printFormForCurrentPatient.Attributes.Add("style", "cursor:hand;");
				currentPatientLink.HRef = "";

				//EFormLink.Attributes["onclick"] = "top.noPatientInSessionRedirect();";


			}
			//else
			//{
			//	EFormLink.Attributes["onclick"] = "top.location='../Eforms/Index.aspx?eform=" + Server.UrlEncode("Prostate Surgery EForm") + "';";
			//}



			

			clinicDateCal.Attributes.Add("onClick", "showCal(this, dataForm." + clinicDate.ClientID.ToString() + ");");

		}
	}
}
