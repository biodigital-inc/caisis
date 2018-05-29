using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.DataAccess;

namespace Caisis.UI.Admin
{
    public partial class Index : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildStats();
        }

        private void BuildStats()
        {
            // get stats in past 0 days, i.e., Today

            ErrorLogDa da = new ErrorLogDa();
            int errorCount = da.GetRecentErrorCount(0);
            ErrorCount.Text = errorCount.ToString();

            UserDa uDa = new UserDa();
            int loginCount = uDa.GetUserLoginCount(0);
            UserLoginCount.Text = loginCount.ToString();
        }
    }
}