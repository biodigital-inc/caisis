using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.SessionState;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Security;
using System.Security.Principal;
using System.Security.Permissions;
using Caisis.Security;
using System.Configuration;
using System.Web.UI.WebControls.WebParts;


using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class AccessionQueryResults : SpecimenMgmtBasePage
    {
        private int patientId = 0;
        private string _identifierType = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
        SpecimenManagerDa da = new SpecimenManagerDa();

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            patientId = Convert.ToInt32(DecryptPatientId(Request.QueryString["patientId"].ToString()));

            if (!Page.IsPostBack)
            {
                LoadAccessions();
            }
        }

        private void LoadAccessions()
        {
            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            DataTable dt = da.GetAccessionsChronoList(patientId, datasetSql);
            int totalRecords = dt.Rows.Count;

            if (totalRecords > 0)
            {
                rptAccessionResults.DataSource = dt.DefaultView;
                rptAccessionResults.DataBind();

                numOfRecordsMsg.Text = totalRecords + " records that matched your search criteria";
            }
            else
            {
                this.noAccessionsRow.Visible = true;
            }
        }        
    }
}