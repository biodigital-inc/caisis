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
using System.Collections.Generic;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectApprovalEditor : ProjectMgmtAddFormBaseControl
    {
        protected override void PopulateDiseaseState(string strDiseaseState)
        {
            diseaseStates = new List<string>(strDiseaseState.Split(','));
            DiseaseState disState = (DiseaseState)this.FindControl("DiseaseStateEditor");
            if (disState != null)
                disState.PopulateDiseaseStateProjApproval(diseaseStates, true);
        }

        public override void Save(int letterOfIntentId)
        {
            base.Save(letterOfIntentId);
        }

    }
}
