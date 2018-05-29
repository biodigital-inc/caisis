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

using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectEventsView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BindEventsRptr()
        {
            ProjectStageEvent biz = new ProjectStageEvent();
        }
    }
}
