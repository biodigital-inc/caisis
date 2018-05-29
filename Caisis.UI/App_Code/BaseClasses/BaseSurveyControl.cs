using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI.Core.Classes;
using Caisis.BOL;

/// <summary>
/// Summary description for BaseSurveyControl
/// </summary>
public class BaseSurveyControl: BaseControl
{
    private int _patientId;
    private string _procedure;
    private string _fuMonth;

    public int PatientId
    {
        get
        {
            return _patientId;
        }

        set
        {
            _patientId = value;
        }
    }

    public string Procedure
    {
        get
        {
            return _procedure;
        }

        set
        {
            _procedure = value;
        }
    }

    public string FuMonth
    {
        get
        {
            return _fuMonth;
        }

        set
        {
            _fuMonth = value;
        }
    }

    public BaseSurveyControl()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    protected void SetPatientLabels(Label Name, Label MRN)
    {
        Patient p = new Patient();
        p.Get(_patientId);
        Name.Text = p[Patient.PtFirstName].ToString() + " " + p[Patient.PtMiddleName].ToString() + "  " + p[Patient.PtLastName].ToString();
        MRN.Text = p[Patient.PtMRN].ToString();
    }

    protected void SetInstitutionName(Label SurveyInstitutionName)
    {
        SurveyInstitutionName.Text = CaisisConfiguration.GetWebConfigValue("institutionName").ToUpper();
    }

    protected void SetProcedureNameAndMonths(Label ProcName, Label FUMonth)
    {
        ProcName.Text = Procedure;
        FUMonth.Text = FuMonth;
    }
}
