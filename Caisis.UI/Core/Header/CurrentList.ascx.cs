using System;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


using Caisis.Security;
using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Header
{

    /// <summary>
    ///		Summary description for currentList.
    /// </summary>
    public partial class CurrentList : HeaderControl
    {
        //, RecentFindsMessage
        protected string patientRedirectPath;

        protected PatientController _pc = new PatientController();


        override protected void Page_Load(object sender, System.EventArgs e)
        {
            //			base.Page_Load(sender, e);

            if (Request.QueryString.Get("findClicked") != null)
            {
                LoadSearchList();
            }
            LoadRecentList();

            patientRedirectPath = this.GetPatientRedirectPath();

        }

        public void LoadSearchList()
        {
            DataTable dt = (DataTable)Session[SessionKey.RecentSearchList];
            if (dt == null)
            {
                dt = new DataTable();
                dt.Columns.Add(new DataColumn("ptMRN"));
                dt.Columns.Add(new DataColumn("ptLastName"));
                dt.Columns.Add(new DataColumn("ptFirstName"));
                dt.Columns.Add(new DataColumn("ptBirthDateText"));
                DataColumn dc = new DataColumn(SessionKey.PatientId);
                dt.Columns.Add(dc);
                dt.PrimaryKey = new DataColumn[1] { dc };
            }
            //add last patient to recent patient list
            if (dt.Rows.Find(Request.QueryString.Get("epid").ToString()) == null)
            {
                if (Session[SessionKey.PtMRN] != null && Session[SessionKey.PtLastName] != null && Session[SessionKey.PtFirstName] != null && Session[SessionKey.PatientId] != null)
                {
                    if (dt.Rows.Find(Session[SessionKey.PatientId]) == null)
                    {
                        DataRow dr = dt.NewRow();
                        dr["ptMRN"] = Session[SessionKey.PtMRN].ToString();
                        dr["ptLastName"] = Session[SessionKey.PtLastName].ToString();
                        dr["ptFirstName"] = Session[SessionKey.PtFirstName].ToString();
                        dr["ptBirthDateText"] = Session[SessionKey.PtDOB].ToString();
                        dr[SessionKey.PatientId] = Session[SessionKey.PatientId].ToString();
                        dt.Rows.Add(dr);
                        Session[SessionKey.RecentSearchList] = dt;
                    }
                }
            }
        }

        /// <summary>
        ///		This method is called by the PageHeader control to load new search results.
        /// </summary>
        public void LoadRecentList()
        {

            DataTable dt = null;
            if (Session[SessionKey.CurrentListCrit] != null && Session[SessionKey.CurrentListType] != null && Session[SessionKey.DatasetId] != null)
            {
                string listType = Session[SessionKey.CurrentListType].ToString();
                string listCrit = Session[SessionKey.CurrentListCrit].ToString();
                string listCritName = "";
                string listMod = "";
                string listUser = "";

                if (Session[SessionKey.CurrentListCritName] != null)
                {
                    listCritName = Session[SessionKey.CurrentListCritName].ToString();
                    string test = Session[SessionKey.CurrentClinicDate].ToString();

                    if (listType.ToUpper().Equals("CATEGORY"))
                    {
                        listMod = listCritName;

                        // if category is not public, the list is user-specific
                        if (listMod.ToUpper() != "PUBLIC")
                        {
                            SecurityController ct = new SecurityController();
                            listUser = ct.GetUserName();
                            //should use?
                            //listUser = HttpContext.Current.User.Identity.Name;
                        }
                    }
                }

                // this if statement is in here so that we don't needlessly query the database if the list contains All patients.
                // should prob clean up logic later. - jf
                if (!(listType == "lastname" && listCrit == "All"))
                {
                    // there is prob a better place to put this, leaving it here for now for quick fix - jf
                    if (listType.Length > 0 && listType.ToUpper().Equals("CLINIC"))
                    {
                        listMod = Session[SessionKey.CurrentClinicDate].ToString();
                    }
                    PatientListController ct = new PatientListController();

                    string dsSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                    DataSet ds = ct.GetList(dsSQL, listType, listCrit, listMod, "", -1, -1, Session[SessionKey.CurrentClinicDate].ToString(), listUser);

                    if (ds != null && ds.Tables.Count > 0)
                    {
                        dt = ds.Tables[0];
                    }
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        // only bind current list to the database if list has 1000 patients or less
                        if (dt.Rows.Count < 1000)
                        {
                            CurrentListMessageRow.Visible = false;


                            if (listType == "Clinic")
                            {
                                clinicRpt.DataSource = dt.DefaultView;
                                clinicRpt.DataBind();
                            }
                            else
                            {
                                patientRpt.DataSource = dt.DefaultView;
                                patientRpt.DataBind();
                            }
                        }
                        // list has > 1000 patients
                        else
                        {
                            CurrentListMessageRow.Visible = true;
                            CurrentListMessage.Text = "The current list contains more than 1000 patients, and is too long to display here.  Please return to the <a href=\"../../Core/PatientLists/PatientListPage.aspx\">Patient List Section</a> to select another patient from the list.";
                        }
                        recentListTitle.Text = setCurrentListTitle(listType, listCrit, listCritName);
                    }
                    // length of the current list is 0
                    else
                    {
                        recentListTitle.Text = setCurrentListTitle(listType, listCrit, listCritName);
                        CurrentListMessageRow.Visible = true;
                        CurrentListMessage.Text = "There are no patients in this list.<br>Please return to the <a href=\"../../Core/PatientLists/PatientListPage.aspx\">Patient List Section</a> if you would like to select another list.";
                    }
                }
                // the current list is ALL
                else
                {
                    recentListTitle.Text = setCurrentListTitle(listType, listCrit, listCritName);
                    CurrentListMessageRow.Visible = true;
                    CurrentListMessage.Text = "The system does not support the listing of <strong>All Patients</strong> here.<br>Please return to the <a href=\"../../Core/PatientLists/PatientListPage.aspx\">Patient List Section</a> to select another patient from the list.";
                }
            }
            // no list selected
            else
            {
                CurrentListMessageRow.Visible = true;
            }
            dt = (DataTable)Session[SessionKey.RecentSearchList];
            if (dt != null)
            {
                findRpt.DataSource = dt.DefaultView;
                findRpt.DataBind();
                RecentFindsMessageRow.Visible = false;
            }
            else
            {
                RecentFindsMessageRow.Visible = true;
            }
        }


        protected string setCurrentListTitle(string listType, string listCrit, string listCritName)
        {
            string title;

            switch (listType)
            {
                case "Clinic":
                    title = listCrit + "<br/>on " + Session[SessionKey.CurrentClinicDate].ToString();
                    break;
                case "Protocol":
                    title = "Patients in<br/>" + listType + " " + listCritName;
                    break;
                case "Physician":
                    title = "Patients who have visited<br/>" + listCritName;
                    break;
                case "lastname":
                    if (listCrit.Equals("All"))
                    {
                        title = "All Patients";
                    }
                    else
                    {
                        title = "Last Names<br/>Beginning with \"" + listCrit + "\"";
                    }
                    break;
                case "ContactStatus":
                    title = "Contact Status -  " + listCrit;
                    break;
                case "ItemsMissing":
                    title = "Patients with Missing Items";
                    break;
                case "ItemsPending":
                    title = "Patients with Pending Items";
                    break;
                default:
                    title = listType + " -  " + listCrit;
                    break;
            }

            return title;
        }

        protected void SetPatientRepeaterListItem(Object sender, RepeaterItemEventArgs e)
        {
            System.Web.UI.WebControls.Label PatientRepeaterListItem;
            PatientRepeaterListItem = (System.Web.UI.WebControls.Label)e.Item.FindControl("PatientRepeaterListItem");

            string patientInfo = base.SetPatientListItem(sender, e);

            PatientRepeaterListItem.Text = patientInfo;
        }

        protected void SetFindRepeaterListItem(Object sender, RepeaterItemEventArgs e)
        {
            System.Web.UI.WebControls.Label FindRepeaterListItem;
            FindRepeaterListItem = (System.Web.UI.WebControls.Label)e.Item.FindControl("FindRepeaterListItem");

            string patientInfo = base.SetPatientListItem(sender, e);

            FindRepeaterListItem.Text = patientInfo;
        }

        protected void rptClinicItemCreated(Object Sender, RepeaterItemEventArgs e)
        {

            // create a reference to the current tr
            System.Web.UI.HtmlControls.HtmlContainerControl clinicListRow;
            clinicListRow = (System.Web.UI.HtmlControls.HtmlContainerControl)e.Item.FindControl("clinicListRow");


            // if the patient ID for this row is empty, clicking the row will cause a javascript alert.
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string localApptPatientId = "";
                string ptLastName = "";
                string ptFirstName = "";
                string ptMRN = "";

                DataRowView view = e.Item.DataItem as DataRowView;

                if (view != null)
                {
                    localApptPatientId = GetFieldValue(view, "ApptPatientId");
                    ptLastName = GetFieldValue(view, "ApptLastName");
                    ptFirstName = GetFieldValue(view, "ApptFirstName");
                    ptMRN = GetFieldValue(view, "ApptMRN");
                }

                //string localApptPatientId = ((DataRowView) e.Item.DataItem )["ApptPatientId"].ToString();
                //string ptLastName = ((DataRowView) e.Item.DataItem )["ApptLastName"].ToString();
                //string ptFirstName = ((DataRowView) e.Item.DataItem )["ApptFirstName"].ToString();
                //string ptMRN = ((DataRowView) e.Item.DataItem )["ApptMRN"].ToString();

                if (localApptPatientId == "")
                {
                    clinicListRow.Attributes.Add("onClick", "javascript:alert('This patient is not in the database.  No data is currently available for this patient.');");
                }
                else
                {

                    string epid = CustomCryptoHelper.Encrypt(localApptPatientId);
                    //build the url string for the row

                    string currentListRowUrl = "parent.location= patientRedirectPath + '?epid=" + epid;

                    if (ptLastName != "")
                    {
                        currentListRowUrl += "&ptLastName=" + ptLastName;
                    }

                    if (ptFirstName != "")
                    {
                        currentListRowUrl += "&ptFirstName=" + ptFirstName;
                    }

                    if (ptMRN != "")
                    {
                        currentListRowUrl += "&ptMRN=" + ptMRN;
                    }

                    //close off the url string
                    currentListRowUrl += "&verifyPatientId=true';";

                    clinicListRow.Attributes.Add("onClick", currentListRowUrl);
                }
            }
        }

        private string GetFieldValue(DataRowView view, string fieldname)
        {
            object o = view[fieldname];
            return o != null ? o.ToString() : "";
        }
    }
}
