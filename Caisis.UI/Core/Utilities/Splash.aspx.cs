using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;

using System.Security.Cryptography;
using System.Text;

using Caisis.Security;
using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Controller;
using System.Configuration;

using Caisis.UI.Core.Classes;


namespace Caisis.UI.Core.Utilities
{
    /// <summary>
    /// Splash page sets session variables and permissions after user login
    /// </summary>
    public partial class Splash : FramePage
    {
        public Splash()
            : base()
        {
            // fire late bound events
            this.PreRender += new EventHandler(SetAdminButton);
            this.PreRender += new EventHandler(SetSelectedDataSet);
            this.PreRender += new EventHandler(SetInboxImage);
            this.PreRender += new EventHandler(ShowSplashIcons);
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e); //base FramePage handles putting new patients in session


            Session[SessionKey.FormStyle] = "populated";
            int loginId = (int)Session[SessionKey.LoginId];
            string userPurpose = "";


            UserController ct = new UserController();

            //get options for dataset select box
            DataTable dataSetsTable = ct.GetUserDatasets().Tables[0];
            BuildDataSetsDropDown(dataSetsTable);

            //form is submitted
            bool formSubmitted = false;
            string userName = new SecurityController().GetUserName();
            if (Request.Form["dataSets"] != null && Request.Form["purpose"] != null)
            {
                //empty patient session in case dataset is being switched
                SessionHandler handler = new SessionHandler(Session);
                handler.EmptySession();

                string purposeVal = Request.Form["purpose"];
                int datasetIdVal = int.Parse(Request.Form["dataSets"]);
                ct.SetPermissions(purposeVal, datasetIdVal, loginId, userName);

                Session[SessionKey.DatasetId] = datasetIdVal;
                Session[SessionKey.GroupViewCode] = ct.SetGroupViewCode(datasetIdVal);

                formSubmitted = true;
                userPurpose = purposeVal;

            }
            //user comes from login page.. set value on splash page.. but don't insert into db until dataset is selected
            else if (Request.QueryString["purpose"] != null && !Request.QueryString["purpose"].Equals(""))
            {
                //Session[SessionKey.UserPurpose] = Request.QueryString["purpose"].ToString();
                userPurpose = Request.QueryString["purpose"].ToString();

                if (dataSetsTable.Rows.Count == 0)
                {
                    UserHasNoDatasetMsg.Text = "<br>Although you have a system account, you have not been assigned to view any patient datasets. Please contact the system adminsistrator.<br>";

                }
                else if (dataSetsTable.Rows.Count == 1)//user assigned to only one dataset, do not show select box
                {
                    int datasetId = int.Parse(dataSetsTable.Rows[0]["DatasetId"].ToString());
                    ct.SetPermissions(userPurpose, datasetId, loginId, userName);
                    Session[SessionKey.DatasetId] = datasetId;
                    Session[SessionKey.GroupViewCode] = ct.SetGroupViewCode(datasetId);

                }
            }


            if (Session[SessionKey.DatasetId] != null)
            {

                if (Session[SessionKey.GroupViewCode] == null)
                {
                    Session[SessionKey.GroupViewCode] = ct.SetGroupViewCode(int.Parse(Session[SessionKey.DatasetId].ToString()));
                }



                splashTitle.Src = ("../../Images/splashTextWhatWouldYouLikeToDo.gif");

                // No need for block layer to render
                blockHeaderLayer.Visible = false;
                datasetPurposeDiv.Attributes["style"] = "position:absolute; width:776px; z-index:20; visibility: hidden; height:140px;";

                changePurposeDatasetButton.Attributes.Add("onclick", "switchSplashKiosk('" + datasetPurposeDiv.ClientID.ToString() + "', '" + changePurposeDatasetButton.ClientID.ToString() + "');");
                changePurposeDatasetButton.Src = ("../../Images/changePurposeDataset.gif");

                //this.ShowAdminButton(int.Parse(Session[SessionKey.DatasetId].ToString())); //show admin button if user has permissions

                //this.ShowSplashIcons();
            }



            //if user purpose is in session, check checkbox
            if (userPurpose != "")
            {
                if (userPurpose.Equals("Research"))
                {
                    purpose1.Checked = true;
                }
                else if (userPurpose.Equals("Clinical"))
                {
                    purpose2.Checked = true;
                }
                else if (userPurpose.Equals("Operations"))
                {
                    purpose3.Checked = true;
                }
            }


            // Set the display within the view/edit patient data layer
            if (Session[SessionKey.PatientId] == null || Session[SessionKey.PatientId].ToString().Length == 0)
            {
                //PatientDataSplashLink.Attributes.Add("href", "javascript: noPatientInSessionRedirect();");
                SplashCurrentPatientTableRow.Visible = false;
                ViewEditPatientSpacerRow1.Visible = false;

                //EFormIcon.Attributes.Add("onclick", "top.noPatientInSessionRedirect();"); //added, fs, should be temporary
            }
            else
            {
                if (Session[SessionKey.PtLastName] != null && Session[SessionKey.PtMRN] != null)
                {

                    SplashCurrentPatient.Text = "View / edit data for the current patient: ";
                    ViewEditPatientName.Text = Session[SessionKey.PtFirstName].ToString() + " " + Session[SessionKey.PtLastName].ToString();
                    ViewEditPatientMRN.Text = Session[SessionKey.PtMRN].ToString();
                }
            }

            if (Session[SessionKey.CurrentListType] == null)
            {
                SelectFromCurrentListTableRow.Visible = false;
                ViewEditPatientSpacerRow2.Visible = false;
            }

            // During Post-back, new Request needs to be loaded to load permissions
            if (formSubmitted)
            {
                HandlerFormSubmitted(userPurpose);
            }
            else
            {
                HandleSingleGroupCode(userPurpose);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void HandleSingleGroupCode(string userPurpose)
        {
            // determine if user has access to only 1 tab
            if (Session[SessionKey.DatasetId] != null && !string.IsNullOrEmpty(Session[SessionKey.DatasetId].ToString()) && Session[SessionKey.GroupViewCode] != null && !string.IsNullOrEmpty(Session[SessionKey.GroupViewCode].ToString()))
            {
                // v4.2
                string groupViewCode = Session[SessionKey.GroupViewCode].ToString();
                TabController tc = new TabController(groupViewCode);
                DataTable tabsDt = tc.CreateTabDataTable(XmlUtil.GetModulesConfigXml());

                // if user can only see 1 tab, forward to path
                if (tabsDt.Rows.Count == 1)
                {
                    string modTab = tabsDt.Rows[0]["Path"].ToString();
                    RedirectToModule(modTab);
                }
                // otherwise, need to reload spash to ensure permissions
                else if (Request.QueryString["login"] != null)
                {
                    Response.Redirect("Splash.aspx?purpose=" + userPurpose, true);
                }
            }
        }

        /// <summary>
        /// During form submission new request need to be loaded
        /// </summary>
        /// <param name="userPurpose"></param>
        protected void HandlerFormSubmitted(string userPurpose)
        {
            HandleSingleGroupCode(userPurpose);
            // load new request
            string purposeParams = "?purpose=" + (!string.IsNullOrEmpty(userPurpose) ? userPurpose : string.Empty);
            Response.Redirect("Splash.aspx" + purposeParams, true);
        }

        /// <summary>
        /// Builds a list of DataSet drop down options
        /// </summary>
        /// <param name="dataSetsTable"></param>
        private void BuildDataSetsDropDown(DataTable dataSetsTable)
        {
            dataSets.DataSource = dataSetsTable;
            dataSets.DataBind();
        }

        /// <summary>
        /// Sets the selected Dataset option
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetSelectedDataSet(object sender, EventArgs e)
        {
            //if datasetId is in session, select option
            if (Session[SessionKey.DatasetId] != null)
            {
                PageUtil.SelectDropDownItem(dataSets, Session[SessionKey.DatasetId]);
            }
        }

        /// <summary>
        /// Sets the Admin button visibility based on user permission
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetAdminButton(object sender, EventArgs e)
        {
            if (PermissionManager.HasPermission(PermissionManager.EditSecurity))
            {
                adminButton.Visible = true;
                string adminPath = "window.location = '" + Page.ResolveUrl("~/Admin/Admin.aspx") + "'";
                adminButton.Attributes.Add("onclick", adminPath);
            }
            else
            {
                adminButton.Visible = false;
            }
        }

        /// <summary>
        /// If user has eforms pending display icon to reminders inbox
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SetInboxImage(object sender, EventArgs e)
        {
            string userName = new SecurityController().GetUserName();

            UserDa uda = new UserDa();
            DataSet uDs = uda.GetByUserName(userName);

            int userId = int.Parse(uDs.Tables[0].Rows[0]["UserId"].ToString());

            EFormsDa iDa = new EFormsDa();
            // string status = "'" + Caisis.UI.Core.Eforms.EformStatusManager.Status_DataEntryInProgress + "','" + Caisis.UI.Core.Eforms.EformStatusManager.Status_DataEntryReviewed + "'";
            string status = "'" + EformStatusManager.Status_DataEntryInProgress + "'";
            DataSet iDs = iDa.GetEformsInbox(userId, status);

            if (!(iDs != null && iDs.Tables.Count > 0 && iDs.Tables[0].Rows.Count > 0))
            {
                //splashKioskInbox.Src="../../Images/splashOptionsYouHaveMessages.gif";
                splashKioskInbox.Visible = false;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void ShowSplashIcons(object sender, EventArgs e)
        {
            if (Session[SessionKey.GroupViewCode] != null && !string.IsNullOrEmpty(Session[SessionKey.GroupViewCode].ToString()))
            {
                string groupViewCode = Session[SessionKey.GroupViewCode].ToString(); //set splash button visibility based on GroupAccessCode

                //XmlDocument xmlDoc = XmlUtil.GetModulesConfigXml();
                TabController tc = new TabController(groupViewCode);

                rptSplashIcons.DataSource = tc.GetSplashIcons();
                rptSplashIcons.DataBind();
            }
        }

        /// <summary>
        /// Set paths to splash images as well as url
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void rptItemCreated(Object sender, RepeaterItemEventArgs e)
        {
            // Only valid for actual repeater items
            if (e.Item.DataItem != null && (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem))
            {
                // Get a reference to icon image
                Image myIconImage = e.Item.FindControl("myIconImage") as Image;

                string moduleName = DataBinder.Eval(e.Item.DataItem, "Name").ToString();
                string imageName = DataBinder.Eval(e.Item.DataItem, "IconImageName").ToString();
                string path = DataBinder.Eval(e.Item.DataItem, "LocationPath").ToString();
                string patientRequired = DataBinder.Eval(e.Item.DataItem, "RequiresPatient").ToString();

                // Determine image path, else item is hidden
                if (!string.IsNullOrEmpty(imageName))
                {
                    // Image control will resolve full virtual path
                    myIconImage.ImageUrl = "~/Images/" + imageName;

                    // Determine client click event
                    if (patientRequired.ToLower().Equals(bool.TrueString.ToLower())) //&& (Session[SessionKey.PatientId] == null || Session[SessionKey.PatientId].ToString().Length == 0))
                    {
                        //path = "showSelectPatientPanel('" + moduleName +"')";
                        path = "showSelectPatientPanel('" + path + "')";
                    }
                    else
                    {
                        // Resolve url to correct path
                        string urlPath = Page.ResolveUrl("~/Core/" + path);
                        path = "location.href = '" + urlPath + "';";
                    }

                    // Onclick will handle redirecting to relevent section
                    myIconImage.Attributes["onclick"] = path;
                }
                else
                {
                    // No image defined, hide item
                    e.Item.Visible = false;
                }
            }
        }

        /// <summary>
        /// Send user directly to a module
        /// </summary>
        /// <param name="modTab"></param>
        private void RedirectToModule(string modTab)
        {
            string modUrl = PageUtil.GetBasePath(this.Request) + "/Core" + modTab;
            Response.Redirect(modUrl, true);
        }
    }
}



