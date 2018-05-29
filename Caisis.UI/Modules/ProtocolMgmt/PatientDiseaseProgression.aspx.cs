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
    public partial class PatientDiseaseProgression : ProtocolMgmtPatientBasePage
    {
        private string[] DISEASE_PROGRESSION_STATUSES = new string[] { "1st Progression", "2nd Progression" };
        private static string STATUS_DISEASE = "Prostate Cancer";
        private int patientId = -1;

        protected override void Page_Load(object sender, EventArgs e)
        {
            // set patient id
            patientId = int.Parse(BaseDecryptedPatientId);

            if (!Page.IsPostBack)
            {
                PopulateForm();
            }
        }

        protected void PopulateForm()
        {
            ProgressionRptr.DataSource = DISEASE_PROGRESSION_STATUSES;
            ProgressionRptr.DataBind();
        }

        protected void PopulateRptrStatuses(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string status = e.Item.DataItem.ToString();
                PopulateStatus(e.Item, status);
            }
        }

        protected void UpdateClick(object sender, EventArgs e)
        {
            foreach (RepeaterItem row in ProgressionRptr.Items)
                SaveStatus(row);
        }

        protected void DeleteStatusClick(object sender, EventArgs e)
        {
            Control container = (sender as Control).NamingContainer;
            HiddenField StatusIdField = container.FindControl("StatusIdField") as HiddenField;
            if (!string.IsNullOrEmpty(StatusIdField.Value))
            {
                int statusId = int.Parse(StatusIdField.Value);
                BOL.Status status = new Status();
                status.Delete(statusId);
                // rebuild form
                PopulateForm();
            }
        }

        /// <summary>
        /// Populates the status for the current control
        /// </summary>
        /// <param name="container"></param>
        /// <param name="status"></param>
        private void PopulateStatus(Control container, string status)
        {
            HiddenField StatusIdField = container.FindControl("StatusIdField") as HiddenField;
            ICaisisInputControl Status_Field = container.FindControl("Status_Field") as ICaisisInputControl;
            ICaisisInputControl StatusDisease = container.FindControl("StatusDisease") as ICaisisInputControl;
            ImageButton deleteBtn = container.FindControl("DeleteBtn") as ImageButton; 

            // get pri key
            int? statusId = GetStaustId(status);
            // set hidden field
            StatusIdField.Value = statusId + "";

            // populate
            if (statusId.HasValue)
            {
                Status biz = new Status();
                biz.Get(statusId.Value);
                CICHelper.SetFieldValues(container.Controls, biz);
            }
            // set inital values
            else
            {
                CICHelper.ClearCaisisInputControlValues(container);
                // set required values
                StatusDisease.Value = STATUS_DISEASE;
                Status_Field.Value = status;
            }
            // set delete
            deleteBtn.Visible = statusId.HasValue;
        }

        /// <summary>
        /// Saves the status in the current control
        /// </summary>
        /// <param name="container"></param>
        private void SaveStatus(Control container)
        {
            HiddenField StatusIdField = container.FindControl("StatusIdField") as HiddenField;
            ICaisisInputControl Status_Field = container.FindControl("Status_Field") as ICaisisInputControl;
            ICaisisInputControl StatusDateText = container.FindControl("StatusDateText") as ICaisisInputControl;
            // get pri key
            int? statusId = null;
            if (!string.IsNullOrEmpty(StatusIdField.Value))
                statusId = int.Parse(StatusIdField.Value);

            // validate
            if (string.IsNullOrEmpty(StatusDateText.Value))
                return;

            // create/edit entry
            Status status = new Status();
            // load existing
            if (statusId.HasValue)
            {
                status.Get(statusId.Value);
            }
            // create new entry
            else
            {
                status[Status.PatientId] = patientId;
                // required
                status[Status.StatusDisease] = STATUS_DISEASE;
                status[Status.Status_Field] = Status_Field.Value;
            }
            CICHelper.SetBOValues(container.Controls, status, patientId);
            status.Save();

            // update pri key field
            statusId = (int)status[Status.StatusId];
            StatusIdField.Value = statusId.Value.ToString();

            // run dependency scheduling
            int patientSchemaId = int.Parse(PatientSchemaId);
            string username = new Security.SecurityController().GetUserName();
            ProtocolMgmtDa.ScheduleDependentPatientItemsByStatus(patientSchemaId, username);
        }

        /// <summary>
        /// Gets the status record based on current disease progression status
        /// </summary>
        /// <param name="status"></param>
        /// <returns></returns>
        private int? GetStaustId(string status)
        {
            Status biz = BusinessObject.GetByFields<Status>(new Dictionary<string, object>
            {
                { Status.PatientId, patientId },
                { Status.Status_Field, status },
                { Status.StatusDisease, STATUS_DISEASE },
            }).FirstOrDefault();
            if (biz != null && !biz.IsEmpty)
                return (int)biz[Status.StatusId];
            else
                return null;
        }

    }
}
