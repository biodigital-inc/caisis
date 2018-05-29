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
using System.Xml;
using System.Text;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Security;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// Page displays tabs for assignment to groups based on their definitions in ModulesRegistry.xml
	/// </summary>
	public partial class AdminGroupTabAccess : AdminBasePage
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			if(!IsPostBack)
			{	
				//get groups
				GroupDa gda = new GroupDa();
				DataSet gds = gda.GetGroups();
				SbGroup.DataSource		= gds.Tables[0].DefaultView;
				SbGroup.DataValueField	= "GroupId";
				SbGroup.DataTextField	= "GroupName";
				SbGroup.DataBind();
				SbGroup.Items.Insert(0,new ListItem(""));
			}
		}
	
		/// <summary>
		/// Get tabs from Xml and display their names
		/// </summary>
		private void DisplayAllTabs()
		{
			TabCheckBoxList.Items.Clear();
			
			XmlDocument xmlDoc = XmlUtil.GetModulesConfigXml();
			XmlNodeList listOfTabs		= xmlDoc.SelectNodes("modules/module[@isTab='true']");

			foreach(XmlNode node in listOfTabs)
			{
				string tabTitleUpper = node.Attributes["name"].Value.ToUpper();

				TabCheckBoxList.Items.Add(new ListItem(tabTitleUpper,tabTitleUpper));
			}
		}

		/// <summary>
		/// Display the tabs
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void OnGroupNameChange(object sender,  System.EventArgs e)
		{
			this.DisplayAllTabs();

			this.CheckGroupTabs();
		}

		/// <summary>
		/// Check the tabs assigned to a group
		/// </summary>
		private void CheckGroupTabs()
		{
			Group group = new Group();
			group.Get((int.Parse(SbGroup.SelectedValue)));

			string groupAccessCode = group["GroupAccessCode"].ToString();

			for(int i=0;i<TabCheckBoxList.Items.Count;i++)
			{
				if(groupAccessCode.IndexOf(TabCheckBoxList.Items[i].Text) >= 0)
				{
					TabCheckBoxList.Items[i].Selected = true;
				}
			}
		}

		/// <summary>
		/// Save tab names assigned to user group
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		protected void UpdateCodesBtn_Click(object sender, CommandEventArgs e)
		{
			StringBuilder sb = new StringBuilder();

			if(!SbGroup.SelectedValue.Equals(""))
			{
				for(int i=0;i<TabCheckBoxList.Items.Count;i++)
				{
					if(TabCheckBoxList.Items[i].Selected)
					{
						if(sb.Length > 0) 
							sb.Append(",");
						sb.Append(TabCheckBoxList.Items[i].Text);
					}
				}
	
				//update db
				GroupDa da = new GroupDa();
				da.UpdateGroupAccessCode(int.Parse(SbGroup.SelectedValue), sb.ToString());

                //refresh item in cache
                CacheManager.RefreshTabListCache();
				
			}
		}
	}	
}
