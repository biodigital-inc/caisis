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
using System.Text;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class RelocateTransfer : SpecimenMgmtBasePage
    {
        /// <summary>
        /// Gets the Transfer Id from the Query String
        /// </summary>
        private int QueryTransferId
        {
            get
            {
                string sId = Request.QueryString["Id"];
                if (!string.IsNullOrEmpty(sId))
                {
                    return int.Parse(sId);
                }
                else
                {
                    return 0; // since TransferId seed in database is 1
                }
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                OnCollectionChange(CollectionId.Value);
            }
            else //first time in
            {
                this.transferName.InnerHtml = getQS("Name");
                LoadCollectionsInTransfer();
               
            }
        }

        private void LoadCollectionsInTransfer()
        {
            SpecimenManagerDa da = new SpecimenManagerDa();
            DataTable dt = da.GetCollectionsByRequestId(QueryTransferId);
            RptCollections.DataSource = dt.DefaultView;
            RptCollections.DataBind();
        }

        protected void OnCollectionChange(string colId)
        {
            if (PageUtil.IsInteger(colId))
            {
                int _colId = int.Parse(colId);
                SpecimenManagerDa da = new SpecimenManagerDa();
                DataTable dt = da.GetBoxesByCollectionId(_colId);
                RptBoxes.DataSource = dt.DefaultView;
                RptBoxes.DataBind();

                // change style of div for current collection
                string s = "highlightItem('Collection', '" + colId + "');";
                Page.RegisterStartupScript("xyz", "<script language=javascript>" + s + "</script>");
            }
        }
    }
}
