using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt.DataEntryForms
{
    public partial class PCCTCMedTxGrid : BaseControl
    {
        private string medTxType;

        public virtual string TxType
        {
            get
            {
                return medTxType;
            }
            set
            {
                medTxType = value;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        public int Populate(int patientId, DateTime? fromDate, DateTime? toDate, IEnumerable<string> txExactMatch, IEnumerable<string> txLikeMatch)
        {
            MedicalTherapyDa da = new MedicalTherapyDa();
            DataView view = da.GetPatientTherapiesByType(patientId, txExactMatch, txLikeMatch).DefaultView;
            // filter
            List<string> filters = new List<string>();
            if (fromDate.HasValue)
            {
                string fromDateFilter = string.Format("{0} > #{1:d}#", MedicalTherapy.MedTxDate, fromDate);
                filters.Add(fromDateFilter);
            }
            if (toDate.HasValue)
            {
                string toDateFilter = string.Format("{0} < #{1:d}#", MedicalTherapy.MedTxDate, toDate);
                filters.Add(toDateFilter);
            }
            if (filters.Count() > 0)
            {
                view.RowFilter = string.Join(" AND ", filters.ToArray());
            }

            view = view.ToTable().DefaultView;
            view.Sort = MedicalTherapy.MedTxDate;
            int recordCount = view.Count;
            MedTxGrid.VisibleBlankRows = recordCount > 0 ? 0 : 2;
            MedTxGrid.DataSource = view;
            MedTxGrid.DataBind();

            return recordCount;
        }

        public IEnumerable<BusinessObject> Save(int patientId)
        {
            MedTxGrid.Save(patientId);
            // todo
            return new BusinessObject[0];
        }

        protected void SetFieldValues(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // set button states
                string priKey = DataBinder.Eval(e.Row.DataItem, MedicalTherapy.MedicalTherapyId) + "";
                bool isLocked = (DataBinder.Eval(e.Row.DataItem, BusinessObject.LockedBy) + "") != "";
                var exists = priKey != "";
                Control lockImg = e.Row.FindControl("LockImage");
                Control clearImg = e.Row.FindControl("ClearImage");
                lockImg.Visible = isLocked;
                clearImg.Visible = !exists;
                // lock inputs
                if (isLocked)
                {
                    var inputs = CICHelper.GetCaisisInputControls(e.Row);
                    inputs.ForEach(i => i.Enabled = false);
                }
                // special case: set TxType
                ICaisisInputControl txTypeInput = e.Row.FindControl("MedTxType") as ICaisisInputControl;
                if (string.IsNullOrEmpty(priKey))
                {
                    if (!string.IsNullOrEmpty(TxType))
                    {
                        txTypeInput.Value = TxType;
                    }
                }
                else
                {
                    txTypeInput.Value = DataBinder.Eval(e.Row.DataItem, MedicalTherapy.MedTxType).ToString();
                }
            }
        }
    }
}