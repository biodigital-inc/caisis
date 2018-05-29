namespace Caisis.UI.Core.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	using System.Xml;

	using Caisis.Security;
	using Caisis.BOL;
	using Caisis.DataAccess;

	using Caisis.UI.Core.Classes;


	/// <summary>
	///		Summary description for EFormMenus.
	/// </summary>
	public partial  class EFormMenus : BaseControl
	{
		protected System.Web.UI.HtmlControls.HtmlAnchor act0;
		protected Literal configMsg;

		protected int[] MenuXPos = new int[1];

		// TODO: these repeaters should be defined dynamically by the parent nodes in the xml
		protected Repeater rptProstateMenuItems;

		private XmlDocument menusXml;

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			// get the current disease
			CustomPrincipal cp = System.Threading.Thread.CurrentPrincipal as CustomPrincipal;
			string module = cp.UserProfile["diseaseView"].ToString();
			
			// load the menus from the modules directory
			//menusXml = XmlUtil.GetXmlConfigFile(XmlUtil.EFormMenusConfig);
			
			this.SetClinicGroupTitles();
//            this.SetEFormListTypeIndicator();
			//this.SetMenus();
			
			//this.GetMenuItems();

			// set menu position if visible
			//this.SetMenuPositions();
		}
	
		protected void SetClinicGroupTitles()
		{
			/* set name of clinic group: ie "Dr. Doe's Clinic"
			if(Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString() == "Clinic")
			{
				string docClinicName = Session[SessionKey.CurrentListCrit].ToString();
				
				// displays just doc last name
				//int commaIndex = docClinicName.IndexOf(",");
				//docClinicName = docClinicName.Remove(commaIndex, docClinicName.Length - commaIndex);
				
				ClinicTitle.Text = "Dr. " + docClinicName + "'s Clinic";
			}*/

			// get user name
			UserDa da = new UserDa();
			SecurityController sc = new SecurityController();

			DataSet ds = da.GetByUserName(sc.GetUserName());
			if (ds.Tables[0].Rows.Count == 1)  
			{
				CurrentClinicUser.Text = ds.Tables[0].Rows[0]["UserFirstName"].ToString() + " " + ds.Tables[0].Rows[0]["UserLastName"].ToString();			
			}
		}


        protected void SetEFormListTypeIndicator()
        {
            if (Request.QueryString["EFormListType"] != null && Request.QueryString["EFormListType"].Length > 0)
            {
                string lt = Request.QueryString["EFormListType"].ToLower();
                EFormMenuJSScript.Text = "setListTypeIndicator('" + lt + "');";
            }
            else if (Request.QueryString["findClicked"] != null && Request.QueryString["findClicked"].Equals("true"))
            {
                EFormMenuJSScript.Text = "setListTypeIndicator('patient');";
            }
        }



        ///// <summary>
        ///// Get xml driven menu items
        ///// </summary>
        //protected void GetMenuItems()
        //{
        //    // bind xml to menus. if nothing defined in xml, hide the menu. string must match node in xml
        //    BindXmlNodeListToMenu("prostate", menusXml, rptProstateMenuItems, act0);
        //}
		
        //protected void SetMenuPositions()
        //{
        //    // start menus 318 px from left as baseline
        //    MenuXPos[0] = 264;

        //    if(act0.Visible) MenuXPos = IncrementMenuPositions(MenuXPos, 0, 81);
        //}

	
        //// set whether or not menu is visible based on user group
        //protected void SetMenus()
        //{		
        //    //TODO : create method in base menu control to encapsulate
        //    act0.Attributes.Add("class", "enabledMenuLink");
        //    act0.Attributes.Add("onmouseover","ypSlideOutMenu.showMenu('menu0')");
        //    act0.Attributes.Add("onmouseout","ypSlideOutMenu.hideMenu('menu0')");
        //}
	}
}
