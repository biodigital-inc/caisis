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
using System.Xml;

using Caisis.UI.Core.Classes;
using Caisis.BOL;
using Caisis.DataAccess;
using System.Text.RegularExpressions;

public partial class Modules_FollowUp_Surveys_FollowUpLetter : BaseSurveyControl
{
    private static readonly string[] LETTER_PARTS = new string[] { "returnAddress", "body", "complimentaryClose", "footer", "rightHandMargin" };

    protected override void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Patient pt = new Patient();
            pt.Get(PatientId);

            string ptTitle = pt[Patient.PtTitle].ToString().ToUpper();
            string ptFirstName = pt[Patient.PtFirstName].ToString().ToUpper();
            string ptGender = pt[Patient.PtGender].ToString().ToUpper();

            string greeting = "";

            if (!String.IsNullOrEmpty(ptTitle))
            {
                greeting = ptTitle;
            }
            else if (!String.IsNullOrEmpty(ptFirstName))
            {
                greeting = ptFirstName;
            }
            else if (!String.IsNullOrEmpty(ptGender))
            {
                if (ptGender.Equals("MALE"))
                    greeting = "Mr.";
                else if (ptGender.Equals("FEMALE"))
                    greeting = "Ms.";
            }

            this.Date.Text = DateTime.Today.ToLongDateString();
            this.PatientName.Text = pt[Patient.PtFirstName].ToString().ToUpper() + " " + pt[Patient.PtMiddleName].ToString().ToUpper() + " " + pt[Patient.PtLastName].ToString().ToUpper();
            this.PatientGreetingName.Text = greeting + " " + pt[Patient.PtLastName].ToString().ToUpper();

            string addrLine1 = pt[Patient.PtAddress1].ToString() + " " + pt[Patient.PtAddress2].ToString();
            string addrLine2 = pt[Patient.PtCity].ToString() + ", " + pt[Patient.PtState].ToString() + pt[Patient.PtPostalCode].ToString();

            this.PatientAddress.Text = addrLine1.ToUpper() + "<br/>" + addrLine2.ToUpper();

            FollowUpDA da = new FollowUpDA();
            this.PhysicianName.Text = da.GetMostRecentTreatingPhysician(PatientId);

            BuildLetter();
        }

    }

    /// <summary>
    /// Builds output based on XML letter
    /// </summary>
    private void BuildLetter()
    {
        XmlDocument xDoc = LetterDataSource.GetXmlDocument();

        foreach (string letterPart in LETTER_PARTS)
        {
            Literal outputLiteral = this.FindControl(letterPart) as Literal;
            XmlNode outputSource = xDoc.SelectSingleNode("//" + letterPart + "");
            if (outputLiteral != null && outputSource != null)
            {
                outputLiteral.Text = outputSource.InnerXml.Trim();
            }
        }
    }
}
