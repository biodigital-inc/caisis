using System;
using System.Collections;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities
{
    /// <summary>
    /// Summary description for ModuleContainer.
    /// </summary>
    public partial class ModuleContainer : FramePage
    {

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Request.QueryString["mod"] != null && Request.QueryString["mod"].Length > 0)
            {
                string mod = Request.QueryString["mod"].ToString();
                string loadPage = "../../Modules" + mod;
                if (Request.QueryString["findClicked"] != null && Request.QueryString["findClicked"].Equals("true"))
                {
                    NameValueCollection modParams = HttpUtility.ParseQueryString(Server.UrlDecode(mod));
                    modParams.Add("findClicked", "true");
                    if (modParams.Keys.Count > 0 && modParams.Keys[0] != null)
                    {
                        loadPage += "&findClicked=true";
                    }
                    else
                    {
                        loadPage += "?findClicked=true";
                    }
                }


                ModuleWindow.Attributes.Add("src", loadPage);
            }

            base.Page_Load(sender, e);
        }

    }
}
