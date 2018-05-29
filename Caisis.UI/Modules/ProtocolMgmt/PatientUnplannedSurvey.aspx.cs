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
    public partial class PatientUnplannedSurvey : ProtocolMgmtPatientBasePage
    {
        protected string QueryPatientItemId
        {
            get
            {
                return Request.QueryString["patientItemId"];
            }
        }

        protected string QuerySurveyId
        {
            get
            {
                return Request.QueryString["surveyId"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(QueryPatientItemId))
                {
                    PatientItemId.Value = QueryPatientItemId;
                    SurveyIdField.Value = QuerySurveyId;
                }
                PopulateForm();
            }
            else
            {
                if (!string.IsNullOrEmpty(SaveFromPlugin.Value))
                {
                    SaveClick(sender, e);
                }
            }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
        }

        /// <summary>
        /// 
        /// </summary>
        private void PopulateForm()
        {
            if (!string.IsNullOrEmpty(SurveyIdField.Value))
            {
                int surveyId = int.Parse(SurveyIdField.Value);
                Survey biz = new Survey();
                biz.Get(surveyId);
                base.PopulateForm(biz);

                // populate survey items
                DataView surveyItems = SurveyItem.GetByParentAsDataView<SurveyItem>(surveyId);
                SurveyItemsGrid.DataSource = surveyItems;
                SurveyItemsGrid.DataBind();

                // set related record if exists
                int patientItemId = int.Parse(base.DecrypyValue(PatientItemId.Value));
                DataTable relatedRecords = RelatedRecordsDa.GetRecord("ProtocolMgr_PatientItems", patientItemId, "Surveys", surveyId);
                if (relatedRecords.Rows.Count > 0)
                {
                    RelatedRecordId.Value = relatedRecords.Rows[0][RelatedRecord.RelatedRecordId].ToString();
                }
            }
            else
            {
                // show empty grid by builing empty data table
                DataTable dt = new DataTable();
                dt.Columns.AddRange((from col in new SurveyItem().FieldNames
                                     select new DataColumn(col)).ToArray());
                SurveyItemsGrid.DataSource = dt.DefaultView;
                SurveyItemsGrid.DataBind();
            }
            SurveyPluginControl.SetSurveyIdField(SurveyIdField.Value);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            // save survey
            Survey biz = new Survey();
            if (!string.IsNullOrEmpty(SurveyIdField.Value))
            {
                biz.Get(int.Parse(SurveyIdField.Value));
            }
            // if save was NOT triggerd from plugin, then save with form fields
            if (string.IsNullOrEmpty(SaveFromPlugin.Value))
            {
                CICHelper.SetBOValues(this.Controls, biz, int.Parse(BaseDecryptedPatientId));
                biz.Save();
                int surveyId = (int)biz[Survey.SurveyId];
                SurveyIdField.Value = surveyId.ToString();

                // save survey items
                SurveyItemsGrid.Save(surveyId);
            }

            SurveyPluginControl.SetSurveyIdField(SurveyIdField.Value);

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
            item[PatientItem.ScheduledDate] = FieldSurveyDate.Value;
            item.Save();
            patientItemId = (int)item[item.PrimaryKeyName];
            PatientItemId.Value = base.EncryptValue(patientItemId.ToString());

            // now create association via related records
            int relatedRecordId = PatientProtocolController.CreateUnplannedVisitRelatedRecord(patientItemId, biz.TableName, int.Parse(SurveyIdField.Value));
            RelatedRecordId.Value = relatedRecordId.ToString();

            // don't register update script if triggered from add new row
            if (sender != AddNewRowBtn)
            {
                // register update script
                RegisterUpdateScript(false);
            }
            // otherwise repopulate form
            else
            {
                PopulateForm();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(SurveyIdField.Value))
            {
                Survey biz = new Survey();
                biz.Delete(int.Parse(SurveyIdField.Value));
                SurveyIdField.Value = string.Empty;
                SurveyPluginControl.SetSurveyIdField(SurveyIdField.Value);

                // delete associated record
                RelatedRecord relatedRecord = new RelatedRecord();
                relatedRecord.Delete(int.Parse(RelatedRecordId.Value));

                // register update script
                RegisterUpdateScript(true);
            }
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