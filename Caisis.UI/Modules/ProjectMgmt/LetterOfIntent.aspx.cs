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

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class LetterOfIntent : ProjectMgmtAddFormBasePage
    {
        protected string strEdit = "false";

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["IsEditable"] != null)
                strEdit = Request.QueryString["IsEditable"].ToString();
            if (!String.IsNullOrEmpty(strEdit) && !strEdit.Equals("false"))
                strEdit = "true";
            base.Page_Load(sender, e);
        }

        protected override void PopulateDiseaseState(string strDiseaseState)
        {
            diseaseStates = new List<string>(strDiseaseState.Split(','));
            DiseaseState disState = (DiseaseState)this.FindControl("DiseaseStateEditor");
            if (disState != null)
                disState.PopulateDiseaseStateLOI(diseaseStates, false);
        }
        
    }
}
