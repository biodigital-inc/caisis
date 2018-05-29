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
using System.Collections.Generic;

using Caisis.UI.Core.Classes;
using Caisis.Security;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class TransferRequest : SpecimenMgmtBasePage
    {
        // keep track of stages 
        private int _stage = 0;   // 0 New, 1 Ready For Dispatch, 2 In-Transit, 3 Received
        private List<string> collectionIdList = new List<string>();

        /// <summary>
        /// Gets the Request Id of the currently loaded request, from the interface
        /// </summary>
        private int RequestId
        {
            get
            {
                if (!string.IsNullOrEmpty(this.SpecimenRequestId.Value))
                {
                    return int.Parse(this.SpecimenRequestId.Value);
                }
                else
                {
                    return 0; //SpecimenRequestId starts at 1 in database
                }
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            UserMessage.Text = "";
            ReceiveDateError.Text = "";
            DispatchDateError.Text = "";

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["requestId"]))
                {
                    int reqId = Int32.Parse(Request.QueryString["requestId"]);
                    LoadExistingRequest(reqId);
                    this.ResultsTitle.Text = "Edit Transfer Request";

                    DetermineRequestStatus();
                    LoadCollectionSelectBox(reqId);

                    UpdatePageTitle();
                }
                else
                {
                    this.ResultsTitle.Text = "New Transfer Request";
                    this.backToSearchIcon.Visible = false;

                    DetermineRequestStatus();
                    InitializeAvailableCollectionSelectBox();
                }

                ////populating Contacts field
                //SpecimenManagerDa da = new SpecimenManagerDa();
                //DataTable contactsdt = da.GetContactsForSpecimens();
                //RequestGenContactName.DataSource = contactsdt;
                //RequestGenContactName.DataBind();

                EnableDisableDivsByStatus();
            }
        }

        private void LoadCollectionSelectBox(int requestId)
        {
            if (this._stage == 1)
            {
                // now we need to append (to the top) the collections that are already part of this request
                LoadModifiableCollectionSelectBox(requestId);
            }
            else
            {
                LoadDisabledCollectionSelectBox(requestId);
            }
        }

        /// <summary>
        /// Load the request by id, including information from the request and distribution associated.
        /// </summary>
        /// <param name="rId"></param>
        protected void LoadExistingRequest(int rId)
        {
            SpecimenRequest tRequest = new SpecimenRequest();
            tRequest.Get(rId);

            // NOTE: should we use CaisisExtendedRadioButtonList instead? we need a lookupcode/lookupdistinct
            CICHelper.SetFieldValues(Page.Controls, tRequest);
            this.RequestDate.Value = GetValidDisplayDate(this.RequestDate.Value);

            if (tRequest[SpecimenRequest.RequestType].ToString().Equals("Internal"))
            {
                this.RequestTypeCBL.Items.FindByValue("Internal").Selected = true;
            }
            else
            {
                this.RequestTypeCBL.Items.FindByValue("External").Selected = true;
            }

            // Load distribution associated with the request,if it exists
            LoadDistributionByRequestId(rId);
        }

        /// <summary>
        /// Given a request id, finds the associated distribution. If found, populates the controls with the values.
        /// </summary>
        /// <param name="rId"></param>
        private void LoadDistributionByRequestId(int rId)
        {
            SpecimenManagerDa da = new SpecimenManagerDa();
            DataTable dt = new DataTable();
            dt = da.GetDistributionByRequestId(rId);

            //if there is a distrbution, we populate the fields
            if (dt.Rows.Count > 0)
            {
                SpecimenDistribution sDistribution = new SpecimenDistribution();
                int dId = Int32.Parse(dt.Rows[0][SpecimenDistribution.DistributionId].ToString());
                sDistribution.Get(dId);

                CICHelper.SetFieldValues(this.DispatchDiv.Controls, sDistribution);
                CICHelper.SetFieldValues(this.ReceiveDiv.Controls, sDistribution);

                this.DispatchedDate.Value = GetValidDisplayDate(this.DispatchedDate.Value);
                this.ReceivedDate.Value = GetValidDisplayDate(this.ReceivedDate.Value);
            }
        }


        private void UpdatePageTitle()
        {

            this.ResultsTitle.Text = "Edit Transfer - Status: " + this.RequestStatus.Value;
        }

        protected void MoveSpecimenBtnClick(object sender, EventArgs e)
        {
            string url = "RelocateTransfer.aspx?id=" + RequestId + "&Name=" + Server.UrlEncode(RequestIdentifier.Value);
            Response.Redirect(url);
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            // Set Move Button

            if (this.RequestStatus.Value == "Received")
            {
                MoveSpecimenBtn.Enabled = true;
                MoveSpecimenBtn.ImageUrl = "../../images/MoveSpecimens.gif";
            }
            else
            {
                MoveSpecimenBtn.Enabled = false;
                MoveSpecimenBtn.ImageUrl = "../../images/MoveSpecimens_Off.gif";
            }
        }

        protected void SaveRequestDetails(object sender, ImageClickEventArgs e)
        {
            UserMessage.Text = "";
            try
            {
                if (ValidateRequestDetails())
                {
                    ControlCollection requestControls = Page.FindControl("RequestDiv").Controls;

                    CICHelper.ValidFieldValues(requestControls);

                    SpecimenRequest tRequest = new SpecimenRequest();
                    CICHelper.SetBOValues(requestControls, tRequest, 1);

                    ListItem internalTypeLi = new ListItem();
                    internalTypeLi = this.RequestTypeCBL.Items.FindByValue("Internal");

                    ListItem externalTypeLi = new ListItem();
                    externalTypeLi = this.RequestTypeCBL.Items.FindByValue("External");

                    if (internalTypeLi.Selected)
                    {
                        tRequest[SpecimenRequest.RequestType] = internalTypeLi.Value;
                    }
                    else if (externalTypeLi.Selected)
                    {
                        tRequest[SpecimenRequest.RequestType] = externalTypeLi.Value;
                    }

                    SecurityController sc = new SecurityController();
                    string user = sc.GetUserName();
                    //tRequest[SpecimenRequest.RequestGenContactName] = RequestGenContactName.Text;
                    tRequest[SpecimenRequest.UpdatedBy] = user;
                    tRequest[SpecimenRequest.UpdatedTime] = DateTime.Now;
                    tRequest[SpecimenRequest.EnteredBy] = user;
                    tRequest[SpecimenRequest.EnteredTime] = DateTime.Now;
                    //tRequest[SpecimenRequest.LockedBy] = this.LockedBy.Text;
                    //tRequest[SpecimenRequest.LockedTime] = this.LockedTime.Text;
                    tRequest[SpecimenRequest.RequestStatus] = "Ready For Dispatch";

                    tRequest.Save();

					//DataTable dt = new DataTable();
					//dt = tRequest.GetTable();
                    //this.SpecimenRequestId.Value = dt.Rows[0][SpecimenRequest.SpecimenRequestId].ToString();
					this.SpecimenRequestId.Value = tRequest[SpecimenRequest.SpecimenRequestId].ToString();

                    collectionIdList = new List<string>(this.CollectionIds.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries));
                    foreach (ListItem li in this.AvailableCollectionSelectBox.Items)
                    {
                        int colId = int.Parse(li.Value);
                        if (li.Selected && !collectionIdList.Contains(li.Value))
                        {
                            AddCollectionToRequest(colId);
                        }
                        else if (!li.Selected && this.collectionIdList.Contains(li.Value))
                        {
                            // now we must make sure RequestId=NULL and Status=Available   
                            // for those that are not selected

                            RemoveCollectionFromRequest(colId);
                        }
                    }

                    /*for(int i=0; i<this.AvailableCollectionSelectBox.Items.Count; i++)
                    {
                        bool selected = this.AvailableCollectionSelectBox.Items[i].Selected;
                        string value = this.AvailableCollectionSelectBox.Items[i].Value;
                        int colId = int.Parse(value);
                        if (selected && !collectionIdList.Contains(value))
                        {
                            AddCollectionToRequest(colId);
                        }
                        else if (!selected && this.collectionIdList.Contains(value))
                        {
                            // now we must make sure RequestId=NULL and Status=Available   
                            // for those that are not selected

                            RemoveCollectionFromRequest(colId);
                        }
                    } */

                    this.RequestStatus.Value = "Ready For Dispatch";

                    DetermineRequestStatus();
                    EnableDisableDivsByStatus();
                    LoadCollectionSelectBox(this.RequestId);

                    UpdatePageTitle();
                }
            }
            catch (RequiredValueException rve)
            {
                UserMessage.Text = "Please complete the highlighted required fields.";
            }

        }

        /// <summary>
        /// Validates if at least one collection is selected and the request name is unique.
        /// </summary>
        /// <returns></returns>
        private bool ValidateRequestDetails()
        {
            // need to check for at least one collection selected
            bool isValidRequestName = ValidateRequestName(this.RequestIdentifier.Value);
            bool isCollectionSelected = ValidateCollectionSelected();

            return isValidRequestName && isCollectionSelected;
        }


        private bool ValidateRequestName(string requestName)
        {
            SpecimenManagerDa da = new SpecimenManagerDa();
            DataTable dt = da.GetRequestByName(requestName);
            if (dt.Rows.Count == 0)
            {
                return true;
            }
            else
            {
                if (!string.IsNullOrEmpty(this.SpecimenRequestId.Value))
                {
                    // if comparing to itself, validate
                    if (dt.Rows[0][SpecimenRequest.RequestIdentifier].ToString().Equals(this.RequestIdentifier.Value))
                    {
                        return true;
                    }
                }
                UserMessage.Text += "Request name is already in use, please use another name. ";
                return false;
            }
        }

        private bool ValidateCollectionSelected()
        {
            if (this.AvailableCollectionSelectBox.SelectedIndex >= 0) // no item selected will be -1
            {
                return true;
            }
            else
            {
                UserMessage.Text += "Please select a collection.";
                return false;
            }
        }

        protected void SaveDispatchDetails(object sender, ImageClickEventArgs e)
        {
            try
            {
                ControlCollection dispatchControls = Page.FindControl("DispatchDiv").Controls;

                CICHelper.ValidFieldValues(dispatchControls);

                SpecimenDistribution sDistribution = new SpecimenDistribution();

                CICHelper.SetBOValues(dispatchControls, sDistribution, 1);
                sDistribution[SpecimenDistribution.SpecimenRequestId] = this.RequestId;

                SecurityController sc = new SecurityController();
                string user = sc.GetUserName();
                sDistribution[SpecimenRequest.UpdatedBy] = user;
                sDistribution[SpecimenRequest.UpdatedTime] = DateTime.Now;
                sDistribution[SpecimenRequest.EnteredBy] = user;
                sDistribution[SpecimenRequest.EnteredTime] = DateTime.Now;

                sDistribution.Save();

				//DataTable dt = new DataTable();
				//dt = sDistribution.GetTable();
				//this.DistributionId.Value = dt.Rows[0][SpecimenDistribution.DistributionId].ToString();
				this.DistributionId.Value = sDistribution[SpecimenDistribution.DistributionId].ToString();

                SpecimenManagerDa da = new SpecimenManagerDa();
                da.UpdateRequestStatus(this.RequestId, "In-Transit");
                this.RequestStatus.Value = "In-Transit";

                // update the status for the collections in this transfer (saved to database) 
                // to status of "In-Transit" 
                DataTable dt = da.GetCollectionsByRequestId(this.RequestId);
                foreach (DataRow dr in dt.Rows)
                {
                    int colId = int.Parse(dr[SpecimenCollection.CollectionId].ToString());
                    UpdateCollectionStatus(colId, "In-Transit");
                }

                DetermineRequestStatus();
                EnableDisableDivsByStatus();

                UpdatePageTitle();
            }
            catch (RequiredValueException rve)
            {
                DispatchDateError.Text = "Please enter a dispatch date.";
            }

        }

        protected void SaveReceiveDetails(object sender, ImageClickEventArgs e)
        {
            try
            {
                ControlCollection receiveControls = Page.FindControl("ReceiveDiv").Controls;
                CICHelper.ValidFieldValues(receiveControls);

                SpecimenDistribution sDistribution = new SpecimenDistribution();
                sDistribution.Get(Int32.Parse(this.DistributionId.Value));

                CICHelper.SetBOValues(receiveControls, sDistribution, 1);

                sDistribution.Save();

                SpecimenManagerDa da = new SpecimenManagerDa();
                da.UpdateRequestStatus(this.RequestId, "Received");
                this.RequestStatus.Value = "Received";

                // update the status for the collections in this transfer 
                // (saved to database ... is the same as the ones in showing up in the select box because user can't change them (w/o. saving) at this stage) 
                // to status of "Received" 
                foreach (ListItem li in this.AvailableCollectionSelectBox.Items)
                {
                    int colId = int.Parse(li.Value);
                    UpdateCollectionStatus(colId, "Received");
                }

                DetermineRequestStatus();
                EnableDisableDivsByStatus();

                UpdatePageTitle();
            }
            catch (RequiredValueException rve)
            {
                ReceiveDateError.Text = "Please enter a receive date.";
            }
        }


        #region Enabling and Disabling divs
        private void DetermineRequestStatus()
        {
            if (this.RequestId > 0)
            {
                SpecimenManagerDa da = new SpecimenManagerDa();
                DataTable dt = new DataTable();
                dt = da.GetDistributionByRequestId(this.RequestId);

                if (dt.Rows.Count > 0)
                {
                    if (!string.IsNullOrEmpty(dt.Rows[0]["DispatchedDate"].ToString()))
                    {
                        if (!string.IsNullOrEmpty(dt.Rows[0]["ReceivedDate"].ToString()))
                        {
                            this._stage = 3; //received
                        }
                        else
                        {
                            this._stage = 2; //in transit ... dispatched
                        }
                    }
                }
                else
                {
                    this._stage = 1; //ready for dispatch
                }
            }
        }

        private void EnableDisableDivsByStatus()
        {
            //DetermineRequestStatus();

            if (this._stage == 0)
            {
                EnableRequestDiv();
                //this.RequestStatus.Value = "Pending Transfer"; //was "New" before but we don't want "New" status
                DisableDispatchDiv();
                DisableReceiveDiv();
            }

            if (this._stage == 1)
            {
                EnableRequestDiv();
                EnableDispatchDiv();
                DisableReceiveDiv();
            }
            else if (this._stage == 2)
            {
                DisableRequestDiv();
                EnableDispatchDiv();
                EnableReceiveDiv();
            }
            else if (this._stage == 3)
            {
                DisableRequestDiv();
                DisableDispatchDiv();
                EnableReceiveDiv();
            }

            this.RequestStatus.Enabled = false;
        }

        private void EnableRequestDiv()
        {
            this.RequestDiv.Attributes.Add("class", "divActive");
            this.RequestHeader.Attributes.Add("class", "headerActive");

            this.requestBtn.ImageUrl = "../../images/SubmitRequestForTransfer.gif";

            this.RequestTypeCBL.Enabled = true;
            EnableControls(this.RequestDiv.Controls, true);

            this.AvailableCollectionSelectBox.Disabled = false;
        }
        private void DisableRequestDiv()
        {
            this.RequestDiv.Attributes.Add("class", "divInactive");
            this.RequestHeader.Attributes.Add("class", "headerInactive");

            this.requestBtn.ImageUrl = "../../images/SubmitRequestForTransfer_Off.gif";

            this.RequestTypeCBL.Enabled = false;
            EnableControls(this.RequestDiv.Controls, false);

            this.AvailableCollectionSelectBox.Disabled = true;
        }

        private void EnableDispatchDiv()
        {
            this.DispatchDiv.Attributes.Add("class", "halfDivActive");
            this.DispatchHeader.Attributes.Add("class", "headerActive");

            this.dispatchBtn.ImageUrl = "../../images/DispatchTransfer.gif";

            EnableControls(this.DispatchDiv.Controls, true);
        }
        private void DisableDispatchDiv()
        {
            this.DispatchDiv.Attributes.Add("class", "halfDivInactive");
            this.DispatchHeader.Attributes.Add("class", "headerInactive");

            this.dispatchBtn.ImageUrl = "../../images/DispatchTransfer_Off.gif";

            EnableControls(this.DispatchDiv.Controls, false);
        }

        private void EnableReceiveDiv()
        {
            this.ReceiveDiv.Attributes.Add("class", "halfDivActive");
            this.ReceiveHeader.Attributes.Add("class", "headerActive");

            this.receiveBtn.ImageUrl = "../../images/ReceiveTransfer.gif";

            EnableControls(this.ReceiveDiv.Controls, true);
        }
        private void DisableReceiveDiv()
        {
            this.ReceiveDiv.Attributes.Add("class", "halfDivInactive");
            this.ReceiveHeader.Attributes.Add("class", "headerInactive");

            this.receiveBtn.ImageUrl = "../../images/ReceiveTransfer_Off.gif";

            EnableControls(this.ReceiveDiv.Controls, false);
        }

        private void EnableControls(ControlCollection col, bool val)
        {
            foreach (Control c in col)
            {
                if (c is ICaisisInputControl)
                {
                    ICaisisInputControl ic = c as ICaisisInputControl;
                    ic.Enabled = val;
                }
                else if (c is ImageButton)
                {
                    ImageButton ib = c as ImageButton;

                    if (val == true)
                    {
                        ib.Style.Add("cursor", "pointer");
                    }
                    else
                    {
                        ib.Style.Add("cursor", "default");
                    }

                    ib.Enabled = val;
                }
            }
        }
        #endregion



        protected void GoToSearch(object sender, CommandEventArgs e)
        {
            Response.Redirect("SearchForTransfer.aspx?" + Request.QueryString + "?goBack=true");
        }

        /// <summary>
        /// Updates the CollectionStatus for a collection. 
        /// </summary>
        /// <param name="colId"></param>
        /// <param name="status"></param>
        private void UpdateCollectionStatus(int colId, string status)
        {
            SpecimenCollection bizCol = new SpecimenCollection();
            bizCol.Get(colId);

            bizCol[SpecimenCollection.CollectionStatus] = status;
            bizCol.Save();
        }

        private void AddCollectionToRequest(int colId)
        {
            SpecimenCollection bizCol = new SpecimenCollection();
            bizCol.Get(colId);

            bizCol[SpecimenCollection.SpecimenRequestId] = this.RequestId;
            bizCol[SpecimenCollection.CollectionStatus] = "Pending Transfer";
            bizCol.Save();

            this.collectionIdList.Add(colId.ToString());
        }
        private void RemoveCollectionFromRequest(int colId)
        {
            SpecimenCollection bizCol = new SpecimenCollection();
            bizCol.Get(colId);

            bizCol[SpecimenCollection.SpecimenRequestId] = DBNull.Value;
            bizCol[SpecimenCollection.CollectionStatus] = "Available";
            bizCol.Save();

            this.collectionIdList.Remove(colId.ToString());
        }

        private void LoadModifiableCollectionSelectBox(int requestId)
        {
            SpecimenManagerDa da = new SpecimenManagerDa();
            DataTable dt = da.GetCollectionsByRequestId(requestId);
            int numCollectionsInRequest = dt.Rows.Count;
            dt.Merge(da.GetAvailableCollections());
            this.AvailableCollectionSelectBox.DataSource = dt.DefaultView;

            this.AvailableCollectionSelectBox.DataTextField = "CollectionName";
            this.AvailableCollectionSelectBox.DataValueField = "CollectionId";
            this.AvailableCollectionSelectBox.DataBind();

            this.collectionIdList.Clear();
            for (int i = 0; i < numCollectionsInRequest; i++)
            {
                this.AvailableCollectionSelectBox.Items[i].Selected = true;
                this.collectionIdList.Add(this.AvailableCollectionSelectBox.Items[i].Value);
            }

            this.CollectionIds.Value = String.Join(",", collectionIdList.ToArray());

        }


        private void LoadDisabledCollectionSelectBox(int requestId)
        {
            SpecimenManagerDa da = new SpecimenManagerDa();
            DataTable dt = da.GetCollectionsByRequestId(requestId);
            this.AvailableCollectionSelectBox.DataSource = dt;

            this.AvailableCollectionSelectBox.DataTextField = "CollectionName";
            this.AvailableCollectionSelectBox.DataValueField = "CollectionId";
            this.AvailableCollectionSelectBox.DataBind();

            /*foreach (ListItem li in this.AvailableCollectionSelectBox.Items)
            {
                li.Selected = true;
            }*/

            this.availableCollectionsLbl.InnerHtml = "Requested Collections";
        }
        private void InitializeAvailableCollectionSelectBox()
        {
            SpecimenManagerDa da = new SpecimenManagerDa();

            this.AvailableCollectionSelectBox.DataSource = da.GetAvailableCollections();
            this.AvailableCollectionSelectBox.DataTextField = "CollectionName";
            this.AvailableCollectionSelectBox.DataValueField = "CollectionId";
            this.AvailableCollectionSelectBox.DataBind();
        }

    }
}