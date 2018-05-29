using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.Extensions;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt.DataEntryForms
{
    public partial class PCCTCRadiationTherapy : BaseDataEntryControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        public override void Populate()
        {
            // get records
            DataView view = BusinessObject.GetByParentAsDataView<RadiationTherapy>(base.patientId);
            // filter by date
            List<string> filters = new List<string>();
            if (BaselineFromDate.HasValue)
            {
                string fromDateFilter = string.Format("{0} > #{1:d}#", RadiationTherapy.RadTxDate, BaselineFromDate);
                filters.Add(fromDateFilter);
            }
            if (BaselineToDate.HasValue)
            {
                string toDateFilter = string.Format("{0} < #{1:d}#", RadiationTherapy.RadTxDate, BaselineToDate);
                filters.Add(toDateFilter);
            }
            if (filters.Count() > 0)
            {
                view.RowFilter = string.Join(" AND ", filters.ToArray());
            }

            view = view.ToTable().DefaultView;
            view.Sort = RadiationTherapy.RadTxDate;
            int recordCount = view.Count;
            RadTxGrid.VisibleBlankRows = recordCount > 0 ? 0 : 2;
            RadTxGrid.DataSource = view;
            RadTxGrid.DataBind();

            // set absent event
            RadTxAbsentEvent.SetAbsentEvent(base.patientId);
            // set "yes"
            if (recordCount > 0)
                RadTxAbsentEvent.YesChecked = true;
        }

        public override IEnumerable<BusinessObject> Save()
        {
            RadTxGrid.Save(base.patientId);
            // update absent event
            RadTxAbsentEvent.SaveAbsentEvent(base.patientId);
            // todo
            return new BusinessObject[0];
        }

        protected void SetFieldValues(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // set button states
                bool isLocked = (DataBinder.Eval(e.Row.DataItem, BusinessObject.LockedBy) + "") != "";
                var exists = (DataBinder.Eval(e.Row.DataItem, RadiationTherapy.RadiationTherapyId) + "") == "";
                Control lockImg = e.Row.FindControl("LockImage");
                Control clearImg = e.Row.FindControl("ClearImage");
                lockImg.Visible = isLocked;
                clearImg.Visible = exists;
            }
        }
    }
}