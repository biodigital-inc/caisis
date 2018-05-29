using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

using Caisis.Security;

namespace Caisis.UI.Core.Classes
{
	/// <summary>
	/// All .aspx pages inherit from BasePage.  Contains little logic of its own but is used to centralize logic
	/// that is needed on all pages.  Common logic includes definition and linking of the PageLoad method to the OnInit event.
	/// </summary>
	public class BasePage : System.Web.UI.Page
	{
        public BasePage()
            : base()
        {
            PreLoad += new EventHandler(BasePage_PreLoad);
        }

        void BasePage_PreLoad(object sender, EventArgs e)
        {
            if (!HasModuleAccess(Request.Url.ToString()))
            {

                Response.Redirect(Page.ResolveUrl("~/Core/Utilities/Dashboard.aspx"));
            }
        }

		/// <summary>
		/// Called at the opening of the page.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		virtual protected void Page_Load(object sender, System.EventArgs e)
		{
            // by default turn off viewstate to increase performance
            this.EnableViewState = false;
		}

		/// <summary>
		/// Called by pages that should be redirected when inactive over the timeout designated in web.config. 
		/// Should NOT be automatically inherited by all pages since outer Frame pages may be static for longer than timeout period.
		/// </summary>
		protected void RedirectOnTimeout()
		{
			string _pathToClientSideRedirect = Page.ResolveUrl("~/Core/Utilities/ClientSideRedirect.aspx");
			Response.AppendHeader("Refresh", Convert.ToString((Session.Timeout * 60) + 10) + "; url=\"" + _pathToClientSideRedirect + "\"");
		}

        private bool HasModuleAccess(string url)
        {
            Dictionary<string, string> map = null;

            if (!CacheManager.IsInCache("modulesecurity"))
            {
                XmlNodeList tabs = CaisisConfiguration.GetTabsList();
                map = new Dictionary<string, string>();

                var q =
                    from XmlNode x in tabs
                    let locationEl = x["location"]
                    let tabName = x.Attributes["name"].Value.ToUpper()
                    where locationEl != null && locationEl.InnerText.StartsWith("/")
                    select new 
                    { 
                        Location = locationEl.InnerText.Split('/')[1],
                        Tab = tabName
                    };

                foreach (var t in q)
                    map[t.Location.ToUpper()] = t.Tab;

                CacheManager.InsertIntoCache("modulesecurity", map, 240);
            }
            else
            {
                map = (Dictionary<string, string>) CacheManager.GetFromCache("modulesecurity");
            }

            if (Session[SessionKey.GroupViewCode] != null)
            {
                string upperUrl = url.ToUpper();
                string groupViewCode = Session[SessionKey.GroupViewCode].ToString();

                foreach (string location in map.Keys)
                {
                    if (upperUrl.Contains(location))
                    {
                        return groupViewCode.Contains(map[location]);
                    }
                }
            }

            // default allow
            return true;
        }

		/// <summary>
		/// Called at the end of page processing.  Can be overriden in child classes to contain class specific information.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		virtual protected void Page_Unload(object sender, System.EventArgs e)
		{
		}

		/// <summary>
		/// Overrides method to add linking of the PageUnLoad method
		/// </summary>
		/// <param name="e"></param>
		override protected void OnUnload(EventArgs e)  
		{
			FinalizeComponent();
			base.OnUnload(e);
		}

		/// <summary>
		/// Overrides method to include Page_Load method.  
		/// </summary>
		/// <param name="e"></param>
		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
//			InitializeComponent();
			base.OnInit(e);
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
		
		private void FinalizeComponent()  
		{
			this.Unload += new System.EventHandler(this.Page_Unload);
		}

        /// <summary>
        /// Returns whether the logged in user has rights to view Patient Identifiers
        /// (i.e., First Name, Last Name, Date of Birth, etc...)
        /// </summary>
        /// <returns></returns>
        public bool ShowPatientIdentifiers()
        {
            return PermissionManager.HasPermission(PermissionManager.ViewPatientIdentifiers);
        }
	}
}
