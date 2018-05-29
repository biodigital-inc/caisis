
using System;
using System.Xml;
using System.Data;
using System.ComponentModel;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.Security;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;


namespace Caisis.UI.Core.Header
{
    /// <summary>
    ///		Summary description for pageHeader.
    /// </summary>
    public partial class PageHeader : BaseControl
    {
        protected string diseaseSelection = "";
        protected string currentUsername
        {
            get { return new SecurityController().GetUserName(); }
        }

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);


            // Get variables in session for patient
            object patientIdInSession = Session[SessionKey.PatientId];
            object patientLastNameInSession = Session[SessionKey.PtLastName];
            object patientFirstNameInSession = Session[SessionKey.PtFirstName];
            object patientMRNInSession = Session[SessionKey.PtMRN];
            object patientDOBInSession = Session[SessionKey.PtDOB];

            // Last Name is required, check if Session variable exits
            if (patientLastNameInSession != null)
            {
                string patientLastName = patientLastNameInSession.ToString();
                if (!string.IsNullOrEmpty(patientLastName))
                {
                    string patientId = patientIdInSession.ToString();
                    string patientFirstName = patientFirstNameInSession.ToString();
                    string patientMRN = patientMRNInSession.ToString();
                    string patientDOB = patientDOBInSession.ToString();

                    Patient biz = new Patient();
                    biz.Get(int.Parse(patientId));
                    PatientController pc = new PatientController();
                    UserController uc = new UserController();

                    // User controller to shield names if needed
                    patientLastName = pc.GetPatientLastName(biz);
                    patientFirstName = pc.GetPatientFirstName(biz);// patientFirstNameInSession.ToString();
                    patientMRN = pc.GetPatientMRN(biz);// patientMRNInSession.ToString();
                    patientDOB = pc.GetPatientDateOfBirth(biz);// patientDOBInSession.ToString();

                    int maxNameLength = 14;

                    // Set Patient First and Last Name, if longer than maxNameLength,
                    // use substring + '...'
                    if (patientFirstName.Length > maxNameLength)
                    {
                        fName.Text = patientFirstName.Substring(0, maxNameLength) + "...";
                    }
                    else
                    {
                        fName.Text = patientFirstName;
                    }
                    if (patientLastName.Length > maxNameLength)
                    {
                        lName.Text = patientLastName.Substring(0, maxNameLength) + "...";
                    }
                    else
                    {
                        lName.Text = patientLastName;
                    }

                    // determine if idtype name  should be Shown with idtype value
                    string showIdentifierOnLogin = CaisisConfiguration.GetWebConfigValue("ShowIdentifiersOnLogin");

                    // Set Identifier Text
                    string defaultIdType = uc.GetDefaultIdentifierType();
                    // special case, if user has default identifier (which isn't MRN), display
                    if (!string.IsNullOrEmpty(defaultIdType) && defaultIdType != PatientController.LAST_NAME_MRN_IDENTIFIER)
                    {               
                        // only append type name and type value if web config key explicity set to true
                        if (!string.IsNullOrEmpty(showIdentifierOnLogin) && bool.Parse(showIdentifierOnLogin))
                            idTypeField.Text = defaultIdType + " " + pc.GetPatientIdentifier(int.Parse(patientId), defaultIdType);
                        else
                            idTypeField.Text = pc.GetPatientIdentifier(int.Parse(patientId), defaultIdType);

                        idTypeField.ToolTip = defaultIdType;
                    }
                    // otherwise default to MRN (handling permission)
                    else
                    {
                        patientMRN = pc.GetPatientMRN(biz);

                        // only append type name and type value if web config key explicity set to true
                        if (!string.IsNullOrEmpty(showIdentifierOnLogin) && bool.Parse(showIdentifierOnLogin))
                            idTypeField.Text = "MRN " + patientMRN;
                        else
                            idTypeField.Text = patientMRN;
                        idTypeField.ToolTip = "MRN";
                    }

                    // Set DOB and check if Patient is deceased
                    string deathText = "";
                    if (!string.IsNullOrEmpty(patientId))
                    {
                        deathText = pc.IsPatientDeceased(int.Parse(patientId)) ? " <span class=\"deceasedText\">(DECEASED)</span>" : "";
                    }
                    dob.Text = patientDOB + deathText;
                }
            }

            XmlDocument xmlDoc = XmlUtil.GetModulesConfigXml();

            // publish tabs
            this.SetHeaderTabs(xmlDoc);

            // set view mode
            this.SetViewMode();

            // Build a List of drop down search paramaters
            this.BuildIdentifiersDropDown();

            this.SetEmailLink();

            // set view overview link
            this.SetViewSummaryLink(patientIdInSession);
        }


        /// <summary>
        /// Escapes single quoted client string
        /// </summary>
        /// <param name="clientString"></param>
        protected string EscapeClientValue(string clientString)
        {
            return PageUtil.EscapeSingleQuotes(clientString);
        }

        /// <summary>
        /// Builds a List of Identifiers based on user
        /// </summary>
        private void BuildIdentifiersDropDown()
        {
            UserController uc = new UserController();
            DataTable dt = uc.GetSearchIdentifiers();
            SearchOptionsDropdown.DataSource = dt;
            SearchOptionsDropdown.DataBind();
        }

        /// <summary>
        /// Gets the global javascript variable accessible from all client side functions based on Culture setting in the web.config.
        /// </summary>
        protected string GetCulture()
        {
            string culture = System.Threading.Thread.CurrentThread.CurrentCulture.Name;
            return culture;
        }

        /// <summary>
        /// Gets a client list of strings reprenseting the months for the current culture 'mon1','mon2',etc...
        /// </summary>
        /// <returns></returns>
        protected string GetMonthNames()
        {
            // Register Month Names used on client
            System.Collections.Generic.List<string> monthList = new System.Collections.Generic.List<string>(System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.MonthNames);
            // Remove empty entries
            monthList.Remove(string.Empty);

            string clientMonthArray = "'" + String.Join("','", monthList.ToArray()) + "'";
            return clientMonthArray;
        }

        private void SetHeaderTabs(XmlDocument xmlDoc)
        {
            if (Session[SessionKey.GroupViewCode] != null)
            {

                int maxTabs = 5;  // this is the maximum number of tabs shown before using the "More" menu.  maybe change based on Screen Resolution?


                string currentSection = HttpContext.Current.Request.RawUrl;

                string groupViewCode = Session[SessionKey.GroupViewCode].ToString();
                TabController ct = new TabController(groupViewCode);
                DataTable HeaderDt = ct.CreateTabDataTable(xmlDoc);

                int numTabs = HeaderDt.Rows.Count;
                bool showMoreTabsMenu = false;
                string TabsRightEndImgName = "HeaderTabsRightEndOff";
                if (HeaderDt.Rows.Count > maxTabs) showMoreTabsMenu = true;

                int ActiveTabRowIndex = 0;


                // make current tab active
                if (currentSection != null)
                {
                    bool isSplashPage = false;
                    if (currentSection.IndexOf("/Utilities/Dashboard.aspx") > -1)
                    {
                        isSplashPage = true;
                    }

                    if (numTabs > 0)
                    {
                        for (int i = 0; i < (numTabs); i++)
                        {
                            if (currentSection.ToLower().IndexOf(HeaderDt.Rows[i]["Path"].ToString().ToLower()) > -1)
                            {
                                HeaderDt.Rows[i]["IsActiveTab"] = "true";
                                ActiveTabRowIndex = i;

                                if (numTabs > (i + 1))
                                {
                                    HeaderDt.Rows[i + 1]["IsActiveTab"] = "previous";

                                    if (showMoreTabsMenu && (i == (maxTabs - 1))) TabsRightEndImgName = "HeaderTabsRightEndOn";

                                }
                                else  // tab is last tab
                                {
                                    if (!showMoreTabsMenu) TabsRightEndImgName = "HeaderTabsRightEndOn";
                                    //                                    TabRightEnd.Src = "../../Images/Header/HeaderTabsRightEndOn.gif";
                                }
                            }

                        }

                        if (isSplashPage)
                        {
                            HeaderDt.Rows[0]["IsActiveTab"] = "previous";
                        }
                    }
                    else
                    {
                        TabsRightEndImgName = "HeaderTabsRightEndOn";
                        //                      TabRightEnd.Src = "../../Images/Header/HeaderTabsRightEndOn.gif";
                    }

                    if (isSplashPage)
                    {
                        TabLeftEnd.Src = "../../Images/Header/HeaderTabsLeftEndOn.gif";
                        TabHome.Src = "../../Images/Header/HeaderTabsHomeOn.gif";
                    }
                    else
                    {
                        TabHome.Attributes["style"] = "cursor:hand;";
                    }
                }


                if (showMoreTabsMenu)
                {

                    // make sure active tab is shown even if selected from more menu
                    // do this by moving the active tab up in the table if necessary
                    if (ActiveTabRowIndex != null && ActiveTabRowIndex > (maxTabs - 1))
                    {
                        DataRow activeRow = HeaderDt.Rows[ActiveTabRowIndex];
                        DataRow newRow = HeaderDt.NewRow();
                        newRow.ItemArray = activeRow.ItemArray;
                        HeaderDt.Rows.Remove(activeRow);
                        HeaderDt.Rows.InsertAt(newRow, maxTabs - 1);
                        TabsRightEndImgName = "HeaderTabsRightEndOn";
                    }


                    TabsRightEndImgName += "_withMoreMenu";
                    MoreModulesTab.Visible = true;
                    MoreModulesMenu.Visible = true;


                    DataTable MoreTabsMenuDt = HeaderDt.Copy();

                    for (int i = 0; i < maxTabs; i++)  // delete unneeded tabs from MoreTabsMenuDt
                    {
                        MoreTabsMenuDt.Rows[0].Delete();
                    }

                    MoreTabsRpt.DataSource = MoreTabsMenuDt.DefaultView;
                    MoreTabsRpt.DataBind();


                    for (int j = maxTabs; j < numTabs; j++) // delete excess tabs from HeaderDt and add tab names to title attribute of the "more" tab
                    {
                        //                        MoreModulesTab.Attributes["title"] += HeaderDt.Rows[maxTabs]["TabName"];
                        //                        if (j < (numTabs - 1)) MoreModulesTab.Attributes["title"] += ", ";

                        HeaderDt.Rows[maxTabs].Delete();
                    }


                }




                TabRightEnd.Src = "../../Images/Header/" + TabsRightEndImgName + ".gif";


                rptHeaderTabs.DataSource = HeaderDt.DefaultView;
                rptHeaderTabs.DataBind();
            }
        }

        /// <summary>
        /// Display view in header and write new cookie on change of view mode
        /// </summary>
        private void SetViewMode()
        {
            // v6
            Caisis.Controller.DiseaseController dc = new Caisis.Controller.DiseaseController();
            var diseaseViews = dc.GetDiseaseViews();

            // bind views to repeater
            rptViewModes.DataSource = diseaseViews;
            rptViewModes.DataBind();

            if (Request.Form.HasKeys())
            {
                if (Request.Form[diseaseSelect.UniqueID] != null && Request.Form[diseaseSelect.UniqueID].ToString() != "")
                {
                    diseaseSelection = Request.Form[diseaseSelect.UniqueID].ToString();
                    this.OnDiseaseSelect(diseaseSelection);
                }
                else
                {
                    this.SetDiseaseDisplay();
                }
            }
            else
            {
                SetDiseaseDisplay();
            }
        }

        /// <summary>
        /// Sets the view mode display based on user cookie. No cookie, then defaults to "all"
        /// </summary>
        /// <param name="cp"></param>
        private void SetDiseaseDisplay()
        {
            CustomPrincipal cp = System.Threading.Thread.CurrentPrincipal as CustomPrincipal;

            SecurityController sc = new SecurityController();

            if (cp.UserProfile["diseaseView"] != null && cp.UserProfile["diseaseView"].ToString().Length > 0)
            {
                currentDiseaseView.Text = cp.UserProfile["diseaseView"].ToString();

            }
            else
            {
                this.OnDiseaseSelect("All");
            }
        }

        /// <summary>
        /// Stores view mode in cookie when a user select a new view mode
        /// </summary>
        /// <param name="diseaseSelection"></param>
        private void OnDiseaseSelect(string diseaseSelection)
        {
            if (diseaseSelection != "")
            {
                string dz = diseaseSelection;

                HttpCookie diseaseView = new HttpCookie("diseaseView", dz);
                diseaseView.Expires = DateTime.Now.AddYears(1);

                Response.Cookies.Add(diseaseView);

                CustomPrincipal cp = System.Threading.Thread.CurrentPrincipal as CustomPrincipal;
                cp.UserProfile["diseaseView"] = dz;

                //Set Disease View Display
                currentDiseaseView.Text = dz.ToString();
            }
        }

        /// <summary>
        /// Writes tab properties on repeater item bound
        /// </summary>
        /// <param name="Sender"></param>
        /// <param name="e"></param>
        protected void HeaderTabsItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            System.Web.UI.HtmlControls.HtmlTableCell TabLeftTD, TabCenterTD;
            TabLeftTD = (HtmlTableCell)e.Item.FindControl("TabLeftTD");
            TabCenterTD = (HtmlTableCell)e.Item.FindControl("TabCenterTD");


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {


                if (((DataRowView)e.Item.DataItem)["RequiresPatient"] != null && ((DataRowView)e.Item.DataItem)["RequiresPatient"].ToString().ToUpper().Equals("TRUE"))
                {
                    if (Session[SessionKey.PatientId] != null && Session[SessionKey.PatientId].ToString().Length > 0)
                    {
                        TabCenterTD.Attributes["onclick"] = "location='.." + ((DataRowView)e.Item.DataItem)["Path"].ToString() + "';";
                    }
                    else
                    {
                        TabCenterTD.Attributes["onclick"] = "noPatientInSessionRedirect();";
                    }

                }
                else
                {
                    TabCenterTD.Attributes["onclick"] = "location='.." + ((DataRowView)e.Item.DataItem)["Path"].ToString() + "';";
                }


                if ((((DataRowView)e.Item.DataItem)["IsActiveTab"] != null))
                {
                    if (((DataRowView)e.Item.DataItem)["IsActiveTab"].ToString().Equals("true"))
                    {
                        TabLeftTD.Attributes["class"] = "HeaderTabInBetweenRightOn";
                        TabCenterTD.Attributes["class"] = "HeaderTabBGOn";
                        helpSection.Text = Server.UrlEncode(((DataRowView)e.Item.DataItem)["TabName"].ToString());
                    }
                    else if (((DataRowView)e.Item.DataItem)["IsActiveTab"].ToString().Equals("previous"))
                    {
                        TabLeftTD.Attributes["class"] = "HeaderTabInBetweenLeftOn";
                    }
                }



            }
        }

        protected bool canViewSummary = false;
        protected bool patientInSession = false;

        /// <summary>
        /// Sets the visibility of header labels and summary link
        /// </summary>
        /// <param name="patientIdInSession"></param>
        private void SetViewSummaryLink(object patientIdInSession)
        {
            patientInSession = patientIdInSession != null && !string.IsNullOrEmpty(patientIdInSession.ToString());
            object groupViewCode = Session[SessionKey.GroupViewCode];
            if (groupViewCode != null)
            {
                string[] codes = groupViewCode.ToString().Split(',');
                if (codes.Contains("PATIENT DATA", StringComparer.CurrentCultureIgnoreCase) || codes.Contains("EFORMS", StringComparer.CurrentCultureIgnoreCase))
                {
                    canViewSummary = true;
                }
            }            

            // adjust name
            noPatientLabel.Style["display"] = patientInSession ? "none" : "";

            // adjust view summary link
            if (!canViewSummary || !patientInSession)
            {
                ViewPatientSummaryLink.Src = "~/Images/headerIcon_PatientReport_noPatient.png";
                ViewPatientSummaryLink.Attributes["class"] = "HeaderPatientSummaryButtonOff";
            }
        }


        protected void MoreTabsRptItemDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            System.Web.UI.HtmlControls.HtmlTableCell MoreTabsMenuRow;
            MoreTabsMenuRow = (HtmlTableCell)e.Item.FindControl("MoreTabsMenuRow");


            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                if (((DataRowView)e.Item.DataItem)["RequiresPatient"] != null && ((DataRowView)e.Item.DataItem)["RequiresPatient"].ToString().ToUpper().Equals("TRUE"))
                {
                    if (Session[SessionKey.PatientId] != null && Session[SessionKey.PatientId].ToString().Length > 0)
                    {
                        MoreTabsMenuRow.Attributes["onclick"] = "location='.." + ((DataRowView)e.Item.DataItem)["Path"].ToString() + "';";
                    }
                    else
                    {
                        MoreTabsMenuRow.Attributes["onclick"] = "noPatientInSessionRedirect();";
                    }

                }
                else
                {
                    MoreTabsMenuRow.Attributes["onclick"] = "location='.." + ((DataRowView)e.Item.DataItem)["Path"].ToString() + "';";
                }

                /*
                                if ((((DataRowView)e.Item.DataItem)["IsActiveTab"] != null))
                                {
                                    if (((DataRowView)e.Item.DataItem)["IsActiveTab"].ToString().Equals("true"))
                                    {
                                        TabLeftTD.Attributes["class"] = "HeaderTabInBetweenRightOn";
                                        TabCenterTD.Attributes["class"] = "HeaderTabBGOn";
                                        helpSection.Text = Server.UrlEncode(((DataRowView)e.Item.DataItem)["TabName"].ToString());
                                    }
                                    else if (((DataRowView)e.Item.DataItem)["IsActiveTab"].ToString().Equals("previous"))
                                    {
                                        TabLeftTD.Attributes["class"] = "HeaderTabInBetweenLeftOn";
                                    }
                                }

                */

            }
        }

        /// <summary>
        /// Adjusts visibility of the contact admin link
        /// </summary>
        private void SetEmailLink()
        {
            string adminEmail = CaisisConfiguration.GetWebConfigValue("adminEmail");
            if (!string.IsNullOrEmpty(adminEmail))
            {
                ContactAdminLink.Visible = true;
            }
            else
            {
                ContactAdminLink.Visible = false;
            }
        }





    }
}
