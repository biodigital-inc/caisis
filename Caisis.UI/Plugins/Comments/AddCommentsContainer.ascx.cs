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

using Caisis.UI;
using Caisis.BOL;
using Caisis.PluginFramework;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Plugins
{
    public partial class AddCommentsContainer : CaisisPlugin
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pluginRoot; 

            if (System.Web.HttpContext.Current.Request.ApplicationPath.Equals("/"))
            {
                pluginRoot = "";
            }
            else
            {
                pluginRoot = System.Web.HttpContext.Current.Request.ApplicationPath;
            }

            string pluginPath = pluginRoot + "/Plugins/Comments/AddComments.aspx";		
            CommentsIFrame.Attributes.Add("src", pluginPath);
            
        }



        #region CaisisPlugin members

        public override string ControlIdToModify
        {
            get
            {
                return null; //since we aren't modifying any controls on the parent page, just return null.
            }
        }

        public override PluginType Type
        {
            get
            {
                return Caisis.PluginFramework.PluginType.WebHtml;
            }
        }

        public override string Name
        {
            get
            {
                return "Add Comments";
            }
        }

        #endregion
    }

  
	
}
