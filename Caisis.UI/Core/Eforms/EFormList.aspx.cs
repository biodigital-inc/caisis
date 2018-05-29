using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Xml;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Globalization;


using Caisis.Security;
using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Controller;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Utilities;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// Displays physicians clinic list of patients with associated eforms.
	/// </summary>
	public partial class EFormList : EFormBasePage
	{
		#region various variables
		private ListItemCollection lic = new ListItemCollection();
		private string patientNameHolder;
		protected HtmlImage lastRepeaterRowImg;


		private HtmlImage currentOtherEformsImage; // placeholder for toggling visibility of the "other eforms" icon
		private bool showOtherEformsImage = false;
		private Hashtable extractedEformIds = new Hashtable();
		private bool isFirstDisplayedExtractedRowForPatient = true;
		private Hashtable patientActiveEformTable = new Hashtable();
		#endregion

		protected override void Page_Load(object sender, System.EventArgs e)
		{
			string listType = "CLINIC";
			if (Request.QueryString.HasKeys() && Request.QueryString["EFormListType"] != null && Request.QueryString["EFormListType"].Length > 0)
			{
				listType = Request.QueryString["EFormListType"].ToUpper();
			}

			LoadEFormList(listType);
		}


		protected void LoadEFormList(string ListType)
		{
			if (ListType.Equals("PHYSICIAN"))
			{
				DataTable statusDt = new DataTable();
				statusDt.Columns.Add("EFormStatusDisplay");
				statusDt.Columns.Add("EFormStatusValue");

				DataRow statusRow1 = statusDt.NewRow();
				statusRow1["EFormStatusDisplay"] = "All Unapproved";
				statusRow1["EFormStatusValue"] = "";
				DataRow statusRow2 = statusDt.NewRow();
				statusRow2["EFormStatusDisplay"] = "Data Entry In Progress";
				statusRow2["EFormStatusValue"] = EformStatusManager.Status_DataEntryInProgress;
				DataRow statusRow3 = statusDt.NewRow();
				statusRow3["EFormStatusDisplay"] = "Data Entry Complete";
				statusRow3["EFormStatusValue"] = EformStatusManager.Status_DataEntryComplete;
				DataRow statusRow4 = statusDt.NewRow();
				statusRow4["EFormStatusDisplay"] = "Data Entry Reviewed";
				statusRow4["EFormStatusValue"] = EformStatusManager.Status_Narrated;
				DataRow statusRow5 = statusDt.NewRow();
				statusRow5["EFormStatusDisplay"] = "Approved";
				statusRow5["EFormStatusValue"] = EformStatusManager.Status_Approved;

				statusDt.Rows.Add(statusRow1);
				statusDt.Rows.Add(statusRow2);
				statusDt.Rows.Add(statusRow3);
				statusDt.Rows.Add(statusRow4);
				statusDt.Rows.Add(statusRow5);


				RptEformStatus.DataSource = statusDt.DefaultView;
				RptEformStatus.DataBind();


				string userName = new SecurityController().GetUserName();

				UserDa uda = new UserDa();
				DataSet uDs = uda.GetByUserName(userName);

				int userId = int.Parse(uDs.Tables[0].Rows[0]["UserId"].ToString());

				string msgType = "";
				if (Request.QueryString["msgStatus"] != null && Request.QueryString["msgStatus"].Length > 0)
				{
					StatusView.Text = Request.QueryString["msgStatus"];
					msgType = "'" + Request.QueryString["msgStatus"] + "'";
					
				}
				else
				{
					msgType = "'" + EformStatusManager.Status_DataEntryInProgress
						+ "','" + EformStatusManager.Status_DataEntryComplete
						+ "','" + EformStatusManager.Status_Narrated
						+ "'";
				}

				PopulateInbox(userId, msgType);
				
				PhysicianHeader.Visible = true;
				PhysicianEFormListTitleRow.Visible = true;

			}
			else if (ListType.Equals("PATIENT"))
			{
				// REFACTOR : redundant code in search of methodization
				if (Session[SessionKey.PatientId] != null && Session[SessionKey.PatientId].ToString() != "")
				{
				
					if (Session[SessionKey.PtFirstName] != null && Session[SessionKey.PtFirstName].ToString().Length > 0)
					{
						PatientName.Text = "Open and Approved eForms for ";
						PatientName.Text += Session[SessionKey.PtFirstName].ToString();
					}

					if (Session[SessionKey.PtLastName] != null && Session[SessionKey.PtLastName].ToString().Length > 0)
					{
						PatientName.Text += " " + Session[SessionKey.PtLastName].ToString();
					}

					this.SetPatientEFormList();

					string epid = CustomCryptoHelper.Encrypt(Session[SessionKey.PatientId].ToString());
                    StartNewEFormImg.PreRender += new EventHandler(delegate(object a, EventArgs b)
                        {
                            StartNewEFormImg.Attributes.Add("onclick", "if (checkPatientEformTypeChosen('" + EFormDropDown.ClientID + "')) { startPatientEfForm(this.id, '" + epid + "' ) } else { alert('Please select an EForm type.') }");
                        });
				}
				else
				{
					PatientName.Text = "No patient is currently in session.";
					NewEFormButton.Visible = false;
				}

				PatientEFormListTitleRow.Visible = true;
				PatientHeader.Visible = true;
			}
			else //clinic list
			{

				// NOTE: view state IS disabled in page declaration to increase performance

				// NOTE: These drop down options MUST match the name of the xml file attributes: name and displayName
				//       defining the eform without spaces

				lic.Add(new ListItem("", ""));
				XmlNodeList list = CaisisConfiguration.GetEFormsList();
				foreach (XmlNode node in list)
				{
					string name = node.Attributes["displayname"].Value;
					string value = node.Attributes["name"].Value;
					ListItem item = new ListItem(name, value);
					lic.Add(item);
				}
				
				this.LoadClinicList();

				this.LoadPhysicianList();

				clinicDateCal.Attributes.Add("onClick", "showCal(this, EFormClinicListForm." + clinicDate.ClientID.ToString() + ");");

				ClinicHeader.Visible = true;
				ClinicListTitleRow.Visible = true;
			}
            string eformOnLoadScript = "EFormListOnload('" + ListType.ToLower() + "');";
            Page.ClientScript.RegisterStartupScript(this.GetType(),"eformOnLoadScript",eformOnLoadScript,true);


		}

		/// <summary>
		/// This is "where things happen" for the EformList. Each record from the datasource is evaluated according
		/// to various rules, and a certain style of row is displayed according to the evaluation.
		/// </summary>
		/// <param name="Sender"></param>
		/// <param name="e"></param>
		protected void OnEFormClinicListItemCreate(object Sender, RepeaterItemEventArgs e)
		{
			bool isFirstRowForPatient = false;

			// handle only repeater "items"
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				// compare inactive eforms to whether the patient has active eforms
				int patientId = (int)((DataRowView)e.Item.DataItem)["PatientId"];
				if (!this.EformIsActive((DataRowView)e.Item.DataItem) && this.PatientHasActiveEform(patientId))
				{
					// hide me and skip everything else below
					HideEformListRow(e.Item);
				}
				else
				{
					string patientName = ((DataRowView)e.Item.DataItem)["PtLastName"].ToString() + ", " + ((DataRowView)e.Item.DataItem)["PtFirstName"].ToString();
					// the first row for a patient is "special" and we need to keep track of it
					if (!patientName.Equals(this.patientNameHolder))
					{
						isFirstRowForPatient = true;
						this.isFirstDisplayedExtractedRowForPatient = true;
						this.patientNameHolder = patientName;

						// we mantain a reference to the current "other eforms image" for the duration of
						// a patient's rows, so that we can make it visible after the fact (i.e. the visibility
						// of this image is a function of ALL the patient's rows, not just the first one)

						DoPostProcessingForOtherEforms(); // we also need call this after everything is done!
					}
					else
					{
						isFirstRowForPatient = false;
					}

					string efid = ((DataRowView)e.Item.DataItem)[EForm.EFormId].ToString();
					string eformStatus = ((DataRowView)e.Item.DataItem)[EForm.CurrentStatus].ToString();
					string lastUpdated = ((DataRowView)e.Item.DataItem)[EForm.UpdatedTime].ToString();
					string apptTime = ((DataRowView)e.Item.DataItem)["ApptTime"].ToString();
					string eformApptTime = ((DataRowView)e.Item.DataItem)["EformApptTime"].ToString();

					// eforms that were approved in the past will be hidden
					bool wasApprovedInThePast = this.IsPastApproved(eformStatus, eformApptTime);
					bool apptDateEqualsClinDate = DateIsEqualToClinicDate(eformApptTime);

					// now we pass things on to the "decorator" method  that does the real work
					if (!apptDateEqualsClinDate)
					{
						// now we know that we are going to hide a row
						// set bool_showOthers = true !!! this SHOULD NOT BE UNSET UNTIL POST-PROCESSING!!!

						if (wasApprovedInThePast)
						{
							this.ShowOtherEformsImage();
						}

						// why the OR condition? the only "first rows" that may be hidden are extracted rows
						if (!isFirstRowForPatient || extractedEformIds.ContainsKey(efid))
						{
							// hide stuff
							HideEformListRow(e.Item);
						}
						else
						{
							// show a "blank" (i.e. "create new eform") row
							ShowCreateEformRow(e.Item);
						}
					}
					else
					{
						// "fresh" list rows (i.e. no status) need the appropriate widgets
						if (eformStatus == null || eformStatus == "")
						{
							ShowCreateEformRow(e.Item);
						}
						else
						{
							if (extractedEformIds.ContainsKey(efid) && this.isFirstDisplayedExtractedRowForPatient)
							{
								this.isFirstDisplayedExtractedRowForPatient = false;
								ShowFirstActiveEformRow(e.Item);
							}
							else if (isFirstRowForPatient)
							{
								ShowFirstActiveEformRow(e.Item);
							}
							else
							{
								ShowSecondaryActiveEformRow(e.Item);
							}
						}
					}
				}
			}
		}

		// do not remove, need override
		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			InitializeComponent();
			// do NOT call EFormBasePage Onit; contains redirect logic of no patient is in session or user does not have edit eform rights
			//base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
		}
		#endregion

		#region list loaders
		/// <summary>
		/// Partition the eform list query results so that "extractable" approved records can be pushed to the bottom
		/// of the list.
		/// </summary>
		private void LoadClinicList()
		{
			string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);	
			string apptPhysician = GetApptPhysician();
			string apptDate = GetClinicDate();

			SetPageTitle(apptPhysician);
			
			EFormController ect = new EFormController();
 
			DataSet ds  = ect.GetEformsClinicList(datasetSql, apptPhysician, apptDate);

			// TODO: create two repeaters and filter the datasource based on "standalone" approves
			ArrayList shiftedApproves = GetStandaloneApprovedRecords(ds.Tables[0]);

			// create disjoint views based on the list
			DataView defaultView = ds.Tables[0].DefaultView;
			DataView extractedApprovedView = ds.Tables[0].DefaultView;

			string defaultFilter = GetDefaultRowFilter(shiftedApproves);
			if (defaultFilter != null)
			{
				defaultView.RowFilter = defaultFilter;
			}

            // we MUST scan before we databind, which will call the itemcreat delegate
            this.ScanActiveEforms(defaultView.Table);

            if (defaultView.Count > 0)
            {
                EFormClinicList.DataSource = defaultView;
                EFormClinicList.DataBind();
            }
            else
            {
                noPatientsRow.Visible = true;
                EmptyListMsg.Text = "No EForms are listed for this clinic on this date.";
            }

			string exFilter = GetStandaloneApprovedRowFilter(shiftedApproves);
			if (exFilter != null) // we don't want to populate the extracted repeater if there were no extractions
			{
				extractedApprovedView.RowFilter = exFilter;
				ExtractedApprovedClinicList.DataSource = extractedApprovedView;
				ExtractedApprovedClinicList.DataBind();
			}
		}

		private string GetStandaloneApprovedRowFilter(ArrayList list)
		{
			if (list.Count == 0)
			{
				return null;
			}
			else if (list.Count == 1) 
			{
				return "EFormId = " + list[0].ToString();
			}
			else
			{
				return "EFormId IN (" + String.Join(",", (string[]) list.ToArray(typeof (string))) + ")";
			}
		}

		private string GetDefaultRowFilter(ArrayList list)
		{
			if (list.Count == 0)
			{
				return null;
			}
			else if (list.Count == 1)
			{
				return "EFormId IS NULL OR EFormId <> " + list[0].ToString();
			}
			else
			{
				return "EFormId IS NULL OR EFormId NOT IN (" + String.Join(",", (string[]) list.ToArray(typeof (string))) + ")";
			}
		}

		/// <summary>
		/// Loads clinic physicians into repeater
		/// </summary>
		private void LoadPhysicianList()
		{
			AppointmentDa aptDa = new AppointmentDa();

			ClinicPhysicians.DataSource = aptDa.GetDistinctAppointmentPhysicians().Tables[0].DefaultView;
			ClinicPhysicians.DataBind();
		}
		#endregion

		#region code to support datasource partitioning by extracting standalone approved records - involves RULES
		/// <summary>
		/// Determine which (if any) rows should be extracted from the default Repeater. A patient's records will
		/// be extracted to the "approved" repeater if he or she has at least one active, approved eform and no
		/// active, non-approved eforms.
		/// </summary>
		/// <param name="table">the results of the eform list query</param>
		/// <returns>a list of eformids to move the "extracted" Repeater</returns>
		private ArrayList GetStandaloneApprovedRecords(DataTable table)
		{
			ArrayList list = new ArrayList();
			ArrayList patientRows = null;

			int currentPatientId = -1;
			
			foreach (DataRow row in table.Rows)
			{
				int pid = Int32.Parse(row["PatientId"].ToString());
				if (pid != currentPatientId)
				{
					if (patientRows != null)
					{
						ArrayList extractList = ExtractPastApprovedRecordsForPatient(patientRows);
						if (extractList != null)
						{
							foreach (object s in extractList)
							{
								list.Add(s.ToString());

								// also add eformid to the extracted hashtable
								extractedEformIds[s.ToString()] = "";
							}
						}
					}

					currentPatientId = pid;
					patientRows = new ArrayList();
				}
				
				patientRows.Add(row);
			}

			return list;
		}

		/// <summary>
		/// Determine whether a patient has at least one active, approved eform and no active, non-approved eforms.
		/// If these conditions obtain, return a list of these eformids. Note: if the patient has only non-active,
		/// approved eforms, these records <em>will not be extracted</em>.
		/// </summary>
		/// <param name="dataRows">a list of DataRows for <em>one</em> patient</param>
		/// <returns>a list of eformids to move the "extracted" Repeater</returns>
		private ArrayList ExtractPastApprovedRecordsForPatient(ArrayList dataRows)
		{
			ArrayList extractList = new ArrayList();
			bool returnExtracted = false;

			DateTime clinDate = DateTime.MinValue;

			if (this.clinicDate.Value != null && PageUtil.IsDate(this.clinicDate.Value))
			{
				clinDate = DateTime.Parse(this.clinicDate.Value);
			}

			foreach (object o in dataRows)
			{
				DataRow row = (DataRow)o;



				// if we run into any status other than approved ON THIS CLINIC DATE, 
				// NONE of the patient's rows should be extracted
				if (row["CurrentStatus"].ToString() != EformStatusManager.Status_Approved)
				{
					if (row["EformApptTime"] != DBNull.Value)
					{
						DateTime eformApptDate = (DateTime)row["EformApptTime"];
						if (eformApptDate.Date == clinDate.Date)
						{
							return null;
						}
					}
				}


				extractList.Add(row[EForm.EFormId].ToString());

				// returnExtraced = true only if EformApptDate = clinDate
				if (row["CurrentStatus"].ToString() == EformStatusManager.Status_Approved &&
					row["EformApptTime"] != DBNull.Value)
				{
					DateTime eformApptDate = (DateTime)row["EformApptTime"];
					if (eformApptDate.Date == clinDate.Date)
					{
						returnExtracted = true;
					}
				}


//				if (!IsPastApproved(row))
//				{
//					returnExtracted = true;
//				}
			}

			if (returnExtracted)
			{
				return extractList;
			}
			else
			{
				return null;
			}
		}
		#endregion

        #region methods to compare date to clinic date
		private bool DateIsEqualToClinicDate(string testDateString)
		{
			if (testDateString != null && testDateString != "")
			{
				DateTime date = DateTime.Parse(testDateString);

				if (this.clinicDate.Value != null && PageUtil.IsDate(this.clinicDate.Value))
				{
					DateTime clinDate = DateTime.Parse(this.clinicDate.Value);
					return date.Date == clinDate.Date;
				}
			}

			return false;
		}
        #endregion

		#region methods to evaluate "past approved"

		/// <summary>
		/// Compares the updated date of an approved record to the clinic date of the list.
		/// </summary>
		/// <param name="status"></param>
		/// <param name="updatedTime"></param>
		/// <returns>True if updated date preceeds clinic date</returns>
		private bool IsPastApproved(string status, string updatedTime)
		{
			/**
			* Example: If the clinic date is June 7, we want to exclude an eform that
			* was approved on May 31.
			**/

			if (status == EformStatusManager.Status_Approved)
			{
				if (updatedTime != null && updatedTime != "")
				{
					DateTime updatedDate = DateTime.Parse(updatedTime);

					if (this.clinicDate.Value != null && PageUtil.IsDate(this.clinicDate.Value))
					{
						DateTime clinDt = DateTime.Parse(this.clinicDate.Value);
						if (clinDt.Date > updatedDate.Date)
						{
							return true;
						}
					}
				}
			}

			return false;
		}

		private bool IsPastApproved(DataRow row)
		{
			if (row["EformApptTime"] != DBNull.Value)
			{
				return IsPastApproved(row["CurrentStatus"].ToString(), row["EformApptTime"].ToString());
			}
			else
			{
				return false;
			}
		}

		#endregion

        #region methods to evaluate whether patients have active eforms in a list
		private bool EformIsActive(DataRowView view)
		{
			object oEformApptTime = view["EformApptTime"];
			if (oEformApptTime != DBNull.Value && this.DateIsEqualToClinicDate(oEformApptTime.ToString()))
			{
				return true;
			}
			return false;
		}

		private void ScanActiveEforms(DataTable table)
		{
			int currentPatientId = -1;

			foreach (DataRow row in table.Rows)
			{
				int pid = Int32.Parse(row["PatientId"].ToString());

				if (pid != currentPatientId)
				{
					if (!this.patientActiveEformTable.ContainsKey(pid))
					{
						this.patientActiveEformTable.Add(pid, false);
					}
					currentPatientId = pid;
				}

				// see if the row is active, if so active[pid] = true;
				object oEformApptTime = row["EformApptTime"];
				if (oEformApptTime != DBNull.Value && this.DateIsEqualToClinicDate(oEformApptTime.ToString()))
				{
					this.patientActiveEformTable[pid] = true;
				}
			}
		}

		private bool PatientHasActiveEform(int pid)
		{
			if (this.patientActiveEformTable.ContainsKey(pid))
			{
				return (bool)this.patientActiveEformTable[pid];
			}
			else
			{
				return false;
			}
		}
        #endregion

		#region various utility methods - physician, page title, clinic date, eform name
		/// <summary>
		/// Gets selected clinic physician from session or form variable
		/// </summary>
		/// <returns></returns>
		protected string GetApptPhysician()
		{
			string pName = ""; //SHOULD default to telling user to select a list

			if(Request.Form["docName"] != null && Request.Form["docName"].Length > 0)
			{		
				pName = Request.Form["docName"].ToString();


				Session[SessionKey.CurrentListType] = "Clinic";
				Session[SessionKey.CurrentListCrit] = pName;
			}
			else if(Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") && Session[SessionKey.CurrentListCrit] != null )
			{
				pName = Session[SessionKey.CurrentListCrit].ToString();

			}


			return pName;
		}

	

		protected void SetPageTitle(string PName)
		{
			if (PName.Length > 0)
			{
				PhysicianName.Text = "Clinic List for " + PName;
			}
			else
			{
				PhysicianName.Text = "Please Select a Clinic List";
				docList.Attributes.Add("style", "visibility: visible; left: 40px;");
				ClinicDateText.Visible = false;
				clinicDateCal.Visible = false;
				EFormTitleTable.Visible = false;
				ListManDataTable.Visible = false;
				RefreshImage.Visible = false;
			}
		}
		
		/// <summary>
		/// Gets clinic list date from session or form variable
		/// </summary>
		/// <returns></returns>
		protected string GetClinicDate()
		{
			string currentClinicDate = "";
			
			if (Request.Form.HasKeys() && Request.Form["clinicDate"] != null)
			{
				currentClinicDate = Request.Form["clinicDate"].ToString();

				Session[SessionKey.CurrentClinicDate] = Request.Form["clinicDate"].ToString();
			}
			else
			{
				if (Session[SessionKey.CurrentClinicDate] != null && Session[SessionKey.CurrentClinicDate].ToString() != "")
				{
					currentClinicDate = Session[SessionKey.CurrentClinicDate].ToString();
				}
				else
				{
                    currentClinicDate = System.DateTime.Today.ToShortDateString();

					Session[SessionKey.CurrentClinicDate] = currentClinicDate;
				}
			}

			clinicDate.Value = currentClinicDate;

			ClinicDateText.Text = "on " + currentClinicDate;

			return currentClinicDate;
		}

		protected string GetEformDisplayName(string eformName)
		{
			switch (eformName)
			{
				case "Uro Pros FU":
					return "Urology Prostate Follow Up";
				case "GU Pros FU":
					return "GU Prostate Follow Up";
				default:
					return eformName;
			}
		}
		#endregion

		#region uninteresting methods that coordinate the display of the "other eforms" image - NO rules here
		protected void DoRepeaterPostProcessing(object sender, EventArgs e)
		{
			DoPostProcessingForOtherEforms();
		}

		// if the "show others" bool is true, make the image visible
		private void DoPostProcessingForOtherEforms()
		{
			if (this.showOtherEformsImage && this.currentOtherEformsImage != null)
			{
				this.currentOtherEformsImage.Visible = true;
			}

			this.ResetOtherEformsImage();
		}

		private void SetCurrentOtherEformsImage(HtmlImage image)
		{
			this.currentOtherEformsImage = image;
		}

		private void ShowOtherEformsImage()
		{
			this.showOtherEformsImage = true;
		}

		// we should also call this anytime we hit a new patient
		private void ResetOtherEformsImage()
		{
			this.currentOtherEformsImage = null;
			this.showOtherEformsImage = false;
		}
		#endregion

		#region display methods that "decorate" repeater rows; rules are NOT applied here
		private void HideEformListRow(RepeaterItem item)
		{
            HtmlContainerControl patientRow = (HtmlContainerControl)item.FindControl("PatientRow");
            HtmlContainerControl additionalEformRow = (HtmlContainerControl)item.FindControl("additionalEformRow");
            patientRow.Visible = false;
            additionalEformRow.Visible = false;
        }

		private void ShowCreateEformRow(RepeaterItem item)
		{
			// "spelled-out" for clarity:
			bool includeShowOtherEformsIcon = true;
			bool showPatientVisit = true;
			bool showAddEformIcon = false;
			bool showActiveEform = false;
			bool showDottedLineSeparator = false;

			HandleRepeaterOptions(item, includeShowOtherEformsIcon, showPatientVisit, showAddEformIcon,
				showActiveEform, showDottedLineSeparator);
		}

		private void ShowFirstActiveEformRow(RepeaterItem item)
		{
			// "spelled-out" for clarity:
			bool includeShowOtherEformsIcon = true;
			bool showPatientVisit = true;
			bool showAddEformIcon = true;
			bool showActiveEform = true;
			bool showDottedLineSeparator = false;

			HandleRepeaterOptions(item, includeShowOtherEformsIcon, showPatientVisit, showAddEformIcon,
				showActiveEform, showDottedLineSeparator);
		}

		private void ShowSecondaryActiveEformRow(RepeaterItem item)
		{
			// "spelled-out" for clarity:
			bool includeShowOtherEformsIcon = false;
			bool showPatientVisit = false;
			bool showAddEformIcon = false;
			bool showActiveEform = true;
			bool showDottedLineSeparator = true;

			HandleRepeaterOptions(item, includeShowOtherEformsIcon, showPatientVisit, showAddEformIcon,
				showActiveEform, showDottedLineSeparator);
		}

		/// <summary>
		/// This method handles the nitty-gritty of widget display for each row. The important consideration is
		/// that <em>this method <strong>does not</strong> concern itself with interactions between these options</em>.
		/// That task belongs to the wrapping methods! Also, this method follows a yes/no conceit; there are no
		/// "intermediate" options. The options must be defined (they are, in fact, parameters); there are no "defaults"!
		/// </summary>
		/// <param name="item"></param>
		/// <param name="includeShowOtherEformsIcon"></param>
		/// <param name="showPatientVisit"></param>
		/// <param name="showAddEformIcon"></param>
		/// <param name="showActiveEform"></param>
		/// <param name="showDottedLineSeparator"></param>
		private void HandleRepeaterOptions(RepeaterItem item, bool includeShowOtherEformsIcon,
			bool showPatientVisit, bool showAddEformIcon, bool showActiveEform, bool showDottedLineSeparator)
		{
			#region boilerplate control-finding and variable-setting

			#region control-finding block
			HtmlContainerControl PatientRow = (HtmlContainerControl) item.FindControl("PatientRow");
//			HtmlContainerControl PatientRowSeparator = (HtmlContainerControl) item.FindControl("PatientRowSeparator");
			HtmlContainerControl PlusImageDiv = (HtmlContainerControl) item.FindControl("plusImageDiv");
			Literal EFormStatus = (Literal) item.FindControl("EFormStatus");
			Literal PatientName = (Literal) item.FindControl("PatientName");
			Literal PatientMrn = (Literal) item.FindControl("PatientMrn");
			Literal AppointmentTime = (Literal) item.FindControl("AppointmentTime");
            ConfigDropDown EFormDropDown = (ConfigDropDown)item.FindControl("EFormDropDown");
            ConfigDropDown EFormDropDown2 = (ConfigDropDown)item.FindControl("EFormDropDown2");
			HtmlImage PlusImage = (HtmlImage) item.FindControl("PlusImage"); 
			HtmlImage StartNewEFormImg = (HtmlImage) item.FindControl("StartNewEFormImg");
			HtmlImage StartNewEFormImg2 = (HtmlImage) item.FindControl("StartNewEFormImg2");
			HtmlImage ShowAllEFormsImg = (HtmlImage) item.FindControl("ShowAllEFormsImg");
			HtmlImage StatusImg = (HtmlImage) item.FindControl("StatusImg");
			Literal EFormNameLiteral = (Literal) item.FindControl("EFormNameLiteral");
			Literal VisitTypeLiteral = (Literal) item.FindControl("VisitTypeLiteral");
			#endregion

			#region useful local variables
			string eformId = ((DataRowView) item.DataItem)[EForm.EFormId].ToString();
			string patientId = ((DataRowView) item.DataItem)["PatientId"].ToString();
			string patientName = ((DataRowView) item.DataItem)["PtLastName"].ToString() + ", " + ((DataRowView) item.DataItem)["PtFirstName"].ToString();
			string patientMrn = ((DataRowView) item.DataItem)["PtMRN"].ToString();
			string eformStatus = ((DataRowView) item.DataItem)[EForm.CurrentStatus].ToString();
			object oLastUpdated = ((DataRowView) item.DataItem)[EForm.UpdatedTime];
			object oEnteredTime = ((DataRowView) item.DataItem)[EForm.EnteredTime];
			string visitType = ((DataRowView) item.DataItem)["ApptVisitType"].ToString();
			
			string sEformName = null;
			object oEformName = ((DataRowView) item.DataItem)[EForm.EFormName];
			if (oEformName != DBNull.Value)
			{
				sEformName = oEformName.ToString();
			}

			string lastUpdated = null;
			if (oLastUpdated != DBNull.Value)
			{
				lastUpdated = DateTime.Parse(oLastUpdated.ToString()).ToString();
			}

			

			string apptTime = ((DataRowView) item.DataItem)["ApptTime"].ToString();	
			string eformStartDate = ((DataRowView) item.DataItem)[EForm.EnteredTime].ToString();; // only display eforms for current clinic date- make display of others optional
			string epid = CustomCryptoHelper.Encrypt(patientId);

			if(!apptTime.Equals("") && PageUtil.IsDate(apptTime))
			{
				// conversion to date type for globalization; needs verifying
				DateTime dt = DateTime.Parse(apptTime);
				apptTime = dt.ToShortTimeString();
			}

			if(eformStartDate != "" && PageUtil.IsDate(eformStartDate))
			{
				DateTime edt = DateTime.Parse(eformStartDate);
				eformStartDate = edt.ToShortDateString();
			}
			#endregion

			#endregion

			// some defaults
			ShowAllEFormsImg.Visible = false;
			PlusImageDiv.Visible = false;

			/**
			 * The options:
			 * 1. includeShowOtherEformsIcon
			 * 2. showPatientVisit
			 * 3. showAddEformIcon
			 * 4. showActiveEform
			 * 5. showDottedLineSeparator
			 **/

			if (includeShowOtherEformsIcon)
			{
				ShowAllEFormsImg.Attributes.Add("OnClick", "showAllPatientEFormsClick('" + "?epid=" + epid + "&status=ListAllEForms" + "')" );
				
				// this should set the image but not manipulate the visibility; however, it will have to set visiblity if the bool
				// is true
				this.SetCurrentOtherEformsImage(ShowAllEFormsImg);
			}
			
            //if (showDottedLineSeparator)
            //{
            //    PatientRowSeparator.Attributes["class"] = "ListManDataTableLightDottedLine";
            //}

			if (showPatientVisit)
			{
				PatientName.Text = patientName;
				PatientMrn.Text = patientMrn;
				AppointmentTime.Text = apptTime;
				VisitTypeLiteral.Text = visitType;
			}
			else
			{
				PatientName.Visible = false;
				PatientMrn.Visible = false;
				AppointmentTime.Visible = false;
				VisitTypeLiteral.Visible = false;
			}

			if (showAddEformIcon)
			{
				PlusImageDiv.Visible = true;
                PlusImageDiv.Style.Add("display", "none");
                PlusImage.Attributes.Add("onclick", "showEFormDropDown(this.id,event)");
            }
			else
			{
				PlusImage.Visible = false;
			}

			if (showActiveEform)
			{
				PatientRow.Attributes.Add("onClick","onRowClickGoToEForm('" + "?epid="+ epid +"&eformId=" + eformId + "&status=" + eformStatus + "'); reEnableRowClick();");
                PatientRow.Attributes.Add("OnMouseOver", "this.className='ListManDataTableRowOver'");
                PatientRow.Attributes.Add("OnMouseOut", "this.className='ListManDataTableRow'");
//                PatientRow.Attributes["class"] = "EFormListClickableRow";

				string LastUpdateDisplayString = lastUpdated;

				if (DateTime.Parse(oLastUpdated.ToString()).ToShortDateString() == DateTime.Now.ToShortDateString())
				{
					LastUpdateDisplayString = "<strong>today</strong> at " + DateTime.Parse(oLastUpdated.ToString()).ToString("h:mm tt");
				}

				switch (eformStatus)
				{
					case EformStatusManager.Status_DataEntryInProgress:
						StatusImg.Src = "../../Images/EFormStatus_InProgress.gif";
						EFormStatus.Text = "Updated " + LastUpdateDisplayString;
						break;
					case EformStatusManager.Status_DataEntryComplete:
						StatusImg.Src = "../../Images/EFormStatus_DataComplete.gif";
						EFormStatus.Text = "Updated " + LastUpdateDisplayString;
						break;
					case EformStatusManager.Status_Narrated:
						StatusImg.Src = "../../Images/EFormStatus_DataReviewed.gif";
						EFormStatus.Text = "Updated " + LastUpdateDisplayString;
						break;
					case EformStatusManager.Status_Approved:
                        PatientRow.Attributes["onClick"] = "loadApprovedEForm('" + eformId + "');";
                        StatusImg.Src = "../../Images/EFormStatus_Approved.gif";
						EFormStatus.Text = "Approved " + LastUpdateDisplayString;
						break;
					default:
						EFormStatus.Text = eformStatus + " Updated " + LastUpdateDisplayString;
						StatusImg.Visible = false;
						break;
				}

				if (sEformName != null)
				{
					EFormNameLiteral.Text = GetEformDisplayName(sEformName);
				}

				EFormDropDown.Visible = false;


				StartNewEFormImg.Visible = false;

				StartNewEFormImg2.Attributes.Add("onClick","startBtn2Click(this.id, '" + epid + "' )");
			}
			else
			{
						
				// see onchange event of drop down list in aspx
                StartNewEFormImg.PreRender += new EventHandler(delegate(object a, EventArgs b)
                {
                    StartNewEFormImg.Attributes.Add("onclick", "if (checkPatientEformTypeChosen('" + EFormDropDown.ClientID + "')) { startBtnClick(this.id, '" + epid + "' ) } else { alert('Please select an EForm type.') }");
                });
					
				PlusImage.Visible = false;
			}
		}
		#endregion

		#region additional inbox and list features
		/// <summary>
		/// Binds messages to Inbox repeater
		/// </summary>
		/// <param name="userId">logged in user</param>
		/// <param name="msgType">type of message to dislay</param>
		private void PopulateInbox(int userId, string msgType)
		{
			EFormsDa iDa = new EFormsDa();

			DataSet iDs = iDa.GetEformsInbox(userId, msgType);

			if (iDs != null && iDs.Tables.Count > 0 && iDs.Tables[0].Rows.Count > 0)
			{
				rptInbox.DataSource = iDs.Tables[0].DefaultView;
				rptInbox.DataBind();

				//            InboxMessagesBody.Attributes.Add("onload", "top.TaskContainer.setNumMessages('" + iDs.Tables[0].Rows.Count + "')");
			}
			else
			{
				noPatientsRow.Visible = true;
				EmptyListMsg.Text = "You have no EForms that fit the selected criteria.";
			}
		}

		protected void myEformsItemCreated(Object sender, RepeaterItemEventArgs e)
		{
			// create a reference to the current tr
			System.Web.UI.HtmlControls.HtmlContainerControl listRow;
			listRow = (System.Web.UI.HtmlControls.HtmlContainerControl)e.Item.FindControl("listRow");

 //           Literal inboxMessage;
 //           inboxMessage = (Literal)e.Item.FindControl("inboxMessage");
			HtmlImage StatusImg = (HtmlImage)e.Item.FindControl("StatusImg");
			Literal EFormStatus = (Literal)e.Item.FindControl("EFormStatus");
			
			//Please complete and approve <%# ((System.Data.DataRowView)Container.DataItem)["EFormName"]%> for <%# ((System.Data.DataRowView)Container.DataItem)["PtFirstName"]%> <%# ((System.Data.DataRowView)Container.DataItem)["PtLastName"]%> (MRN <%# ((System.Data.DataRowView)Container.DataItem)["PtMrn"]%>; DOB <%# ((System.Data.DataRowView)Container.DataItem)["PtBirthDateText"]%>)

			// if the patient ID for this row is empty, clicking the row will cause a javascript alert.
			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				string eformId = ((DataRowView)e.Item.DataItem)[EForm.EFormId].ToString();
				string localPatientId = ((DataRowView)e.Item.DataItem)[EForm.PatientId].ToString();
				string eformName = ((DataRowView)e.Item.DataItem)[EForm.EFormName].ToString();
				string status = ((DataRowView)e.Item.DataItem)[EForm.CurrentStatus].ToString();
				string ptName = ((DataRowView)e.Item.DataItem)[Patient.PtFirstName].ToString() + " " + ((DataRowView)e.Item.DataItem)[Patient.PtLastName].ToString();
				string ptMrn = ((DataRowView)e.Item.DataItem)[Patient.PtMRN].ToString();
				
				object oLastUpdated = ((DataRowView)e.Item.DataItem)[EForm.UpdatedTime];

				string lastUpdated = null;
				

				if (oLastUpdated != DBNull.Value)
				{
                    lastUpdated = DateTime.Parse(oLastUpdated.ToString()).ToString();
				}
				string LastUpdateDisplayString = lastUpdated;

				if (DateTime.Parse(oLastUpdated.ToString()).ToShortDateString() == DateTime.Now.ToShortDateString())
				{
					LastUpdateDisplayString = "<strong>today</strong> at " + DateTime.Parse(oLastUpdated.ToString()).ToString("h:mm tt");
				}


				if (localPatientId != "" && eformName != "")
				{
					string urlVars = "eform=" + Server.UrlEncode(eformName) + "&status=" + status + "&epid=" + CustomCryptoHelper.Encrypt(localPatientId) + "&eformid=" + eformId + "";

					listRow.Attributes.Add("onclick", "top.location='../Eforms/Index.aspx?" + urlVars + "';");
				}

				if (status.Equals(EformStatusManager.Status_DataEntryInProgress))
				{
					StatusImg.Src = "../../Images/EFormStatus_InProgress.gif";
					EFormStatus.Text = "Updated " + LastUpdateDisplayString;
				}
				else if (status.Equals(EformStatusManager.Status_DataEntryComplete))
				{
					StatusImg.Src = "../../Images/EFormStatus_DataComplete.gif";
					EFormStatus.Text = "Updated " + LastUpdateDisplayString;
				}
				else if (status.Equals(EformStatusManager.Status_Narrated))
				{
					StatusImg.Src = "../../Images/EFormStatus_DataReviewed.gif";
					EFormStatus.Text = "Updated " + LastUpdateDisplayString;
				}
				else if (status.Equals(EformStatusManager.Status_Approved))
				{
                    listRow.Attributes["onclick"] = "loadApprovedEForm('" + eformId + "');";
					StatusImg.Src = "../../Images/EFormStatus_Approved.gif";
					EFormStatus.Text = "Approved " + LastUpdateDisplayString;
				}
				else
				{
					StatusImg.Src = "../../Images/EFormStatus_InProgress.gif";
				}

			}
		}

		private void SetPatientEFormList()
		{
			if (Session[SessionKey.PatientId] != null && Session[SessionKey.PatientId].ToString() != "")
			{
				EFormsDa da = new EFormsDa();
				DataSet ds = da.GetPatientEForms(int.Parse(Session[SessionKey.PatientId].ToString()));

				if (ds.Tables[0].Rows.Count > 0)
				{

                    ds.Tables[0].Columns.Add("ComputedEFormDate", typeof(DateTime));

                    
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        if (dr[BOL.EForm.EformApptTime].ToString().Length < 1) { dr["ComputedEFormDate"] = dr[BOL.EForm.EnteredTime]; }
                        else { dr["ComputedEFormDate"] = dr[BOL.EForm.EformApptTime]; }
                    }
                    

					NoEFormsTableRow.Visible = false;
					DataView view = ds.Tables[0].DefaultView;
                    view.Sort = "ComputedEFormDate DESC, EFormName, CurrentStatus";

					PatientEForms.DataSource = view;
					PatientEForms.DataBind();
				}
				else
				{
					noPatientsRow.Visible = true;
					EmptyListMsg.Text = "This patient has no open or approved EForms.";
				}
			}
		}

		protected void OnPatientListItemCreate(Object Sender, RepeaterItemEventArgs e)
		{
			HtmlContainerControl EFormCell;
			EFormCell = (HtmlContainerControl)e.Item.FindControl("EFormCell");

			HtmlContainerControl EFormRow;
			EFormRow = (HtmlContainerControl)e.Item.FindControl("EFormRow");

			HtmlImage EFormStatusImg;
			EFormStatusImg = (HtmlImage)e.Item.FindControl("EFormStatusImg");

            Literal EFormStatus = (Literal)e.Item.FindControl("EFormStatus");
            Label PatientEFormListDate = (Label)e.Item.FindControl("PatientEFormListDate");

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
			{
				string eformId = ((DataRowView)e.Item.DataItem)[EForm.EFormId].ToString();
				string eformStatus = ((DataRowView)e.Item.DataItem)[EForm.CurrentStatus].ToString();
				string patientId = ((DataRowView)e.Item.DataItem)["PatientId"].ToString();
				string epid = CustomCryptoHelper.Encrypt(patientId);

                if (eformStatus == EformStatusManager.Status_Deleted)
                {
                    // hide it
                    EFormRow.Visible = false;
                }
                else
                {
                    if (eformStatus == EformStatusManager.Status_Approved)
                    {
                        // link to this page

                        EFormRow.Attributes.Add("onclick", "loadApprovedEForm('" + eformId + "');");

                        // this is old functionality, remove after testing - jf
                        //					EFormCell.Attributes.Add("onClick","document.location='PatientEFormList.aspx?eformId=" + eformId + "';");

                        EFormStatusImg.Src = "../../Images/EFormStatus_Approved.gif";

                        string ImgTitleString = "Approved " + ((DataRowView)e.Item.DataItem)["UpdatedTime"].ToString() + "\nby " + ((DataRowView)e.Item.DataItem)["UpdatedBy"].ToString();

                        EFormStatusImg.Attributes.Add("title", ImgTitleString);
                        EFormStatus.Text = ImgTitleString;
                    }
                    else
                    {
                        string ImgTitleString = "Last Updated " + ((DataRowView)e.Item.DataItem)["UpdatedTime"].ToString() + "\nby " + ((DataRowView)e.Item.DataItem)["UpdatedBy"].ToString();
                        EFormStatusImg.Attributes.Add("title", ImgTitleString);
                        EFormStatus.Text = ImgTitleString;

                        if (eformStatus == EformStatusManager.Status_Narrated)
                        {
                            EFormStatusImg.Src = "../../Images/EFormStatus_DataReviewed.gif";
                        }
                        else if (eformStatus == EformStatusManager.Status_DataEntryComplete)
                        {
                            EFormStatusImg.Src = "../../Images/EFormStatus_DataComplete.gif";
                        }

                        // link back to workflow so user can finish the eform

                        //                    EFormCell.Attributes.Add("OnClick", "document.location.href='PatientEFormList.aspx?eformId=" + eformId + "';");

                        string urlVars = "epid=" + epid + "&eformId=" + eformId + "&status=" + eformStatus;

                        EFormRow.Attributes.Add("onclick", "parent.location='Index.aspx?" + urlVars + "';");

                    }
                }

                if (((DataRowView)e.Item.DataItem)["EformApptTime"].ToString().Length > 0)
                {
                    PatientEFormListDate.Text = ((DateTime)((DataRowView)e.Item.DataItem)["EformApptTime"]).ToShortDateString();
                }
                else
                {
                    PatientEFormListDate.Text = ((DateTime)((DataRowView)e.Item.DataItem)["EnteredTime"]).ToShortDateString();
                    PatientEFormListDate.CssClass = "EFormDateSpecial";
                }

			}
		}
		#endregion
	}
}
