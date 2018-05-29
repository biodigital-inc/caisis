using System;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Collections.Generic;
using System.Linq;


using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

using System.Security.Permissions;

namespace Caisis.UI.Modules.ProtocolMgmt.DataEntryForms
{
    /// <summary>
    ///
    /// </summary>
    public partial class PCCTCDiseaseState : BaseDataEntryControl
    {
        private IEnumerable<Status> PatientStatusList = new Status[0];

        private static readonly string STATUS_DISEASE = "Prostate Cancer";
        protected static readonly string[] STATUS_LIST = new string[]
        {
            "Diagnosis Date",
            "Localized",
            "Rising PSA Non-Castrate",
            "Clinical Mets Non-Castrate",
            "Rising PSA Castrate",
            "Clinical Mets Castrate"
        };

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            base.InitDirtyControlTracking(StatusRptr);
        }

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        public override void Populate()
        {
            // get a list of status records for disease Prostate
            var statusRecords = BOL.BusinessObject.GetByFields<Status>(new Dictionary<string, object> {
                    { Status.PatientId, base.patientId },
                    { Status.StatusDisease, STATUS_DISEASE }
            });
            // build a left outer join against status list
            var dataSource = from status in STATUS_LIST
                             join bizo in statusRecords on status equals bizo[Status.Status_Field].ToString() into g
                             select new
                             {
                                 Status = status,
                                 Bizo = g.FirstOrDefault()
                             };
            StatusRptr.DataSource = dataSource;
            StatusRptr.DataBind();
        }


        public override IEnumerable<BusinessObject> Save()
        {
            List<BOL.Status> statuses = new List<Status>();
            IEnumerable<Control> dirtyControls = base.GetDirtyInputControls(StatusRptr);
            // only update "dirty" rows
            foreach (Control item in dirtyControls)
            {
                HiddenField statusIdField = item.FindControl("StatusId_Field") as HiddenField;
                ICaisisInputControl statusField = item.FindControl("Status") as ICaisisInputControl;
                ICaisisInputControl statusDateTextField = item.FindControl("StatusDateText") as ICaisisInputControl;
                statuses.Add(SaveStatusRow(statusField.Value, statusDateTextField, statusIdField));
            }
            base.RemoveDirtyInputControls(dirtyControls.ToArray());
            return statuses.Where(s => s != null).Cast<BusinessObject>();
        }


        protected void SetFieldValues(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // get Status and Bizo (optional)
                string status = DataBinder.Eval(e.Item.DataItem, "Status").ToString();
                Status biz = DataBinder.Eval(e.Item.DataItem, "Bizo") as Status;

                var inputs = CICHelper.GetCaisisInputControls(e.Item);
                HiddenField statusIdField = e.Item.FindControl("StatusId_Field") as HiddenField;
                ICaisisInputControl statusDateTextField = e.Item.FindControl("StatusDateText") as ICaisisInputControl;
                ICaisisInputControl statusDateField = e.Item.FindControl("StatusDate") as ICaisisInputControl;
                ICaisisInputControl statusField = e.Item.FindControl("Status") as ICaisisInputControl;
                HtmlTableRow rowElement = e.Item.FindControl("DataRecordRow") as HtmlTableRow;
                Control clearBtn = e.Item.FindControl("ClearBtn");
                Control lockImg = e.Item.FindControl("LockImage");
                clearBtn.Visible = false;
                lockImg.Visible = false;

                // populate
                statusField.Value = status;

                if (biz != null)
                {
                    // populate fields
                    CICHelper.SetFieldValues(inputs, biz);
                    // set key field
                    statusIdField.Value = biz[Status.StatusId] + "";

                    bool lockedByRecord = (biz[Status.LockedBy] + "") != "";
                    if (lockedByRecord)
                    {
                        CICHelper.EnableFields(e.Item.Controls, false);
                    }
                    lockImg.Visible = lockedByRecord;
                    clearBtn.Visible = false;
                }
                // new records
                else
                {
                    statusIdField.Value = "";
                    lockImg.Visible = false;
                    clearBtn.Visible = true;

                    // SPECIAL CASE: if calculated diagnosis date, lock status
                    if (status == "Diagnosis Date")
                    {
                        DateTime? diagnosisDate = ProtocolMgmtServices.GetDateOfDiagnosis(patientId);
                        if (diagnosisDate.HasValue)
                        {
                            CICHelper.EnableFields(e.Item.Controls, false);
                            string displayDate = string.Format("{0:d}", diagnosisDate);
                            statusDateField.Value = displayDate;
                            statusDateTextField.Value = displayDate;

                            lockImg.Visible = true;
                            clearBtn.Visible = false;
                        }
                    }

                }
            }
        }

        protected Status SaveStatusRow(string status, ICaisisInputControl statusDateText, HiddenField statusIdField)
        {
            BOL.Status biz = new Status();
            int? statusId = null;
            // existing
            if (!string.IsNullOrEmpty(statusIdField.Value))
                statusId = int.Parse(statusIdField.Value);
            // validation: new entries
            if (!statusId.HasValue)
            {
                if (string.IsNullOrEmpty(statusDateText.Value))
                    return null;
            }
            if (statusId.HasValue)
            {
                biz.Get(statusId.Value);
            }
            // new record
            else
            {
                biz[BOL.Status.PatientId] = base.patientId;
                biz[BOL.Status.StatusDisease] = STATUS_DISEASE;
                biz[BOL.Status.Status_Field] = status;
            }
            biz[BOL.Status.StatusDateText] = statusDateText.Value;
            DateTime statusDate = DateTime.Now;
            if (DateTime.TryParse(statusDateText.Value, out statusDate))
                biz[BOL.Status.StatusDate] = statusDate;
            base.SaveBizo(biz);
            // update key
            statusIdField.Value = biz[BOL.Status.StatusId] + "";

            return biz;
        }
    }
}
