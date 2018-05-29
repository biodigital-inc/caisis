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

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.DataAnalysis
{
    public partial class ReportsIndex : FramePage
    {
        /// <summary>
        /// Gets the report passed in the query string
        /// </summary>
        protected string QueryStringReport
        {
            get
            {
                return Request.QueryString["report"];
            }
        }
 
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(QueryStringReport))
                {
                    SetLoadReport(QueryStringReport);
                }
            }
        }

        /// <summary>
        /// Sets the active report in frame
        /// </summary>
        /// <param name="report"></param>
        private void SetLoadReport(string report)
        {
            ReportsContainer.Attributes["src"] = "Reports/AdHocReports.aspx?report=" + Server.UrlEncode(report);
        }
    }
}
