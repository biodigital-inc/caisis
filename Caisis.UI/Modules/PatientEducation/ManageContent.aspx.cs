using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text;

using Caisis.UI.Core.Classes;
using Caisis.UI.Modules.PatientEd;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using Caisis.BOL;

public enum PageModes
{
	DefaultDoc, Single
}

public partial class Modules_PatientEducation_ManageContent : BasePage
{
	public string PreloadedContentType
	{
		get
		{
			return Request.QueryString["contentType"];
		}
	}

	public string PreloadedContentId
	{
		get
		{
			return Request.QueryString["contentId"];
		}
	}

	public string PageMode
	{
		get
		{
			return Request.QueryString["mode"];
		}
	}

	private BusinessObject sectionBiz;
	private BusinessObject topicBiz;
	private BusinessObject subTopicBiz;
    private const string ADDNEW = "--- Add New ---";

	protected override void Page_Load(object sender, EventArgs e)
	{
		if (!string.IsNullOrEmpty(PreloadedContentType) && !string.IsNullOrEmpty(PreloadedContentId))
		{
			if (PreloadedContentType == "Section")
			{
				sectionBiz = new PatientEdSection();
				sectionBiz.Get(int.Parse(PreloadedContentId));
				RegisterPreloadedContent();
			}
			else if (PreloadedContentType == "Topic")
			{
				topicBiz = new PatientEdTopic();
				topicBiz.Get(int.Parse(PreloadedContentId));

				sectionBiz = new PatientEdSection();
				sectionBiz.Get(int.Parse(topicBiz[PatientEdTopic.SectionId].ToString()));
				RegisterPreloadedContent();
			}
			else if (PreloadedContentType == "SubTopic")
			{

				subTopicBiz = new PatientEdSubTopic();
				subTopicBiz.Get(int.Parse(PreloadedContentId));

				topicBiz = new PatientEdTopic();
				topicBiz.Get(int.Parse(subTopicBiz[PatientEdSubTopic.TopicId].ToString()));

				sectionBiz = new PatientEdSection();
				sectionBiz.Get(int.Parse(topicBiz[PatientEdTopic.SectionId].ToString()));
				RegisterPreloadedContent();
			}
		}

		if (!Page.IsPostBack)
		{
			if (PageMode == PageModes.DefaultDoc.ToString())
			{
				LoadDDLs();
				this.ddlsDiv.Visible = true;
				this.contentTV.SelectedNodeStyle.CssClass = "manageNode";
				this.addNewBtnsDiv.Visible = false;

				ShowOrHideDefaultDocButtons();
			}
			else
			{
				this.ddlsDiv.Visible = false;
				this.defaultDocBtns.Visible = false;
			}
		}
		else
		{
			if (PageMode == PageModes.DefaultDoc.ToString())
			{
				ShowOrHideDefaultDocButtons();
			}

			if (PageMode == PageModes.Single.ToString())
			{
				if (this._callbackType.Value == "delete")
				{
					DeleteSelectedNodeFromTreeView();
					Response.Redirect("ManageContent.aspx?mode=Single");
				}
			}
		}

		// we refresh the tree view on load, on ddls select and on reset
		if (this._callbackType.Value != "save")
		{
			GetRootNodes();
		}
	}


	/// <summary>
	/// Registers a node's path and parent nodes for javascript updates of titles.
	/// </summary>
	private void RegisterPreloadedContent()
	{
        StringBuilder buff = new StringBuilder();
        //string buff = "";
		if (sectionBiz != null)
		{
			buff.Append("'" + sectionBiz[PatientEdSection.SectionId] + "','" + sectionBiz[PatientEdSection.SectionName] + "',");
		}
		else
		{
			buff.Append("'','',");
		}
		if (topicBiz != null)
		{
			buff.Append("'" + topicBiz[PatientEdTopic.TopicId] + "','" + topicBiz[PatientEdTopic.TopicName] + "',");
		}
		else
		{
			buff.Append("'','',");
		}
		if (subTopicBiz != null)
		{
			buff.Append("'" + subTopicBiz[PatientEdSubTopic.SubTopicId] + "','" + subTopicBiz[PatientEdSubTopic.SubTopicName] + "'");
		}
		else
		{
			buff.Append("'',''");
		}
        string updateScript = "setHiddenTitles(" + buff.ToString() + ");";
		Page.ClientScript.RegisterStartupScript(typeof(Page), "registerPreloadContent", updateScript, true);
	}

	private void DeleteSelectedNodeFromTreeView()
	{
		int id = Int32.Parse(this.contentTV.SelectedNode.Value);
		int nodeType = this.contentTV.SelectedNode.Depth;

		if (nodeType == 0) //deleting section
		{
			PatientEdSection bizObj = new PatientEdSection();
			bizObj.Delete(id);

		}
		else if (nodeType == 1) //deleting topic
		{
			PatientEdTopic bizObj = new PatientEdTopic();
			bizObj.Delete(id);

		}
		else if (nodeType == 2) //deleting subtopic
		{
			PatientEdSubTopic bizObj = new PatientEdSubTopic();
			bizObj.Delete(id);
		}
	}




	#region Populate and Display Tree View
	private void GetRootNodes()
	{
		contentTV.Nodes.Clear();

		PatientEducationDa da = new PatientEducationDa();
		DataTable dt = da.GetAllSections(); //will eventually use GetAll() from BusinessObject

		foreach (DataRow row in dt.Rows)
		{
			TreeNode node = new TreeNode();
			string sectionId = row[PatientEdSection.SectionId].ToString();
			string sectionName = row[PatientEdSection.SectionName].ToString();
			node.Value = sectionId;
			node.ToolTip = sectionName;
			node.ImageToolTip = sectionName;

			if (PageMode == PageModes.Single.ToString())
			{
				node.Text = PatientEdUtil.GetFriendlyJavascriptTitle(sectionName, sectionId, sectionName, string.Empty, string.Empty, string.Empty, string.Empty, "Section");
			}
			else
			{
				node.Text = "<span onclick='return false;' style='cursor:default;'>" + sectionName + "</span>";
			}

			if (PageMode == PageModes.Single.ToString())
			{
				if (!(topicBiz != null && topicBiz[PatientEdTopic.SectionId].ToString() == sectionId))
				{
					if (sectionBiz != null && sectionBiz[PatientEdSection.SectionId].ToString() == sectionId)
					{
						SetContentDetailSrc("1", sectionId, sectionName);
					}
				}

				node.NavigateUrl = "ManageContentDetail.aspx?type=1&id=" + node.Value;
			}

			node.PopulateOnDemand = true;
			node.SelectAction = TreeNodeSelectAction.SelectExpand;
			node.ShowCheckBox = false;
			node.Expand();

			if (!String.IsNullOrEmpty(PreloadedContentType))
			{
				if (sectionBiz != null && topicBiz == null && subTopicBiz == null &&
						sectionBiz[PatientEdSection.SectionId].ToString() == sectionId)
				{
					node.Selected = true;
				}
			}
			contentTV.Nodes.Add(node);
		}
	}

	protected void TreeNode_Populate(Object sender, TreeNodeEventArgs e)
	{
		int sectionId = Int32.Parse(e.Node.Value);
		PatientEdSection sectionBiz = new PatientEdSection();
		sectionBiz.Get(sectionId);
		string sectionTitle = sectionBiz[PatientEdSection.SectionName].ToString();
		PatientEducationDa da = new PatientEducationDa();
		// Wouldn't it be better to do use PatientEdTopic biz and GetByParent sectionId ???
		DataTable dt = da.GetTopicsBySection(sectionId);
		List<string> subTopicIds = new List<string>();

		//get topics
		foreach (DataRow row in dt.Rows)
		{
			int topicId = int.Parse(row[PatientEdTopic.TopicId].ToString());
			string topicName = row[PatientEdTopic.TopicName].ToString();
			string titleText = "";

			if (PageMode == PageModes.Single.ToString())
			{
				titleText = PatientEdUtil.GetFriendlyJavascriptTitle(topicName, sectionId.ToString(), sectionTitle, topicId.ToString(), topicName, String.Empty, String.Empty, "Topic");
			}
			else
			{
				titleText = "<span onclick='return false;' style='cursor:default;'>" + topicName + "</span>";
			}
			TreeNode topicNode = new TreeNode(titleText, topicId.ToString());
			topicNode.ToolTip = topicName;
			topicNode.ImageToolTip = topicName;

			if (subTopicBiz != null && subTopicBiz[PatientEdSubTopic.TopicId].ToString() == topicId.ToString())
			{
				topicNode.Expanded = true;
			}
			else
			{
				if (PageMode == PageModes.Single.ToString())
				{
					if (topicBiz != null && topicBiz[PatientEdTopic.TopicId].ToString() == topicId.ToString())
					{
						string title = sectionBiz[PatientEdSection.SectionName].ToString() + " > " + topicName;
						SetContentDetailSrc("2", topicId.ToString(), title);
					}
				}
				topicNode.Expanded = false;
			}

			if (PageMode == PageModes.Single.ToString())
			{
				topicNode.NavigateUrl = "ManageContentDetail.aspx?type=2&id=" + topicNode.Value;
			}

			// get subtopics
			DataTable dtSubTopic = da.GetSubTopicsByTopic(topicId);
			foreach (DataRow dr in dtSubTopic.Rows)
			{
				string subTopicId = dr[PatientEdSubTopic.SubTopicId].ToString();
				string subTopicName = dr[PatientEdSubTopic.SubTopicName].ToString();
				string stText = "";

				subTopicIds.Add(subTopicId);

				if (PageMode == PageModes.Single.ToString())
				{
					stText = PatientEdUtil.GetFriendlyJavascriptTitle(subTopicName, sectionId.ToString(), sectionTitle, topicId.ToString(), topicName, subTopicId, subTopicName, "SubTopic");
				}
				else
				{
					if (PageMode == PageModes.DefaultDoc.ToString())
					{
						stText = "<span onclick='doNodeCheckboxClick(this);return false;' style='cursor:default;'>" + subTopicName + "</span>";
					}
					else
					{
						stText = "<span onclick='return false;' style='cursor:default;'>" + subTopicName + "</span>";
					}
				}

				TreeNode subTopicNode = new TreeNode(stText, subTopicId);
				if (PageMode == PageModes.Single.ToString())
				{
					subTopicNode.NavigateUrl = "ManageContentDetail.aspx?type=3&id=" + subTopicNode.Value;
				}

				if (PageMode == PageModes.DefaultDoc.ToString())
				{
					subTopicNode.ShowCheckBox = true;

					// NOTE: try to check off subtopics based on ddls
					DataTable dST = da.GetDiseaseVisitSubTopicBySubTopic(Int32.Parse(subTopicId));
					foreach (DataRow r in dST.Rows)
					{
						if (r[PatientEdDisease_VisitType_SubTopic.DiseaseId].ToString() == ddlDiseaseType.SelectedValue
							&& r[PatientEdDisease_VisitType_SubTopic.VisitTypeId].ToString() == ddlVisitType.SelectedValue
                            && r[PatientEdPacket.PacketId].ToString() == ddlPacketName.SelectedValue)
						{
							subTopicNode.Checked = true;
							topicNode.Expand();
							break;
						}
					}
				}

				subTopicNode.ToolTip = subTopicName;
				subTopicNode.ImageToolTip = subTopicName;


				if (!String.IsNullOrEmpty(PreloadedContentType))
				{
					if (sectionBiz != null && topicBiz != null && subTopicBiz != null &&
							subTopicBiz[PatientEdSubTopic.SubTopicId].ToString() == subTopicId)
					{
						subTopicNode.Selected = true;
					}
				}
				topicNode.ChildNodes.Add(subTopicNode);

				if (subTopicBiz != null && subTopicBiz[PatientEdSubTopic.SubTopicId].ToString() == subTopicId)
				{
					string title = sectionBiz[PatientEdSection.SectionName].ToString() + " > " + topicName + " > " + subTopicName;
					SetContentDetailSrc("3", subTopicId, title);
				}
			}

			if (!String.IsNullOrEmpty(PreloadedContentType))
			{
				if (sectionBiz != null && topicBiz != null && subTopicBiz == null &&
					topicBiz[PatientEdTopic.TopicId].ToString() == topicId.ToString())
				{
					topicNode.Selected = true;
				}
			}
			topicNode.ShowCheckBox = false;
			e.Node.ChildNodes.Add(topicNode);
		}

		PatientEdUtil.RegisterStartupSubTopicIds(Page, sectionId, subTopicIds);
	}
	#endregion

	/// <summary>
	/// Sets the URL of the iframe to load content for editing
	/// </summary>
	/// <param name="type"></param>
	/// <param name="id"></param>
	/// <returns></returns>
	private void SetContentDetailSrc(string type, string id, string title)
	{
		nodePath.Text = title;
		string url = "ManageContentDetail.aspx?type=" + type + "&id=" + id;
		ContentDetail.Attributes["src"] = url;
	}

    /// <summary>
    /// Save the packet; packet requires a disease, visit type and packet name
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
	protected void SaveDefaultDocument(object sender, ImageClickEventArgs e)
	{
		PatientEducationDa da = new PatientEducationDa();
        int dId = 0; //= this.ddlDiseaseType.SelectedValue;
		int vId = 0; //= this.ddlVisitType.SelectedValue;
        int pId = 0; //= this.ddlPacketName.SelectedValue;
  

        if (!String.IsNullOrEmpty(this.ddlDiseaseType.SelectedValue) && !String.IsNullOrEmpty(this.ddlVisitType.SelectedValue))
		{
            dId = Int32.Parse(this.ddlDiseaseType.SelectedValue);
            vId = Int32.Parse(this.ddlVisitType.SelectedValue);
		}

      
        if (this.ddlPacketName.SelectedValue.Equals(ADDNEW) && !string.IsNullOrEmpty(this.txtPacketName.Value))
        {
            // adding new; insert packet name and get new primary key for insertion into disease_visits_packets table
            string newPacketName = txtPacketName.Value;

            PatientEdPacket packet = new PatientEdPacket();
            packet[PatientEdPacket.PacketName] = newPacketName;
            packet.Save();
            pId = int.Parse(packet[PatientEdPacket.PacketId].ToString());

            // new packet name was used so refresh the drop down list, select the recent addition, and make the delete button available
            ListItem li = new ListItem(newPacketName, pId.ToString());
            ddlPacketName.Items.Insert(1, li);
            ddlPacketName.SelectedIndex = 1;

            txtPacketName.Value = "";
            txtPacketName.Visible = false;

            BtnDeletePacket.Visible = true;
            
        }
        else if(!string.IsNullOrEmpty(this.ddlPacketName.SelectedValue))
        {
                pId = int.Parse(this.ddlPacketName.SelectedValue);
        }

        if (pId > 0 && dId > 0 && vId > 0) // update or insert default doc
        {

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

            PatientEdDisease_VisitType_SubTopic biz = new PatientEdDisease_VisitType_SubTopic();
            DataTable defaultDocPartsDt = da.GetDefaultDocumentByDiseaseVisitPacketIds(dId, vId, pId);

            // start by deleting nodes that may have been removed
            foreach (DataRow dr in defaultDocPartsDt.Rows)
            {
                string drId = dr[PatientEdDisease_VisitType_SubTopic.DiseaseVisitTypeSubTopicId].ToString();
                string stId = dr[PatientEdDisease_VisitType_SubTopic.SubTopicId].ToString();

                if (!checkedPartsList.Contains(stId))
                {
                    //delete this record 
                    biz.Get(Int32.Parse(drId));
                    biz.Delete();
                }
                else
                {
                    //remove it from the list of checked parts, as we have confirmed it is already in the db
                    checkedPartsList.Remove(stId);
                }
            }

            //save the new additions
            foreach (string defaultDocpart in checkedPartsList)
            {
                //add new profile doc parts to the db
                PatientEdDisease_VisitType_SubTopic bizObj = new PatientEdDisease_VisitType_SubTopic();
                bizObj[PatientEdDisease_VisitType_SubTopic.SubTopicId] = Int32.Parse(defaultDocpart);
                bizObj[PatientEdDisease_VisitType_SubTopic.VisitTypeId] = vId.ToString();
                bizObj[PatientEdDisease_VisitType_SubTopic.DiseaseId] = dId.ToString();
                bizObj[PatientEdDisease_VisitType_SubTopic.PacketId] = pId.ToString();
                bizObj.Save();
            }

            GetRootNodes();
            this._callbackType.Value = String.Empty;
        }
	}

	/// <summary> 
	/// Hides the "save" and "reset" buttons for default docs unless disease, visit type and packet name are populated
	/// </summary>
	private void ShowOrHideDefaultDocButtons()
	{
        if (String.IsNullOrEmpty(this.ddlVisitType.SelectedValue) || String.IsNullOrEmpty(this.ddlDiseaseType.SelectedValue) || String.IsNullOrEmpty(this.ddlPacketName.SelectedValue))
		{
			this.defaultDocBtns.Visible = false;
		}
		else
		{
			this.defaultDocBtns.Visible = true;

            if (PageUtil.IsInteger(ddlPacketName.SelectedValue))
            {
                BtnDeletePacket.Visible = true;
            }
            else
            {
                BtnDeletePacket.Visible = false;
            }
		}
	}

    protected void ResetDDLs(Object sender, EventArgs e)
    {
        ddlDiseaseType.SelectedIndex = 0;
        ddlVisitType.SelectedIndex = 0;
        ddlPacketName.Items.Clear();
        txtPacketName.Visible = false;
    }

	private void LoadDDLs()
	{
		this.ddlDiseaseType.DataValueField = PatientEdDisease.DiseaseId;
		this.ddlDiseaseType.DataTextField = PatientEdDisease.DiseaseName;
		this.ddlVisitType.DataValueField = PatientEdVisitType.VisitTypeId;
		this.ddlVisitType.DataTextField = PatientEdVisitType.VisitTypeName;

		PatientEducationDa da = new PatientEducationDa();
		this.ddlDiseaseType.DataSource = da.GetAllDiseaseTypes();
		this.ddlDiseaseType.DataBind();
		this.ddlVisitType.DataSource = da.GetAllVisitTypes();
		this.ddlVisitType.DataBind();

        // packet names are specific to the combination of disease and visit type
	}

    
    protected void LoadPacketDDL(Object sender, EventArgs e)
    {
        LoadPacketDDL();
    }

    private void LoadPacketDDL()
    {
        DataTable dt = new DataTable();
        PatientEducationDa da = new PatientEducationDa();

        int diseaseId;
        int visitTypeId;

        if (int.TryParse(ddlDiseaseType.SelectedValue, out diseaseId) && int.TryParse(ddlVisitType.SelectedValue, out visitTypeId))
        {
            dt = da.GetPacketsByDiseaseAndVisitType(diseaseId, visitTypeId);
            this.ddlPacketName.DataTextField = PatientEdPacket.PacketName;
            this.ddlPacketName.DataValueField = PatientEdPacket.PacketId;
            this.ddlPacketName.DataSource = dt.DefaultView;


            this.ddlPacketName.DataBind();

            if (dt.Rows.Count > 0)
            {
                this.ddlPacketName.Items.Insert(1, ADDNEW);
                txtPacketName.Visible = false;
                //BtnDeletePacket.Visible = false;
            }
            else
            {
                this.ddlPacketName.Items.Insert(0, ADDNEW);
                txtPacketName.Visible = true;
                //BtnDeletePacket.Visible = false;
            }
        }
    }

    
    protected void LoadPacket(Object sender, EventArgs e)
    {
        if (this.ddlPacketName.SelectedValue.Equals(ADDNEW))
        {
            txtPacketName.Visible = true; // show text field to enter new packet name
            //BtnDeletePacket.Visible = false;
        }
        else if(this.ddlPacketName.SelectedValue != "")
        {
            // get existing packet
            txtPacketName.Visible = false;
        }
    }

    protected void DeletePacket(Object sender, EventArgs e)
    {
        int packetId;

        if (int.TryParse(ddlPacketName.SelectedValue, out packetId))
        {
            PatientEdPacket packet = new PatientEdPacket();
            packet.Delete(packetId);
       
            // refresh page
            this.LoadPacketDDL();   
            this.Page_Load(sender, e);
        }
    }

   
}
