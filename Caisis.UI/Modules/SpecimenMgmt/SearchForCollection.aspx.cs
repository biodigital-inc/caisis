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
    public partial class SearchForCollection : SpecimenMgmtBasePage //System.Web.UI.Page
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            // first time, either from "Find Collection" or "Back to Query Page" links
            if (!IsPostBack)
            {
                // load the prior search parameters from the QueryString into the controls
                // QueryString is empty when page is reached through "Find Collection" link
                foreach (string k in Request.QueryString.Keys)
                {
                    Control cic = Page.FindControl(k) as Control;
                    if (cic != null && cic is ICaisisInputControl)
                    {
                        (cic as ICaisisInputControl).Value = Request.QueryString[k];
                    }
                }

                // don't run the search if the search returned a single result (prevent loop)
                // because we have it set to redirect to the Collection page when single result
                bool isSingleSearch = !string.IsNullOrEmpty(Request.QueryString["isSingleResult"]);

                if (Request.QueryString.Count > 0 && !isSingleSearch) // runs when coming from "View All Collections" as well
                {                                                     // but not for "Find Collection" 
                    RunSearch();
                }

                string menuItem = Request.QueryString["menu"];
                if (!string.IsNullOrEmpty(menuItem) && menuItem.Equals("viewAll"))
                {
                    this.ResultsTitle.Text = "View All Collections";
                    this.searchControlsRow.Visible = false;
                    this.resultsMsg.Visible = true;
                }
                else
                {
                    this.ResultsTitle.Text = "Find Collection";
                    this.searchControlsRow.Visible = true;

                    if (!string.IsNullOrEmpty(Request.QueryString["colId"])) //we are reaching the page through "Back to Search Results"
                    {
                        this.resultsMsg.Visible = true;
                    }
                    else //plain "Find Collection"
                    {
                        this.resultsMsg.Visible = false;
                    }
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
                dt = da.GetCollectionByName(this.collectionName.Value);

                dt = da.GetCollections(this.collectionName.Value, this.ddlType.Value, this.ddlStatus.Value, this.dateFrom.Value, this.dateTo.Value, this.chkViewAll.Checked);
                //}

                this.lblTotalCollections.Text = dt.Rows.Count.ToString() + " collection record(s) matched your search criteria";

                if (dt.Rows.Count == 1)
                {
                    Response.Redirect("Collection.aspx?colId=" + dt.Rows[0][SpecimenCollection.CollectionId].ToString() + "&isSingleResult=true" + BuildQuerySearch());
                }
                if (dt.Rows.Count > 0)
                {
                    this.noCollectionsRow.Visible = false;
                    this.searchBody.Visible = true;
                    this.resultsMsg.Visible = true;

                    this.rptCollection.DataSource = dt.DefaultView;
                    this.rptCollection.DataBind();
                }
                else
                {
                    this.noCollectionsRow.Visible = true;
                    this.searchBody.Visible = true;
                    this.resultsMsg.Visible = false;

                    this.rptCollection.DataSource = null;
                    this.rptCollection.DataBind();
                }
            }
            else
            {
                ShowMessage(this.errorMessage, "Please enter a valid date.", "red");

                this.errorMessage.Visible = true;
                this.resultsMsg.Visible = false;
                this.searchBody.Visible = false;
            }
        }

        /// <summary>
        /// Concatenate the current values in the search controls for the QueryString.
        /// </summary>
        /// <returns>String formatted to be appended to the QueryString, starts with &amp; symbol.</returns>
        protected string BuildQuerySearch()
        {
            //// Works if controls match BizObj Column Names
            //string url = "";
            //SpecimenCollection spec = new SpecimenCollection();
            //foreach (DataColumn bizCol in spec.DataSourceView.Table.Columns)
            //{
            //    string colName = bizCol.ColumnName;
            //    ICaisisInputControl cic = Page.FindControl(colName) as ICaisisInputControl;
            //    if (cic != null)
            //    {
            //        url += "&" + (cic as Control).ID + "=" + cic.Value;
            //    }
            //}
            //return url;

            string urlVars = "";
            string menuItem = Request.QueryString["menu"];
            if (!string.IsNullOrEmpty(menuItem) && menuItem.Equals("viewAll"))
            {
                urlVars = "&menu=viewAll" + "&chkViewAll=" + this.chkViewAll.Value;
            }
            else
            {
                urlVars = "&collectionName=" + this.collectionName.Value + "&dateFrom=" + this.dateFrom.Value + "&dateTo=" + this.dateTo.Value + "&ddlType=" + this.ddlType.Value + "&ddlStatus=" + this.ddlStatus.Value + "&chkViewAll=" + this.chkViewAll.Value;
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
            // create a reference to the current tr
            System.Web.UI.HtmlControls.HtmlContainerControl collectionRow;
            collectionRow = (System.Web.UI.HtmlControls.HtmlContainerControl)e.Item.FindControl("collectionRow");

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.DataItem != null)
                {
                    string localCollectionId = ((DataRowView)e.Item.DataItem)["collectionId"].ToString();
                    string urlVars = "colId=" + localCollectionId + BuildQuerySearch();

                    collectionRow.Attributes.Add("onClick", "parent.frames['MainWindow'].location='Collection.aspx?" + urlVars + "';");
                }
            }
        }


        /// <summary>
        /// Update contents of "collectionName" drop down based on "Show Transaction Complete" checkbox checked value. 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LoadCollectionNameDDL(object sender, EventArgs e)
        {
            if (this.chkViewAll.Checked) // show all collections
            {
                this.collectionName.LookupDistinct = "SpecimenCollections;CollectionName;CollectionName;;CollectionName ASC";
            }
            else // don't show collections with status of "Transaction Complete"
            {
                this.collectionName.LookupDistinct = "SpecimenCollections;CollectionName;CollectionName;CollectionStatus <> 'Transaction Complete';CollectionName ASC";
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

        /// <summary>
        /// Sorting Collection repeater using headers in ascending & descending order
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptSort(object sender, CommandEventArgs e)
        {
            SpecimenManagerDa da = new SpecimenManagerDa();
            DataTable dt = da.GetCollections(this.collectionName.Value, this.ddlType.Value, this.ddlStatus.Value, this.dateFrom.Value, this.dateTo.Value, this.chkViewAll.Checked);

            switch (e.CommandName)
            {
                case "Name":
                    if (Name.ToolTip == "Click to sort descending")
                    {
                        dt.DefaultView.Sort = "CollectionName Desc";
                        Name.ToolTip = "Click to sort ascending";
                    }
                    else
                    {
                        dt.DefaultView.Sort = "CollectionName Asc";
                        Name.ToolTip = "Click to sort descending";
                    }
                    break;
                case "Type":
                    if (ColType.ToolTip == "Type" || ColType.ToolTip == "Click to sort ascending")
                    {
                        dt.DefaultView.Sort = "CollectionType";
                        ColType.ToolTip = "Click to sort descending";
                    }
                    else if (ColType.ToolTip == "Click to sort descending")
                    {
                        dt.DefaultView.Sort = "CollectionType Desc";
                        ColType.ToolTip = "Click to sort ascending";
                    }
                    break;
                case "Status":
                    if (Status.ToolTip == "Status" || Status.ToolTip == "Click to sort ascending")
                    {
                        dt.DefaultView.Sort = "CollectionStatus";
                        Status.ToolTip = "Click to sort descending";
                    }
                    else if (Status.ToolTip == "Click to sort descending")
                    {
                        dt.DefaultView.Sort = "CollectionStatus Desc";
                        Status.ToolTip = "Click to sort ascending";
                    }
                    break;
                case "Specimens":
                    if (Specimens.ToolTip == "#Specimens" || Specimens.ToolTip == "Click to sort ascending")
                    {
                        dt.DefaultView.Sort = "SpecimensInCollection";
                        Specimens.ToolTip = "Click to sort descending";
                    }
                    else if (Specimens.ToolTip == "Click to sort descending")
                    {
                        dt.DefaultView.Sort = "SpecimensInCollection Desc";
                        Specimens.ToolTip = "Click to sort ascending";
                    }
                    break;
                case "DateCreated":
                    if (DateCreated.ToolTip == "Date" || DateCreated.ToolTip == "Click to sort ascending")
                    {
                        dt.DefaultView.Sort = "CollectionAssignDate"+" Asc";
                        DateCreated.ToolTip = "Click to sort descending";
                    }
                    else if (DateCreated.ToolTip == "Click to sort descending")
                    {
                        dt.DefaultView.Sort = "CollectionAssignDate"+" Desc";
                        DateCreated.ToolTip = "Click to sort ascending";
                    }
                    break;
            }

            rptCollection.DataSource = dt;
            rptCollection.DataBind();
        }

    }
}