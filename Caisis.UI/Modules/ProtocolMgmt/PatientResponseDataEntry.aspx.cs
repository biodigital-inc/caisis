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

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientResponseDataEntry : ProtocolMgmtPatientBasePage
    {

        /// <summary>
        /// Gets the PatientResponseId passed in Query string
        /// </summary>
        protected string PatientResponseId
        {
            get
            {
                return Request.QueryString["patientResponseId"];
            }
        }

        /// <summary>
        /// Returns if a new record is being inserted
        /// </summary>
        private bool IsNew
        {
            get
            {
                return PatientResponseId == "new";
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (IsNew)
                {
                    DeleteBtn.Visible = false;
                }
                else
                {
                    // populate existing fields
                    if (!string.IsNullOrEmpty(PatientResponseId))
                    {
                        PopulateFields(int.Parse(PatientResponseId));
                    }
                }

            }
        }

        /// <summary>
        /// Populates fields from database record
        /// </summary>
        /// <param name="patientResponseId"></param>
        private void PopulateFields(int patientResponseId)
        {
            PatientProtocolResponse biz = new PatientProtocolResponse();
            biz.Get(patientResponseId);
            base.PopulateForm(biz);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            PatientProtocolResponse biz = new PatientProtocolResponse();
            // Load existing record if updating
            if (!IsNew && !string.IsNullOrEmpty(PatientResponseId))
            {
                biz.Get(int.Parse(PatientResponseId));
            }
            // reference parent key
            int parKey = int.Parse(PatientProtocolId);
            // set fields value
            CICHelper.SetBOValues(this.Controls, biz, parKey);
            // finally save and call update script
            biz.Save();

            string updateResponseId = biz[PatientProtocolResponse.PatientResponseId].ToString();
            RegisterOnSaveScript(updateResponseId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteClick(object sender, EventArgs e)
        {
            if (!IsNew && !string.IsNullOrEmpty(PatientResponseId))
            {
                PatientProtocolResponse biz = new PatientProtocolResponse();
                biz.Delete(int.Parse(PatientResponseId));
            }
            RegisterOnSaveScript(string.Empty);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void CancelClick(object sender, EventArgs e)
        {
            RegisterOnSaveScript(string.Empty);
        }

        /// <summary>
        /// Registers a script to reload parent page to reflect changes for inserted/updated record
        /// </summary>
        /// <param name="patientResponseId"></param>
        private void RegisterOnSaveScript(string patientResponseId)
        {
            string reloadScript = "if(parent.reloadChronRecord) { parent.reloadChronRecord('ProtocolMgr_PatientResponse','" + patientResponseId + "'); }";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ReloadChronRecord", reloadScript, true);
        }
    }
}
