using System;
using System.Data;
using System.Drawing;
using System.Web;
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

namespace Caisis.UI.Modules.Prostate.DataEntryForms
{
    /// <summary>
    ///
    /// </summary>
    public partial class PSAAtDiagnosis : BaseDataEntryControl
    {
        private static readonly string ENTERED_BY_MATCH = "PSA";

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        public override void Populate()
        {
            // determine lab at diagnosis
            LabTest diagnosisPSA = ProtocolMgmtServices.GetBaselinePSA(base.patientId);
            // populate
            if (diagnosisPSA != null)
            {
                // set key
                LabTestIdField.Value = diagnosisPSA[BOL.LabTest.LabTestId] + "";
                // populate fields
                CICHelper.SetFieldValues(this.Controls, diagnosisPSA);
            }
        }


        public override IEnumerable<BusinessObject> Save()
        {
            // validation
            var inputs = CICHelper.GetCaisisInputControls(this);
            bool valid = CICHelper.InputControlsHaveValue(inputs);
            if (!valid)
            {
                return new BusinessObject[0];
            }

            LabTest lab = new LabTest();
            // update
            if (!string.IsNullOrEmpty(LabTestIdField.Value))
            {
                lab.Get(int.Parse(LabTestIdField.Value));
            }
            // insert
            else
            {
                lab[BOL.LabTest.LabTest_Field] = "PSA";
                lab[BOL.LabTest.LabUnits] = "ng/ml";
            }

            CICHelper.SetBOValues(this.Controls, lab, base.patientId);
            // get special stamp
            lab.AppendToUserName(GetEnteredBySuffix());
            lab.Save();
            // update key
            LabTestIdField.Value = lab[BOL.LabTest.LabTestId] + "";
            if (lab.PrimaryKeyHasValue)
                return new BusinessObject[] { lab };
            else
                return new BusinessObject[0];
        }

        /// <summary>
        /// Gets the specially formatted EnteredBy/UpdatedBy stamp to indicate a baseline PSA
        /// </summary>
        /// <returns></returns>
        private string GetEnteredBySuffix()
        {
            string enteredBy = string.Format("{0} - {1}", AppendToUserName, ENTERED_BY_MATCH);
            return enteredBy;
        }
    }
}
