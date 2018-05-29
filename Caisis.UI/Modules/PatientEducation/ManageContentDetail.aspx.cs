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

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using Caisis.BOL;


public partial class Modules_PatientEducation_ManageContentDetail : BasePage
{
	// "type" 1 for section, 2 for topic, 3 for subtopic; 0 is none
	private int Type
	{
		get
		{
			string type = Request.QueryString["type"];
			if (!string.IsNullOrEmpty(type))
			{
				return int.Parse(type);
			}
			else
			{
				return 0; //none 
			}
		}
	}

	private int Id
	{
		get
		{
			string id = Request.QueryString["id"];
			if (!string.IsNullOrEmpty(id))
			{
				return int.Parse(id);
			}
			else
			{
				return 0; //none 
			}
		}
	}

	protected override void Page_Load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			LoadContent();

			ShowButtonsInParentPage();
			ShowAddButtonInParentPage();
		}
		else
		{
			// Check if btn type was set to save
			if (btnType.Value == "save")
			{
				SaveContent();
			}
			// Reset btn type
			btnType.Value = string.Empty;
		}
	}

	private void LoadContent()
	{
		int id = Id;
		HideAllEditDivs();

		switch (Type)
		{
			case 1: //section
				{
					sectionEditDiv.Visible = true;
					sectionEditDiv.Style.Add("display", "block");

					if (id > 0)
					{
						PatientEdSection section = new PatientEdSection();
						section.Get(id);
						SectionTitleTxtBox.Text = section[PatientEdSection.SectionName].ToString();
						SectionDesc.Text = section[PatientEdSection.SectionDescription].ToString();
					}
					break;
				}
			case 2: //topic
				{
					if (id > 0)
					{
						topicEditDiv.Visible = true;
						topicEditDiv.Style.Add("display", "block");

						PatientEdTopic topic = new PatientEdTopic();
						topic.Get(id);
						TopicTitleTxtBox.Text = topic[PatientEdTopic.TopicName].ToString();
						TopicDesc.Text = topic[PatientEdTopic.TopicDescription].ToString();

						//PatientEdSection section = new PatientEdSection();
						//section.Get(Int32.Parse(topic[PatientEdTopic.SectionId].ToString()));
						//SectionTitle.Text = section[PatientEdSection.SectionName].ToString();
					}
					else
					{
						topicEditDiv.Visible = true;
						topicEditDiv.Style.Add("display", "block");

						//PatientEdSection section = new PatientEdSection();
						//section.Get(Int32.Parse(Request.QueryString["sectionId"]));
						//SectionTitle.Text = section[PatientEdSection.SectionName].ToString();
					}
					break;
				}
			case 3: //subtopic
				{
					if (id > 0)
					{
						subTopicEditDiv.Visible = true;
						subTopicEditDiv.Style.Add("display", "block");

						PatientEdSubTopic subtopicBO = new PatientEdSubTopic();
						subtopicBO.Get(id);
						SubTopicTitleTxtBox.Text = subtopicBO[PatientEdSubTopic.SubTopicName].ToString();
						SubTopicContentRTE.Text = subtopicBO[PatientEdSubTopic.SubTopicContent].ToString();

						//PatientEdTopic topic = new PatientEdTopic();
						//topic.Get(Int32.Parse(subtopicBO[PatientEdSubTopic.TopicId].ToString()));
						//StTopicTitle.Text = topic[PatientEdTopic.TopicName].ToString();

						//PatientEdSection section = new PatientEdSection();
						//section.Get(Int32.Parse(topic[PatientEdTopic.SectionId].ToString()));
						//StSectionTitle.Text = section[PatientEdSection.SectionName].ToString();
					}
					else
					{
						subTopicEditDiv.Visible = true;
						subTopicEditDiv.Style.Add("display", "block");

						//PatientEdTopic topic = new PatientEdTopic();
						//topic.Get(Int32.Parse(Request.QueryString["topicId"]));
						//StTopicTitle.Text = topic[PatientEdTopic.TopicName].ToString();

						//PatientEdSection section = new PatientEdSection();
						//section.Get(Int32.Parse(Request.QueryString["sectionId"]));
						//StSectionTitle.Text = section[PatientEdSection.SectionName].ToString();
					}
					break;
				}
		}
	}

	private void ShowButtonsInParentPage()
	{
		if (Id > 0)
		{
			ClientScript.RegisterClientScriptBlock(Page.GetType(), "showButtons", "parent.showExButtons();", true);
		}
		else
		{
			ClientScript.RegisterClientScriptBlock(Page.GetType(), "showButtons", "parent.showNewButtons(" + Type + ");", true);
		}
	}

	private void ShowAddButtonInParentPage()
	{
		if (Id > 0)
		{
			ClientScript.RegisterClientScriptBlock(Page.GetType(), "showAddButton", "parent.showAddButton(" + Type + ");", true);
		}
		else
		{
			ClientScript.RegisterClientScriptBlock(Page.GetType(), "hideAddButtons", "parent.hideAddButtons();", true);
		}
	}

	private void HideAllEditDivs()
	{
		sectionEditDiv.Visible = false;
		sectionEditDiv.Style.Add("display", "none");

		topicEditDiv.Visible = false;
		topicEditDiv.Style.Add("display", "none");

		subTopicEditDiv.Visible = false;
		subTopicEditDiv.Style.Add("display", "none");
	}

	protected void SaveContent()
	{
		int id = Id;

		switch (Type)
		{
			case 1:
				{
					if (id > 0)
					{
						PatientEdSection sec = new PatientEdSection();
						sec.Get(Id);
						sec[PatientEdSection.SectionName] = SectionTitleTxtBox.Text;
						sec[PatientEdSection.SectionDescription] = SectionDesc.Text;
						sec.Save();
						RegisterParentFormTitleUpdate("Section", id.ToString(), SectionTitleTxtBox.Text);
					}
					else
					{
						PatientEdSection sec = new PatientEdSection();
						sec[PatientEdSection.SectionName] = SectionTitleTxtBox.Text;
						sec[PatientEdSection.SectionDescription] = SectionDesc.Text;
						sec.Save();
						string contentType = "Section";
						string contentId = sec[PatientEdSection.SectionId].ToString();
						RegisterParentFormRefresh("Section", contentId);
					}

					break;
				}
			case 2:
				{
					PatientEdTopic topic = new PatientEdTopic();
					if (id > 0)
					{
						topic.Get(Id);
						RegisterParentFormTitleUpdate("Topic", id.ToString(), TopicTitleTxtBox.Text);
					}
					else
					{
						string sectionId = Request.QueryString["sectionId"];
						if (!string.IsNullOrEmpty(sectionId))
						{
							topic[PatientEdTopic.SectionId] = sectionId;
						}
						else
						{
							break;
						}
					}
					topic[PatientEdTopic.TopicName] = TopicTitleTxtBox.Text;
					topic[PatientEdTopic.TopicDescription] = TopicDesc.Text;
					topic.Save();

					if (id == 0)
					{
						string contentType = "Topic";
						string contentId = topic[PatientEdTopic.TopicId].ToString();
						RegisterParentFormRefresh(contentType, contentId);
					}
					break;
				}
			case 3:
				{
					PatientEdSubTopic subtopic = new PatientEdSubTopic();
					if (id > 0)
					{
						subtopic.Get(Id);
						RegisterParentFormTitleUpdate("SubTopic", id.ToString(), SubTopicTitleTxtBox.Text);
					}
					else
					{
						string topicId = Request.QueryString["topicId"];
						if (!string.IsNullOrEmpty(topicId))
						{
							subtopic[PatientEdSubTopic.TopicId] = topicId;
						}
						else
						{
							break;
						}
					}
					subtopic[PatientEdSubTopic.SubTopicName] = SubTopicTitleTxtBox.Text;
					subtopic[PatientEdSubTopic.SubTopicContent] = SubTopicContentRTE.Text;
					subtopic.Save();

					if (id == 0)
					{
						string contentType = "SubTopic";
						string contentId = subtopic[PatientEdSubTopic.SubTopicId].ToString();
						RegisterParentFormRefresh(contentType, contentId);
					}
					break;
				}
		}
	}

	/// <summary>
	/// Calls the top page to reload page and tree based on updated node
	/// </summary>
	/// <param name="contentType"></param>
	/// <param name="contentId"></param>
	private void RegisterParentFormRefresh(string contentType, string contentId)
	{
		string reloadContent = "parent.reloadContentPage('" + contentType + "','" + contentId + "');";
		Page.ClientScript.RegisterStartupScript(typeof(Page), "reloadContent", reloadContent, true);
	}

	/// <summary>
	/// Updates the node title in the parent tree.
	/// </summary>
	private void RegisterParentFormTitleUpdate(string contentType, string contentId, string newTitle)
	{
		newTitle = PageUtil.EscapeSingleQuotes(newTitle);
		newTitle = PageUtil.EscapeDoubleQuotes(newTitle);
		string updateNodeTitle = "parent.updateNodeTitle('" + contentType + "','" + contentId + "','" + newTitle + "');";
		Page.ClientScript.RegisterStartupScript(typeof(Page), "updateNodeTitle", updateNodeTitle, true);
	}
}

