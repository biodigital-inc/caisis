using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Linq;

using Caisis.BOL;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.Security;
using Caisis.UI.Core.Utilities.Widget;

namespace Caisis.UI.Core.Utilities
{
    public partial class Dashboard : FramePage
    {
        UserController uc = new UserController();

        IDictionary<string, BaseWidgetControl> widgetLookup;

        /// <summary>
        /// Returns a lookup of User accessable widgets
        /// </summary>
        private IDictionary<string, BaseWidgetControl> WidgetLookup
        {
            get
            {
                if (widgetLookup == null)
                {
                    widgetLookup = WidgetManager.GetWidgetsLookup(Page);
                }
                return widgetLookup;
            }
        }

        protected override void OnInit(EventArgs e)
        {
            // process AJAX related calls
            string widgetName = Request.Form["widgetName"];
            string widgetState = Request.Form["widgetState"];
            if (!string.IsNullOrEmpty(widgetName) && !string.IsNullOrEmpty(widgetState))
            {
                // update user preference
                UpdateUserWidgetPreference(widgetName, widgetState);
                // no need to continue processing page
                Response.End();
            }
            else
            {
                base.OnInit(e);
                this.BuildWidgets();

            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!Page.IsPostBack)
            {

  //              this.SetDatasetsDropdown();
                this.SetDisplayUserName();
                this.BuildModulesWidget();
                this.SetAdminButton();


                // old stuff
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



            }

            this.EnableViewState = true;
        }

        /// <summary>
        /// Loads a widget into the repeater item by widget name
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddWidgetOnCreation(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HiddenField widgetName = e.Item.FindControl("WidgetName") as HiddenField;
                // widgets need to be dynamically loaded into placeholder on each post
                e.Item.Load += (a, b) =>
                   {
                       // widget name set during data-binding and post, load into container
                       if (!string.IsNullOrEmpty(widgetName.Value) && WidgetLookup.ContainsKey(widgetName.Value))
                       {
                           BaseWidgetControl widget = WidgetLookup[widgetName.Value];
                           PlaceHolder widgetContent = e.Item.FindControl("WidgetContent") as PlaceHolder;
                           // add widget to placeholder
                           widgetContent.Controls.Add(widget);
                       }
                   };
            }
        }

        /// <summary>
        /// Sets hidden fields,labels, etc... for each widget
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildWidget(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // get reference to widget object
                BaseWidgetControl widget = e.Item.DataItem as BaseWidgetControl;
                Label widgetTitle = e.Item.FindControl("WidgetTitle") as Label;
                Label widgetHelpText = e.Item.FindControl("WidgetHelpText") as Label;
                HiddenField widgetName = e.Item.FindControl("WidgetName") as HiddenField;
                HiddenField stateField = e.Item.FindControl("StateField") as HiddenField;

                // set hidden state tracker
                widgetName.Value = widget.Name;
                stateField.Value = widget.State.ToString();
                // set widget title and description
                widgetTitle.Text = widget.Title;
                widgetTitle.ToolTip = widget.Description;
                widgetHelpText.Text = widget.HelpText;
                
                // hide "hidden" widgets
                if (widget.State == WidgetState.Hidden)
                {
                    e.Item.Visible = false;
                }
            }
        }

        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="sender"></param>
        ///// <param name="e"></param>
        //protected void UpdateUserWidgets(object sender, EventArgs e)
        //{
        //    // for each widget update state
        //    for (int i = 0; i < UserWidgetsChooser.Items.Count; i++)
        //    {
        //        ListItem widgetItem = UserWidgetsChooser.Items[i];
        //        RepeaterItem widgetRptrItem = WidgetsRptr.Items[i];
        //        HiddenField stateField = widgetRptrItem.FindControl("StateField") as HiddenField;
        //        WidgetState? widgetState = WidgetManager.ParseWidgetState(stateField.Value);

        //        if (widgetItem.Selected)
        //        {
        //            // if no current state or hidden, open, otherwise retain opened/collapsed state
        //            if (!widgetState.HasValue || widgetState == WidgetState.Hidden)
        //            {
        //                widgetState = WidgetState.Opened;
        //            }
        //        }
        //        // unchecked items, will have state of hidden
        //        else
        //        {
        //            widgetState = WidgetState.Hidden;
        //        }
        //        UpdateUserWidgetPreference(widgetItem.Value, widgetState.Value);
        //    }
        //    // rebuild widgets to reflect changes
        //    //BuildWidgets();
        //    Response.Redirect("Dashboard.aspx");
        //}

        /// <summary>
        /// 
        /// </summary>
        private void BuildWidgets()
        {
            // get a list of widgets
            var widgets = WidgetLookup.Values;
            DataTable dt = uc.GetUserAttributesByType("Widget Preference");

            // normalize
            var lookup = from row in dt.AsEnumerable()
                         let attributeName = row[UserAttribute.UserAttributeName].ToString()
                         let state = row[UserAttribute.UserAttributeValue].ToString()
                         select new
                         {
                             StateName = attributeName,
                             StateValue = state
                         };
            foreach (var widget in widgets)
            {
                string stateName = widget.Name + " State";
                var widgetStates = lookup.Where(s => s.StateName == stateName).Select(s => s.StateValue);
                if (widgetStates.Count() > 0)
                {
                    string widgetState = widgetStates.First();
                    widget.SetWidgetState(widgetState);
                }
            }

            // build list of user widget
            //UserWidgetsChooser.DataSource = widgets;
            //UserWidgetsChooser.DataBind();

            UserWidgetsChooserRptr.DataSource = widgets;
            UserWidgetsChooserRptr.DataBind();

            //for (int i = 0; i < UserWidgetsChooser.Items.Count; i++)
            //{
            //    ListItem item = UserWidgetsChooser.Items[i];
            //    // those widgets which aren't hidden, will be checked
            //    item.Selected = widgets.ElementAt(i).State != WidgetState.Hidden;
            //}

            WidgetsRptr.DataSource = widgets;
            WidgetsRptr.DataBind();
        }

        /// <summary>
        /// Sets the user's display name on the page.
        /// </summary>
        private void SetDisplayUserName()
        {
            int userId = uc.GetUserId();
            BOL.User biz = new BOL.User();
            biz.Get(userId);
            string fName = biz[BOL.User.UserFirstName].ToString();
            string lName = biz[BOL.User.UserLastName].ToString();
        }

        /// <summary>
        /// Builds list of User datasets
        /// </summary>
        //private void SetDatasetsDropdown()
        //{
        //    // get a list of user's datasets
        //    UserController uc = new UserController();
        //    DataTable dataSetsTable = uc.GetUserDatasets().Tables[0];

        //    // build dropdown of available datasets
        //    DatasetsSelector.DataSource = dataSetsTable.DefaultView;
        //    DatasetsSelector.DataBind();

        //    // set active user dataset
        //    string activeDatasetId = Session[SessionKey.DatasetId].ToString();
        //    DataRow[] activeUserDataset = dataSetsTable.Select(Dataset.DatasetId + " = " + activeDatasetId);
        //    if (activeUserDataset.Count() > 0)
        //    {
        //        ActiveDataset.Text = activeUserDataset[0][Dataset.DatasetName].ToString();
        //    }
        //}

        ///// <summary>
        ///// Update the users dataset and associated permissions
        ///// </summary>
        ///// <param name="sender"></param>
        ///// <param name="e"></param>
        //protected void OnDatasetChange(object sender, CommandEventArgs e)
        //{
        //    // get the dataset of clicked item
        //    int datasetId = int.Parse(e.CommandArgument.ToString());
        //    //empty patient session in case dataset is being switched
        //    SessionHandler handler = new SessionHandler(Session);
        //    handler.EmptySession();


        //    int loginId = (int)Session[SessionKey.LoginId];
        //    string userName = new SecurityController().GetUserName();


        //    uc.SetPermissions("IN DEV", datasetId, loginId, userName);
        //    Session[SessionKey.DatasetId] = datasetId;
        //    Session[SessionKey.GroupViewCode] = uc.SetGroupViewCode(datasetId);

        //    Response.Redirect("Dashboard.aspx");
        //}


        private void BuildModulesWidget()
        {
            if (Session[SessionKey.GroupViewCode] != null)
            {
                XmlDocument xmlDoc = XmlUtil.GetModulesConfigXml();


                string currentSection = HttpContext.Current.Request.RawUrl;

                string groupViewCode = Session[SessionKey.GroupViewCode].ToString();
                TabController ct = new TabController(groupViewCode);
                DataTable HeaderDt = ct.CreateTabDataTable(xmlDoc);

                DashboardModulesList.DataSource = HeaderDt.DefaultView;
                DashboardModulesList.DataBind();
            }
        }

        protected void rptItemCreated(Object sender, RepeaterItemEventArgs e)
        {
            // Only valid for actual repeater items
            if (e.Item.DataItem != null && (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem))
            {
                HtmlContainerControl moduleButtonDiv = e.Item.FindControl("moduleButtonDiv") as HtmlContainerControl;

                string moduleName = DataBinder.Eval(e.Item.DataItem, "TabName").ToString();
                string path = DataBinder.Eval(e.Item.DataItem, "Path").ToString();
                string patientRequired = DataBinder.Eval(e.Item.DataItem, "RequiresPatient").ToString();


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
                    moduleButtonDiv.Attributes["onclick"] = path;


            }
        }

        protected void SetAdminButton()
        {
            if (PermissionManager.HasPermission(PermissionManager.EditSecurity))
            {
                adminButtonDiv.Visible = true;
                string adminPath = "window.location = '" + Page.ResolveUrl("~/Admin/Index.aspx") + "'";
                adminButtonDiv.Attributes.Add("onclick", adminPath);
            }
            else
            {
                adminButtonDiv.Visible = false;
            }
        }

        /// <summary>
        /// Updates the state of the user widget, i.e., collapsed, open, etc...
        /// </summary>
        /// <param name="widgetName"></param>
        /// <param name="widgetState"></param>
        private void UpdateUserWidgetPreference(string widgetName, string widgetState)
        {
            WidgetState? widgetStateEnum = WidgetManager.ParseWidgetState(widgetState);
            if (widgetStateEnum.HasValue)
            {
                UpdateUserWidgetPreference(widgetName, widgetStateEnum.Value);
            }
        }

        /// <summary>
        /// Updates the state of the user widget, i.e., collapsed, open, etc...
        /// </summary>
        /// <param name="widgetName"></param>
        /// <param name="widgetState"></param>
        private void UpdateUserWidgetPreference(string widgetName, WidgetState widgetState)
        {
            string stateName = widgetName + " State";
            uc.UpdateUserAttribute(stateName, widgetState.ToString(), "Widget Preference");

        }
    }
}
