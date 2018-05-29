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

using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// Summary description for AdminGroupsToDatasets.
	/// </summary>
	public partial class AdminGroupsToDatasets : AdminBasePage
										   {
		protected ImageButton  DeleteBtn;
		
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			valMsg.Text = "";
			datasetMessage.Text = "";
			AddBtn.ImageUrl = "../Images/AdminImages/submit.gif"; 
			AddBtn.Width = 65; 
			AddBtn.Height= 21;
			
			SelectDatasetName.Attributes.Add("onchange", "this.form."+SelectSubmitted.ClientID+".value = 'true'; this.form.submit();");

			if(Page.IsPostBack)
			{
				//check if form is submitted from select box or to update password	
				if(!Request.Form["SelectDatasetName"].Equals("") && Request.Form["SelectSubmitted"] != null && Request.Form["SelectSubmitted"].Equals("true")) 
				{
					this.ShowGroupSelect(int.Parse(Request.Form["SelectDatasetName"]));
				}
			}
			else
			{
				DataSetDa das = new DataSetDa();
				DataSet ds = das.GetDatasets();
				SelectDatasetName.DataSource		= ds.Tables[0].DefaultView;
				SelectDatasetName.DataValueField	= "DatasetId";
				SelectDatasetName.DataTextField	= "DatasetName";
				SelectDatasetName.DataBind();
				SelectDatasetName.Items.Insert(0,new ListItem(""));

				//SelectDatasetTable.Visible = false;		
	
				//adding new dataset
				if(Request.QueryString["newDataset"] != null && Request.QueryString["newDataset"].Equals("yes"))
				{
					SelectDatasetName.Value = Request.QueryString["datasetId"];

					this.ShowGroupSelect(int.Parse(Request.QueryString["datasetId"]));
				}
			}

		}//end page_load

		protected void ShowGroupSelect(int datasetId)
		{
			datasetMessage.Text = "";		
			
			GroupDatasetDa da = new GroupDatasetDa();

			//get users existing groups
			DataSet ds = da.GetGroupsByDatasetId(datasetId);
			rptDatasetGroups.DataSource = ds.Tables[0].DefaultView;
			rptDatasetGroups.DataBind();

			if(ds.Tables[0].Rows.Count == 0)
			{
				datasetMessage.Text = "No Groups Assigned";
			}
					
			//get groups
			GroupDa gda = new GroupDa();
			DataSet gds = gda.GetGroups();
			Group.DataSource		= gds.Tables[0].DefaultView;
			Group.DataValueField	= "GroupId";
			Group.DataTextField		= "GroupName";
			Group.DataBind();
			Group.Items.Insert(0,new ListItem(""));

			SelectDatasetTable.Visible = true;
		}

		protected void AddButtonClick(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			if(!Request.Form["Group"].Equals("") && !Request.Form["Group"].Equals(""))
			{
				int datasetId = int.Parse(Request.Form["SelectDatasetName"]);
				int groupId = int.Parse(Request.Form["Group"]);
			
				if(ValidateDatasetGroup())
				{
                    GroupDataset biz = new GroupDataset();
                    biz[GroupDataset.DatasetId] = datasetId;
                    biz[GroupDataset.GroupId] = groupId;
                    biz.Save();
				}

				this.ShowGroupSelect(datasetId);
				//this.Page_Load(sender, (System.EventArgs)e);
			}
			else
			{
				valMsg.Text = "You must select a dataset and group.";
			}
		}
		
		protected void DeleteButtonClick(object sender, CommandEventArgs e)
		{
			GroupDatasetDa groupDatasetDa = new GroupDatasetDa();
			int datasetId = int.Parse(Request.Form["SelectDatasetName"]);
			int groupId = int.Parse(e.CommandName);
			
			groupDatasetDa.DeleteGroupDataset(datasetId, groupId);
			
			this.Page_Load(sender, (System.EventArgs)e);
		}

		protected bool ValidateDatasetGroup()
		{
			return true;
		}
	}
}
