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

public partial class Modules_FollowUp_Surveys_EpicSurvey : BaseSurveyControl
{
    protected override void Page_Load(object sender, EventArgs e)
    {
        base.SetPatientLabels(Name, MRN);

        if (!String.IsNullOrEmpty(FuMonth))
        {
            if (FuMonth.Equals("0"))
                Period.Text = "Pre-Op";

            else
                Period.Text = FuMonth + " Month";
        }

        Patient pt = new Patient();
        pt.Get(PatientId);
        if (pt[Patient.PtBirthDate] != null && PageUtil.IsDate(pt[Patient.PtBirthDate].ToString()))
        {
            DateTime dob = DateTime.Parse(pt[Patient.PtBirthDate].ToString());
            DOBDay.Text = dob.Day.ToString();
            DOBMonth.Text = dob.Month.ToString();
            DOBYear.Text = dob.Year.ToString();
        }
    }
}
