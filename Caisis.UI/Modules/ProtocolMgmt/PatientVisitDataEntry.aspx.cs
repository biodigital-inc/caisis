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
using System.Xml.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientVisitDataEntry : ProtocolMgmtPatientBasePage
    {
        /// <summary>
        /// Dates which are not updated when perfored status is checked
        /// </summary>
        private static readonly IEnumerable<string> EXCLUDE_DATE_CHECKLIST =
            new string[]
            {
                Hospitalization.HospDischargeDate, 
                MedicalTherapy.MedTxStopDate,
                Medication.MedStopDate,
                MedTxAdministration.MedTxAdminStopDate,
                MedTxAdministration.MedTxLotExpirationDate,
                OperatingRoomDetail.OpAdmitDate, 
                OperatingRoomDetail.OpDischargeDate,
                QOL_Therapy.QOL_TxStopDate,
                RadiationTherapy.RadTxStopDate,                    
                RadTxAdministration.RadTxAdminStopDate,
                SeriousAdverseEvent.SAE_ReportFDA_Date,
                Toxicity.ToxStopDate
            };

        private DataView visitList;

        private DataView VisitList
        {
            get
            {
                if (visitList == null)
                {
                    // create default view
                    DataTable table = new DataTable();
                    // populate visits
                    if (!string.IsNullOrEmpty(PatientSchemaId))
                    {
                        int patientSchemaId = int.Parse(PatientSchemaId);
                        int parsedPatientItemId = int.Parse(PatientItemId);
                        int? timelineId = ProtocolMgmtDa.GetPatientTimelineId(parsedPatientItemId);
                        // get items by visit (timeline)
                         table = ProtocolMgmtDa.GetPatientVisitSchedulingSummary(patientSchemaId, timelineId);
                    }
                    visitList = table.DefaultView;
                }
                return visitList;
            }
        }

        private IEnumerable<string> excludedDateFields;

        private IEnumerable<string> dataEntryTableNames = new string[0];

        protected string CLIENT_STANDARD_PERFORMED_DATE_TEXT_FIELDS = "";
        protected string CLIENT_GRID_PERFORMED_DATE_TEXT_FIELDS = "";

        protected string DATA_ENTRY_TABLE_NAMES = "";

        protected string FirstAnticipatedClientDate = "null";
        protected string LastAnticipatedClientDate = "null";

        private PatientItemEntry itemEntryControl;

        /// <summary>
        /// The name of the post-back script which saves the form and loads next item by patient item id
        /// </summary>
        protected static readonly string DO_ITEM_SAVE_SCRIPT = "_doItemSave";

        /// <summary>
        /// The name of the post-back script which saves the form and loads next item
        /// </summary>
        protected static readonly string DO_ITEM_SAVE_ADVANCE_SCRIPT = "_doItemSaveAdvance";

        /// <summary>
        /// The name of the post-back script which cancel's the data entry form and loads next item
        /// </summary>
        protected static readonly string DO_ITEM_CANCEL_SCRIPT = "_doItemCancel";

        /// <summary>
        /// The name of the post-back script which saves the form and goes back to Patient Portal Visit interface
        /// </summary>
        protected static readonly string DO_ITEM_SAVE_RELOAD_SCRIPT = "_doItemSaveAndReload";

        /// <summary>
        /// The name of the post-back script which cancel's the data entry form and goes to portal
        /// </summary>
        protected static readonly string DO_ITEM_CANCEL_RELOAD_SCRIPT = "_doItemCancelAndReload";

        /// <summary>
        /// The item used to trigged survey save
        /// </summary>
        protected static readonly string DO_SURVEY_SAVE_SCRIPT = "_doSurveySave";

        private bool patientItemFieldsDirty = false;

        /// <summary>
        /// Return if the patient items fields are "dirty", i.e., fields need to be updated/saved
        /// </summary>
        private bool PatientItemFieldsDirty
        {
            get
            {
                return patientItemFieldsDirty;
            }
        }

        /// <summary>
        /// Returns if the data entry fields (not patient items) are dirty
        /// </summary>
        private bool DataEntryFieldsDirty
        {
            get
            {
                string formDirtyValue = Request.Form["DataEntryFieldsDirty"];
                return !string.IsNullOrEmpty(formDirtyValue) ? bool.Parse(formDirtyValue) : false;
            }
        }

        private string itemStatus = "";
        /// <summary>
        /// Gets the "Status" of an Item
        /// </summary>
        protected string ItemStatus
        {
            get
            {
                if (ViewState["ItemStatus"] != null)
                {
                    return ViewState["ItemStatus"].ToString();
                }
                else
                {
                    return itemStatus;
                }
            }
            set
            {
                itemStatus = value;
                ViewState["ItemStatus"] = itemStatus;
            }
        }

        /// <summary>
        /// Get the encrypted patient item id
        /// </summary>
        protected string QueryPatientItemId
        {
            get
            {
                return Request.QueryString["patientItemId"] + "";
            }
        }

        /// <summary>
        /// Gets the decrypted verion of the encrypted PatientItemId passed in query string
        /// </summary>
        private string PatientItemId
        {
            get
            {
                if (!string.IsNullOrEmpty(QueryPatientItemId))
                {
                    return DecrypyValue(QueryPatientItemId);
                }
                else
                {
                    return "";
                }
            }
        }

        /// <summary>
        /// Returns a list of date field names to exclude in auto populating logic
        /// </summary>
        public IEnumerable<string> ExcludedDateFields
        {
            get
            {
                if (excludedDateFields == null)
                {
                    var dateFields = EXCLUDE_DATE_CHECKLIST;
                    // exclude list contains DateField, but should also add DateText fields
                    var dateTextFields = from field in dateFields
                                         select field + "Text";
                    // combine date and datetext fields
                    excludedDateFields = dateFields.Concat(dateTextFields);
                }
                return excludedDateFields;
            }
        }

        public PatientVisitDataEntry()
            : base()
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            // fix to readonly field, allow persisted values
            ScheduledDate.Attributes["readOnly"] = "readOnly";

            PopulateForm();

        }

        protected override void Page_Load(object sender, EventArgs e)
        {

            // if (!Page.IsPostBack)
            {
                // PopulateForm();
            }
            // Regitser save callback script
            RegisterDoItemSaveScritpts();
            RegisterItemSyncScript();            

            //SaveBtn.OnClientClick = "return validateRequiredControls();";
            //SaveReloadBtn.OnClientClick = "return validateRequiredControls();";
        }

        protected override void Render(HtmlTextWriter writer)
        {
            RegisterPerformedDateFields();
            // notify container to pass along status date to go back to calendar
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "GO_TO_DATE", "if(parent.GO_TO_DATE != null) { parent.GO_TO_DATE = '" + PageUtil.EscapeSingleQuotes(ScheduledDate.Text) + "'; } ", true);
            base.Render(writer);
        }

        /// <summary>
        /// Registers client arrays used for auto-populating date fields when status is updated.
        /// </summary>
        private void RegisterPerformedDateFields()
        {
            // get all fields which end in Date or DateText, which aren't in black list of fields (exclude StopDate fields)
            var allDataEntryDateFields = from icic in PageUtil.GetCaisisInputControlsInContainer(dataEntryContainer)
                                         where !string.IsNullOrEmpty(icic.Field)
                                         where (icic.Field.EndsWith("Date") || icic.Field.EndsWith("DateText")) && !icic.Field.Contains("StopDate")
                                         where !ExcludedDateFields.Contains(icic.Field)
                                         select icic as Control;

            // get a list of fields which are part of a grid
            var fieldsInGrid = from field in allDataEntryDateFields
                               where field.NamingContainer is GridViewRow
                               select field;

            // get a list of fields not part of a grid
            var fieldNotInGrid = allDataEntryDateFields.Except(fieldsInGrid);

            // register client arrays
            CLIENT_STANDARD_PERFORMED_DATE_TEXT_FIELDS = GetClientControlIdList(fieldNotInGrid);
            CLIENT_GRID_PERFORMED_DATE_TEXT_FIELDS = GetClientControlIdList(fieldsInGrid);

            // register data entry table names
            if (dataEntryTableNames.Count() == 0)
                DATA_ENTRY_TABLE_NAMES = "";
            else
                DATA_ENTRY_TABLE_NAMES = "'" + string.Join("','", dataEntryTableNames.ToArray()) + "'";
        }

        /// <summary>
        /// Returns a csv list of client ids in form 'clientId_1', 'clientId_2', ....
        /// </summary>
        /// <param name="controls"></param>
        /// <returns></returns>
        private string GetClientControlIdList(IEnumerable<Control> controls)
        {
            // create a csv list of client id
            var clientDateFields = from field in controls
                                   select string.Format("'{0}'", field.ClientID);
            return string.Join(",", clientDateFields.ToArray());
        }

        /// <summary>
        /// Populates the Item record and DataEntry Items
        /// </summary>
        private void PopulateForm()
        {
            if (!string.IsNullOrEmpty(PatientItemId))
            {
                int patientItemId = int.Parse(PatientItemId);

                // build data entry
                PopulatePatientItem(patientItemId);
                BindPatientItemFields(patientItemId);

                // handle special tables
                IDictionary<string, IEnumerable<int>> tableToKeys = (from row in ProtocolMgmtDa.GetPatientItemFields(patientItemId).AsEnumerable()
                                                                     let table = row[SchemaItemField.DestTable].ToString()
                                                                     group row by table into g
                                                                     select new
                                                                     {
                                                                         Table = g.Key,
                                                                         Keys = g.Where(r => !r.IsNull(PatientItemField.DestTablePrimKey)).Select(r => (int)r[PatientItemField.DestTablePrimKey]).Distinct()
                                                                     }).ToDictionary(a => a.Table, a => a.Keys);

                // update data entry form names
                dataEntryTableNames = tableToKeys.Keys.Distinct();

                // handle special plugins
                //var metadata = Caisis.BOL.ProtocolMgmt.GetMetadata(priKey);
                HandleSurveyPlugin(tableToKeys);
                HandleMedications(tableToKeys);

                // special logic: build MedTx compliance
                bool hasMedTx = dataEntryTableNames.Any(t=>t == "MedicalTherapy");
                if (hasMedTx)
                {
                    int protocolId = int.Parse(BaseProtocolId);
                    Protocol protocol = new Protocol();
                    protocol.Get(protocolId);
                    string protocolNum = protocol[Protocol.ProtocolNum] + "";
                    if (protocolNum.StartsWith("c11-086 v2"))
                        MedTxComplianceBit.Visible = true;
                }
                // special logic: tox sae popup
                bool hasToxicities = dataEntryTableNames.Any(t => t == "Toxicities");
                ToxSAEBit.Visible = hasToxicities;                
            }
        }

        /// <summary>
        /// Populates the PatienItem
        /// </summary>
        /// <param name="pItemId"></param>
        private void PopulatePatientItem(int pItemId)
        {
            PatientItem biz = new PatientItem();
            biz.Get(pItemId);

            // ScheduledDate.Text = ((DateTime)biz[PatientItem.ScheduledDate]).ToShortDateString();
            object dt = biz[PatientItem.ScheduledDate];

            if (dt != null && !String.IsNullOrEmpty(dt.ToString()))
                ScheduledDate.Text = ((DateTime)dt).ToShortDateString();

            StatusField.Value = biz[PatientItem.Status].ToString();
            ItemStatus = GetItemStatus(biz);

            // register client buffer dates
            string clientDateFormatString = "new Date('{0}')";
            object firstDate = biz[PatientItem.FirstAnticipatedDate];
            object lastDate = biz[PatientItem.LastAnticipatedDate];
            if (firstDate != null && !string.IsNullOrEmpty(firstDate.ToString()))
            {
                DateTime date = (DateTime)firstDate;
                string shortDate = date.ToShortDateString();
                FirstAnticipatedClientDate = string.Format(clientDateFormatString, shortDate);
                FirstAnticipatedDateText.Text = shortDate;
            }
            else
            {
                FirstAnticipatedClientDate = "null";
                FirstAnticipatedDateText.Text = string.Empty;
            }
            if (lastDate != null && !string.IsNullOrEmpty(lastDate.ToString()))
            {
                DateTime date = (DateTime)lastDate;
                string shortDate = date.ToShortDateString();
                LastAnticipatedClientDate = string.Format(clientDateFormatString, shortDate);
                LastAnticipatedDateText.Text = shortDate;
            }
            else
            {
                LastAnticipatedClientDate = "null";
                LastAnticipatedDateText.Text = string.Empty;
            }
        }

        /// <summary>
        /// Populates the Patient Item Fields
        /// </summary>
        /// <param name="pItemId"></param>
        private void BindPatientItemFields(int pItemId)
        {
            //DataView view = ProtocolMgrDa.GetProtocolMgrFieldsByPatientItemId(pItemId.ToString());
            //SchemaItemFieldsRprt.DataSource = view;
            //SchemaItemFieldsRprt.DataBind();

            //// form is no longer dirty, as fields are repopulated form db
            //formIsDirty = false;
            itemEntryControl = LoadControl(@"~/Modules/ProtocolMgmt/PatientItemEntry.ascx") as PatientItemEntry;
            itemEntryControl.PatientItemId = pItemId;
            dataEntryContainer.Controls.Add(itemEntryControl);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableToKeys"></param>
        private void HandleSurveyPlugin(IDictionary<string, IEnumerable<int>> tableToKeys)
        {
            // KeyValuePair<IEnumerable<XElement>, int?> kvp = new KeyValuePair<IEnumerable<XElement>, int?>(mapping.Key, mapping.Value.Count() > 0 ? mapping.Value.First().Value : null);
            // var pItems = PatientItemField.GetByParent<PatientItemField>(pItemId);
            var existingSurveys = tableToKeys.Where(t => t.Key == "Surveys");// && !meta.Value.HasValue
            // only show if there is survey metadata
            SurveyPlugin.Visible = false;
            SurveyIdField.Value = "";
            if (existingSurveys.Count() > 0)
            {
                SurveyPlugin.Visible = existingSurveys.Count() > 0;
                var surveyIds = existingSurveys.SelectMany(s => s.Value).Distinct();
                if (surveyIds.Count() > 0)
                {
                    int surveyId = surveyIds.First();
                    SurveyIdField.Value = surveyId.ToString();
                }
            }
            // update plugin value
            SurveyPlugin.SetSurveyIdField(SurveyIdField.Value);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableToKeys"></param>
        private void HandleMedications(IDictionary<string, IEnumerable<int>> tableToKeys)
        {
            // show only on Medication related forms
            string[] medTables = new string[] { new Medication().TableName, new MedicalTherapy().TableName };
            bool displayMedications = tableToKeys.Keys.Intersect(medTables).Count() > 0;
            if (displayMedications)
            {
                MedicationsSection.Visible = true;

                int patientId = int.Parse(BaseDecryptedPatientId);
                MedicationDa da = new MedicationDa();
                DataView medications = da.GetMedicationsAndOralMedTx(patientId, null).DefaultView;
                MedicationsGridView.DataSource = medications;
                MedicationsGridView.DataBind();
            }
            else
            {
                MedicationsSection.Visible = false;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="biz"></param>
        /// <returns></returns>
        protected string GetItemStatus(PatientItem biz)
        {
            string defaultStatus = "Anticipated";
            string status = biz[PatientItem.Status].ToString();
            return !string.IsNullOrEmpty(status) ? status : defaultStatus;
        }

        /// <summary>
        /// Marks this DataEntry form as "dirty", i.e., needs to updated
        /// </summary>
        /// <param name="iCIC"></param>
        /// <param name="e"></param>
        protected void MarkFormDirty(ICaisisInputControl iCIC, EventArgs e)
        {
            patientItemFieldsDirty = true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            // Save current data entry items
            Save(sender, e);
            // TODO: hack?
            string[] reloadTableNames = new string[] { "Toxicities", "MedTxAdministration" };
            if (dataEntryTableNames.Any(t => reloadTableNames.Contains(t)))
                ReloadPage();
            else
                GoToNext();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveAndAdvanceClick(object sender, EventArgs e)
        {
            // Save current data entry items
            Save(sender, e);
            // !important, go to next logical item
            int? nextItemId = GetNextPatientItem(int.Parse(PatientItemId));
            if (nextItemId.HasValue)
            {
                NextItemId.Value = EncryptValue(nextItemId.Value.ToString());
            }
            GoToNext();
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleSurveyUpdated(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(SurveyIdField.Value))
            {
                int newPrimaryKey = int.Parse(SurveyIdField.Value);
                int itemid = int.Parse(PatientItemId);
                int patientid = ProtocolMgmtDa.GetPatientIdByPatientItemId(itemid);

                Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
                string username = sc.GetUserName();
                Dictionary<string, IEnumerable<int>> updateKeys = new Dictionary<string, IEnumerable<int>>();
                updateKeys.Add(new Survey().TableName, new int[] { newPrimaryKey });
                ProtocolMgmtDa.UpdateProtocolMgrPatientFieldsWithPKey(itemid, updateKeys, username);
                //Reload new request
                string encryptedItemId = EncryptValue(PatientItemId);
                GoToPage(encryptedItemId);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveAndReloadClick(object sender, EventArgs e)
        {
            Save(sender, e);
            GoToPortal();
        }

        /// <summary>
        /// Reloads the current page (new request).
        /// </summary>
        protected void ReloadPage()
        {
            GoToPage(QueryPatientItemId);
        }

        /// <summary>
        /// Go to specified next patient item
        /// </summary>
        /// <param name="encryptedItemId"></param>
        protected void GoToPage(string encryptedItemId)
        {
            if (!string.IsNullOrEmpty(encryptedItemId))
            {
                // Reload the current page, with new patientItemid
                string nextItemURL = GetQueryString("PatientVisitDataEntry.aspx") + "&patientItemId=" + encryptedItemId;
                Response.Redirect(nextItemURL, true);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        protected void GoToPortal()
        {
            string reloadPatientPortal = "goToPortal();";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "reloadPatientPortal", reloadPatientPortal, true);
        }

        /// <summary>
        /// 
        /// </summary>
        protected void GoToNext()
        {
            // Forward to next item if needed
            string encryptedItemId = NextItemId.Value;
            if (!string.IsNullOrEmpty(encryptedItemId))
            {
                GoToPage(encryptedItemId);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Save(object sender, EventArgs e)
        {
            Save();
            // repopuplate item status
            PopulatePatientItem(int.Parse(PatientItemId));
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CancelClick(object sender, EventArgs e)
        {
            // update status if needed
            if (PatientItemFieldsDirty)
            {
                UpdatePatientItem();
            }
            GoToNext();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CancelAndGoToPortal(object sender, EventArgs e)
        {
            GoToPortal();
        }

        /// <summary>
        /// Returns the next logic patient item entry
        /// </summary>
        /// <param name="currenPatientItemId"></param>
        /// <returns></returns>
        private int? GetNextPatientItem(int currenPatientItemId)
        {
            int? nextItemId = null;
            int lastIndex = VisitList.Count - 1;
            for (int i = 0; i < VisitList.Count; i++)
            {
                int rowPatientItemId = (int)VisitList[i][PatientItem.PatientItemId];
                if (rowPatientItemId == currenPatientItemId)
                {
                    int nextItemIndex = i + 1;
                    if (nextItemIndex <= lastIndex)
                    {
                        nextItemId = (int)VisitList[nextItemIndex][PatientItem.PatientItemId];
                    }
                }
            }
            return nextItemId;
        }

        /// <summary>
        /// 
        /// </summary>
        private void Save()
        {
            if (PatientItemFieldsDirty)
            {
                UpdatePatientItem();
            }
            if (DataEntryFieldsDirty)
            {
                UpdatePatientItemFields();
            }
            // register script to refresh main patient lists
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ReloadParentList", "if(window.parent.parent.reloadListAndCalendar) { window.parent.parent.reloadListAndCalendar(); }", true);
        }

        /// <summary>
        /// Updates the PatientItem record including status and status date.
        /// Also triggers scheduling of dependent events on this item.
        /// </summary>
        private void UpdatePatientItem()
        {
            if (!string.IsNullOrEmpty(PatientItemId))
            {
                // Load Item record and update fields
                int priKey = int.Parse(PatientItemId);
                PatientItem biz = new PatientItem();
                biz.Get(priKey);
                biz[PatientItem.Status] = StatusField.Value;
                // ScheduledDate is read only, so values aren't persisted by rumtime, but in Form
                biz[PatientItem.ScheduledDate] = Request.Form[ScheduledDate.UniqueID];
                biz.Save();

                // trigger scheduling for dependent items
                PatientProtocolController.ScheduleDependentItemsByItemStatus(priKey, StatusField.Value);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void UpdatePatientItemFields()
        {
            if (itemEntryControl != null)
            {
                int itemid = int.Parse(PatientItemId);
                int patientid = ProtocolMgmtDa.GetPatientIdByPatientItemId(itemid);

                // save patient items
                var updatedTableKeys = itemEntryControl.Save();

                // update survey plugin key
                HandleSurveyPlugin(updatedTableKeys);

                // update patient item fields
                Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
                string username = sc.GetUserName();
                ProtocolMgmtDa.UpdateProtocolMgrPatientFieldsWithPKey(itemid, updatedTableKeys, username);

                //ProtocolMgmtDa.UpdateProtocolMgrPatientFieldsWithPKey(itemid, newPrimaryKey);
            }
        }

        /// <summary>
        /// Registers a client script to update the navigation
        /// </summary>
        private void RegisterItemSyncScript()
        {
            // udpate navigation
            string syncMainNavigation = "if(parent.syncMainNavigation) { parent.syncMainNavigation(); }";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "syncMainNavigation", syncMainNavigation, true);
            // hilight current patient item
            string syncCurrentItem = "if(parent.setActivePatientItem) { parent.setActivePatientItem('" +  EncryptValue(PatientItemId) + "'); }";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "syncCurrentItem", syncCurrentItem, true);

        }

        /// <summary>
        /// Registers a client script function at rumetime used to initiate a postback and save and reload form
        /// </summary>
        private void RegisterDoItemSaveScritpts()
        {
            PageUtil.RegitserControlPostBackScript(TriggerSurveyUpdateBtn, DO_SURVEY_SAVE_SCRIPT);
            PageUtil.RegitserControlPostBackScript(SaveBtn, DO_ITEM_SAVE_SCRIPT);
            PageUtil.RegitserControlPostBackScript(SaveAdvanceBtn, DO_ITEM_SAVE_ADVANCE_SCRIPT);            
            PageUtil.RegitserControlPostBackScript(CancelBtn, DO_ITEM_CANCEL_SCRIPT);
            PageUtil.RegitserControlPostBackScript(SaveReloadBtn, DO_ITEM_SAVE_RELOAD_SCRIPT);
            PageUtil.RegitserControlPostBackScript(CancelReloadBtn, DO_ITEM_CANCEL_RELOAD_SCRIPT);
        }
    }
}
