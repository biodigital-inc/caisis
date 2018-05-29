using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.Prostate.DataEntryForms
{
    /// <summary>
    ///	
    /// </summary>
    public partial class ClinicalStage_ProstateUICC02 : BaseDataEntryControl
    {
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        public override void Populate()
        {
            // determine clin stage at diagnosis
            ClinicalStage diagnosisClinStage = BusinessObject.GetByFields<ClinicalStage>(new Dictionary<string, object>
            {
                { ClinicalStage.PatientId, base.patientId },
                { ClinicalStage.ClinStageDisease, "Prostate" }
            }).FirstOrDefault();
            // populate existing clin stage
            if (diagnosisClinStage != null)
            {
                int clinicalStageId = (int)diagnosisClinStage[ClinicalStage.ClinicalStageId];
                CICHelper.SetFieldValues(this.Controls, diagnosisClinStage);
                ClinicalStageId.Value = clinicalStageId + "";
            }
        }


        public override IEnumerable<BusinessObject> Save()
        {
            var inputs = CICHelper.GetCaisisInputControls(this);
            bool fieldHaveValue = CICHelper.InputControlsHaveValue(inputs);
            // ClinStageT required
            if (fieldHaveValue && !string.IsNullOrEmpty(ClinStageT.Value))
            {
                int? clinStageId = null;
                if (!string.IsNullOrEmpty(ClinicalStageId.Value))
                    clinStageId = int.Parse(ClinicalStageId.Value);
                ClinicalStage clinStage = new ClinicalStage();
                // update
                if (clinStageId.HasValue)
                {
                    clinStage.Get(clinStageId.Value);
                }
                // new
                else
                {
                    clinStage[ClinicalStage.PatientId] = base.patientId;
                    clinStage[ClinicalStage.ClinStageDisease] = "Prostate";
                    clinStage[ClinicalStage.ClinStageSystem] = "UICC_02";
                    clinStage[ClinicalStage.ClinStageQuality] = "STD";
                }
                CICHelper.SetBOValues(this.Controls, clinStage, base.patientId);
                base.SaveBizo(clinStage);
                // update key
                ClinicalStageId.Value = clinStage[ClinicalStage.ClinicalStageId].ToString();

                return new BusinessObject[] { clinStage };
            }

            return new BusinessObject[0];
        }
    }
}
