using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;


using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    /// <summary>
    /// 
    /// </summary>
    public class ProtocolMgmtBaseAdminPage : ProtocolMgmtBasePage
    {
        public ProtocolMgmtBaseAdminPage()
            : base
                ()
        {
            this.PreRender += new EventHandler(HandleUserPermissions);
        }

        /// <summary>
        /// Supress render on basic permissions
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void HandleUserPermissions(object sender, EventArgs e)
        {
            if (this.UserType != ProtocolMgmtUsers.ProtocolAdmin)
            {
                this.Visible = false;
            }
        }
    }
}
