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
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientToxicitiesSAE : ProtocolMgmtPatientBasePage
    {
        private bool isToxicityRecordDirty = false;
        private bool isSAERecordDirty = false;

        private string[] protocolMedTxAgents = new string[0];

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

        public PatientToxicitiesSAE()
            : base()
        {
            // init events
            this.Init += new EventHandler(InitalizeEvents);
        }

        /// <summary>
        /// Add event handlers to ICaisisInputControls to mark relevant forms as dirty
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void InitalizeEvents(object sender, EventArgs e)
        {
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
            }

            // query default list of patient MedTxAgents
            if (!string.IsNullOrEmpty(BaseSchemaId))
            {
                int protocolSchemaId = int.Parse(BaseSchemaId);
                MedicalTherapyDa da = new MedicalTherapyDa();
                protocolMedTxAgents = da.GetProtocolSchemaTherapies(protocolSchemaId).AsEnumerable().Select(r => r[MedicalTherapy.MedTxAgent].ToString()).ToArray();
            }
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
                if (!string.IsNullOrEmpty(QueryPatientItemId))
                {
                    PatientItemId.Value = QueryPatientItemId;
                    ToxicityIdField.Value = QueryToxicityId;
                }
                // build form
                int? toxicityId = null;
                if (!string.IsNullOrEmpty(QueryToxicityId))
                {
                    toxicityId = int.Parse(ToxicityIdField.Value);
                }
                PopulateForm(toxicityId);
                bool saeExists = ShowSAEField.Value == "true";
                // show SAE UI via QS
                string saeQS = Request.QueryString["sae"];
                bool showSAEUI = !string.IsNullOrEmpty(saeQS) && bool.Parse(saeQS);
                if (showSAEUI || saeExists)
                {
                    ShowSAEField.Value = true.ToString().ToLower();
                    // check by default
                    if (!saeExists)
                        ToxSAEField.Checked = true;
                }
            }
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

                var adverseEvents = BusinessObject.GetByParent<SeriousAdverseEvent>(toxicityId.Value);
                bool hasAdverseEvents = adverseEvents.Count() > 0;
                if (adverseEvents.Count() > 0)
                {
                    ShowSAEField.Value = bool.TrueString.ToLower();
                    base.PopulateForm(SAEFields, adverseEvents.First());
                    ToxSAEField.Checked = true;
                    ToxSAEField.Enabled = false;
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
            // add attributions
            if (toxicityId.HasValue)
                attributions.AddRange(BusinessObject.GetByParent<ToxAttribution>(toxicityId.Value));

            // add blank
            int medTxCount = protocolMedTxAgents.Length;
            int attributionCount = attributions.Count();
            int totalCount = Math.Min(Math.Max(medTxCount, attributionCount), 1);
            int blankRows = Math.Max(totalCount - attributionCount, 0);
            attributions.AddRange(Enumerable.Range(0, blankRows).Select(i => new ToxAttribution()));
            ToxAttributionGrid.BlankRows = blankRows;
            ToxAttributionGrid.VisibleBlankRows = blankRows;
            // build attributions
            ToxAttributionGrid.DataSource = attributions.AsDataView<ToxAttribution>();
            ToxAttributionGrid.DataBind();
        }

        /// <summary>
        /// Determines if to show SAE Fields
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DetermineSAEVisibility(object sender, EventArgs e)
        {
            if (ShowSAEField.Value != "true")
            {
                SAEFields.Attributes.Add("style", "display: none;");
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            SaveForm(true);
        }

        private void SaveForm(bool registerUpdateScript)
        {
            // only update dirty record
            if (isToxicityRecordDirty)
            {
                int patientId = int.Parse(BaseDecryptedPatientId);
                // save toxicity
                Toxicity tox = new Toxicity();
                int toxicityId = SaveRecord(ToxicityFields, tox, ToxicityIdField, patientId);

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
                int relatedRecordId = PatientProtocolController.CreateUnplannedVisitRelatedRecord(patientItemId, tox.TableName, toxicityId);
                RelatedRecordId.Value = relatedRecordId.ToString();

                // if visible to user and record dirty
                if (isSAERecordDirty)
                {
                    // SAE Record
                    SeriousAdverseEvent sae = new SeriousAdverseEvent();
                    SaveRecord(SAEFields, sae, ToxicityIdField, toxicityId);
                }
            }
            // no need to update parent Toxicity, update child record if needed
            else if (isSAERecordDirty && !string.IsNullOrEmpty(ToxicityIdField.Value))
            {
                int toxicityId = int.Parse(ToxicityIdField.Value);
                SeriousAdverseEvent sae = new SeriousAdverseEvent();
                SaveRecord(SAEFields, sae, ToxicityIdField, toxicityId);
            }
            // save attributions
            if (!string.IsNullOrEmpty(ToxicityIdField.Value) && ToxAttributionGrid.DirtyRows.Count > 0)
            {
                int toxicityId = int.Parse(ToxicityIdField.Value);
                ToxAttributionGrid.Save(toxicityId);
            }
            // register client update script (close form from popup)
            if (registerUpdateScript)
                RegisterUpdateScript(false);
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
                RegisterUpdateScript(true);
                // delete associated record
                RelatedRecord relatedRecord = new RelatedRecord();
                relatedRecord.Delete(int.Parse(RelatedRecordId.Value));
            }
        }

        protected void SetAttributionFields(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int rowIndex = e.Row.DataItemIndex;
                string toxAttributionId = DataBinder.Eval(e.Row.DataItem, ToxAttribution.ToxAttributionId).ToString();
                string toxAttribution = DataBinder.Eval(e.Row.DataItem, ToxAttribution.ToxAttribution_Field).ToString();

                // data bind attributions
                CaisisSelect attributionField = e.Row.FindControl("ToxAttributionField") as CaisisSelect;
                attributionField.DataSource = protocolMedTxAgents;
                attributionField.DataBind();
                // set values based on index
                if (string.IsNullOrEmpty(toxAttributionId) && rowIndex < protocolMedTxAgents.Length)
                {
                    string defaultValue = protocolMedTxAgents[rowIndex];
                    attributionField.Value = defaultValue;
                }
                else
                {
                    attributionField.Value = toxAttribution;
                }
            }
        }

        protected void DeleteToxAttribution(object sender, GridViewDeletedEventArgs e)
        {
            // save form ??
            int toxicityId = int.Parse(ToxicityIdField.Value);
            PopulateAttributions(toxicityId);
            SaveForm(false);
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
