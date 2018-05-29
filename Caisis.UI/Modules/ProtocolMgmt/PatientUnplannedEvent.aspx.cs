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
    public partial class PatientUnplannedEvent : ProtocolMgmtPatientBasePage
    {
        protected string QueryPatientItemId
        {
            get
            {
                return Request.QueryString["patientItemId"];
            }
        }

        protected string QueryTableName
        {
            get
            {
                return Request.QueryString["table"];
            }
        }

        protected string QueryPriKey
        {
            get
            {
                return Request.QueryString["priKey"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(QueryPatientItemId))
                {
                    PatientItemId.Value = QueryPatientItemId;                    
                }
                if (!string.IsNullOrEmpty(QueryPriKey))
                {
                    PriKeyField.Value = QueryPriKey;
                }
            }

            BuildUnplannedEvent();
        }

        /// <summary>
        /// Builds the data entry interface based on table
        /// </summary>
        protected void BuildUnplannedEvent()
        {
            // Build UI: build column layout based on default metadata
            var inputs = CICHelper.GetCaisisInputControlsByTableName(QueryTableName, null);
            int colCount = new Caisis.Controller.PatientDataEntryController(null).GetNumDisplayColumns(QueryTableName);
            DataEntryLayout.BuildLayout(inputs, colCount, new string[] { });
             
            // Populate: populate exising record
            if (!string.IsNullOrEmpty(PriKeyField.Value))
            {
                int priKey = int.Parse(PriKeyField.Value);
                // load record and populate form
                var biz = BusinessObjectFactory.BuildBusinessObject(QueryTableName);
                biz.Get(priKey);
                // populate section with biz
                base.PopulateForm(DataEntryLayout, biz);

                // set related record if exists
                if (!string.IsNullOrEmpty(PatientItemId.Value))
                {
                    int patientItemId = int.Parse(base.DecrypyValue(PatientItemId.Value));
                    RelatedRecord relatedRecord = Caisis.Controller.RelatedRecordController.GetRelatedRecords("ProtocolMgr_PatientItems", patientItemId, QueryTableName, priKey).FirstOrDefault();
                    if (relatedRecord != null)
                    {
                        RelatedRecordId.Value = relatedRecord[RelatedRecord.RelatedRecordId].ToString();
                    }
                }
            }
            
        }
        
        #region CLICK EVENTS

        /// <summary>
        /// Save the data entry form and close
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            var biz = BusinessObjectFactory.BuildBusinessObject(QueryTableName);
            if (!string.IsNullOrEmpty(PriKeyField.Value))
            {
                biz.Get(int.Parse(PriKeyField.Value));
            }
            int patientId = (int)Session[Patient.PatientId];//int.Parse(BaseDecryptedPatientId)
            int parentKey = biz.HasField(Patient.PatientId) ? patientId : -1;
            CICHelper.SetBOValues(DataEntryLayout.Controls, biz, parentKey);
            biz.Save();
            // update hidden field
            int priKey = (int)biz[biz.PrimaryKeyName];
            PriKeyField.Value = priKey.ToString();

            // create patient item if needed
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
            // determine schedule date
            var dateFields = from field in biz.FieldNames
                             where field.EndsWith("Date")
                             select field;
            if (dateFields.Count() > 0)
            {
                item[PatientItem.ScheduledDate] = biz[dateFields.First()].ToString();
            }
            item.Save();
            patientItemId = (int)item[item.PrimaryKeyName];
            PatientItemId.Value = base.EncryptValue(patientItemId.ToString());

            // now create association via related records
            if (string.IsNullOrEmpty(RelatedRecordId.Value))
            {
                int relatedRecordId = PatientProtocolController.CreateUnplannedVisitRelatedRecord(patientItemId, biz.TableName, priKey);
                RelatedRecordId.Value = relatedRecordId.ToString();
            }

            RegisterUpdateScript(false);

            // re populate
            BuildUnplannedEvent();
        }

        /// <summary>
        /// Delete the data entry form and close
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteClick(object sender, EventArgs e)
        {
            var biz = BusinessObjectFactory.BuildBusinessObject(QueryTableName);
            if (!string.IsNullOrEmpty(PriKeyField.Value))
            {
                biz.Delete(int.Parse(PriKeyField.Value));
                // update hidden field
                PriKeyField.Value = string.Empty;

                // delete associated record
                if (!string.IsNullOrEmpty(RelatedRecordId.Value))
                {
                    RelatedRecord relatedRecord = new RelatedRecord();
                    relatedRecord.Delete(int.Parse(RelatedRecordId.Value));

                    RelatedRecordId.Value = string.Empty;

                    // register update script
                    RegisterUpdateScript(true);
                }
            }
            BuildUnplannedEvent();
        }
        #endregion

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