using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;

using Caisis.Controller;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.PatientLists
{
	/// <summary>
	/// PatListContent gets lists of patients based on selected menu option.
	/// List is based on list type and list criteria (eg List Type = Last Name, List Criteria = A)
	/// </summary>
	/// 

	public partial class PatListContent : ListPage
	{
		protected string listTitle;
		protected int startRow;
		protected int endRow;	
		protected int recordCount = 0;
		protected string recordMemo = "";
		protected string currentClinicDate;
		//protected System.Web.UI.HtmlControls.HtmlTable clinicListTable;

		protected string sortColumn = "";
		protected string listType = "";
		protected string listCrit = "";
		protected string listCritName = "";  // Also using listCritName for Category type so we don't have to create a new var and session var - jf
		protected string listMod = "";
		protected string listUser = "";

		protected Literal eformStatus;

        private bool canDeletePatient = false;
        
	

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			//TODO: confirm a dataset id is in session or throw user out

            base.RedirectOnTimeout();

            // delete clinic list patient logic
            canDeletePatient = Caisis.Security.PermissionManager.HasPermission(PermissionManager.DeletePatient);
            if (canDeletePatient)
            {
                string deleteClinicApptId = Request.QueryString["deleteClinicApptId"];
                if (!string.IsNullOrEmpty(deleteClinicApptId))
                {
                    int apptId = int.Parse(deleteClinicApptId);
                    BOL.Appointment appt = new BOL.Appointment();
                    appt.Delete(apptId);
                    Response.End();
                }
            }

			//
			// Show this message if user is being redirected from a page that requires a patient in session.
			//
			if (Request.QueryString.HasKeys() && Request.QueryString["patientSession"] != null && Request.QueryString["patientSession"].ToUpper() == "FALSE")
			{
				splashMessage.Text = "You must select a patient before attempting to perform that function.";
//				patientListSplashLayer.Attributes["style"] = "border-right: #000000 1px; border-top: #000000 1px; z-index: 7; left: 0px; visibility: visible; border-left: #000000 1px; background-color: #f8fafc; border-bottom: #000000 1px; position: absolute; top: 0px;";
                patientListSplashLayer.Visible = true;
                //pageCoverImage.Visible= false;
                // Replace conver image by hiding/showing table
//                PatContentLayer.Style.Add("display", "table");
			}		

			//
			// Set Clinic Date Variable		
			//
			this.SetClinicDate();

			//
			// Set listType Variable
			//
			this.SetListType();

			//
			// Set list criteria variable
			//
			this.SetListCriteriaValue();

			//
			// Set list criteria name
			//
			this.SetListCriteriaName();
		
			//
			// Set list sort order
			//
			this.SetListSortOrder();

			//
			// Show blank screen if no list has been selected
			//
			if (listType.Equals("") || listCrit.Equals(""))  
			{
//				patientListSplashLayer.Attributes["style"] = "border-right: #000000 1px; border-top: #000000 1px; z-index: 7; left: 0px; visibility: visible; border-left: #000000 1px; background-color: #f8fafc; border-bottom: #000000 1px; position: absolute; top: 0px;";
                patientListSplashLayer.Visible = true;
                //pageCoverImage.Visible = true;
                // Replace conver image by hiding/showing table
                PatContentLayer.Style.Add("display", "none");
				if (Request.QueryString.HasKeys() && Request.QueryString.Get("patientListMessage") != null && Request.QueryString.Get("patientListMessage").Length > 0)
				{
					splashMessage.Text = Request.QueryString.Get("patientListMessage").ToString();
				}
			}
			//
			// Get the list of patients
			//
			else
			{	
				this.GetPatientList();
			}
			
			clinicDateCal.Attributes.Add("onClick", "showCal(this, dataForm." + clinicDate.ClientID.ToString() + ");");
		
		}

		protected void GetPatientList()
		{
			if (!listType.Equals("") && !listCrit.Equals(""))  
			{
				PatientListController ct = new PatientListController();
				DataSet ds = null; 

				if(Request.QueryString.HasKeys() && Request.QueryString["startRow"] != null)
				{
					startRow = int.Parse(Request.QueryString["startRow"]);
				}

				// set number of patients to list per page; default is 200
				int numRecords = 200;
				
				// get list of patients
				string dsSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);				
				ds = ct.GetList(dsSQL, listType, listCrit, listMod, sortColumn, startRow, numRecords, currentClinicDate, listUser);
				
				//
				// Set the title of the list
				//
				this.SetPatientListTitle();

                // default hide everything
                clinicListTableTitles.Visible = false;
                inPatientTableTitles.Visible = false;
                patientListTableTitles.Visible = false;
                missedPendingTableTitles.Visible = false;
                clinicDateCal.Visible = false;

				//set record count and displaying records string for display
				if (ds.Tables.Count > 0)  
				{
		        	// clinic list has its own table headers
					if (listType == "Clinic")
					{
						clinicListTableTitles.Visible = true;
						clinicDateCal.Visible = true;

                        DataColumn isDupeAppt = new DataColumn("isDupeAppt");
                        isDupeAppt.DataType = typeof(bool);
                        ds.Tables[0].Columns.Add(isDupeAppt);

                        List<int> uniqueAppointments = new List<int>();

                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            if (!uniqueAppointments.Contains((int)dr[BOL.Appointment.AppointmentId]))
                            {
                                uniqueAppointments.Add((int)dr[BOL.Appointment.AppointmentId]);
                                dr["isDupeAppt"] = false;
                            }
                            else
                            {
                                dr["isDupeAppt"] = true;
                            }
                        }

                        DataView dv = new DataView(ds.Tables[0]);
                        dv.RowFilter = "isDupeAppt = 0";


                        rptClinic.DataSource = dv;
                        rptClinic.DataBind();

						//recordCount = (int)ds.Tables[0].Rows.Count;
						//recordMemo = recordCount + " patients returned";
					}
				
					// in patient list has its own titles table headers
					else if(listType == "InPatient")
					{
						inPatientTableTitles.Visible = true;

						rptInPatients.DataSource = ds.Tables[0].DefaultView;
						rptInPatients.DataBind();

						//recordCount = (int)ds.Tables[0].Rows.Count;
						//recordMemo = recordCount + " patients returned";
					}

					// missing and pending item lists have their own table header
					else if(listType == "ItemsMissing" || listType == "ItemsPending")
					{
						missedPendingTableTitles.Visible = true;

						rptMissedPendingItems.DataSource = ds.Tables[0].DefaultView;
						rptMissedPendingItems.DataBind();
					}
						
					// all other lists use patientListTableTitles
					else
					{
						patientListTableTitles.Visible = true;

						rptPatient.DataSource = ds.Tables[0].DefaultView;
						rptPatient.DataBind();
					}

					// three sp's used to retrieve patient lists and they all have an output parameter returning a record count
					recordCount = (int)ds.Tables[0].ExtendedProperties[ExtendedProperty.RowCount];
					//recordCount = (int)ds.Tables[0].Rows.Count;
						
					startRow = 0;
					endRow = 200;

                    if (recordCount < 1)
                    {
                        noPatientsRow.Visible = true;
                    }
				
					if (recordCount > 200)  	
					{
						if(Request.QueryString.HasKeys() && null != Request.QueryString["startRow"])
						{
							startRow = int.Parse(Request.QueryString["startRow"]);
							endRow = startRow+200;
							if(endRow > recordCount)
							{
								endRow = recordCount;
							}
						}
						recordMemo = "Displaying "+startRow+" to "+endRow+" of "+recordCount+" patients";
					}
					else
					{
						recordMemo = recordCount+" patients returned";
					}

				

					if (recordCount == 0)
					{
						BatchPrintButton.Visible = false;
					}

				}

				else // no records in datatable
				{
					BatchPrintButton.Visible = false;
					recordMemo = "0 patients returned";
                    noPatientsRow.Visible = true;
				}
						
			}
		}

		protected void SetPatientListTitle()
		{
			// set the page title and also set listMod for category list
			switch (listType)
			{
				case "Protocol":
					if(!listCritName.Equals(""))
					{
						listTitle = listType + " " + listCritName;
					}
					else
					{
						listTitle = listType;
					}
					break;

				case "Physician":
					if(!listCritName.Equals(""))
					{
						// listTitle = listType +" List for "+ listCritName;
						listTitle = "Patient List for "+ listCritName;
					}
					else
					{
						listTitle = listType;
					}
					break;

				case "Clinic":
					listTitle = listType +" List for " + listCrit + " on " + currentClinicDate;
					break;

				case "InPatient":
					listTitle = listType +" List for " + listCrit;
					break;

				case "lastname":
					if(listCrit.Equals("All"))
					{
						listTitle = "All Patients";
					}
					else
					{
						listTitle = "Patients with Last Names Beginning with \"" + listCrit + "\"";
					}
					break;

				case "ContactStatus":
					listTitle = "Contact Status:  " + listCrit;
					break;

				case "ItemsMissing":
					listTitle = "Patients with Missing Items";
					break;

				case "ItemsPending":
					listTitle = "Patients with Pending Items";
					break;

				default:
					listTitle = listType + ":  " + listCrit;
					break;
			}

		}
		
        protected void SetClinicDate()
		{
			
			if (Request.Form.HasKeys() && Request.Form["clinicDate"] != null)
			{
				currentClinicDate = Request.Form["clinicDate"].ToString();
				Session[SessionKey.CurrentClinicDate] = Request.Form["clinicDate"].ToString();
			}
			else
			{
                SessionHandler sh = new SessionHandler(this.Page.Session);
                currentClinicDate = sh.GetCurrentClinicDate();

                /*if (Session[SessionKey.CurrentClinicDate] != null && Session[SessionKey.CurrentClinicDate].ToString() != "")
				{
					currentClinicDate = Session[SessionKey.CurrentClinicDate].ToString();
				}
				else
				{
                    currentClinicDate = System.DateTime.Now.ToShortDateString(); // Date.ToString("MM/dd/yyyy");
                    Session[SessionKey.CurrentClinicDate] = currentClinicDate;
				}*/
			}

			clinicDate.Value = currentClinicDate;
			listMod = currentClinicDate; // for 3.1 appointments fix
		}
		
        protected void SetListType() // listType is same as 
		{
			if (Request.QueryString.HasKeys() && Request.QueryString.Get("listType") != null)  
			{
				listType = Request.QueryString.Get("listType").ToString();
				Session[SessionKey.CurrentListType] = listType;
			}
			else if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().Length > 0)  
			{
				listType = Session[SessionKey.CurrentListType].ToString();
			}
		}
		
        protected void SetListCriteriaValue()
		{
			if (Request.QueryString.HasKeys() && Request.QueryString.Get("listCrit") != null)  
			{
				listCrit = Request.QueryString.Get("listCrit").ToString();
				Session[SessionKey.CurrentListCrit] = listCrit;
			}
			else if (Session[SessionKey.CurrentListCrit] != null && Session[SessionKey.CurrentListCrit].ToString().Length > 0)  
			{
				listCrit = Session[SessionKey.CurrentListCrit].ToString();
			}

		}
		
        protected void SetListCriteriaName()
		{
			if (Request.QueryString.HasKeys() && Request.QueryString.Get("listCritName") != null)
			{
				listCritName = Request.QueryString.Get("listCritName").ToString();
				Session[SessionKey.CurrentListCritName] = listCritName;

				// this is here so we don't have to set up another session var
				if (listType.ToUpper().Equals("CATEGORY"))
				{
					listMod = listCritName;
					
					// if category is not public, the list is user-specific
					if (listMod.ToUpper() != "PUBLIC")
					{
						SecurityController ct = new SecurityController();
						listUser = ct.GetUserName();
					}
				}
			}
			else if (Session[SessionKey.CurrentListCritName] != null && Session[SessionKey.CurrentListCritName].ToString().Length > 0)  
			{
				listCritName = Session[SessionKey.CurrentListCritName].ToString();

				// this is here so we don't have to set up another session var
				if (listType.ToUpper().Equals("CATEGORY"))
				{
					listMod = listCritName;

					// if category is not public, the list is user-specific
					if (listMod.ToUpper() != "PUBLIC")
					{
						SecurityController ct = new SecurityController();
						listUser = ct.GetUserName();
					}
				}
			}
		}
		
        protected void SetListSortOrder()
		{

			if (Request.QueryString.HasKeys() && null != Request.QueryString["sortColumn"])
			{
				sortColumn = Request.QueryString["sortColumn"];
			}
			else if (listType == "Clinic")
			{
				sortColumn = "ApptTime";
			}
		}

		protected void rptInPatientItemCreated(Object Sender, RepeaterItemEventArgs e)
		{
			// create a reference to the current tr
			System.Web.UI.HtmlControls.HtmlContainerControl inPatientRow;
			inPatientRow = (System.Web.UI.HtmlControls.HtmlContainerControl) e.Item.FindControl("inPatientRow");

			// if the patient ID for this row is empty, clicking the row will cause a javascript alert.
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				string currentPatientId = ((DataRowView) e.Item.DataItem )["PatientId"].ToString();

				if (currentPatientId.Equals(""))
				{
                    inPatientRow.Attributes.Add("onclick", "alert('This patient is not in the database.  No information about this patient beyond the data listed on this page is currently available.');");
				}
				else
				{
                    string urlVars = "epid=" + CustomCryptoHelper.Encrypt(currentPatientId) + "&patientList=yes&listType=" + Server.UrlEncode(this.listTitle);
                    string url = PageUtil.EscapeSingleQuotes("../DataEntryForms/index.aspx?" + urlVars + "&verifyPatientId=true");
                    inPatientRow.Attributes.Add("onclick", "parent.location='" + url + "';");
				}
			}
		}
		
		protected void rptClinicItemCreated(Object Sender, RepeaterItemEventArgs e)
		{


			// create a reference to the current tr
			System.Web.UI.HtmlControls.HtmlContainerControl clinicListRow;
			clinicListRow = (System.Web.UI.HtmlControls.HtmlContainerControl) e.Item.FindControl("clinicListRow");

			Literal eformStatus;
			eformStatus = (System.Web.UI.WebControls.Literal) e.Item.FindControl("eformStatus");

			// if the patient ID for this row is empty, clicking the row will cause a javascript alert.
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				string localApptPatientId = ((DataRowView) e.Item.DataItem )["ApptPatientId"].ToString();

				if (localApptPatientId == "")
				{
					clinicListRow.Attributes.Add("onclick","alert('This patient is not in the database.  No information about this patient beyond the data listed on this page is currently available.');");
				}
				else
				{
					string urlVars = "epid="+CustomCryptoHelper.Encrypt(localApptPatientId)+"&patientList=yes&listType="+ Server.UrlEncode(this.listTitle);
                    string url = PageUtil.EscapeSingleQuotes("../DataEntryForms/index.aspx?" + urlVars + "&verifyPatientId=true");
                    clinicListRow.Attributes.Add("onclick", "parent.location='" + url + "';");
				}

				string currentStatus = ((DataRowView) e.Item.DataItem )["CurrentStatus"].ToString();
				
				if(!currentStatus.Equals(""))
				{
					string summary = ((DataRowView) e.Item.DataItem )["EFormName"].ToString() + " last updated by " + ((DataRowView) e.Item.DataItem )["UpdatedBy"].ToString() + " on " + ((DataRowView) e.Item.DataItem )["UpdatedTime"].ToString();
					string spanOpeningText = "<a span onmouseover=\"showToolTipMessage('" + summary + "')\" onmouseout=\"hideToolTip()\">";
					string spanClosingText = "</span>";

					if( currentStatus.Equals(EformStatusManager.Status_DataEntryComplete) || currentStatus.Equals(EformStatusManager.Status_DataEntryInProgress) || currentStatus.Equals(EformStatusManager.Status_Narrated) )
					{
						eformStatus.Text = spanOpeningText + "EForm Initiated" + spanClosingText;
					}
					else if( currentStatus.Equals(EformStatusManager.Status_Approved) )
					{
						eformStatus.Text = spanOpeningText +  "EForm Approved" + spanClosingText;
					}
				
				}
			}
		}

		protected void rptItemCreated(Object sender, RepeaterItemEventArgs e)
		{

			// create a reference to the current tr
			System.Web.UI.HtmlControls.HtmlContainerControl listRow;
			listRow= (System.Web.UI.HtmlControls.HtmlContainerControl) e.Item.FindControl("listRow");


			// if the patient ID for this row is empty, clicking the row will cause a javascript alert.
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				string localPatientId = ((DataRowView) e.Item.DataItem )["patientId"].ToString();

				if (localPatientId == "")
				{
					listRow.Attributes.Add("onClick","alert('This patient is not in the database.  No information about this patient beyond the data listed on this page is currently available.');");
				}
				else
				{
					string urlVars = "epid="+CustomCryptoHelper.Encrypt(localPatientId)+"&patientList=yes";

					listRow.Attributes.Add("onClick","parent.location='../DataEntryForms/index.aspx?"+urlVars+"';");
				}
			}
		}

        protected void SetClinicDelete(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HtmlAnchor btn = e.Item.FindControl("DeleteClinicPatientBtn") as HtmlAnchor;
                if (canDeletePatient)
                {
                    string apptId = DataBinder.Eval(e.Item.DataItem, BOL.Appointment.AppointmentId).ToString();
                    if (!string.IsNullOrEmpty(apptId))
                    {
                        btn.Visible = true;
                        btn.HRef = "PatListContent.aspx?deleteClinicApptId=" + apptId;
                    }
                    else
                    {
                        btn.Visible = false;
                    }
                }
                else
                {
                    btn.Visible = false;
                }
            }
        }
    }
}













