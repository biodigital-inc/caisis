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



//2.0 using Caisis.UI.Core.Eforms;
using Caisis.Controller;
using System.Configuration;

using Caisis.UI.Core.Classes;


namespace Caisis.UI.Core.Utilities
{
	/// <summary>
	/// Summary description for Inbox.
	/// </summary>
	public partial class Inbox : BasePage
	{
		
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			base.Page_Load(sender, e);

			if(!Page.IsPostBack)
			{
				ListItem item0 = new ListItem("All Unapproved", ""); // returns in progress, complete, and narrated eforms
				ListItem item1 = new ListItem("Data Entry In Progress", EformStatusManager.Status_DataEntryInProgress);
				ListItem item2 = new ListItem("Data Entry Complete", EformStatusManager.Status_DataEntryComplete);
				ListItem item3 = new ListItem("Data Entry Reviewed", EformStatusManager.Status_Narrated); // reviewed and narrated the same thing right now
				ListItem item4 = new ListItem("Approved", EformStatusManager.Status_Approved);
				
				InboxMsgType.Items.Clear();
				InboxMsgType.Items.Insert(0, item0);
				InboxMsgType.Items.Insert(1, item1);
				InboxMsgType.Items.Insert(2, item2);
				InboxMsgType.Items.Insert(3, item3);
				InboxMsgType.Items.Insert(4, item4);					
				
			}
			// set message type url variable
			else 
			{
				//defaults to Open and Previewed Forms
				InboxMessages.Attributes.Add("src", "InboxMessages.aspx?msgStatus="+InboxMsgType.SelectedValue+"");
			}
		}
	}
}
