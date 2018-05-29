using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Xml.Linq;

using Caisis.Security;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.FollowUp
{
    /// <summary>
    /// Summary description for FollowUP.
    /// </summary>
    public partial class FollowUpSplash : BasePage
    {
        private void InitializeComponent()
        {

        }

        protected override void Page_Load(object sender, System.EventArgs e)
        {

            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
            }
        }
    }
}
