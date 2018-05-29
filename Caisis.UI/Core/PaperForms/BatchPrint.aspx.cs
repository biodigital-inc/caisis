using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;


using Caisis.Security;
using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.PaperForms
{
    /// <summary>
    /// Summary description for BatchPrint.
    /// </summary>
    public partial class BatchPrint : BasePage
    {

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            LoadFormList();
        }

        public void LoadFormList()
        {

            DataTable dt = null;
            if (Session[SessionKey.CurrentListCrit] != null && Session[SessionKey.CurrentListType] != null && Session[SessionKey.DatasetId] != null)
            {
                string listType = Session[SessionKey.CurrentListType].ToString();
                string listCrit = Session[SessionKey.CurrentListCrit].ToString();
                string listCritName = "";
                string listMod = "";
                string sortColumn = "";
                string listUser = "";

                if (Session[SessionKey.CurrentListCritName] != null)
                {
                    listCritName = Session[SessionKey.CurrentListCritName].ToString();

                    if (listType.ToUpper().Equals("CATEGORY"))
                    {
                        listMod = listCritName;

                        // if category is not public, the list is user-specific
                        if (listMod.ToUpper() != "PUBLIC")
                        {
                            SecurityController st = new SecurityController();
                            listUser = st.GetUserName();
                            //should use?
                            //listUser = HttpContext.Current.User.Identity.Name;
                        }
                    }
                }


                if (Request.QueryString.HasKeys() && null != Request.QueryString["sortColumn"])
                {
                    sortColumn = Request.QueryString["sortColumn"];
                }
                else if (listType == "Clinic")
                {
                    sortColumn = "ApptLastName";
                }


                // there is prob a better place to put this, leaving it here for now for quick fix - jf
                if (listType.Length > 0 && listType.ToUpper().Equals("CLINIC"))
                {
                    listMod = Session[SessionKey.CurrentClinicDate].ToString();
                }

                PatientListController ct = new PatientListController();

                string dsSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                DataSet ds = ct.GetList(dsSQL, listType, listCrit, listMod, sortColumn, -1, -1, Session[SessionKey.CurrentClinicDate].ToString(), listUser);

                // hide by default
                patientListTitleTable.Visible = false;
                inPatientListTitleTable.Visible = false;
                clinicListTitleTable.Visible = false;

                if (ds != null && ds.Tables.Count > 0)
                {
                    dt = ds.Tables[0];
                }

                if (dt != null)
                {

                    if (listType == "Clinic")
                    {
                        clinicListTitleTable.Visible = true;

                        dt.Columns.Add("StringApptPatientId");

                        foreach (DataRow clinicListRow in dt.Rows)
                        {
                            if (clinicListRow["ApptPatientId"] == null || clinicListRow["ApptPatientId"].ToString() == "")
                            {
                                clinicListRow["StringApptPatientId"] = "_AppointmentId_" + clinicListRow["AppointmentId"];
                            }
                            else
                            {
                                clinicListRow["StringApptPatientId"] = clinicListRow["ApptPatientId"].ToString() + "_Appt" + clinicListRow["AppointmentId"];
                            }
                        }

                        DataView clinicView = new DataView(dt);
                        DataTable clinicTable = clinicView.ToTable(true, BOL.Appointment.ApptTime, BOL.Appointment.ApptLastName, BOL.Appointment.ApptFirstName, BOL.Appointment.ApptMRN, BOL.Appointment.ApptVisitType, BOL.Appointment.ApptPatientId, "StringApptPatientId");

                        rptClinicFormList.DataSource = clinicTable.DefaultView;
                        rptClinicFormList.DataBind();
                    }
                    else if (listType == "InPatient")
                    {
                        inPatientListTitleTable.Visible = true;
                        
                        dt.Columns.Add("StringInPatientPatientId");

                        foreach (DataRow inPatientListRow in dt.Rows)
                        {
                            if (inPatientListRow["PatientId"] == null || inPatientListRow["PatientId"].ToString().Length < 1)
                            {
                                inPatientListRow["StringInPatientPatientId"] = "_InPatientId_" + inPatientListRow["InPatientId"];
                            }
                            else
                            {
                                inPatientListRow["StringInPatientPatientId"] = inPatientListRow["PatientId"].ToString() + "_Appt" + inPatientListRow["InPatientId"];
                            }
                        }

                        rptInPatientFormList.DataSource = dt.DefaultView;
                        rptInPatientFormList.DataBind();
                    }
                    else
                    {
                        patientListTitleTable.Visible = true;

                        rptFormList.DataSource = dt.DefaultView;
                        rptFormList.DataBind();

                        clinicListTitleTable.Visible = false;
                        inPatientListTitleTable.Visible = false;

                    }
                }
            }


        }

        /// <summary>
        /// During binding, set text and value for options in paper form list
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetOptionNameAndValue(object sender, RepeaterItemEventArgs e)
        {
            string shortName = DataBinder.Eval(e.Item.DataItem, "page").ToString();
            string displayName = DataBinder.Eval(e.Item.DataItem, "batchName").ToString(); ;
            HtmlGenericControl selOption = e.Item.FindControl("PaperFormOption") as HtmlGenericControl;
            selOption.InnerText = displayName;
            selOption.Attributes["value"] = shortName.Replace(".ascx", "");
        }





    }
}
