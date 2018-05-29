using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Threading;

using System.Web.Security;
using System.Security;
using System.Security.Principal;
using System.Configuration;

using Caisis.Security;
using Caisis.BOL;
using Caisis.Controller;
using Caisis.DataAccess;


using Caisis.UI.Core.Classes;

namespace Caisis.UI
{
    /// <summary>
    /// Summary description for Login.
    /// 
    /// User Authentication ticket set on this page including the session expiration time (currently 2 hours)
    /// </summary>
    public partial class Login : System.Web.UI.Page
    {
        protected System.Web.UI.WebControls.Button submitForm;
        protected System.Web.UI.HtmlControls.HtmlContainerControl updatePasswordFields;
        private string _username = "";
        private string focusElementId = "userName"; // default action is to focus on username

        protected void Page_Load(object sender, System.EventArgs e)
        {
            // write timeout period specified in web.config to login page
            timeoutPeriod.Text = Session.Timeout.ToString() + " minutes";

            if (!Page.IsPostBack)
            {
                this.BuildDefaultIdentifiers();
                this.HidePasswordButtons();

                if (Request.QueryString["userId"] != null || Request.QueryString["user"] != null || Request.QueryString["userEmail"] != null)
                {
                    this.DefaultUserName();
                }
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "startupFocus", string.Format("document.getElementById('{0}').focus();", focusElementId), true);

            SetHolidayWelcome();


        }

        /// <summary>
        /// Builds a list of default idenfitiers used for default search parameters
        /// as well as identifier on various forms.
        /// </summary>
        private void BuildDefaultIdentifiers()
        {
            // determine if list should be Shown
            string showIdentifierOnLogin = CaisisConfiguration.GetWebConfigValue("ShowIdentifiersOnLogin");

            // only build and show list if web config key explicity set to true
            if (!string.IsNullOrEmpty(showIdentifierOnLogin) && bool.Parse(showIdentifierOnLogin))
            {
                LookupCodeDa lkpDa = new LookupCodeDa();
                DataView defaultIdList = lkpDa.GetLookupCodesAttributeValues("IdType", "UseAsDefault").DefaultView;
                DefaultIdentifiersRadioList.DataSource = defaultIdList;
                DefaultIdentifiersRadioList.DataBind();

                // only show identifiers radio when values exist
                if (defaultIdList.Count > 0)
                {
                    // show list
                    IdentifiersPanel.Visible = true;
                    // select value in list if in cookie
                    HttpCookie defaultIdTypeCookie = GetDefaultIdTypeCookie();
                    if (defaultIdTypeCookie != null)
                    {
                        string defaultIdType = defaultIdTypeCookie.Value;
                        // if a value exists in cookie, check default radio
                        if (!string.IsNullOrEmpty(defaultIdType))
                        {
                            foreach (ListItem item in DefaultIdentifiersRadioList.Items)
                            {
                                if (item.Value == defaultIdType)
                                {
                                    item.Selected = true;
                                    break;
                                }
                            }
                        }
                    }
                }
                else
                {
                    IdentifiersPanel.Visible = false;
                }
            }
        }

        /// <summary>
        /// Defaults username using any of url variable: user, userId, or userEmail
        /// </summary>
        private void DefaultUserName()
        {
            if (!String.IsNullOrEmpty(Request.QueryString["user"]))
            {
                _username = Request.QueryString["user"];
            }
            else if (!String.IsNullOrEmpty(Request.QueryString["userId"]))
            {
                User user = new User();
                user.Get(int.Parse(Request.QueryString["userId"]));
                _username = user[Caisis.BOL.User.UserName].ToString();
            }
            else if (!String.IsNullOrEmpty(Request.QueryString["userEmail"]))
            {
                UserDa userDa = new UserDa();
                DataTable dt = userDa.GetByEmail(Request.QueryString["userEmail"].ToString());
                if (dt.Rows.Count > 0)
                {
                    _username = dt.Rows[0][Caisis.BOL.User.UserName].ToString();
                }
            }
            if (!_username.Equals(""))
            {
                this.userName.Value = _username;
                this.focusElementId = "password";
            }
        }

        protected void onSubmitBtn_Click(Object sender, System.Web.UI.ImageClickEventArgs e)
        {
            bool executeLogin = true;
            string user = userName.Value;
            string pswd = password.Value;
            string newPswd1 = newPassword1.Value;
            string newPswd2 = newPassword2.Value;

            UserController ct = new UserController(Session);

            // is user trying to update password?
            if (!newPswd1.Equals("") || !newPswd2.Equals(""))
            {
                try
                {
                    bool updatePassword = ct.ValidateNewPassword(user, pswd, newPswd1, newPswd2);
                    if (updatePassword)
                    {
                        //update password
                        string hashedOldPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(pswd, "MD5");
                        string hashedNewPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(newPswd1, "MD5");
                        ct.UpdateUserPassword(user, hashedOldPassword, hashedNewPassword);
                        pswd = newPswd1;
                    }
                }
                catch (ClientException updateEx)
                {
                    errorMessage.Text = updateEx.Message;
                    executeLogin = false; // something went wrong with password update, don't log user in
                }
            }


            //executeLogin = ct.LoginAfterPasswordUpdatePassword(userName.Value, password.Value, newPassword1.Value, newPassword2.Value);

            if (executeLogin)
            {
                // reset
                //string roleList = "";
                //string hashedPassword = "";
                errorMessage.Text = "";

                try
                {
                    //string roleList = "";

                    //int loginSessionId = ct.LoginUser(user, pswd);
                    //Session[SessionKey.LoginId] = loginSessionId;

                    //HttpContext currentContext = HttpContext.Current;
                    //string formsCookieStr = string.Empty;

                    //FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                    //    1,                                  // version
                    //    user,                     // user name
                    //    DateTime.Now,                       // issue time
                    //    DateTime.Now.AddMinutes(Session.Timeout),       // EXPIRES, updated 4/4/05
                    //    false,                              // persistent
                    //    roleList							// user data
                    //    );

                    //// get the encrypted representation suitable for placing in a HTTP cookie
                    //formsCookieStr = FormsAuthentication.Encrypt(ticket);
                    //HttpCookie FormsCookie = new HttpCookie(FormsAuthentication.FormsCookieName, formsCookieStr);

                    //currentContext.Response.Cookies.Add(FormsCookie);
                    
                    ct.SetUserLoginCredentials(user, pswd);

                    // set default search type
                    this.SetDefaultSearchIdType();
                    // log user attempty
                    ct.LogLoginAttempt(errorMessage.Text, user);
                    // handler redirect
                    this.RedirectUser();

                }
                catch (ClientException ex)
                {
                    errorMessage.Text = ex.Message;
                    ct.LogLoginAttempt(ex.Message, user);
                }
            }

        }

        protected void HidePasswordButtons()
        {
            string loginMode = CaisisConfiguration.GetWebConfigValue("LDAPAuthenticationMode");
            if (string.Equals(loginMode, "On", StringComparison.CurrentCultureIgnoreCase) || string.Equals(loginMode, "AccessMgr", StringComparison.CurrentCultureIgnoreCase))
            {
                ChangePasswordButton.Visible = false;
                ForgotPasswordButton.Visible = false;

                // does it use EZ Password? 
                string useEzPassword = CaisisConfiguration.GetWebConfigValue("AccessMgrURL");
                if (string.Equals(useEzPassword, "ezpassword", StringComparison.CurrentCultureIgnoreCase))
                {
                    EzPasswordImg.Visible = true; 
                }
            }
        }

        /// <summary>
        /// If login url contains datasetId and page name then validate and redirect, otherwise continue on to default splash page
        /// Only works for eforms at the moment; easily generalized
        /// </summary>
        private void RedirectUser()
        {
            //http://localhost/dev4/Login.aspx?redirect=%2fdev4%2fCore%2fEforms%2fIndex.aspx%3feform%3dUro+Pros+FU&status=new&dsId=1&user=admin&epid=791D41350A007063

            if (Request.QueryString["eform"] != null && Request.QueryString["eform"].Length > 0 && Request.QueryString["ptId"] != null && PageUtil.IsInteger(Request.QueryString["ptId"]))
            {
                // need to automatically set purpose, user dataset, and make sure patient is in the dataset
                // reference UserController to SetPermissions and GroupViewCode
                int loginId = (int)Session[SessionKey.LoginId];
                string userPurpose = Request.Form["purpose"];
                // int datasetId = int.Parse(Request.QueryString["dsId"]);
                int patientId = int.Parse(Request.QueryString["ptId"]);
                string eformName = Request.QueryString["eform"];

                // if redirecting to an existing eform, retrive eformId to ensure a new eform will now be created
                string eformId = String.Empty;
                if (Request.QueryString["eformId"] != null)
                    eformId = Request.QueryString["eformId"].ToString();

                int datasetId = 0;

                UserController ct = new UserController();
                DataSet userDatasets = ct.GetUserDatasets(userName.Value);
                // DataSet userDatasets = ct.GetUserDatasets();
                PatientController pc = new PatientController();
                bool isPatientInDataset = false;

                foreach (DataRow dr in userDatasets.Tables[0].Rows)
                {
                    datasetId = (int)dr[Dataset.DatasetId];
                    isPatientInDataset = pc.IsPatientInDataSet(patientId, datasetId);
                    if (isPatientInDataset) break;
                }

                //bool userHasAccessToDataset = ct.VerifyUserAccessToDataset(datasetId);

                if (isPatientInDataset)
                {
                    Session[SessionKey.DatasetId] = datasetId;
                    Session[SessionKey.GroupViewCode] = ct.SetGroupViewCode(datasetId, userName.Value);
                    // Session[SessionKey.GroupViewCode] = ct.SetGroupViewCode(datasetId);
                    ct.SetPermissions(userPurpose, datasetId, loginId, userName.Value);
                    // ct.SetPermissions(userPurpose, datasetId, loginId);

                    // set session vars for defaulting values when reaching eform
                    if (!string.IsNullOrEmpty(Request.QueryString["apptDate"].ToString()))
                    {
                        // should check that it is a date and culture format
                        Session[SessionKey.CurrentClinicDate] = Request.QueryString["apptDate"].ToString();
                    }
                    if (!string.IsNullOrEmpty(Request.QueryString["surgeon"].ToString()))
                    {
                        Session[SessionKey.CurrentListType] = "Clinic";
                        Session[SessionKey.CurrentListCrit] = Request.QueryString["surgeon"].ToString();
                    }


                    string epid = CustomCryptoHelper.Encrypt(patientId.ToString());
                    string eformStatus = "new";
                    string baseUrl = PageUtil.GetBasePath(Request);
                    string referralStr = (Request.QueryString["referral"] != null && Request.QueryString["referral"].ToUpper() == "TRUE") ? "&referral=true&status=Approved" : ("&status=" + eformStatus);

                    string redirectTo = baseUrl + "/Core/Eforms/Index.aspx?eform=" + eformName + "&epid=" + epid + "&eformId=" + eformId + referralStr;
                    // on top of eform name, need to append status=new and the patient epid (does not apply to referrals)

                    Response.Redirect(redirectTo);
                }
                else // we could not determine that this user has access to a dataset with this patient in it display message
                {
                    errorMessage.Text = "The system was unable to automatically direct you to the requested page. Please notify the system admin.";
                }
            }
            else
            {
                // default
                string purpose = Request.Form["purpose"].ToString();
                //Response.Redirect("Core/Utilities/Splash.aspx?login=true&purpose=" + purpose);
                Response.Redirect("Core/Utilities/SetAccessLevel.aspx?login=true&purpose=" + purpose);
            }

        }

        /// <summary>
        /// Log to database cookies on/off, ecma version, userIpAddress, userAgent,userBrowser, userPlatform, userJavascript, screenResolution, colorDepth
        /// Client Machine Name was skipped to avoid a DNS lookup on every login   
        /// </summary>
        /// 
        /*
        private void LogLoginAttempt()
        {
            int loginSessionId = -1;
            HttpRequest req = HttpContext.Current.Request;
            System.Web.HttpBrowserCapabilities browser = req.Browser;

            if (Session[SessionKey.LoginId] != null)
            {
                loginSessionId = (int)Session[SessionKey.LoginId];
            }
            string userBrowser = browser.Type.ToString() + " (" + browser.Version.ToString() + ")";
            string userPlatform = browser.Platform.ToString();
            string userJavascript = browser.JavaScript.ToString() + " (" + browser.EcmaScriptVersion.ToString() + ")"; ;
            string userCookies = browser.Cookies.ToString();
            string userIpAddress = req.UserHostAddress.ToString();
            string screenResolution = "Unknown";
            string message = errorMessage.Text;
            if (message.Length == 0)
            {
                message = "Valid.";
            }

            if (req.Form["screenResolution"] != null && req.Form["screenResolution"].Length > 0)
            {
                screenResolution = req.Form["screenResolution"];
            }

            string colorDepth = "Unknown";
            if (req.Form["colorDepth"] != null && req.Form["colorDepth"].Length > 0)
            {
                colorDepth = req.Form["colorDepth"] + "-bit";
            }

            string userAgent = "No User Agent Strinng Received";
            if (req.UserAgent != null && req.UserAgent.Length > 0)
            {
                userAgent = req.UserAgent;
            }
            Caisis.DataAccess.UserDa ud = new Caisis.DataAccess.UserDa();
            ud.LogLoginAttempt(userName.Value, loginSessionId, message, userIpAddress, userAgent, userBrowser, userPlatform, userJavascript, userCookies, screenResolution, colorDepth);

            return;
        }
        */

        /// <summary>
        /// Sets a cookie, setting user default idtype used through system
        /// </summary>
        private void SetDefaultSearchIdType()
        {
            string defaultIdType = Request.Form["DefaultIdentifiersRadioList"];
            // important, if radio list did not post, i.e., user didn't select value, don't insert cookie
            if (defaultIdType != null)
            {
                // check if cookie already exists (shouldn't, but verify)
                HttpCookie defaultIdTypeCookie = GetDefaultIdTypeCookie();
                if (defaultIdTypeCookie == null)
                {
                    defaultIdTypeCookie = new HttpCookie("DefaultSearchType");
                }
                defaultIdTypeCookie.Value = defaultIdType;
                // cookie shoud expire on empty values
                if (string.IsNullOrEmpty(defaultIdType))
                {
                    defaultIdTypeCookie.Expires = DateTime.MinValue;
                }
                Response.SetCookie(defaultIdTypeCookie);
            }
        }

        private HttpCookie GetDefaultIdTypeCookie()
        {
            HttpCookie defaultIdTypeCookie = Request.Cookies["DefaultSearchType"];
            return defaultIdTypeCookie;
        }

        private void SetHolidayWelcome()
        {
            DateTime today = DateTime.Now.Date;

            // winter holiday
            DateTime WinterHoliday_Start = new DateTime(DateTime.Now.Year, 12, 18);
	        DateTime WinterHoliday_End = new DateTime(DateTime.Now.AddYears(1).Year, 1, 1);
            if (today >= WinterHoliday_Start && today <= WinterHoliday_End) Holiday_Winter.Visible = true;



        }


        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {

        }
        #endregion


    }
}
