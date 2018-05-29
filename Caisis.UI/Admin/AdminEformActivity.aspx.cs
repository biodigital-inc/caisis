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
using System.Linq;

using Caisis.DataAccess;
using Caisis.BOL;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.Controller;

namespace Caisis.UI.Admin
{
    public partial class AdminEformActivity : AdminBasePage
    {

        private List<int> dirtyRows = new List<int>();

        protected string QueryColumn
        {
            get
            {
                return Request.QueryString["column"];
            }
        }

        protected string QuerySort
        {
            get
            {
                return Request.QueryString["sort"];
            }
        }

        protected string QueryDate
        {
            get
            {
                return Request.QueryString["searchDate"];
            }
        }

        protected string QueryIdType
        {
            get
            {
                return Request.QueryString["idType"];
            }
        }
        //protected string EFormNameSearchType
        //{
        //    get
        //    {
        //        return Request.QueryString["EFormNameSearchType"];
        //    }
        //}
        protected string EFormName
        {
            get
            {
                return Request.QueryString["EFormName"];
            }
        }
        //protected string EFormStatusSearchType
        //{
        //    get
        //    {
        //        return Request.QueryString["EFormStatusSearchType"];
        //    }
        //}
        protected string EFormStatus
        {
            get
            {
                return Request.QueryString["EFormStatus"];
            }
        }

        protected string EnteredStartDate
        {
            get
            {
                return Request.QueryString["EnteredStartDate"];
            }
        }
        protected string EnteredEndDate
        {
            get
            {
                return Request.QueryString["EnteredEndDate"];
            }
        }
        protected string EnteredBy
        {
            get
            {
                return Request.QueryString["EnteredBy"];
            }
        }

        protected string UpdatedStartDate
        {
            get
            {
                return Request.QueryString["UpdatedStartDate"];
            }
        }
        protected string UpdatedEndDate
        {
            get
            {
                return Request.QueryString["UpdatedEndDate"];
            }
        }
        protected string UpdatedBy
        {
            get
            {
                return Request.QueryString["UpdatedBy"];
            }
        }

        protected string ClinicStartDate
        {
            get
            {
                return Request.QueryString["ClinicStartDate"];
            }
        }
        protected string ClinicEndDate
        {
            get
            {
                return Request.QueryString["ClinicEndDate"];
            }
        }
        protected string ClinicPhysician
        {
            get
            {
                return Request.QueryString["ClinicPhysician"];
            }
        }

        private PatientController pc;
        private UserController uc;
        private bool canViewIdentifiers;

        private static IEnumerable<string> EFormStatuses = EformStatusManager.GetEformStatuses();


        protected override void Page_Load(object sender, EventArgs e)
        {
            // init
            pc = new PatientController();
            uc = new UserController();
            canViewIdentifiers = uc.CanViewPatientIdentifiers();

            if (!Page.IsPostBack)
            {
                // data bind search options
                DataTable dt = uc.GetSearchIdentifiers();
                IdTypeSelection.DataSource = dt;
                IdTypeSelection.DataBind();
                // set selection
                if (!string.IsNullOrEmpty(QueryIdType))
                {
                    IdTypeSelection.Value = QueryIdType;
                }

                // build results
                string queryColumn = !string.IsNullOrEmpty(QueryColumn) ? QueryColumn : BOL.EForm.EFormId;
                SortDirection querySort = !string.IsNullOrEmpty(QuerySort) && QuerySort == "desc" ? SortDirection.Descending : SortDirection.Ascending;

                BuildEformStatusList(queryColumn, querySort);
            }
            BuildNavigationLinks();
            //SetEformSearchFields();


        }


        private void BuildNavigationLinks()
        {
            var links = PageUtil.GetControls<HtmlAnchor>(EFormActivityHeader);
            foreach (var link in links)
            {
                string column = link.Title;
                string sort = "asc";
                if (!string.IsNullOrEmpty(QueryColumn) && QueryColumn == column)
                {
                    if (!string.IsNullOrEmpty(QuerySort) && QuerySort == "asc")
                    {
                        sort = "desc";
                    }
                }
                link.HRef = "AdminEformActivity.aspx?searchDate=" + DateChooser.Text + "&column=" + column + "&sort=" + sort;
            }
        }

        protected void SetEformFields(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemIndex > -1)
            {
                int patientId = (int)DataBinder.Eval(e.Item.DataItem, Patient.PatientId);
                string mrn = DataBinder.Eval(e.Item.DataItem, Patient.PtMRN).ToString();
                string name = DataBinder.Eval(e.Item.DataItem, "Name").ToString().Replace(",", ", ");
                string currentStatus = DataBinder.Eval(e.Item.DataItem, "CurrentStatus").ToString();
                string currentEFormApptPhysician = DataBinder.Eval(e.Item.DataItem, "EFormApptPhysician").ToString();

                CaisisSelect statusList = e.Item.FindControl("StatusField") as CaisisSelect;
                CaisisSelect EFormApptPhysicianField = e.Item.FindControl("EFormApptPhysicianField") as CaisisSelect;
                
                Label mrnLabel = e.Item.FindControl("PtMRN") as Label;
                Label ptLabel = e.Item.FindControl("PtLabel") as Label;

                statusList.DataSource = EFormStatuses; // EformStatusManager.GetEformStatuses();
                statusList.DataBind();

                statusList.Value = currentStatus;


                //AppointmentDa aptDa = new AppointmentDa();
                //EFormApptPhysicianField.DataSource = aptDa.GetDistinctAppointmentPhysicians().Tables[0].DefaultView;
                //EFormApptPhysicianField.DataTextField = "ApptPhysician";
                //EFormApptPhysicianField.DataValueField = "ApptPhysician";

                //EFormApptPhysicianField.DataBind();
                EFormApptPhysicianField.Value = currentEFormApptPhysician;

                if (DataBinder.Eval(e.Item.DataItem, "EFormApptTime").ToString().Length > 0)
                {
                    CaisisTextBox EFormApptTimeField = e.Item.FindControl("EFormApptTimeField") as CaisisTextBox;
                    EFormApptTimeField.Value = ((DateTime)(DataBinder.Eval(e.Item.DataItem, "EFormApptTime"))).ToShortDateString();
                }


                // set identified fields
                mrnLabel.Text = pc.GetPatientMRN(mrn);
                ptLabel.Text = canViewIdentifiers ? name : pc.GetPatientName(" ", " ", true);

                // set identifier
                string selectedIdType = IdTypeSelection.Value + "";
                bool displayIdentifier = selectedIdType != PatientController.LAST_NAME_MRN_IDENTIFIER;
                Label idTypeLabel = e.Item.FindControl("IdType") as Label;
                Label idValueLabel = e.Item.FindControl("IdTypeValue") as Label;

                if (displayIdentifier)
                {
                    idTypeLabel.Text = selectedIdType + ":";
                    idValueLabel.Text = pc.GetPatientIdentifier(patientId, selectedIdType);
                    idTypeLabel.Visible = true;
                    idValueLabel.Visible = true;
                }
                else
                {
                    idTypeLabel.Visible = false;
                    idValueLabel.Visible = false;
                }
            }
        }

        protected void SetRecordChanged(ICaisisInputControl sender, EventArgs e)
        {
            Control input = sender as Control;
            if (input != null && input.NamingContainer is RepeaterItem)
            {
                int index = (input.NamingContainer as RepeaterItem).ItemIndex;
                if (!dirtyRows.Contains(index))
                {
                    dirtyRows.Add(index);
                }
            }
        }

        private void BuildEformStatusList(string sortColumn, SortDirection direction)
        {
            // defaults
            sortColumn = !string.IsNullOrEmpty(sortColumn) ? sortColumn : BOL.EForm.EFormId;

            //DateTime enteredStartDate = DateTime.Today;

            //if (!string.IsNullOrEmpty(EnteredStartDate))
            //{
            //    if (!DateTime.TryParse(EnteredStartDate, out enteredStartDate))
            //    {
            //        enteredStartDate = DateTime.Today;
            //    }
            //}
            //string searchDateText = enteredStartDate.ToShortDateString();
            //// Set calendar box to match searchDate
            //DateChooser.Value = searchDateText;
            //_EnteredStartDate.Value = searchDateText;


            DateTime? enteredDateStart = null;
            if (!string.IsNullOrEmpty(EnteredStartDate))
            {
                DateTime _enteredDateStart = new DateTime();
                if (DateTime.TryParse(EnteredStartDate, out _enteredDateStart)) enteredDateStart = _enteredDateStart;
                _EnteredStartDate.Value = _enteredDateStart.ToShortDateString();
            }
            DateTime? enteredDateEnd = null;
            if (!string.IsNullOrEmpty(EnteredEndDate))
            {
                DateTime _enteredDateEnd = new DateTime();
                if (DateTime.TryParse(EnteredEndDate, out _enteredDateEnd)) enteredDateEnd = _enteredDateEnd.AddDays(1);
                _EnteredEndDate.Value = _enteredDateEnd.ToShortDateString();
            }
            DateTime? updatedDateStart = null;
            if (!string.IsNullOrEmpty(UpdatedStartDate))
            {
                DateTime _updatedDateStart = new DateTime();
                if (DateTime.TryParse(UpdatedStartDate, out _updatedDateStart)) updatedDateStart = _updatedDateStart;
                _UpdatedStartDate.Value = _updatedDateStart.ToShortDateString();
            }
            DateTime? updatedDateEnd = null;
            if (!string.IsNullOrEmpty(UpdatedEndDate))
            {
                DateTime _updatedDateEnd = new DateTime();
                if (DateTime.TryParse(UpdatedEndDate, out _updatedDateEnd)) updatedDateEnd = _updatedDateEnd.AddDays(1);
                _UpdatedEndDate.Value = _updatedDateEnd.ToShortDateString();
            }

            DateTime? clinicDateStart = null;
            if (!string.IsNullOrEmpty(ClinicStartDate))
            {
                DateTime _clinicDateStart = new DateTime();
                if (DateTime.TryParse(ClinicStartDate, out _clinicDateStart)) clinicDateStart = _clinicDateStart;
                _ClinicStartDate.Value = _clinicDateStart.ToShortDateString();
            }
            DateTime? clinicDateEnd = null;
            if (!string.IsNullOrEmpty(ClinicEndDate))
            {
                DateTime _clinicDateEnd = new DateTime();
                if (DateTime.TryParse(ClinicEndDate, out _clinicDateEnd)) clinicDateEnd = _clinicDateEnd.AddDays(1);
                _ClinicEndDate.Value = _clinicDateEnd.ToShortDateString();
            }

            string enteredBy = (!string.IsNullOrEmpty(EnteredBy)) ? EnteredBy : "";
            string updatedBy = (!string.IsNullOrEmpty(UpdatedBy)) ? UpdatedBy : "";
            string eFormName = (!string.IsNullOrEmpty(EFormName)) ? EFormName : "";
            string eFormStatus = (!string.IsNullOrEmpty(EFormStatus)) ? EFormStatus : "";
            string clinicPhysician = (!string.IsNullOrEmpty(ClinicPhysician)) ? ClinicPhysician : "";

            _ClinicPhysician.Value = clinicPhysician;
            _EnteredBy.Value = enteredBy;
            _UpdatedBy.Value = updatedBy;
            _EFormStatus.Value = eFormStatus;
//            _EFormName.Value = eFormName;
            
            //           Request.Form[_EFormName.ClientID] = eFormName;

            // Bind to datesource
            EFormsDa da = new EFormsDa();
            DataTable dt = da.GetEforms(enteredDateStart, enteredDateEnd, enteredBy, updatedDateStart, updatedDateEnd, updatedBy, eFormName, eFormStatus, clinicDateStart, clinicDateEnd, clinicPhysician);



            dirtyRows.Clear();

            string message = "No EForms match the search criteria";

            // Set search message
            int records = dt.Rows.Count;
            int maxRecords = 300;
            if (records > maxRecords)
            {
                message = records + " EForms match the search criteria. The first " + maxRecords + " records are displayed here.";

                DataTable subsetDt = dt.Rows.Cast<System.Data.DataRow>().Take(maxRecords).CopyToDataTable();

                DataView view = subsetDt.DefaultView;
                view.Sort = sortColumn + " " + (direction == SortDirection.Ascending ? "ASC" : "DESC");
                EFormActivityRptr.DataSource = view;
                EFormActivityRptr.DataBind();
                SearchResultsContainer.Visible = true;
            }
            else if (records < 1)
            {
                // set data entry visibility
                SearchResultsContainer.Visible = false;
            }
            else
            {
                DataView view = dt.DefaultView;
                view.Sort = sortColumn + " " + (direction == SortDirection.Ascending ? "ASC" : "DESC");

                message = records + " EForms match the search criteria";
                EFormActivityRptr.DataSource = view;
                EFormActivityRptr.DataBind();
                SearchResultsContainer.Visible = true;
            }
            // set message
            SearchMessage.InnerText = message;

        }

        /// <summary>
        /// Transfer back to this page with query
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RunSearch(object sender, EventArgs e)
        {
            string url = "AdminEformActivity.aspx";
            string searchDate = DateChooser.Value;
            string idType = IdTypeSelection.Value;

//            string eFormNameSearchType = _EFormNameSearchType.Value;
            string eFormName = Request.Form[_EFormName.ClientID];
//            string eFormStatusSearchType = _EFormStatusSearchType.Value;
            string eFormStatus = _EFormStatus.Value;
            string enteredStartDate = _EnteredStartDate.Value;
            string enteredEndDate = _EnteredEndDate.Value;
            string enteredBy = _EnteredBy.Value;
            string updatedStartDate = _UpdatedStartDate.Value;
            string updatedEndDate = _UpdatedEndDate.Value;
            string updatedBy = _UpdatedBy.Value;
            string clinicStartDate = _ClinicStartDate.Value;
            string clinicEndDate = _ClinicEndDate.Value;
            string clinicPhysician = _ClinicPhysician.Value;

            //string[] urlVars;
            List<string> urlVars = new List<string>();

            if (!string.IsNullOrEmpty(searchDate)) urlVars.Add("searchDate=" + searchDate);
            if (!string.IsNullOrEmpty(idType)) urlVars.Add("idType=" + idType);

 //           if (!string.IsNullOrEmpty(eFormNameSearchType)) urlVars.Add("EFormNameSearchType=" + eFormNameSearchType);
            if (!string.IsNullOrEmpty(eFormName)) urlVars.Add("EFormName=" + eFormName);
//            if (!string.IsNullOrEmpty(eFormStatusSearchType)) urlVars.Add("EFormStatusSearchType=" + eFormStatusSearchType);
            if (!string.IsNullOrEmpty(eFormStatus)) urlVars.Add("EFormStatus=" + eFormStatus);
            if (!string.IsNullOrEmpty(enteredStartDate)) urlVars.Add("EnteredStartDate=" + enteredStartDate);
            if (!string.IsNullOrEmpty(enteredEndDate)) urlVars.Add("EnteredEndDate=" + enteredEndDate);
            if (!string.IsNullOrEmpty(enteredBy)) urlVars.Add("EnteredBy=" + enteredBy);
            if (!string.IsNullOrEmpty(updatedStartDate)) urlVars.Add("UpdatedStartDate=" + updatedStartDate);
            if (!string.IsNullOrEmpty(updatedEndDate)) urlVars.Add("UpdatedEndDate=" + updatedEndDate);
            if (!string.IsNullOrEmpty(updatedBy)) urlVars.Add("UpdatedBy=" + updatedBy);
            if (!string.IsNullOrEmpty(clinicStartDate)) urlVars.Add("ClinicStartDate=" + clinicStartDate);
            if (!string.IsNullOrEmpty(clinicEndDate)) urlVars.Add("ClinicEndDate=" + clinicEndDate);
            if (!string.IsNullOrEmpty(clinicPhysician)) urlVars.Add("ClinicPhysician=" + clinicPhysician);

            if (urlVars.Count > 0)
            {
                url += "?" + String.Join("&", urlVars.ToArray()); 
            }


            //if (!string.IsNullOrEmpty(searchDate))
            //{
            //    url += "?searchDate=" + searchDate + "&idType=" + idType;
            //}




            Response.Redirect(url);
        }

        protected void DeleteEform(object sender, CommandEventArgs e)
        {
            // delete eform
            int eformId = int.Parse(e.CommandArgument.ToString());
            BOL.EForm eForm = new EForm();
            eForm.Delete(eformId);

            // rebind eform list
            BuildEformStatusList(BOL.EForm.EFormId, SortDirection.Ascending);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateEformStatuses(object sender, EventArgs e)
        {
            // manually update eform statuses
            foreach (int dirtyRowIndex in dirtyRows)
            {
                Control row = EFormActivityRptr.Items[dirtyRowIndex];
                // get status text
                ICaisisInputControl eformIdField = row.FindControl("EFormId") as ICaisisInputControl;
                ICaisisInputControl statusField = row.FindControl("StatusField") as ICaisisInputControl;
                ICaisisInputControl EFormApptPhysicianField = row.FindControl("EFormApptPhysicianField") as ICaisisInputControl;
                ICaisisInputControl EFormApptTimeField = row.FindControl("EFormApptTimeField") as ICaisisInputControl;


                

                // load record and update status field
                int eformId = int.Parse(eformIdField.Value);
                BOL.EForm biz = new EForm();
                biz.Get(eformId);
                biz[BOL.EForm.CurrentStatus] = statusField.Value;
                biz[BOL.EForm.EformApptPhysician] = EFormApptPhysicianField.Value;
                biz[BOL.EForm.EformApptTime] = EFormApptTimeField.Value;
                biz.Save();
            }
            // rebind list to show updated statuses
            BuildEformStatusList(BOL.EForm.EFormId, SortDirection.Ascending);
        }

        protected void SetEformSearchFields()
        {

            //AppointmentDa aptDa = new AppointmentDa();
            //AllEFormApptPhysicianField.DataSource = aptDa.GetDistinctAppointmentPhysicians().Tables[0].DefaultView;
            //AllEFormApptPhysicianField.DataTextField = "ApptPhysician";
            //AllEFormApptPhysicianField.DataTextField = "ApptPhysician";



            //AllEFormApptPhysicianField.DataBind();

        }
    }
}
