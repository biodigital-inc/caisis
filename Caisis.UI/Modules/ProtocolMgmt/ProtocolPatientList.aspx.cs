using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Caisis.BOL;
using Caisis.DataAccess;
using System.Collections.Specialized;
using Caisis.UI.Core.Classes;

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class ProtocolPatientList : ProtocolMgmtBasePage, ICallbackEventHandler
    {
        // List of columns which are searched upon in patient list
        private static readonly string[] searchColumnsPatient = new string[] { Patient.PtLastName + " + ',' + " + Patient.PtFirstName };

        private static readonly string[] bindColumnsPatient = new string[] { "Name" };

        private string callbackSearchType;
        private string callbackSearchValue;
        private string callbackType;
        private string callbackSortCol;
        protected int recordCount;

        /// <summary>
        /// Return a list of treatment arms passed in query string. NULL if empty
        /// </summary>
        protected IEnumerable<int> QueryTreatmentArms
        {
            get
            {
                string queryArms = Request.QueryString["TreatmentArms"];
                if (!string.IsNullOrEmpty(queryArms))
                {
                    IEnumerable<int> schemaList = from schemaId in queryArms.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries)
                                                  select int.Parse(schemaId);
                    return schemaList;
                }
                return null;
            }
        }

        /// <summary>
        /// Return a list of statuses passed in query string. NULL if empty
        /// </summary>
        protected IEnumerable<string> QueryStatuses
        {
            get
            {
                string queryStatuses = Request.QueryString["statuses"];
                if (!string.IsNullOrEmpty(queryStatuses))
                {
                    return queryStatuses.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                }
                return null;
            }
        }

        /// <summary>
        /// controls if pt identifiers are rendered
        /// </summary>
        private bool canViewIdentifiers = false;

        protected bool CanViewIdentifiers
        {
            get
            {
                return canViewIdentifiers;
            }
        }

        protected bool IncludeDeceasedPatients
        {
            get
            {
                string includeDeceased = Request.QueryString["includeDeceased"];
                return string.IsNullOrEmpty(includeDeceased) || PageUtil.IsTrueString(includeDeceased);
            }
        }

        public ProtocolPatientList()
            : base()
        {
            // set view identifiers bool
            canViewIdentifiers = base.ShowPatientIdentifiers();
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            if (!Page.IsPostBack)
            {
                // build patient list: sort by Study Id
                string defaultSortExpression = HiddenSortColumn.Value + " " + HiddenSortOrder.Value;
                DataView patientsList = LoadPatients(defaultSortExpression);
                // Bind projects to user's view
                BindPatientList(patientsList);
            }

            RegisterPatientSearchScript();
        }

        private String GetSortString(String SortColumn)
        {
            return HiddenSortColumn.Value + " " + HiddenSortOrder.Value;
        }

        protected string GetPatientIdentifiersVisibility()
        {
            return (canViewIdentifiers == true ? "" : "display: none");
        }

        private DataView LoadPatients(String SortString)
        {
            string dataset = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            DataView patientsList;
            int protocolId = int.Parse(BaseProtocolId);
            bool showIdentifiers = base.ShowPatientIdentifiers();

            // call main method for filtering values
            patientsList = ProtocolMgmtDa.GetPatientsByProtocol(protocolId, dataset, QueryTreatmentArms, QueryStatuses, showIdentifiers, IncludeDeceasedPatients).DefaultView;

            // special case for StudyId: strip last x ids from end to sort
            if (SortString.StartsWith(PatientProtocol.PtProtocolStudyId) && patientsList.Count > 0)
            {
                string sort = SortString.EndsWith("DESC", StringComparison.OrdinalIgnoreCase) ? "DESC" : "ASC";
                patientsList = PatientProtocolController.SortPatientsByStudyId(patientsList.Table, sort);                 
            }
            else
            {
                // Force default sort to earliest records first
                patientsList.Sort = SortString;
            }

            return patientsList;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// <param name="searchColumns"></param>
        private void LoopSearchColumns(object sender, RepeaterItemEventArgs e, string[] searchColumns)
        {
            foreach (string colName in searchColumns)
            {
                Label labelField = e.Item.FindControl(colName + "Field") as Label;
                Label first = e.Item.FindControl(colName + "Pre") as Label;
                Label match = e.Item.FindControl(colName + "Match") as Label;
                Label pos = e.Item.FindControl(colName + "Post") as Label;
                string colValue = DataBinder.Eval(e.Item.DataItem, colName).ToString();

                int textFoundIndex = System.Globalization.CultureInfo.CurrentCulture.CompareInfo.IndexOf(colValue, callbackSearchValue, System.Globalization.CompareOptions.IgnoreCase);
                if (textFoundIndex > -1)
                {
                    int textFoundEndIndex = textFoundIndex + callbackSearchValue.Length;
                    first.Text = colValue.Substring(0, textFoundIndex);
                    match.Text = colValue.Substring(textFoundIndex, callbackSearchValue.Length);
                    pos.Text = colValue.Substring(textFoundEndIndex, colValue.Length - textFoundEndIndex);

                    // Hide standard label
                    labelField.Visible = false;
                }
                else
                {
                    // Hide highlighted text labels
                    first.Visible = false;
                    match.Visible = false;
                    pos.Visible = false;
                }
            }
        }

        /// <summary>
        /// Hilight found text in search columns
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HilightFoundText(object sender, RepeaterItemEventArgs e)
        {
            // If invoked from callback, value is set
            if (!string.IsNullOrEmpty(callbackSearchValue))
            {
                // if cannot view identifiers, no need to hilight text
                if (canViewIdentifiers)
                {
                    // Search through each search columns and highlight if text found
                    LoopSearchColumns(sender, e, bindColumnsPatient);
                }
            }

            string strPtId = DataBinder.Eval(e.Item.DataItem, "PatientProtocolId").ToString();


            //allPatientStatuses.RowFilter = PatientProtocol.PatientProtocolId + " = " + strPtId;

            //if (allPatientStatuses.Count > 0)

            // format next visit
            Label nextVisit = e.Item.FindControl("NextVisitLabel") as Label;
            string nextVisitDate = DataBinder.Eval(e.Item.DataItem, "NextVisit", "{0:d}").ToString();
            string nextVisitLabel = DataBinder.Eval(e.Item.DataItem, "VisitLabel").ToString();
            if (!string.IsNullOrEmpty(nextVisitDate))
            {
                if (!string.IsNullOrEmpty(nextVisitLabel))
                {
                    nextVisit.Text = string.Format("{0} - {1}", nextVisitDate, nextVisitLabel);
                }
                else
                {
                    nextVisit.Text = string.Format("{0}", nextVisitDate);
                }
            }
            else if (!string.IsNullOrEmpty(nextVisitLabel))
            {
                nextVisit.Text = string.Format("{0}", nextVisitLabel);
            }

            // handle latest status/death date
            if (e.Item.DataItem != null)
            {
                HtmlGenericControl statusLabel = e.Item.FindControl("StatusLabel") as HtmlGenericControl;
                string latestStatus = DataBinder.Eval(e.Item.DataItem, PatientProtocolStatus.PtProtocolStatus).ToString();
                string ptDeathDate = DataBinder.Eval(e.Item.DataItem, Patient.PtDeathDate, "{0:d}");
                string ptDeathDateText = DataBinder.Eval(e.Item.DataItem, Patient.PtDeathDateText, "{0}");
                string deathDateText = !string.IsNullOrEmpty(ptDeathDate) ? ptDeathDate : (!string.IsNullOrEmpty(ptDeathDateText) ? ptDeathDateText : "");
                // display latest status, optional if patient is deceased
                string statusFormat = !string.IsNullOrEmpty(deathDateText) ? "{0} <br /> ({1})" : "{0}";
                statusLabel.InnerHtml = string.Format(statusFormat, latestStatus, "Deceased");
            }
        }

        /// <summary>
        /// Binds the list of Patients List based on User's Permission
        /// </summary>
        /// <param name="dv"></param>
        private void BindPatientList(DataView dv)
        {
            PatientListRptr.DataSource = dv;
            PatientListRptr.DataBind();

            recordCount = dv.Count;
        }

        /// <summary>
        /// Sets content visibility based on ShowIdentifiers permission
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetPatientIdentifiersVisibility(object sender, EventArgs e)
        {
            if (sender is Control)
            {
                Control ptControl = sender as Control;
                ptControl.Visible = canViewIdentifiers;
            }
        }

        #region SEARCH CALLBACK METHODS

        /// <summary>
        /// Registers the callback script for calling server for search
        /// </summary>
        private void RegisterPatientSearchScript()
        {
            // Register startup
            ClientScriptManager cm = Page.ClientScript;
            String cbReference = cm.GetCallbackEventReference(this, "arg",
                "handleSearchReturn", "");
            String callbackScript = "function _doSearch(arg, context) {" +
                cbReference + "; }";
            cm.RegisterClientScriptBlock(this.GetType(),
                "doSearch", callbackScript, true);
        }

        /// <summary>
        /// Gets called with argument from client
        /// </summary>
        /// <param name="eventArgument"></param>
        public void RaiseCallbackEvent(String eventArgument)
        {
            //Arguments from client are pased as key/value pairs, url encoded
            NameValueCollection clientArgs = HttpUtility.ParseQueryString(eventArgument);
            callbackSearchType = clientArgs["SearchType"];
            callbackSearchValue = clientArgs["SearchValue"];
            callbackType = clientArgs["CallbackType"];
            callbackSortCol = clientArgs["CallbackSortCol"];
        }

        /// <summary>
        /// Returns the rendered contexts of the filtered list
        /// </summary>
        /// <returns></returns>
        public string GetCallbackResult()
        {
            // Determine if need to filter by user id
            DataView patientsList = new DataView();

            CallBackVars callbackVars;
            callbackVars.SortString = callbackSortCol;
            callbackVars.Type = callbackType;
            callbackVars.Value = callbackSearchValue;

            // get list of patients sorted by column direction
            patientsList = LoadPatients(callbackSortCol);

            BindPatientList(patientsList);

            // Returns the rendered context of the ContentTable
            System.IO.StringWriter stream = new System.IO.StringWriter();
            HtmlTextWriter writer = new HtmlTextWriter(stream);
            ContentTableHolder.RenderControl(writer);
            writer.Flush();
            string rawHTML = stream.ToString();

            return rawHTML;
        }
        #endregion
    }
}