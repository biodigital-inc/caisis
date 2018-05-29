using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Caisis.UI.Core.Utilities
{
    public partial class RemoteCalcTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string url = "http://vssurpweblib1/nomogram/production/v01/prostate";
            using (WebClient client = new WebClient())
            {
                string json = client.DownloadString(url);
                GuruMeditation.InnerText = json;
            }
        }
    }
}
