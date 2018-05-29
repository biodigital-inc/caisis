using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI.Modules.PatientEd;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.Security;
using Caisis.DataAccess;
using Caisis.BOL;

public partial class Modules_PatientEducation_AssembleContent : BasePage
{
	private int _profileId = 0;
	private int _diseaseId = 0;
	private int _visitTypeId = 0;

	#region Accessors
	/// <summary>
	/// The Id of the profile currently being viewed. If: 
	/// 1. there is no pt in session, the Id is 0 (unsaved)
	/// 2. pt in session has no profiles or all profiles have been printed before, the Id is 0 (unsaved)
	/// 3. pt in session with most recent profile and no printed date, the Id is this profile's Id
	/// </summary>
	public int ProfileId
	{
		get
		{
			return _profileId;
		}
		set
		{
			_profileId = value;
			this._ptProfileId.Value = value.ToString();
		}
	}
	
	/// <summary>
	/// Gets the currently selected value of the disease Id ddl. Sets the selected value of the ddl.
	/// An Id of 0 indicates a non-disease-filtered profile.
	/// </summary>
	public int DiseaseId 
	{
		get
		{
			string val = this.ddlDiseaseProfile.SelectedValue;
			if (String.IsNullOrEmpty(val))
			{
				return 0;
			}
			else
			{

			}
			return Int32.Parse(val);
		}
		set
		{
			this.ddlDiseaseProfile.SelectedValue = value.ToString();
		}
	}

	/// <summary>
	/// The Id of the visit-type for the profile currently being viewed. If: 
	/// 1. there is no pt in session, the Id is 0 (unsaved)
	/// 2. pt in session has no profiles or all profiles have been printed before, the Id is 0 (unsaved)
	/// 3. pt in session with most recent profile and no printed date, the Id is this visit-type Id for this profile 
	/// </summary>
	private int VisitTypeId
	{
		get
		{
			return _visitTypeId;
		}
		set
		{
			_visitTypeId = value;
			//this._visitTypeStage.Value = value.ToString(); //set value in front end
		}
	}
	#endregion


	protected override void Page_Load(object sender, EventArgs e)
	{
		SessionHandler sh = new SessionHandler(Session);
		int ptId = sh.GetPatientId();

        this.LoadPacketMenus();

		if (!Page.IsPostBack)
		{
			LoadDiseaseDDL();

			if (Request.QueryString["usePtInSession"] == "true")
			{
				this._usePtInSession.Value = "true";
				PatientEducationDa da = new PatientEducationDa();

				if (ptId > 0)
				{
					DataTable dt = da.GetMostRecentPatientProfile(ptId);
					if (dt.Rows.Count > 0 && String.IsNullOrEmpty(dt.Rows[0][PatientEdProfile.LastPrintedTime].ToString()))
					{
						// will either load most recent profile (only if it hasn't been printed),
						// or load blank profile (not yet saved to db; no disease filter, no visit-type filter)
						ProfileId = Int32.Parse(dt.Rows[0][PatientEdProfile.ProfileId].ToString());
						LoadExistingProfile();
						ShowProfileLog(true);
					}
					else
					{
						this._visitTypeStage.Value = "0";
						ShowProfileLog(false);
					}
					LoadListOfProfilesTable(ptId);
				}

				ShowPatientInSessionLayout(true);
			}
			else
			{
				this._usePtInSession.Value = "false";
				ShowPatientInSessionLayout(false);
				ShowProfileLog(false);

				this._visitTypeStage.Value = "0";
			}

			GetRootNodes();
		}
		else 
		{
			if (this._callbackType.Value != "print" && this._callbackType.Value != "save")
			{
				UpdateTreeAndContent(); //update the tree when changing disease/visit 
			}
		}
	}

    protected void LoadPacketMenus()
    {
        if(!string.IsNullOrEmpty(ddlDiseaseProfile.SelectedValue))
        {
            int dId = int.Parse(ddlDiseaseProfile.SelectedValue);
            
            PatientEducationDa peda = new PatientEducationDa();
            
            // initial consult packets
            DataTable initialConsultDt = new DataTable();
            initialConsultDt = peda.GetPacketsByDiseaseAndVisitType(dId, 1);
            rptInitialConsultPackets.DataSource = initialConsultDt.DefaultView;
            rptInitialConsultPackets.DataBind();

            //rptPostOpVisit packets
            DataTable postOpVisitDt = new DataTable();
            postOpVisitDt = peda.GetPacketsByDiseaseAndVisitType(dId, 2);
            rptPostOpVisit.DataSource = postOpVisitDt.DefaultView;
            rptPostOpVisit.DataBind();


            // rptDischarge
            DataTable dischargeDt = new DataTable();
            dischargeDt = peda.GetPacketsByDiseaseAndVisitType(dId, 3);
            rptDischarge.DataSource = dischargeDt.DefaultView;
            rptDischarge.DataBind();

            //
            DataTable followUpDt = new DataTable();
            followUpDt = peda.GetPacketsByDiseaseAndVisitType(dId, 4);
            rptFollowUp.DataSource = followUpDt.DefaultView;
            rptFollowUp.DataBind();
        }
    
    }

	/// <summary>
	/// "Loads" the existing profile. Sets values for profile id, visit type id, and disease id that are used when 
	/// building the tree view. Also sets the profile log information.
	/// </summary>
	private void LoadExistingProfile()
	{
		// Retrieve the profile
		PatientEdProfile profileBiz = new PatientEdProfile();
		profileBiz.Get(ProfileId);

		//Set values
		if (!String.IsNullOrEmpty(profileBiz[PatientEdProfile.ProfileVisitTypeId].ToString()))
		{
			// Note: Not really necessary to do as shown below, if we have order numbers that are the same 
			// as the Ids.
			VisitTypeId = Int32.Parse(profileBiz[PatientEdProfile.ProfileVisitTypeId].ToString());
			PatientEducationDa da = new PatientEducationDa();
			DataRow dr = da.GetVisitTypeById(VisitTypeId);
			this._visitTypeStage.Value = dr[PatientEdVisitType.OrderNumber].ToString();
		}
		else
		{
			this._visitTypeStage.Value = "0";
		}

		if (!String.IsNullOrEmpty(profileBiz[PatientEdProfile.ProfileDiseaseId].ToString()))
		{
			DiseaseId = Int32.Parse(profileBiz[PatientEdProfile.ProfileDiseaseId].ToString());
		}

		// update profile log info
		this.printedDate.InnerHtml = profileBiz[PatientEdProfile.LastPrintedTime].ToString();
		this.printedBy.InnerHtml = profileBiz[PatientEdProfile.LastPrintedBy].ToString();
		if (!String.IsNullOrEmpty(profileBiz[PatientEdProfile.LastPrintedBy].ToString()))
		{
			this.printedBy.InnerHtml = "by " + this.printedBy.InnerHtml;
		}
	
		this.updatedDate.InnerHtml = profileBiz[PatientEdProfile.UpdatedTime].ToString();
		this.updatedBy.InnerHtml = profileBiz[PatientEdProfile.UpdatedBy].ToString();
		if (!String.IsNullOrEmpty(profileBiz[PatientEdProfile.UpdatedBy].ToString()))
		{
			this.updatedBy.InnerHtml = "by " + this.updatedBy.InnerHtml;
		}
	}


	/// <summary>
	/// Updates the values for profile id, visit type id, and disease id, and rebuilds the tree view based on this.
	/// Also registers script to reset the profiles list table.
	/// </summary>
	private void UpdateTreeAndContent()
	{
		if (this._callbackType.Value == "profileListSelect" || this._callbackType.Value == "reset")
		{
			if (Request.QueryString["usePtInSession"] == "true")
			{
				ProfileId = Int32.Parse(this._ptProfileId.Value);
				LoadExistingProfile();
				ShowProfileLog(true);
			}
		}
		else
		{
			ProfileId = 0;
			ShowProfileLog(false);
			ClientScript.RegisterStartupScript(Page.GetType(), "resetProfilesListStyles", "resetProfilesListStyles();", true);
		}
		this._callbackType.Value = String.Empty;

		VisitTypeId = Int32.Parse(this._visitTypeStage.Value);
		GetRootNodes();
	}


	#region Populate and Display Tree View
	//private void GetRootNodes(int vtId, int dId)
	private void GetRootNodes()
	{
		contentTV.Nodes.Clear();

		PatientEducationDa da = new PatientEducationDa();
		//DataTable dt = da.GetSectionsByVisitTypeAndDiseaseId(vtId, dId);
		DataTable dt = da.GetAllSections();

		foreach (DataRow row in dt.Rows)
		{
			TreeNode node = new TreeNode();
			string sectionName = row[PatientEdSection.SectionName].ToString();
			node.Text = "<span onclick='return false;' style='cursor:default;'>" + sectionName + "</span>";
			node.Value = row[PatientEdSection.SectionId].ToString();
			node.ToolTip = sectionName;
			node.ImageToolTip = sectionName;
			node.Expanded = false;
			node.PopulateOnDemand = true;
			node.SelectAction = TreeNodeSelectAction.SelectExpand;
			node.ShowCheckBox = false;
			node.Expand();

			contentTV.Nodes.Add(node);
		}
	}
	protected void TreeNode_Populate(Object sender, TreeNodeEventArgs e)
	{
		int sectionId = Int32.Parse(e.Node.Value);
		PatientEducationDa da = new PatientEducationDa();
		DataTable dt = da.GetTopicsBySection(sectionId);

		List<string> subTopicIds = new List<string>();
        DataTable profilePartsDt = new DataTable();
        DataTable subTopicTable = new DataTable();

        string loadDocType = "";
        // inside the loop we will want to check off boxes based on a profile or default doc
        if(ProfileId > 0)
        {
            profilePartsDt = da.GetProfileDocPartsByProfileId(ProfileId);
            loadDocType = "UserProfile";
        }
        else if(PageUtil.IsInteger(_packetId.Value))
        {
             // check off subtopics based on active packet  
            subTopicTable = da.GetDiseaseVisitSubTopicByPacket(int.Parse(_packetId.Value));
            loadDocType = "DefaultPacket";
            PacketName.Text = _packetName.Value;
        }

		// get subtopics by topic
		foreach (DataRow row in dt.Rows)
		{
			string topicName = row[PatientEdTopic.TopicName].ToString();
			TreeNode topicNode = new TreeNode("<span onclick='return false;' style='cursor:default;'>" + topicName + "</span>", row[PatientEdTopic.TopicId].ToString());
			topicNode.Expanded = false;
			topicNode.ToolTip = topicName;
			topicNode.ImageToolTip = topicName;
			int topicId = Int32.Parse(row[PatientEdTopic.TopicId].ToString());
			
			DataTable dtSubTopic = da.GetSubTopicsByTopic(topicId);
			foreach (DataRow dr in dtSubTopic.Rows)
			{
				string subTopicId = dr[PatientEdSubTopic.SubTopicId].ToString();
				subTopicIds.Add(subTopicId);

				string subTopicName = dr[PatientEdSubTopic.SubTopicName].ToString();
				TreeNode subTopicNode = new TreeNode("<span onclick='doNodeCheckboxClick(this);return false;' style='cursor:default;'>" + subTopicName + "</span>", dr[PatientEdSubTopic.SubTopicId].ToString());
				subTopicNode.ToolTip = subTopicName;
				subTopicNode.ImageToolTip = subTopicName;
				subTopicNode.ShowCheckBox = true;

				//Loading an existing profile, so check off boxes if subtopic is part of the profile doc
				if (loadDocType.Equals("UserProfile"))
				{
                    DataRow[] returnedRows = profilePartsDt.Select("SubTopicId = " + subTopicId + "");
                    if (returnedRows.Length > 0)
                    {
                        subTopicNode.Checked = true;
                        topicNode.Expand();
                    }
                    
                    /* previous, less efficient way
                    foreach (DataRow pdr in profilePartsDt.Rows)
					{
						if (subTopicId == pdr[PatientEdProfileDocPart.SubTopicId].ToString())
						{
							subTopicNode.Checked = true;
							topicNode.Expand();
						}
					}
                    */
				}
				else if(loadDocType.Equals("DefaultPacket")) //not for a particular patient
				{
                    // if a the subtopic is part of the default packet, check it off
                    DataRow[] foundRows = subTopicTable.Select("SubTopicId = " + subTopicId + "");
                    if (foundRows.Length > 0)
                    {
                        subTopicNode.Checked = true;
                        topicNode.Expand();
                    }

                        /*foreach (DataRow packetRow in subTopicTable.Rows)
                        {
                            if (subTopicId == packetRow[PatientEdDisease_VisitType_SubTopic.SubTopicId].ToString())
                            {
                                subTopicNode.Checked = true;
                                topicNode.Expand();
                                break;
                            }
                        }*/
                    
                        /* Try to check off subtopics based on disease ddl and visit type
					    DataTable dST = da.GetDiseaseVisitSubTopicBySubTopic(Int32.Parse(subTopicId));
					    foreach (DataRow r in dST.Rows)
					    {
						    string sVisitTypeId = "";
						    //if (this._visitTypeId != 0)
						    if (VisitTypeId != 0)
						    {
							    sVisitTypeId = this._visitTypeId.ToString(); //this._visitTypeStage.Value
						    }

						    if (r[PatientEdDisease_VisitType_SubTopic.DiseaseId].ToString() == this.ddlDiseaseProfile.SelectedValue
							    && r[PatientEdDisease_VisitType_SubTopic.VisitTypeId].ToString() == sVisitTypeId)
						    {
							    subTopicNode.Checked = true;
							    topicNode.Expand();  
							    break;
						    }
					    }
                        */
				}

				topicNode.ChildNodes.Add(subTopicNode);
			}

			topicNode.ShowCheckBox = false;
			e.Node.ChildNodes.Add(topicNode);
		}

		PatientEdUtil.RegisterStartupSubTopicIds(Page, sectionId, subTopicIds);
	}
	#endregion


	/// <summary>
	/// Calls function to save current profile after save button is clicked.
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void SaveProfile(Object sender, ImageClickEventArgs e)
	{
		SaveCurrentProfile("save");
	}


	/// <summary>
	/// Saves the current profile, existing or newly created. 
	/// </summary>
	/// <param name="caller"></param>
	private void SaveCurrentProfile(string caller)
	{
		SecurityController sc = new SecurityController();
		string user = sc.GetUserName();

		if (!String.IsNullOrEmpty(this._ptProfileId.Value))
		{
			ProfileId = Int32.Parse(this._ptProfileId.Value);
		}

		if (this._visitTypeStage.Value != "0")
		{
			VisitTypeId = Int32.Parse(this._visitTypeStage.Value);
		}

		PatientEducationDa da = new PatientEducationDa();
		List<string> checkedPartsList = new List<string>();

		foreach (TreeNode sectionNode in contentTV.Nodes)
		{
			foreach (TreeNode topicNode in sectionNode.ChildNodes)
			{
				foreach (TreeNode subTopicNode in topicNode.ChildNodes)
				{
					if (subTopicNode.Checked)
					{
						checkedPartsList.Add(subTopicNode.Value);
					}
				}
			}
		}

		if (ProfileId > 0)
		{
			DataTable dbProfilePartsDt = da.GetProfileDocPartsByProfileId(ProfileId);
			// Delete existing profile parts that have been deselected, 
			// and update the list of actual new parts to be saved later on.
			foreach (DataRow dr in dbProfilePartsDt.Rows)
			{
				string stId = dr[PatientEdProfileDocPart.SubTopicId].ToString();
				if (!checkedPartsList.Contains(stId))
				{
					//delete this profile doc part from the db
					da.DeleteProfileDocPartByProfileIdAndSubTopicId(ProfileId, Int32.Parse(stId));
				}
				else
				{
					//remove it from the list of checked parts, as we have confirmed it is already in the db
					checkedPartsList.Remove(stId);
				}
			}

			PatientEdProfile profileBiz = new PatientEdProfile();
			profileBiz.Get(ProfileId);
			profileBiz[PatientEdProfile.UpdatedBy] = user;
			profileBiz[PatientEdProfile.UpdatedTime] = DateTime.Now.ToString();

			if (caller == "print")
			{
				profileBiz[PatientEdProfile.LastPrintedBy] = user;
				profileBiz[PatientEdProfile.LastPrintedTime] = DateTime.Now.ToString();
			}
			profileBiz.Save();
		}
		else
		{
			// Saving a brand new profile.
			SessionHandler sh = new SessionHandler(Session);
			int ptId = sh.GetPatientId();

			PatientEdProfile profile = new PatientEdProfile();
			profile[PatientEdProfile.PatientId] = ptId.ToString();

			if (this._visitTypeStage.Value != "0")
			{
				profile[PatientEdProfile.ProfileVisitTypeId] = VisitTypeId;
			}
			if (this.ddlDiseaseProfile.SelectedIndex > 0)
			{
				profile[PatientEdProfile.ProfileDiseaseId] = DiseaseId;
			}

			string profileDate = DateTime.Now.ToString();
			profile[PatientEdProfile.ProfileCreateDate] = profileDate;
			profile[PatientEdProfile.EnteredBy] = user;
			profile[PatientEdProfile.EnteredTime] = profileDate;
			profile[PatientEdProfile.UpdatedBy] = user;
			profile[PatientEdProfile.UpdatedTime] = profileDate;

			if (caller == "print")
			{
				profile[PatientEdProfile.LastPrintedBy] = user;
				profile[PatientEdProfile.LastPrintedTime] = DateTime.Now.ToString();
			}
			profile.Save();

			ProfileId = Int32.Parse(profile[PatientEdProfile.ProfileId].ToString());
			LoadListOfProfilesTable(ptId);

			ShowProfileLog(true);
		}

		// Add the new profile parts to this profile document
		foreach (string profilePart in checkedPartsList)
		{
			PatientEdProfileDocPart dp = new PatientEdProfileDocPart();
			dp[PatientEdProfileDocPart.ProfileId] = ProfileId.ToString();
			dp[PatientEdProfileDocPart.SubTopicId] = Int32.Parse(profilePart);
			dp[PatientEdProfileDocPart.ProfileDocPartVersionNumber] = "1.0";
			dp[PatientEdProfileDocPart.ProfileDocPartOrderNumber] = "1";
			dp.Save();
		}

		LoadExistingProfile();
		GetRootNodes();

		this._callbackType.Value = String.Empty;
	}


	/// <summary>
	/// After the javascript print dialogue is launched, 
	/// this function saves the profile changes, if any, and then updates the profile log.
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void PrintProfile(Object sender, ImageClickEventArgs e)
	{
		// Note: this first check is really not necessary, as the js in the front end will stop the postback
		// when there is no patient in session.
		if (Request.QueryString["usePtInSession"] == "true")
		{
			string sPId = this._ptProfileId.Value;

			if (!String.IsNullOrEmpty(sPId) && !sPId.Equals("0"))
			{
				ProfileId = Int32.Parse(sPId);

				SecurityController sc = new SecurityController();
				string user = sc.GetUserName();

				SaveCurrentProfile("print");
				LoadExistingProfile(); //to reload it
				ShowProfileLog(true);

				GetRootNodes();

				SessionHandler sh = new SessionHandler(Session);
				int ptId = sh.GetPatientId();
				if (ptId > 0)
				{
					LoadListOfProfilesTable(ptId);
				}
			}
			else
			{
				
				SaveCurrentProfile("print");
				ShowProfileLog(true);
			}
		}
		//else
		//{
		//    UpdateTreeAndContent();
		//}

		this._callbackType.Value = String.Empty; //reset to empty string
	}

	/// <summary>
	/// Get list of all profiles for current patient. Bind to gridview in list of profiles tab. 
	/// </summary>
	/// <param name="ptId"></param>
	private void LoadListOfProfilesTable(int ptId)
	{
		// populate the past profiles repeater
		PatientEducationDa da = new PatientEducationDa();
		DataTable dtList = da.GetAllProfilesForPatient(ptId);
		rptProfileResults.DataSource = dtList;
		rptProfileResults.DataBind();
	}

	/// <summary>
	/// Populate and bind the disease drop down list.
	/// </summary>
	private void LoadDiseaseDDL()
	{
		ddlDiseaseProfile.DataValueField = PatientEdDisease.DiseaseId;
		ddlDiseaseProfile.DataTextField = PatientEdDisease.DiseaseName;

		PatientEducationDa da = new PatientEducationDa();
		ddlDiseaseProfile.DataSource = da.GetAllDiseaseTypes();
		ddlDiseaseProfile.DataBind();
	}

	/// <summary>
	/// Just clear out any old values in the hidden _callbackType field. 
	/// Handling call to update tree is done on page load.
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void DiseaseDDLSelected(object sender, EventArgs e)
	{
		this._callbackType.Value = "";
	}

	/// <summary>
	/// Shows or Hides the profiles list tab and the save button
	/// </summary>
	/// <param name="b"></param>
	private void ShowPatientInSessionLayout(bool b)
	{
		this.SaveContentBtn.Visible = b;
		this.profileListTab.Visible = b;
		
	}

	/// <summary>
	///  Shows or Hides the profile log ("Last Printed:" and "Last Updated:")
	/// </summary>
	/// <param name="b"></param>
	private void ShowProfileLog(bool b)
	{
		this.profileLog.Visible = b;
	}
}
