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

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientDeviations : ProtocolMgmtPatientBasePage
    {
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

        protected string QueryPatientDeviationId
        {
            get
            {
                return Request.QueryString["deviationId"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PatientItemId.Value = QueryPatientItemId;
                PatientDeviationId.Value = QueryPatientDeviationId;
                PopulateForm();
            }
        }

        /// <summary>
        /// Populates the fiels on this form with a PatientDevaition record
        /// </summary>
        private void PopulateForm()
        {
            if (!string.IsNullOrEmpty(PatientItemId.Value))
            {
                // Populate patient item scheduled field
                int patientItemId = int.Parse(base.DecrypyValue(PatientItemId.Value));
                PatientItem item = new PatientItem();
                item.Get(patientItemId);
                if (item[PatientItem.ScheduledDate] != null && item[PatientItem.ScheduledDate].ToString() != "")
                {
                    string sDate = ((DateTime)item[PatientItem.ScheduledDate]).ToShortDateString();
                    ScheduledDate.Value = sDate;
                    ScheduledDateText.Value = sDate;
                }

                // populate deviation
                if (!string.IsNullOrEmpty(PatientDeviationId.Value))
                {
                    int pdi = int.Parse(PatientDeviationId.Value);
                    PatientDeviation deviation = new PatientDeviation();
                    deviation.Get(pdi);
                    base.PopulateForm(deviation);
                    // cleanup date field display
                    var inputs = PageUtil.GetCaisisInputControlsInContainer(this);
                    foreach (var input in inputs)
                    {
                        if (input.Table == "ProtocolMgr_PatientDeviations" && input.Field.Contains("DeviationDate"))
                        {
                            if (!deviation.IsNull(input.Field))
                            {
                                input.Value = string.Format("{0:d}", deviation[input.Field]);
                            }
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Saves/Updates the current PatientDeviation record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            // Update/Insert PatientItem
            PatientItem patientItem = new PatientItem();
            // update
            if (!string.IsNullOrEmpty(PatientItemId.Value))
            {
                patientItem.Get(int.Parse(base.DecrypyValue(PatientItemId.Value)));
            }
            // inserting
            else
            {
                patientItem[PatientItem.PatientSchemaId] = PatientSchemaId;
            }
            patientItem[PatientItem.ScheduledDate] = ScheduledDate.Value;
            patientItem[PatientItem.Status] = "Unplanned";
            patientItem.Save();
            int patientItemId = (int)patientItem[PatientItem.PatientItemId];
            PatientItemId.Value = base.EncryptValue(patientItemId.ToString());

            // Update/insert deviation
            PatientDeviation deviation = new PatientDeviation();

            // update
            if (!string.IsNullOrEmpty(PatientDeviationId.Value))
            {
                deviation.Get(int.Parse(PatientDeviationId.Value));
            }
            // insert
            else
            {
                deviation[PatientDeviation.PatientItemId] = patientItemId;
            }
            // set biz object values, update and reload form
            CICHelper.SetBOValues(this.Controls, deviation, patientItemId);
            deviation[PatientDeviation.PatientItemId] = patientItemId;
            deviation.Save();
            PatientDeviationId.Value = deviation[PatientDeviation.PatientDeviationId].ToString();

            // update fields
            PopulateForm();

            // notify client scripts
            RegisterUpdateScript(false);
        }

        /// <summary>
        /// Deletes the current PatientItem and PatientDeviation record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteClick(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(PatientItemId.Value) && !string.IsNullOrEmpty(PatientDeviationId.Value))
            {
                // cleanup patient item
                int patientItemId = int.Parse(base.DecrypyValue(PatientItemId.Value));
                // if item is not tied to existing records, cleanup
                IEnumerable<PatientItemField> fields = BusinessObject.GetByFields<PatientItemField>(new Dictionary<string,object> { { PatientItemField.PatientItemId, patientItemId } });
                bool fieldsHaveRecord = fields.Any(f => !f.IsNull(PatientItemField.DestTablePrimKey));
                //if (!fieldsHaveRecord)
                //{
                //    ProtocolMgmtDa.DeletePatientItem(patientItemId);
                //    PatientItemId.Value = string.Empty;
                //}

                // delete deviation
                int patientDeviationId = int.Parse(PatientDeviationId.Value);
                PatientDeviation deviation = new PatientDeviation();
                deviation.Delete(patientDeviationId);
                PatientDeviationId.Value = string.Empty;

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
