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
using System.IO;

public partial class Modules_FollowUp_Surveys_LongitudinalLetter : BaseLongitudinalControl
{
    private static readonly string[] LETTER_PARTS = new string[] { "returnAddress", "greeting", "body", "complimentaryClose", "footer"};
    private string physicianWorkPh = String.Empty;

    protected override void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (!String.IsNullOrEmpty(CoverLetterXmlFileName))
            {
                if (CoverLetterXmlFileName.Contains(".xml"))
                    LetterDataSource.DataFile = "~/Modules/FollowUp/LongitudinalFollowUp/" + CoverLetterXmlFileName;
                else
                    LetterDataSource.DataFile = "~/Modules/FollowUp/LongitudinalFollowUp/" + CoverLetterXmlFileName + ".xml";

                Patient pt = new Patient();
                pt.Get(PatientId);

                string ptMRN = pt[Patient.PtMRN].ToString();
                string ptTitle = pt[Patient.PtTitle].ToString().ToUpper();
                string ptFirstName = pt[Patient.PtFirstName].ToString().ToUpper();
                string ptGender = pt[Patient.PtGender].ToString().ToUpper();

                string greeting = "";

                if (!String.IsNullOrEmpty(ptMRN))
                {
                    identifier.Text = "MRN:  " + ptMRN;
                }
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

                string addrLine1 = !String.IsNullOrEmpty(pt[Patient.PtAddress1].ToString()) ? pt[Patient.PtAddress1].ToString() : String.Empty;
                addrLine1 = !String.IsNullOrEmpty(addrLine1) && !String.IsNullOrEmpty(pt[Patient.PtAddress2].ToString()) ? addrLine1 + " " + pt[Patient.PtAddress2].ToString() : addrLine1;

                string addrLine2 = pt[Patient.PtCity].ToString();
                addrLine2 = !String.IsNullOrEmpty(pt[Patient.PtCity].ToString()) && !String.IsNullOrEmpty(pt[Patient.PtState].ToString()) ? addrLine2 + ", " + pt[Patient.PtState].ToString() : addrLine2;
                addrLine2 = String.IsNullOrEmpty(pt[Patient.PtCity].ToString()) && !String.IsNullOrEmpty(pt[Patient.PtState].ToString()) ? addrLine2 + pt[Patient.PtState].ToString() : addrLine2;
                addrLine2 = !String.IsNullOrEmpty(addrLine2) && !String.IsNullOrEmpty(pt[Patient.PtPostalCode].ToString()) ? addrLine2 + " " + pt[Patient.PtPostalCode].ToString() : addrLine2 + pt[Patient.PtPostalCode].ToString();

                this.PatientAddress.Text = addrLine1.ToUpper();
                this.PatientAddress.Text = !String.IsNullOrEmpty(addrLine1) ? this.PatientAddress.Text + "<br/>" + addrLine2.ToUpper() : addrLine2.ToUpper();

                FollowUpDA da = new FollowUpDA();
                this.PhysicianName.Text = da.GetMostRecentTreatingPhysician(PatientId);
                PatientPhysicianDa ptPhDa = new PatientPhysicianDa();
                DataSet ptPhDs = ptPhDa.FormGetPatientPhysicians(PatientId, "", "Dynamic");
                DataView ptPhDv = new DataView(ptPhDs.Tables[0]);
                if (ptPhDv.Count > 0)
                {
                    ptPhDv.Sort = PatientPhysician.EnteredTime + " DESC ";

                    this.PhysicianName.Text = ptPhDv[0][Physician.PhFirstName].ToString() + " " + ptPhDv[0][Physician.PhMiddleName].ToString() + "  " + ptPhDv[0][Physician.PhLastName].ToString() + "  " + ptPhDv[0][Physician.PhSuffix].ToString();

                    this.PhysicianInfo.Text = String.Empty;
                    if (!String.IsNullOrEmpty(ptPhDv[0][Physician.PhLevel].ToString()))
                        this.PhysicianInfo.Text = this.PhysicianInfo.Text + ptPhDv[0][Physician.PhLevel].ToString() + " Physician<br/>";
                    if (!String.IsNullOrEmpty(ptPhDv[0][Physician.PhInstitution].ToString()))
                        this.PhysicianInfo.Text = this.PhysicianInfo.Text + ptPhDv[0][Physician.PhInstitution].ToString() + "<br/>";
                    if (!String.IsNullOrEmpty(ptPhDv[0][Physician.PhWorkPhone].ToString()))
                    {
                        this.PhysicianInfo.Text = this.PhysicianInfo.Text + "Phone: " + ptPhDv[0][Physician.PhWorkPhone].ToString() + "<br/>";
                        physicianWorkPh = ptPhDv[0][Physician.PhWorkPhone].ToString();
                    }

                    // if physician has a signature image stord, add to Letter
                    // image file should be stored as Images/FormImages/PhysicianSig_[PhLastName][PhFirstName].jpg
                    if (!String.IsNullOrEmpty(ptPhDv[0][Physician.PhFirstName].ToString()) && !String.IsNullOrEmpty(ptPhDv[0][Physician.PhLastName].ToString()))
                    {
                        string signaturesSourceFolder = Server.MapPath("../../../Images/FormImages/");
                        string signatureFileName = "PhysicianSig_" + ptPhDv[0][Physician.PhLastName].ToString() + ptPhDv[0][Physician.PhFirstName].ToString() + ".jpg";
                        string signaturePath = signaturesSourceFolder + signatureFileName;

                        if (File.Exists(signaturePath))
                        {
                            SignatureImage.ImageUrl = signaturePath;
                            SignaturePH.Visible = true;
                        }

                    }
                }

                /// Add institution logo based on web.config variable to Xsl params.
                /// Institution logo should be stored in the format AbbreviatedName_FormLogo.gif, ie MSKCC_FormLogo.gif.
                string logoUrl = "../../../Images/FormImages/" + CaisisConfiguration.GetWebConfigValue("institutionShortName") + "_FormLogo.gif";
                HeaderLogo.Src = Server.MapPath(logoUrl);;


                BuildLetter();

            }
        }
        ExternalContent.Visible = false;

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

                if (letterPart == "body" && outputSource.InnerXml.Trim().Contains("<PHYS_PHONE></PHYS_PHONE>"))
                    outputLiteral.Text = outputSource.InnerXml.Trim().Replace("<PHYS_PHONE></PHYS_PHONE>",physicianWorkPh);
                else
                    outputLiteral.Text = outputSource.InnerXml.Trim();
            }
        }
    }
}
