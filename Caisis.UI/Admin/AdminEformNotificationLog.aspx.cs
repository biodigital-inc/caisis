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

using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Admin
{
    public partial class AdminEformNotificationLog : AdminBasePage
    {
        DateTime searchDate = DateTime.Now;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            string searchDateText = Request.QueryString["searchDate"];
            if (!string.IsNullOrEmpty(searchDateText))
            {
                if (!DateTime.TryParse(searchDateText, out searchDate))
                {
                    searchDate = DateTime.Now;
                }
            }
            if (!Page.IsPostBack)
            {
                // Search search date
                DateChooser.Value = searchDate.ToShortDateString();
                BindNotificationGrid(searchDate);
            }

        }

        protected void BindNotificationGrid(DateTime date)
        {
            AppointmentDa da = new AppointmentDa();
            DataTable dt = da.GetEformsSurgeryAppointmentsSentByDate(date);
            dt.DefaultView.Sort = SurgeryAppointment.ApptSurgeonEmail;

            // Bind grid to sorted view
            NotificationLogGrid.DataSource = dt.DefaultView;            
            NotificationLogGrid.DataBind();

            if (dt.Rows.Count == 0)
            {
                SearchMessage.InnerText = "There were no emails sent on " + date.ToShortDateString();
            }
            else
            {
                SearchMessage.InnerText = "Here is a list of emails sent on " + date.ToShortDateString();
            }
        }

        protected void RunSearch(object sender, EventArgs e)
        {
            Server.Transfer("AdminEformNotificationLog.aspx?searchDate=" + DateChooser.Value);
        }
    }
}