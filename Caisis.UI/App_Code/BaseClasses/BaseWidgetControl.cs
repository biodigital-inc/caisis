using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Data;
using System.Xml;
using System.IO;

using Caisis.Controller;
using Caisis.Extensions;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities.Widget
{
    public enum WidgetState
    {
        Opened,
        Collapsed,
        Hidden
    }

    /// <summary>
    /// BaseClass for all widgets
    /// </summary>
    public class BaseWidgetControl : UserControl
    {
        public static readonly string DATETIME_FORMAT_DEFAULT = "{0:d}";
        public static readonly string DATETIME_FORMAT_TODAY = "Today {0:t}"; 

        private string title = "";
        private string description = "";
        private string helpText = "";
        private string[] modules = new string[0];
        private WidgetState state = WidgetState.Opened;

        private PatientController pc = new PatientController();

        public BaseWidgetControl()
            : base()
        {
        }

        public BaseWidgetControl(string title, string description, string helpText, string moduleName)
            : base()
        {
            this.title = title;
            this.description = description;
            this.helpText = helpText;
            this.modules = new string[] { moduleName };
        }

        /// <summary>
        /// 
        /// </summary>
        public string Name
        {
            get
            {
                return GetType().BaseType.Name;
            }
        }

        /// <summary>
        /// Gets or sets the title of the widget
        /// </summary>
        public virtual string Title
        {
            get
            {
                return title;
            }
            set
            {
                title = value;
            }
        }

        /// <summary>
        /// Gets or sets the description of the widget
        /// </summary>
        public virtual string Description
        {
            get
            {
                return description;
            }
            set
            {
                description = value;
            }
        }

        /// <summary>
        /// Gets or sets the help text of the widget
        /// </summary>
        public virtual string HelpText
        {
            get
            {
                return helpText;
            }
            set
            {
                helpText = value;
            }
        }

        /// <summary>
        /// Gets or sets the module
        /// </summary>
        public string[] Modules
        {
            get
            {
                return modules;
            }
            set
            {
                modules = value;
            }
        }

        /// <summary>
        /// Gets or sets the current Widget state
        /// </summary>
        public WidgetState State
        {
            get
            {
                return state;
            }
            set
            {
                state = value;
            }
        }        

        /// <summary>
        /// Sets the current state of the widget based on a string value
        /// </summary>
        /// <param name="widgetState"></param>
        public void SetWidgetState(string widgetState)
        {
            WidgetState? parsedState = WidgetManager.ParseWidgetState(widgetState);
            if (parsedState.HasValue)
            {
                state = parsedState.Value;
            }
        }

        public virtual string FormatDisplayDate(object date)
        {
            return FormatDisplayDate(date, DATETIME_FORMAT_DEFAULT, DATETIME_FORMAT_TODAY);
        }
         
        /// <summary>
        /// Formats the specified date object with a standard formatting if earlier than today, or today format for today date times.
        /// </summary>
        /// <param name="date"></param>
        /// <param name="standardFormat"></param>
        /// <param name="todayFormat"></param>
        /// <returns></returns>
        public virtual string FormatDisplayDate(object date, string standardFormat, string todayFormat)
        {
            string displayDate = string.Empty;
            if (date != null && date is DateTime)
            {
                DateTime today = DateTime.Today;
                DateTime dateObj = (DateTime)date;
                // if date is today, format with Today specific output
                if (dateObj.Year == today.Year && dateObj.Month == today.Month && dateObj.Day == today.Day)
                {
                    displayDate = string.Format(todayFormat, dateObj);
                }
                    // format with standard formatting
                else
                {
                    displayDate = string.Format(standardFormat, dateObj);
                }
            }
            return displayDate;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected virtual void SetIdentifiers(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HyperLink patientName = e.Row.FindControl("PatientName") as HyperLink;
                Label patientIdentifier = e.Row.FindControl("PatientIdentifier") as Label;
                string ptId = DataBinder.Eval(e.Row.DataItem, BOL.Patient.PatientId).ToString();
                string ptFirstName = DataBinder.Eval(e.Row.DataItem, BOL.Patient.PtFirstName).ToString();
                string ptLastName = DataBinder.Eval(e.Row.DataItem, BOL.Patient.PtLastName).ToString();
                string ptMRN = DataBinder.Eval(e.Row.DataItem, BOL.Patient.PtMRN).ToString();

                // set display name
                patientName.Text = pc.GetPatientLastName(ptLastName) + ", " + pc.GetPatientFirstName(ptFirstName);
                string epid = Caisis.Security.CustomCryptoHelper.Encrypt(ptId);
                patientName.Attributes["onclick"] = "if(top.navigateToPatient) { top.navigateToPatient('" + epid + "') } return false;";
                // set display identifier
                patientIdentifier.Text = pc.GetPatientMRN(ptMRN);
            }
        }

        protected virtual void SetRptIdentifiers(Object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label patientName = e.Item.FindControl("PatientName") as Label;
                Label patientIdentifier = e.Item.FindControl("PatientIdentifier") as Label;
                Literal encPID = e.Item.FindControl("encPID") as Literal;
                string ptId = DataBinder.Eval(e.Item.DataItem, BOL.Patient.PatientId).ToString();
                string ptFirstName = DataBinder.Eval(e.Item.DataItem, BOL.Patient.PtFirstName).ToString();
                string ptLastName = DataBinder.Eval(e.Item.DataItem, BOL.Patient.PtLastName).ToString();
                string ptMRN = DataBinder.Eval(e.Item.DataItem, BOL.Patient.PtMRN).ToString();

                // set display name
                patientName.Text = pc.GetPatientLastName(ptLastName) + ", " + pc.GetPatientFirstName(ptFirstName);
                string epid = Caisis.Security.CustomCryptoHelper.Encrypt(ptId);
                encPID.Text = epid;

                // set display identifier
                patientIdentifier.Text = pc.GetPatientMRN(ptMRN);
            }
        }
    }

    /// <summary>
    /// Provides access to User widgets based on User's permissions
    /// </summary>
    public class WidgetManager
    {
        /// <summary>
        /// Path to the main widget directory
        /// </summary>
        public static readonly string WIDGET_PATH = "~/Core/Utilities/Widgets/";

        /// <summary>
        /// Retrieves a dictionary of Widgets specific to current User.
        /// Lookup by widget name.
        /// </summary>
        /// <param name="page">The page object used to load widget controls</param>
        /// <returns></returns>
        public static IDictionary<string,BaseWidgetControl> GetWidgetsLookup(Page page)
        {
            var widgets = GetWidgets(page);
            // return a lookup where widget name is used to access widget
            return widgets.ToDictionary(k => k.Name, v => v);
        }

        /// <summary>
        /// Retrieves a list of Widgets specific to current User.
        /// </summary>
        /// <param name="page">The page object used to load widget controls</param>
        /// <returns>A list of Widgets specific to current users.</returns>
        public static IEnumerable<BaseWidgetControl> GetWidgets(Page page)
        {
            // retrieve all widgets
            var widgets = GetAllWidgets(page);
            // retrieve widget config
            var configs = CaisisConfiguration.GetWidgetConfigList();

            // a list of filtered (by permission, configuration) user widgets
            var filteredWidgets = new List<BaseWidgetControl>();

            // FILTER: filter widgets which have config nodes and are active
            foreach (var config in configs)
            {
                // only care about active widgets
                if (config.Active)
                {
                    // find widget which matches config
                    foreach (var widget in widgets)
                    {
                        if (widget.Name == config.Name)
                        {
                            // set widget properties via config
                            SetWidgetByConfig(widget, config);
                            // add to filtered list
                            filteredWidgets.Add(widget);
                        }
                    }
                }
            }

            // FILTER: filter nodes which are associated with tabs
            XmlDocument xmlDoc = XmlUtil.GetModulesConfigXml();

            string groupViewCode = page.Session[SessionKey.GroupViewCode].ToString();
            TabController ct = new TabController(groupViewCode);
            DataTable tabs = ct.CreateTabDataTable(xmlDoc);
            var tabNames = from row in tabs.AsEnumerable()
                           let tabName = row["TabName"].ToString()
                           select tabName;
            var filtered = from widget in filteredWidgets
                           where
                               // if not associated with a module
                            widget.Modules.Count() == 0
                            ||
                            // otherwise validate, user has access to at least one tab
                            (from module in widget.Modules
                             where tabNames.Contains(module, StringComparer.OrdinalIgnoreCase)
                             select module).Count() > 0
                           select widget;


            // return filters list
            return filtered;
        }

        /// <summary>
        /// Sets widget properties if config object exists for node
        /// </summary>
        /// <param name="widget"></param>
        public static void SetWidgetByConfig(BaseWidgetControl widget)
        {
            WidgetConfig config = WidgetConfig.GetByName(widget.Name);
            if (config != null)
            {
                SetWidgetByConfig(widget, config);
            }
        }

        /// <summary>
        /// Sets widget properties via config object
        /// </summary>
        /// <param name="widget"></param>
        /// <param name="config"></param>
        public static void SetWidgetByConfig(BaseWidgetControl widget, WidgetConfig config)
        {
            widget.Title = config.Title;
            widget.Description = config.Description;
            widget.HelpText = config.HelpText;
            widget.Modules = config.Modules.ToArray();
            // set default widget state (if applicable)
            if (!string.IsNullOrEmpty(config.DefaultState))
            {
                widget.SetWidgetState(config.DefaultState);
            }
        }

        /// <summary>
        /// Returns the WidgetState(or null) from specified state string.
        /// </summary>
        /// <param name="widgetState"></param>
        /// <returns></returns>
        public static WidgetState? ParseWidgetState(string widgetState)
        {
            object parsedState = Enum.Parse(typeof(WidgetState), widgetState, true);
            if (parsedState != null)
            {
                return (WidgetState)parsedState;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Returns all Widgets in the system.
        /// </summary>
        /// <param name="page">The page object used to load widget controls</param>
        /// <returns>A list of all Widgets</returns>
        private static IEnumerable<BaseWidgetControl> GetAllWidgets(Page page)
        {
            string fullWidgetPath = page.Server.MapPath(WIDGET_PATH);
            DirectoryInfo di = new DirectoryInfo(fullWidgetPath);
            var files = di.GetFiles("*.ascx");
            // for each file in directory, retrieve all widgets
            var widgets = from file in files
                          // get path to control
                          let controlPath = WIDGET_PATH + file.Name
                          // load control
                          let control = page.LoadControl(controlPath)
                          // only retrieve widget controls
                          where control is BaseWidgetControl
                          select control as BaseWidgetControl;
            return widgets;
        }
    }
}
