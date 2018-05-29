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

using Caisis.UI.Core.Classes;
using Caisis.BOL;

public partial class Modules_FollowUp_Surveys_EVUQOLPostLateTx : BaseSurveyControl
{
    protected override void Page_Load(object sender, EventArgs e)
    {
        base.SetPatientLabels(Name, MRN);
        base.SetInstitutionName(SurveyInstitutionName);
        base.SetProcedureNameAndMonths(ProcName, FUMonth);

        if (!String.IsNullOrEmpty(FuMonth))
        {
            if (FuMonth.Equals("0"))
                Period.Text = "Pre-Op";

            else
                Period.Text = FuMonth + " Month";
        }

    }
}
