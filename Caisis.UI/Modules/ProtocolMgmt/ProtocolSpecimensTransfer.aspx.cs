using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.BOL;
using System.Collections.Specialized;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class ProtocolSpecimensTransfer : ProtocolMgmtBasePage
    {
        #region Query String Paramaters

        protected string QueryTransferStatus
        {
            get
            {
                return Request.QueryString["status"];
            }
        }

        private static readonly string defaultMode = "request";
        protected string QueryMode
        {
            get
            {
                string mode = (Request.QueryString["mode"] + "").ToLower();
                return !string.IsNullOrEmpty(mode) ? mode : defaultMode;

            }
        }

        protected string QueryAction
        {
            get
            {
                return Request.QueryString["action"] + "";

            }
        }

        #endregion

        private Dictionary<string, string> selectedColumns = new Dictionary<string, string>();

        private SpecimenManagerDa da = new SpecimenManagerDa();

        protected override void Page_Load(object sender, EventArgs e)
        {
            // validation
            if (!Request.QueryString.HasKeys())
                Response.End();

            if (!Page.IsPostBack)
            {
                IEnumerable<int> postedSpecimens = GetPostedSpecimenIds();

                // set fields via QS
                SpecimenRequestId.Value = Request.QueryString["requestId"];
                CollectionId.Value = Request.QueryString["collectionId"];
                DistributionId.Value = Request.QueryString["distributionId"];
                specimens.Value = Request.Form["specimens"];

                string btnText = Request.QueryString["btnText"] + "";
                if (!string.IsNullOrEmpty(btnText))
                {
                    DoTransferBtn.Text = btnText;
                }

                // set UI
                if (QueryMode == "request")
                {
                    CICHelper.EnableFields(RequestFields.Controls, true);
                    CICHelper.EnableFields(ReceivedFields.Controls, false);
                }
                else if (QueryMode == "received")
                {
                    CICHelper.EnableFields(RequestFields.Controls, false);
                    CICHelper.EnableFields(ReceivedFields.Controls, true);
                }
                else if (QueryMode == "readonly")
                {
                    CICHelper.EnableFields(RequestFields.Controls, false);
                    CICHelper.EnableFields(ReceivedFields.Controls, false);
                    SpecimensGrid.Enabled = false;
                    SpecimensGrid.Columns[0].Visible = false;
                    DoTransferBtn.Visible = false;
                }
                // set default fields
                int protocolId = int.Parse(BaseProtocolId);
                string datasetSQL = base.GetSpecimenPatientsDatasetSQL();
                // restrict to transfer of current type
                string nextRequestId = da.GetNextRequestIdByProtocol(base.ProtocolNumber);
                Protocol protocol = new Protocol();
                protocol.Get(protocolId);
                string protocolNum = protocol[Protocol.ProtocolNum].ToString();
                string requestIdentifier = nextRequestId;
                RequestIdentifier.Enabled = false;
                RequestIdentifier.Value = requestIdentifier;

                // on creation of transfer: allow to transfer to other
                if (QueryAction == "create")
                {
                    // TODO: refactor
                    string[] collectionStatuses = new string[] { QueryTransferStatus };

                    // get transfers and restrict to those not yet received
                    DataTable currentTransfers = da.GetSpecimenTransfersByProtocol(protocolId, datasetSQL, collectionStatuses, new int[0]);
                    var transferDataSource = from transfer in currentTransfers.AsEnumerable()
                                             where transfer.IsNull("ReceivedDate")
                                             select new
                                             {
                                                 FieldText = transfer[SpecimenRequest.RequestIdentifier] + " (" + transfer["SpecimenCount"] + " Specimens)",
                                                 FieldValue = string.Format("{0},{1},{2}", transfer[SpecimenRequest.SpecimenRequestId], transfer[SpecimenDistribution.DistributionId], transfer[SpecimenCollection.CollectionId])
                                             };
                    ExistingTransferSelection.DataSource = transferDataSource;
                    ExistingTransferSelection.DataBind();
                    ExistingTransferPanel.Visible = transferDataSource.Count() > 0;
                }
                else
                {
                    ExistingTransferPanel.Visible = false;
                }
                // populate form values
                PopulateFormOnLoad();
            }
        }

        private void PopulateFormOnLoad()
        {
            // populate request
            if (!string.IsNullOrEmpty(SpecimenRequestId.Value))
            {
                int requestId = int.Parse(SpecimenRequestId.Value);
                if (!string.IsNullOrEmpty(DistributionId.Value))
                {
                    int distributionId = int.Parse(DistributionId.Value);
                    PopulateRequest(requestId, distributionId);
                }
            }
            // populate collection
            int? collectionId = null;
            if (!string.IsNullOrEmpty(CollectionId.Value))
            {
                collectionId = int.Parse(CollectionId.Value);
            }
            IEnumerable<int> newSpecimens = GetPostedSpecimenIds();
            PopulateSpecimens(collectionId, newSpecimens);
        }

        /// <summary>
        /// Populate the transfer details
        /// </summary>
        /// <param name="requestId"></param>
        /// <param name="distributionId"></param>
        private void PopulateRequest(int requestId, int distributionId)
        {
            // populate request fields
            SpecimenRequest request = new SpecimenRequest();
            request.Get(requestId);
            base.PopulateForm(this, request);
            // populate distribution fields
            SpecimenDistribution distribution = new SpecimenDistribution();
            distribution.Get(distributionId);
            base.PopulateForm(this, distribution);
            // date mask
            DispatchedDate.Value = string.Format("{0:d}", distribution[SpecimenDistribution.DispatchedDate]);
            ReceivedDate.Value = string.Format("{0:d}", distribution[SpecimenDistribution.ReceivedDate]);
        }

        /// <summary>
        /// For the given collection build a list of specimens contained.
        /// </summary>
        /// <param name="collectionId"></param>
        private void PopulateSpecimens(int? collectionId, IEnumerable<int> newSpecimens)
        {
            Dictionary<int, string> existingSpecimens = new Dictionary<int, string>();
            if (collectionId.HasValue)
            {
                int protocolId = int.Parse(BaseProtocolId);
                string datasetSQL = base.GetSpecimenPatientsDatasetSQL();
                existingSpecimens = da.GetTransferSpecimensByProtocol(protocolId, collectionId.Value, datasetSQL).AsEnumerable().ToDictionary(
                                        c => (int)c[Specimen_SpecimenCollections.SpecimenId],
                                        c => c[Specimen_SpecimenCollections.SpecimenCollectionId].ToString());

            //    existingSpecimens = BOL.BusinessObject.GetByFields<Specimen_SpecimenCollections>(new Dictionary<string, object>
            //{
            //    { Specimen_SpecimenCollections.CollectionId, collectionId }
            //}).ToDictionary(c => (int)c[Specimen_SpecimenCollections.SpecimenId], c => c[Specimen_SpecimenCollections.SpecimenCollectionId].ToString());
                newSpecimens = newSpecimens.Except(existingSpecimens.Keys);
            }

            // build unified data source
            var dataSource = from specimen in GetSpecimens(existingSpecimens.Keys.Concat(newSpecimens))
                             let specimenId = (int)specimen[Specimen.SpecimenId]
                             select new
                             {
                                 SpecimenId = specimenId,
                                 SpecimenSubType = specimen[Specimen.SpecimenSubType].ToString(),
                                 CollectionId = collectionId,
                                 SpecimenCollectionId = existingSpecimens.ContainsKey(specimenId) ? existingSpecimens[specimenId].ToString() : "",
                                 SpecimenReferenceNumber = specimen[Specimen.SpecimenReferenceNumber].ToString()
                             };
            //  var specimens = da.GetSpecimensInCollection(collectionId, "");

            SpecimensGrid.DataSource = dataSource;
            SpecimensGrid.DataBind();
        }

        protected void OnSelectExistingTransfer(object sender, EventArgs e)
        {
            string selectedTransfer = ExistingTransferSelection.SelectedValue;
            if (!string.IsNullOrEmpty(selectedTransfer))
            {
                var pairs = selectedTransfer.Split(',');
                // set new fields
                SpecimenRequestId.Value = pairs[0];
                DistributionId.Value = pairs[1];
                CollectionId.Value = pairs[2];
                // update form based on selected
                PopulateFormOnLoad();
            }
        }

        private IEnumerable<Specimen> GetSpecimens(IEnumerable<int> specimenIds)
        {
            foreach (int specimenId in specimenIds)
            {
                Specimen specimen = new Specimen();
                specimen.Get(specimenId);
                yield return specimen;
            }
        }

        private void SaveRequestFields()
        {
            int? requestId = null;
            // save request
            SpecimenRequest request = new SpecimenRequest();
            if (!string.IsNullOrEmpty(SpecimenRequestId.Value))
            {
                requestId = int.Parse(SpecimenRequestId.Value);
                request.Get(requestId.Value);
            }
            CICHelper.SetBOValues(this.Controls, request, -1);
            request.Save();
            requestId = (int)request[SpecimenRequest.SpecimenRequestId];
            // save distribution
            int? distributionId = null;
            SpecimenDistribution distribution = new SpecimenDistribution();
            if (!string.IsNullOrEmpty(DistributionId.Value))
            {
                distributionId = int.Parse(DistributionId.Value);
                distribution.Get(distributionId.Value);
            }
            CICHelper.SetBOValues(this.Controls, distribution, -1);
            distribution[SpecimenDistribution.SpecimenRequestId] = requestId.Value;
            distribution.Save();
            // save collecion
            int? collectionId = null;
            SpecimenCollection collection = new SpecimenCollection();
            if (!string.IsNullOrEmpty(CollectionId.Value))
            {
                collectionId = int.Parse(CollectionId.Value);
                collection.Get(collectionId.Value);
            }
            CICHelper.SetBOValues(this.Controls, collection, -1);
            collection[SpecimenCollection.SpecimenRequestId] = requestId.Value;
            // !important
            // handle transfer status: stamp with original request
            if (QueryMode == "request" && !string.IsNullOrEmpty(QueryTransferStatus))
                collection[SpecimenCollection.CollectionStatus] = QueryTransferStatus;
            collection.Save();
            collectionId = (int)collection[SpecimenCollection.CollectionId];
            // save specimens
            IEnumerable<int> specimensInCollection = SaveSpecimens(collectionId.Value);
            // update specimen statuses
            if (!string.IsNullOrEmpty(QueryTransferStatus))
                UpdateSpecimenStatus(specimensInCollection, QueryTransferStatus);

            // update fields
            SpecimenRequestId.Value = requestId + "";
            DistributionId.Value = distributionId + "";
            CollectionId.Value = collectionId + "";

            // register update script
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "registerUpdateScript", "if(parent.doTransferUpdated) parent.doTransferUpdated();", true);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="collectionId"></param>
        /// <returns></returns>
        private IEnumerable<int> SaveSpecimens(int collectionId)
        {
            List<int> specimensInCollection = new List<int>();
            foreach (GridViewRow row in SpecimensGrid.Rows)
            {
                int specimenId = (int)SpecimensGrid.DataKeys[row.RowIndex][Specimen.SpecimenId];
                string specimenCollectionId = SpecimensGrid.DataKeys[row.RowIndex][Specimen_SpecimenCollections.SpecimenCollectionId] + "";
                CheckBox cb = row.FindControl("IncludeSpecimenCheck") as CheckBox;
                // add new
                if (cb.Checked && string.IsNullOrEmpty(specimenCollectionId))
                {
                    Specimen_SpecimenCollections newSpecimenCollection = new Specimen_SpecimenCollections();
                    newSpecimenCollection[Specimen_SpecimenCollections.SpecimenId] = specimenId;
                    newSpecimenCollection[Specimen_SpecimenCollections.CollectionId] = collectionId;
                    newSpecimenCollection.Save();

                    // add entry
                    specimensInCollection.Add(specimenId);
                }
                // remove existing
                else if (!string.IsNullOrEmpty(specimenCollectionId))
                {
                    if (!cb.Checked)
                    {
                        int priKey = int.Parse(specimenCollectionId);
                        RemoveSpecimenFromCollection(priKey);
                    }
                    else
                    {
                        // add entry
                        specimensInCollection.Add(specimenId);
                    }
                }
            }
            return specimensInCollection;
        }

        protected void SaveClick(object sender, EventArgs e)
        {
            // validate
            var fields = CICHelper.GetCaisisInputControls(RequestFields).Concat(CICHelper.GetCaisisInputControls(ReceivedFields));
            bool fieldsHaveValue = CICHelper.InputControlsHaveValue(fields);
            if (fieldsHaveValue)
            {
                SaveRequestFields();
            }
            else
            {
                Response.Write("Please enter a value.");
            }
        }

        /// <summary>
        /// Returns a list of specimen ids POSTed to the FORM
        /// </summary>
        /// <returns></returns>
        protected IEnumerable<int> GetPostedSpecimenIds()
        {
            string specimens = Request.Form["specimens"] + "";
            if (!string.IsNullOrEmpty(specimens))
            {
                return specimens.Split(',').Select(sid => int.Parse(sid));
            }
            return new int[0];
        }

        /// <summary>
        /// Foreach specimen id, update specimen record with new status
        /// </summary>
        /// <param name="specimens"></param>
        /// <param name="status"></param>
        private void UpdateSpecimenStatus(IEnumerable<int> specimens, string status)
        {
            foreach (int specimenId in specimens)
            {
                Specimen biz = new Specimen();
                biz.Get(specimenId);
                biz[Specimen.SpecimenStatus] = status;
                biz.Save();
            }
        }

        /// <summary>
        /// Special logic for removing specimen and rolling back the status
        /// </summary>
        /// <param name="specimenCollectionId"></param>
        private void RemoveSpecimenFromCollection(int specimenCollectionId)
        {           
            Specimen_SpecimenCollections biz = new Specimen_SpecimenCollections();
            biz.Get(specimenCollectionId);
            if (!biz.IsEmpty)
            {
               int specimenId = (int)biz[Specimen_SpecimenCollections.SpecimenId];
               Specimen specimen = new Specimen();
               specimen.Get(specimenId);
               string currentStatus = specimen[Specimen.SpecimenStatus].ToString();
               string rollbackStatus = "";
               switch (currentStatus)
               {
                   case "In Transit to Pathology":
                       rollbackStatus = "Collected";
                       break;
                   case "In Transit to Sequencing":
                       rollbackStatus = "Pathology Review Completed";
                       break;
                   case "In Transit to Analysis":
                       rollbackStatus = "Sequenced";
                       break;
                   case "In Transit to cBIO Portal":
                       rollbackStatus = "Analysis Complete";
                       break;
                   default:
                       break;
               }
                // rollback status
               if (!string.IsNullOrEmpty(currentStatus) && !string.IsNullOrEmpty(rollbackStatus))
               {
                   specimen[Specimen.SpecimenStatus] = rollbackStatus;
                   specimen.Save();
               }
                biz.Delete(specimenCollectionId);
            }
        }
    }
}