using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt.DataEntryForms
{
    public partial class PCCTCChemoTherapy : BaseDataEntryControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        public override void Populate()
        {
            int recordCount = MedTxControl.Populate(base.patientId, base.BaselineFromDate, base.BaselineToDate, new string[] { "Chemo" }, new string[] { "Chemo" });
            MedTxAbsentEvent.SetAbsentEvent(base.patientId);
            // set "yes"
            if (recordCount > 0)
                MedTxAbsentEvent.YesChecked = true;
        }

        public override IEnumerable<BusinessObject> Save()
        {
            var records = MedTxControl.Save(base.patientId);
            // update absent event
            MedTxAbsentEvent.SaveAbsentEvent(base.patientId);
            return records;
        }
    }
}