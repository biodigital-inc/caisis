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

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class Index : ProjectMgmtBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {

            if (!string.IsNullOrEmpty(base.ProjectId))
            {
                MainWindow.Attributes["src"] = "EditProject.aspx?projectId=" + base.ProjectId;
            }
         
            base.Page_Load(sender, e);


        }
    }
}