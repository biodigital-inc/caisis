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
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class SearchForTransfer : SpecimenMgmtBasePage //System.Web.UI.Page
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            // first time, either from "Find Transfer Request" or "Back to Query Page" links
            if (!IsPostBack)
            {
                // load the prior search parameters from the QueryString into the controls
                // QueryString is empty when page is reached through "Find Transfer Request" link
                foreach (string k in Request.QueryString.Keys)
                {
                    Control cic = Page.FindControl(k) as Control;
                    if (cic != null && cic is ICaisisInputControl)
                    {
                        (cic as ICaisisInputControl).Value = Request.QueryString[k];
                    }
                }
                bool isSingleSearch = !string.IsNullOrEmpty(Request.QueryString["isSingleResult"]);

                // don't run the search if the search returned a single result (prevent loop)
                // because we have it set to redirect to the Trasfer page when single result
                if (Request.QueryString.Count > 0 && !isSingleSearch)
                {
                    RunSearch();
                }

                // NOTE: need to write code so it doesn't redirect when "view all transfer requests" (and there is only 1 entry in db)
                //if (string.IsNullOrEmpty(Request.QueryString["goBack"]) && !isSingleSearch)
                //{
                //    RunSearch();
                //}

                string menuItem = Request.QueryString["menu"];
                if (!string.IsNullOrEmpty(menuItem) && menuItem.Equals("viewAll"))
                {
                    this.ResultsTitle.Text = "View Existing Transfers";
                    this.searchControlsRow.Visible = false;
                    this.resultsMsg.Visible = true;
                }
                else
                {
                    this.ResultsTitle.Text = "Find Transfer Request";
                    this.searchControlsRow.Visible = true;
                    this.resultsMsg.Visible = false;
                }
            }
        }

        protected void ReloadCollections(object sender, EventArgs e)
        {
            RunSearch();
        }

        protected void btnSearch_onClick(object sender, ImageClickEventArgs e)
        {
            RunSearch();
        }

        private void RunSearch()
        {
            // need validation here too
            // because date is validated in the front-end but only when they leave the control
            if (ValidateDates())
            {
                this.errorMessage.Visible = false;

                DataTable dt = null;
                SpecimenManagerDa da = new SpecimenManagerDa();
                dt = da.GetRequests(this.requestName.Value, this.ddlType.Value, this.ddlStatus.Value, this.dateFrom.Value, this.dateTo.Value, this.chkViewAll.Checked);

                this.lblTotalRequests.Text = dt.Rows.Count.ToString() + " transfer request record(s) matched your search criteria";

                string menuItem = Request.QueryString["menu"];
                string isSingleSearch = Request.QueryString["isSingleResult"];
                string searchTerm = this.requestName.Value;

                if (dt.Rows.Count == 1 && menuItem != "viewAll" && !string.IsNullOrEmpty(searchTerm))
                {
                    if (dt.Rows[0]["RequestIdentifier"].ToString().Equals(searchTerm))
                    {
                        // NOTE: try so it doesn't redirect when "view all transfer requests" (and there is only 1 entry in db)
                        Response.Redirect("TransferRequest.aspx?requestId=" + dt.Rows[0][SpecimenRequest.SpecimenRequestId].ToString() + "&isSingleResult=true" + BuildQuerySearch());

                    }
                }
                if (dt.Rows.Count > 0)
                {
                    this.noCollectionsRow.Visible = false;
                    this.pnlSearchBody.Visible = true;
                    this.resultsMsg.Visible = true;

                    this.rptCollection.DataSource = dt.DefaultView;
                    this.rptCollection.DataBind();
                }
                else
                {
                    this.noCollectionsRow.Visible = true;
                    this.pnlSearchBody.Visible = true;
                    this.resultsMsg.Visible = true;

                    this.rptCollection.DataSource = null;
                    this.rptCollection.DataBind();
                }
            }
            else
            {
                ShowMessage(this.errorMessage, "Please enter a valid date.", "red");

                this.errorMessage.Visible = true;
                this.resultsMsg.Visible = false;
                this.pnlSearchBody.Visible = false;
            }
        }

        /// <summary>
        /// Concatenate the current values in the search controls for the QueryString.
        /// </summary>
        /// <returns>String formatted to be appended to the QueryString, starts with &amp; symbol.</returns>
        protected string BuildQuerySearch()
        {
            string urlVars = "";
            string menuItem = Request.QueryString["menu"];
            if (!string.IsNullOrEmpty(menuItem) && menuItem.Equals("viewAll"))
            {
                urlVars = "&menu=viewAll" + "&chkViewAll=" + this.chkViewAll.Value;
            }
            else
            {
                urlVars = "&requestName=" + this.requestName.Value + "&dateFrom=" + this.dateFrom.Value + "&dateTo=" + this.dateTo.Value + "&ddlType=" + this.ddlType.Value + "&ddlStatus=" + this.ddlStatus.Value + "&chkViewAll=" + this.chkViewAll.Value;
            }

            return urlVars;
        }

        /// <summary>
        /// Attach onClick event for each collection table row in the search results. 
        /// The collection id and the current values in the controls are passed to the next page in the QueryString.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptItemCreated(Object sender, RepeaterItemEventArgs e)
        {
            System.Web.UI.HtmlControls.HtmlTableRow tr;
            tr = (System.Web.UI.HtmlControls.HtmlTableRow)e.Item.FindControl("collectionRow");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.DataItem != null)
                {
                    string requestId = ((DataRowView)e.Item.DataItem)["specimenRequestId"].ToString();
                    string urlVars = "requestId=" + requestId + BuildQuerySearch();

                    tr.Attributes.Add("onClick", "parent.frames['MainWindow'].location='TransferRequest.aspx?" + urlVars + "';");
                }
            }
        }


        public bool ValidateDates()
        {
            string sDateFrom = this.dateFrom.Value;
            string sDateTo = this.dateTo.Value;

            if (!string.IsNullOrEmpty(sDateFrom))
            {
                if (sDateFrom.Length > 0 && !PageUtil.IsDate(sDateFrom))
                    return false;
            }
            if (!string.IsNullOrEmpty(sDateTo))
            {
                if (sDateTo.Length > 0 && !PageUtil.IsDate(sDateTo))
                    return false;
            }

            return true;
        }

    }
}