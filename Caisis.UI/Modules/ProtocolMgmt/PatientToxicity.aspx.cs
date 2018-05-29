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
using System.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientToxicity : ProtocolMgmtPatientBasePage
    {
        private bool isToxicityRecordDirty = false;
        private bool isSAERecordDirty = false;

        private List<string> dirtyTables = new List<string>();

        private IEnumerable<string> protocolMedTxAgents = new List<string>();

        /// <summary>
        /// Gets the PatientItemId passed in the QueryString
        /// </summary>
        protected string QueryPatientItemId
        {
            get
            {
                return Request.QueryString["patientItemId"];
            }
        }

        protected string QueryToxicityId
        {
            get
            {
                return Request.QueryString["toxicityId"];
            }
        }

        public PatientToxicity()
            : base()
        {
            // init events
            this.Init += new EventHandler(InitalizeEvents);
        }

        /// <summary>
        /// Transfer to SAE Details where relevant details entered
        /// </summary>
        /// <param name="toxicityId"></param>
        private void CheckSAEDetails(int toxicityId)
        {
            Toxicity tox = new Toxicity();
            tox.Get(toxicityId);
            // if is SAE, transfer
            if (!tox.IsNull(Toxicity.ToxSAE) && PageUtil.IsTrueString(tox[Toxicity.ToxSAE] + ""))
            {
                TransferToSAEDetails(toxicityId);
            }
        }

        /// <summary>
        /// Add event handlers to ICaisisInputControls to mark relevant forms as dirty
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void InitalizeEvents(object sender, EventArgs e)
        {
            // set require fields
            if (!Page.IsPostBack)
            {
                int? toxicityId = null;
                int? patientItemId = null;
                // get keys
                if (!string.IsNullOrEmpty(QueryPatientItemId))
                {
                    string dpid = base.DecrypyValue(QueryPatientItemId);
                    if (!string.IsNullOrEmpty(dpid))
                    {
                        patientItemId = int.Parse(dpid);
                    }
                }
                if (!string.IsNullOrEmpty(QueryToxicityId))
                {
                    toxicityId = int.Parse(QueryToxicityId);
                }
                // set hidden fields: important, use raw QS for pass through
                PatientItemId.Value = QueryPatientItemId;
                ToxicityIdField.Value = QueryToxicityId;
                // check if SAE
                if (toxicityId.HasValue)
                {
                    CheckSAEDetails(toxicityId.Value);
                }
            }
            // add "dirty" tracking for forms
            foreach (ICaisisInputControl iCIC in CICHelper.GetCaisisInputControls(this))
            {
                if (iCIC.Table == "Toxicities")
                {
                    iCIC.ValueChanged += new CaisisEventHandler(MarkToxicityDirty);
                }
                else if (iCIC.Table == "SeriousAdverseEvents")
                {
                    iCIC.ValueChanged += new CaisisEventHandler(MarkSAEDirty);
                }
                iCIC.ValueChanged += MarkTableFieldsDirty;
            }

            // query default list of patient MedTxAgents
            if (!string.IsNullOrEmpty(BaseSchemaId))
            {
                int protocolSchemaId = int.Parse(BaseSchemaId);
                int patientSchemaId = int.Parse(PatientSchemaId);
                MedicalTherapyDa da = new MedicalTherapyDa();
                DataTable trialMedTx = da.GetProtocolSchemaTherapies(protocolSchemaId);
                // combine data
                var trialAgents = trialMedTx.AsEnumerable().Select(m => m[MedicalTherapy.MedTxAgent].ToString()).Distinct().ToArray();
                IEnumerable<MedicalTherapy> patientTherapies = BOL.ProtocolMgmt.GetRecordsByPatientSchema<MedicalTherapy>(patientSchemaId);
                protocolMedTxAgents = from agent in trialAgents
                                join tx in patientTherapies on agent equals tx[MedicalTherapy.MedTxAgent].ToString() into g
                                let tx = g.FirstOrDefault()
                                let txAdmin = tx == null ? new MedTxAdministration[0] : BOL.BusinessObject.GetByParent<MedTxAdministration>((int)tx[MedTxAdministration.MedicalTherapyId])
                                select agent;
            }
        }

        protected void MarkTableFieldsDirty(ICaisisInputControl sender, EventArgs e)
        {
            if (!dirtyTables.Contains(sender.Table))
                dirtyTables.Add(sender.Table);
        }

        protected void MarkToxicityDirty(ICaisisInputControl sender, EventArgs e)
        {
            isToxicityRecordDirty = true;
        }

        protected void MarkSAEDirty(ICaisisInputControl sender, EventArgs e)
        {
            isSAERecordDirty = true;
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            /*
                        foreach (ICaisisInputControl iCIC in CICHelper.GetCaisisInputControls(this))
                        {
                            iCIC.ShowLabel = true;
                            iCIC.FieldLabel = iCIC.Field;
                        }
            */
            if (!Page.IsPostBack)
            {
                PopulateSpecialFields();
                Populate();
            }
        }

        private void Populate()
        {
            // build form
            int? toxicityId = null;
            if (!string.IsNullOrEmpty(QueryToxicityId))
            {
                toxicityId = int.Parse(ToxicityIdField.Value);
            }
            PopulateForm(toxicityId);
        }

        private void PopulateSpecialFields()
        {
            // popualte AE + categories by latest version
            CTCAEDa da = new CTCAEDa();

            //populate AE
            DataTable adverseEvents = da.GetLatestAdverseEvents();
            ToxNameField.BuildComboData(adverseEvents, "ToxDesc", "ToxDesc");

            // populate categories
            DataTable categories = da.GetLatestCategories();
            ToxCategoryField.DataTextField = "AE_Category_Description";
            ToxCategoryField.DataValueField = "AE_Category_Description";
            ToxCategoryField.DataSource = categories;
            ToxCategoryField.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="toxicityId"></param>
        private void PopulateForm(int? toxicityId)
        {
            if (toxicityId.HasValue)
            {
                // populate toxicity
                Toxicity biz = new Toxicity();
                biz.Get(toxicityId.Value);
                base.PopulateForm(ToxicityFields, biz);

                // Determine if SAE fields need to be displayed when records exits
                //SeriousAdverseEvent adverseEvents = new SeriousAdverseEvent();
                //adverseEvents.GetByParent(toxicityId);
                //if (adverseEvents.RecordCount > 0)
                //{
                //    ShowSAEField.Value = bool.TrueString.ToLower();
                //    base.PopulateForm(SAEFields, adverseEvents);
                //}

                SeriousAdverseEvent adverseEvent = BusinessObject.GetByParent<SeriousAdverseEvent>(toxicityId.Value).FirstOrDefault();
                if (adverseEvent != null)
                {
                    base.PopulateForm(this, adverseEvent);
                }

                int patientItemId = int.Parse(base.DecrypyValue(PatientItemId.Value));
                DataTable relatedRecords = RelatedRecordsDa.GetRecord("ProtocolMgr_PatientItems", patientItemId, "Toxicities", toxicityId.Value);
                if (relatedRecords.Rows.Count > 0)
                {
                    RelatedRecordId.Value = relatedRecords.Rows[0][RelatedRecord.RelatedRecordId].ToString();
                }
            }
            PopulateAttributions(toxicityId);
        }

        private void PopulateAttributions(int? toxicityId)
        {
            List<ToxAttribution> attributions = new List<ToxAttribution>();
            // get attributions for exisitng toxicity
            if (toxicityId.HasValue)
                attributions.AddRange(BusinessObject.GetByParent<ToxAttribution>(toxicityId.Value));
            DataTable patientAttributionTable = attributions.AsDataView<ToxAttribution>().Table;
            // clear restrictions
            foreach (DataColumn column in patientAttributionTable.Columns)
                column.AllowDBNull = true;
            // search for existing attributions
            var exisitngMedTxAgents = from row in patientAttributionTable.AsEnumerable()
                                      let agent = row[ToxAttribution.ToxAttribution_Field].ToString()
                                      where protocolMedTxAgents.Contains(agent)
                                      select agent;
            // add blank agents not yet attributed
            var blankMedTxAgents = protocolMedTxAgents.Except(exisitngMedTxAgents).ToArray();
            for (int i = 0; i < blankMedTxAgents.Length; i++)
            {
                string agent = blankMedTxAgents[i];
                DataRow blankRow = patientAttributionTable.NewRow();
                blankRow[ToxAttribution.ToxAttribution_Field] = agent;
                patientAttributionTable.Rows.Add(blankRow);
            }
            DataView attributionView = patientAttributionTable.DefaultView;
            // build attributions
            if (attributionView.Count > 0)
            {
                ToxAttributionGrid.DataSource = attributionView;
                ToxAttributionGrid.DataBind();
                AttributionsMessage.Visible = false;
            }
            // no attributions or expectations
            else
            {
                AttributionsMessage.Visible = true;
            }
        }

        /// <summary>
        /// Adds a related column
        /// </summary>
        /// <param name="dataSource"></param>
        /// <param name="tableName"></param>
        /// <param name="toxicityId"></param>
        /// <returns></returns>
        private DataView GetRelatedRecords(DataTable dataSource, string tableName, int? toxicityId)
        {
            // get required fields
            string priKeyName = BOL.BusinessObject.GetPrimaryKeyName(tableName);
            // add related record column
            if (!dataSource.Columns.Contains("RelatedRecordId"))
                dataSource.Columns.Add(new DataColumn("RelatedRecordId", typeof(int), null));
            if (toxicityId.HasValue)
            {
                var relatedTableRecords = RelatedRecordController.GetRelatedRecordsByDest(tableName, "Toxicities", toxicityId.Value);
                // find related records by row
                var foundRelatedRecords = from row in dataSource.AsEnumerable()
                                          let rowPriKey = row[priKeyName].ToString()
                                          let relatedRecord = relatedTableRecords.FirstOrDefault(r => r[RelatedRecord.SrcPrimaryKey].ToString() == rowPriKey)
                                          where relatedRecord != null
                                          select new
                                          {
                                              Row = row,
                                              RelatedRecordId = (int)relatedRecord["RelatedRecordId"]
                                          };
                foreach (var record in foundRelatedRecords)
                {
                    DataRow row = record.Row;
                    row["RelatedRecordId"] = record.RelatedRecordId;
                }
            }
            return dataSource.DefaultView;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            SaveForm(true);
            Populate();
        }

        /// <summary>
        /// Save Tox form and transfer to SAE form
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void EnterSAEDetails(object sender, EventArgs e)
        {
            // save form
            int? toxicityId = SaveForm(true);
            TransferToSAEDetails(toxicityId);
        }

        /// <summary>
        /// Transfer to the SAE details
        /// </summary>
        /// <param name="toxicityId"></param>
        private void TransferToSAEDetails(int? toxicityId)
        {
            // get params
            var urlParams = PageUtil.GetUrlPairs(Request.Url.Query);
            if (urlParams.ContainsKey("toxicityId"))
                urlParams["toxicityId"] = toxicityId + "";
            else
                urlParams.Add("toxicityId", toxicityId + "");
            if (urlParams.ContainsKey("patientItemId"))
                urlParams["patientItemId"] = PatientItemId.Value + "";
            else
                urlParams.Add("patientItemId", PatientItemId.Value + "");
            string saeURL = string.Format("PatientToxicitiesSAE.aspx?{0}", PageUtil.CreateUrlPairs(urlParams));
            // go to SAE details
            Response.Redirect(saeURL, true);
        }

        private int? SaveForm(bool registerUpdateScript)
        {
            // update patient info
            int patientId = int.Parse(BaseDecryptedPatientId);
            int? toxicityId = null;
            if (!string.IsNullOrEmpty(ToxicityIdField.Value))
            {
                toxicityId = int.Parse(ToxicityIdField.Value);
            }
            // only update dirty record
            if (isToxicityRecordDirty)
            {
                // save toxicity
                Toxicity tox = new Toxicity();
                toxicityId = SaveRecord(this, tox, ToxicityIdField, patientId);

                // PatientItem Record
                PatientItem item = new PatientItem();
                int patientItemId;
                if (!string.IsNullOrEmpty(PatientItemId.Value))
                {
                    item.Get(int.Parse(base.DecrypyValue(PatientItemId.Value)));
                }
                else
                {
                    item[PatientItem.PatientSchemaId] = PatientSchemaId;
                    item[PatientItem.Status] = "Unplanned";
                }
                item[PatientItem.ScheduledDate] = ToxDate.Value;
                item.Save();
                patientItemId = (int)item[item.PrimaryKeyName];
                PatientItemId.Value = base.EncryptValue(patientItemId.ToString());

                // Related Record
                int relatedRecordId = PatientProtocolController.CreateUnplannedVisitRelatedRecord(patientItemId, tox.TableName, toxicityId.Value);
                RelatedRecordId.Value = relatedRecordId.ToString();

                // if visible to user and record dirty
                if (isSAERecordDirty)
                {
                    // SAE Record
                    SeriousAdverseEvent sae = new SeriousAdverseEvent();
                    SaveRecord(this, sae, ToxicityIdField, toxicityId.Value);
                }
            }
            // no need to update parent Toxicity, update child record if needed
            else if (isSAERecordDirty && !string.IsNullOrEmpty(ToxicityIdField.Value))
            {
                SeriousAdverseEvent sae = new SeriousAdverseEvent();
                SaveRecord(this, sae, ToxicityIdField, toxicityId.Value);
            }
            // save attributions
            if (toxicityId.HasValue && ToxAttributionGrid.DirtyRows.Count > 0)
            {
                ToxAttributionGrid.Save(toxicityId.Value);
            }
            // register client update script (close form from popup)
            if (registerUpdateScript)
                RegisterUpdateScript(false);

            // return updated/saved record
            return toxicityId;
        }

        /// <summary>
        /// Loads and saves a BusinessObject with value from PriKey field (if it has a value) and fills with values from controls
        /// in the container.
        /// </summary>
        /// <param name="container">The container containing controls to poulate BusinessObject</param>
        /// <param name="biz">The BusinessObject populated with field values</param>
        /// <param name="priKeyField">The hidden field tracking the prikey for BusinessObject</param>
        /// <param name="parKey">The parent/foreign key for the BusinessObject</param>
        /// <returns></returns>
        private int SaveRecord(Control container, BusinessObject biz, HiddenField priKeyField, int parKey)
        {
            if (!string.IsNullOrEmpty(priKeyField.Value))
            {
                biz.Get(int.Parse(priKeyField.Value));
            }
            else
            {
                biz[biz.ParentKeyName] = parKey;
            }
            CICHelper.SetBOValues(container.Controls, biz, parKey);
            biz.Save();
            int priKey = (int)biz[biz.PrimaryKeyName];
            // update prikey field
            priKeyField.Value = priKey.ToString();
            return priKey;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ToxicityIdField.Value))
            {
                // delete main tox record
                Toxicity biz = new Toxicity();
                biz.Delete(int.Parse(ToxicityIdField.Value));
                ToxicityIdField.Value = "";
                RegisterUpdateScript(true);
                // delete associated record
                if (!string.IsNullOrEmpty(RelatedRecordId.Value))
                {
                    RelatedRecord relatedRecord = new RelatedRecord();
                    relatedRecord.Delete(int.Parse(RelatedRecordId.Value));
                    RelatedRecordId.Value = "";
                }
            }
        }

        protected void SetAttributionFields(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int rowIndex = e.Row.DataItemIndex;
                string toxAttributionId = DataBinder.Eval(e.Row.DataItem, ToxAttribution.ToxAttributionId).ToString();
                string toxAttribution = DataBinder.Eval(e.Row.DataItem, ToxAttribution.ToxAttribution_Field).ToString();
            }
        }

        protected void DeleteToxAttribution(object sender, GridViewDeletedEventArgs e)
        {
            // save form ??
            int toxicityId = int.Parse(ToxicityIdField.Value);
            PopulateAttributions(toxicityId);
            SaveForm(false);
        }

        private DateTime? GetOnStudyDate()
        {
            int ptProtocolId = int.Parse(PatientProtocolId);
            PatientProtocolController ppc = new PatientProtocolController(ptProtocolId);
            return ppc.GetStatusDate(PatientProtocolController.OnStudy);
        }

        /// <summary>
        /// Registers a script which notifies parent page, that a record has been updated and needs to reflect chanages
        /// </summary>
        /// <param name="isDelete"></param>
        private void RegisterUpdateScript(bool isDelete)
        {
            string clientScript = "notifyRecordUpdate(" + isDelete.ToString().ToLower() + ");";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "NotifyRecordUpdate", clientScript, true);
        }
    }
}
