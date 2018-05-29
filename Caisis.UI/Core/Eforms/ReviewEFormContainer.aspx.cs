using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Linq;

using Caisis.UI.Core.Classes;
using Caisis.Security;
using Caisis.Controller;
using Caisis.DataAccess;
using Caisis.BOL;

using Caisis.UI.Plugins.FileLoader;


namespace Caisis.UI.Core.Eforms
{
    /// <summary>
    /// Summary description for ReviewEFormDataFrames.
    /// </summary>
    public partial class ReviewEFormContainer : EFormBasePage
    {

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            this.SetEFormNavigationSteps();
            this.SetApproveButtonProperties();
            EFormTitle.Text = base.EFormTitle;
            PatientName.Text = "";

            if (Session[SessionKey.PtFirstName] != null && Session[SessionKey.PtFirstName].ToString().Length > 0)
            {
                PatientName.Text += " for " + Session[SessionKey.PtFirstName].ToString();
            }
            if (Session[SessionKey.PtLastName] != null && Session[SessionKey.PtLastName].ToString().Length > 0)
            {
                PatientName.Text += " " + Session[SessionKey.PtLastName].ToString();
            }

            // add switch here if xsl doc does not exist load EFormVerify.aspx

            ReviewDataFrame.Attributes.Add("src", "ReviewEForm.aspx?eformId=" + base.EFormId + "");

            if (!IsPostBack)
            {
                string eformId = base.EFormId.ToString();

                Page.RegisterClientScriptBlock("xyz", "<script language=javascript>var eformId = " + eformId + "</script>");

                SetReferralMDList();

            }

            if (base.EFormIsOfType("GU ", false)) PrintBtn.Visible = true;


        }

        protected void SetEFormNavigationSteps()
        {
            EditStep.HRef = "EditEFormContainer.aspx?eformId=" + base.EFormId;
            NarrativeStep.HRef = "ReviewEFormContainer.aspx?eformId=" + this.EFormId; // I don't think this is used? 
            //ApproveStep.HRef	= "EFormPrint.aspx?eformId=" + this.EFormId;
        }

        private void SetApproveButtonProperties()
        {
            if (PermissionManager.HasPermission(PermissionManager.EFormApprove))
            {
                // if user signature is enabled, disable approve button until user "signs" form
                if (this.userSignatureURL.Length > 0) { SaveButton.Src = "../../Images/ApproveThisForm_disabled.gif"; }
                else { SaveButton.Src = "../../Images/ApproveThisForm.gif"; }
                SaveButton.Attributes.Add("onclick", "submitReviewDataFrame();");

            }
            else if (PermissionManager.HasPermission(PermissionManager.EFormEdit))
            {
                SaveButton.Src = "../../Images/SaveAndClose.gif";
                SaveButton.Attributes.Add("onclick", "SaveAndCloseReviewDataFrame();");

                PermissionMessage.Text = "You do not have rights to approve eforms.";
                PermissionMessage.Visible = true;
            }
            else
            {
                SaveButton.Visible = false;
                PermissionMessage.Text = "You do not have rights to approve or edit eforms.";
                PermissionMessage.Visible = true;
            }
        }



        protected void SetReferralMDList()
        {

            XmlNode configNode = CaisisConfiguration.GetEFormNode(this.EFormName);
            if (configNode != null)
            {
                XmlAttribute att = configNode.Attributes["enableReferrals"];
                if (att != null)
                {

                    bool doEnable = bool.Parse(att.Value);
                    if (doEnable)
                    {
                        referToPanelContainer.Visible = true;

                        //UserDa uDa = new UserDa();
                        //DataTable uDt = uDa.GetUsersByAttributeValue("EForm Referee", "true");
                        //DataView uDv = uDt.DefaultView;
                        //uDv.Sort = BOL.User.UserLastName + " ASC";

                        //AppointmentDa da = new AppointmentDa();
                        //DataTable dt = da.GetUsersWithAppointments();
                        //DataView uDv = dt.DefaultView;

                        AppointmentDa da = new AppointmentDa();
                        DataTable dt = da.GetUsersWithAppointments();
                        List<string> UsersWithAppointments = (from row in dt.AsEnumerable()
                                                              select row.Field<string>(BOL.User.UserName)).ToList<string>();

                        // add referral recipients
                        DataTable uDt = ReferralRecipientsToGetLimitedData();
                        List<string> RECIPIENTS_TO_GET_LIMITED_DATA = (from row in uDt.AsEnumerable()
                                                                       select row.Field<string>(BOL.User.UserName)).ToList<string>();

                        UserDa userDa = new UserDa();

                        foreach (string refUserName in RECIPIENTS_TO_GET_LIMITED_DATA)
                        {
                            // check if user is already in list
                            if (!UsersWithAppointments.Contains(refUserName))
                            {
                                // include the "additional" users in list even if they don't have appointments
                                DataTable userDt = userDa.GetByUserName(refUserName).Tables[0];
                                if (userDt.Rows.Count > 0) { dt.Rows.Add(userDt.Rows[0].ItemArray); }
                            }
                        }


                        DataView uDv = dt.DefaultView;
                        uDv.Sort = "UserLastName ASC";


                        if (uDv.Count > 0)
                        {
                            NoEFormReferees.Visible = false;
                            ReferToRptr.DataSource = uDv;
                            ReferToRptr.DataBind();
                        }
                    }
                }
            }


        }


        protected string userSignatureURL
        {
            get
            {

                string url = "";

                UserController uc = new UserController();
                int userID = uc.GetUserId();

                FilesDa da = new FilesDa();
                DataSet ds = da.GetRecordsByTableAndTablePK("Users", userID);

                // get uploaded signatures for User
                IEnumerable<UploadedFile> userFiles = BOL.BusinessObject.GetByFields<UploadedFile>(
                     new Dictionary<string, object>
                     {
                         { BOL.UploadedFile.TableName, "Users" },
                         { BOL.UploadedFile.TablePrimaryKey, userID },
                         { BOL.UploadedFile.FileLabel, "signature" }
                    }
                );
                if (userFiles.Count() > 0)
                {
                    // get latest file
                    UploadedFile userFile = (from file in userFiles
                                             let date = (DateTime)file[BOL.UploadedFile.EnteredTime]
                                             orderby date descending
                                             select file).FirstOrDefault();
                    // validate file on disk
                    string fullFilePath = FileLoaderUtil.GetFileOnDisk(userFile, false);
                    if (System.IO.File.Exists(fullFilePath))
                    {
                        System.IO.FileStream reader = null;
                        try
                        {
                            // get output content type
                            string contentType = userFile[UploadedFile.FileType].ToString();
                            // get bytes from file
                            reader = new System.IO.FileStream(fullFilePath, System.IO.FileMode.Open);
                            byte[] buffer = new byte[reader.Length];
                            reader.Read(buffer, 0, (int)reader.Length);
                            reader.Close();
                            string imageAsBase64 = Convert.ToBase64String(buffer);
                            imageAsBase64 = PageUtil.EscapeSingleQuotes(imageAsBase64);
                            string base64FormatString = "data:{0};base64,{1}";
                            // create base64 image URL
                            url = string.Format(base64FormatString, contentType, imageAsBase64);
                            SignatureToggle.Visible = true;

                        }
                        catch (Exception ex)
                        {
                            if (reader != null)
                                reader.Close();
                            url = "";
                            SignatureToggle.Visible = false;
                        }
                    }
                }

                return url;

            }
        }



        public static readonly List<string> IMG_EXTENSIONS = new List<string>(new string[] { ".jpg", ".jpeg", ".gif", ".bmp", ".png" });


    }
}
