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
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminSchemaPatients : ProtocolMgmtBaseAdminPage
    {
        protected PatientController _pc = new PatientController();

        private string QuerySortColumn
        {
            get
            {
                return Request.QueryString["sortCol"];
            }
        }

        private string QuerySortDir
        {
            get
            {
                return Request.QueryString["sortDir"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(BaseSchemaId))
                {
                    ProtocolSchema biz = new ProtocolSchema();
                    biz.Get(int.Parse(BaseSchemaId));
                    TreatmentArmTitle.Text = biz[ProtocolSchema.ProtocolArmDescription].ToString().ToUpper();
                }
                BuildSchemaPatients();

                // delete via QS
                string queryAction = Request.QueryString["action"];
                string queryPatientSchemaId = Request.QueryString["patientSchemaId"];
                if (queryAction == "delete" && !string.IsNullOrEmpty(queryPatientSchemaId))
                {
                    int patientSchemaId = int.Parse(queryPatientSchemaId);
                    PatientSchema ps = new PatientSchema();
                    ps.Get(patientSchemaId);
                    if (!ps.IsEmpty)
                    {
                        string dataset = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                        DataSetController dsc = new DataSetController();
                        int patientId = (int)ps[PatientSchema.PatientId];
                        if (dsc.IsPatientInDataset(patientId, dataset))
                        {
                            DeletePatient(patientSchemaId);
                            Response.Redirect("AdminSchemaPatients.aspx?scid=" + BaseSchemaId);
                        }
                    }
                }
            }

            Message.Visible = false;
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SetSortingLinks();
        }

        protected void FixAllPatientSchedules(object sender, EventArgs e)
        {
            int protocolSchemaId = int.Parse(BaseSchemaId);
            Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
            string username = sc.GetUserName();
            FixEverything(protocolSchemaId, username);
            Message.Visible = true;
        }

        protected void FixSinglePatientSchedule(object sender, CommandEventArgs e)
        {
            int patientSchemaId = int.Parse(e.CommandArgument.ToString());
            Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
            string username = sc.GetUserName();
            // fix schedule
            FixPatientSchedule(patientSchemaId, username);
        }

        /// <summary>
        /// 
        /// </summary>
        private void SetSortingLinks()
        {
            string baseURL = GetQueryString("AdminSchemaPatients.aspx", BaseProtocolId, BaseSchemaId, string.Empty, false);
            MRNSort.NavigateUrl = baseURL + "&sortCol=ptmrn&sortDir=desc";
            NameSort.NavigateUrl = baseURL + "&sortCol=Name&sortDir=asc";
            StudyIdSort.NavigateUrl = baseURL + "&sortCol=StudyId&sortDir=asc";
            // set sorting if needed
            if (!string.IsNullOrEmpty(QuerySortColumn))
            {
                if (QuerySortColumn.Equals("name", StringComparison.CurrentCultureIgnoreCase))
                {
                    if (QuerySortDir.Equals("asc"))
                    {
                        MRNSort.NavigateUrl = baseURL + "&sortCol=ptmrn&sortDir=asc";
                        NameSort.NavigateUrl = baseURL + "&sortCol=Name&sortDir=desc";
                        StudyIdSort.NavigateUrl = baseURL + "&sortCol=StudyId&sortDir=asc";
                    }
                    else
                    {
                        MRNSort.NavigateUrl = baseURL + "&sortCol=ptmrn&sortDir=asc";
                        NameSort.NavigateUrl = baseURL + "&sortCol=Name&sortDir=asc";
                        StudyIdSort.NavigateUrl = baseURL + "&sortCol=StudyId&sortDir=asc";
                    }
                }
                if (QuerySortColumn.Equals("ptmrn"))
                {
                    if (QuerySortDir.Equals("asc"))
                    {
                        MRNSort.NavigateUrl = baseURL + "&sortCol=ptmrn&sortDir=desc";
                        NameSort.NavigateUrl = baseURL + "&sortCol=Name&sortDir=asc";
                        StudyIdSort.NavigateUrl = baseURL + "&sortCol=StudyId&sortDir=asc";
                    }
                    else
                    {
                        MRNSort.NavigateUrl = baseURL + "&sortCol=ptmrn&sortDir=asc";
                        NameSort.NavigateUrl = baseURL + "&sortCol=Name&sortDir=asc";
                        StudyIdSort.NavigateUrl = baseURL + "&sortCol=StudyId&sortDir=asc";
                    }
                }
                if (QuerySortColumn.Equals("StudyId"))
                {
                    if (QuerySortDir.Equals("asc"))
                    {
                        MRNSort.NavigateUrl = baseURL + "&sortCol=ptmrn&sortDir=asc";
                        NameSort.NavigateUrl = baseURL + "&sortCol=Name&sortDir=asc";
                        StudyIdSort.NavigateUrl = baseURL + "&sortCol=StudyId&sortDir=desc";
                    }
                    else
                    {
                        MRNSort.NavigateUrl = baseURL + "&sortCol=ptmrn&sortDir=asc";
                        NameSort.NavigateUrl = baseURL + "&sortCol=Name&sortDir=asc";
                        StudyIdSort.NavigateUrl = baseURL + "&sortCol=StudyId&sortDir=asc";
                    }
                }
            }
        }

        /// <summary>
        /// Build the list of patients on the schema
        /// </summary>
        private void BuildSchemaPatients()
        {
            if (!string.IsNullOrEmpty(BaseSchemaId))
            {
                int schemaId = int.Parse(BaseSchemaId);
                string dataset = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                DataView dv = ProtocolMgmtDa.GetPatientsByProtocolSchema(schemaId, dataset).DefaultView;
                // determine sort
                string sortCol = Patient.PtLastName;
                string sortDir = "asc";
                if (!string.IsNullOrEmpty(QuerySortColumn))
                {
                    sortCol = QuerySortColumn.Equals("ptmrn") ? Patient.PtMRN : Patient.PtLastName;
                    sortDir = !string.IsNullOrEmpty(QuerySortDir) && QuerySortDir.Equals("asc") ? "desc" : "asc";
                }

                dv.Sort = sortCol + " " + sortDir;
                SchemaPatientsRptr.DataSource = dv;
                SchemaPatientsRptr.DataBind();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetDeleteMessage(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Button deleteBtn = e.Item.FindControl("DeleteBtn") as Button;
                Label ptLabel = e.Item.FindControl("PtLabel") as Label;
                string patientId = DataBinder.Eval(e.Item.DataItem, Patient.PatientId).ToString();
                string ptLastName = _pc.GetPatientLastName(DataBinder.Eval(e.Item.DataItem, Patient.PtLastName).ToString());
                string ptFirstName = _pc.GetPatientFirstName(DataBinder.Eval(e.Item.DataItem, Patient.PtFirstName).ToString());
                string ptMrn = _pc.GetPatientMRN(DataBinder.Eval(e.Item.DataItem, Patient.PtMRN).ToString());
                string ptFullName = string.Format("{0}, {1} ({2})", ptLastName, ptFirstName, ptMrn);
                string ptProtocolStudyId = DataBinder.Eval(e.Item.DataItem, PatientProtocol.PtProtocolStudyId).ToString();
                string participantID = DataBinder.Eval(e.Item.DataItem, "ParticipantID").ToString();
                string clientClick = "return confirmDeleteSchemaPatient('" + PageUtil.EscapeSingleQuotes(ptFullName) + "','" + PageUtil.EscapeSingleQuotes(ptProtocolStudyId) + "', '" + PageUtil.EscapeSingleQuotes(participantID) + "', '" + patientId + "');";
                string[] identifiers = new string[] { "Study Id: " + ptProtocolStudyId, "Participant ID: " + participantID, "Caisis Patient Id: " + patientId };
                deleteBtn.ToolTip = "Remove patient " + ptFullName + " \n(" + string.Join(",\n", identifiers) + ")\n from this Treatment Arm";
                deleteBtn.OnClientClick = clientClick;
            }
        }

        /// <summary>
        /// Delete the patient from this treatment arm.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeletePatientFromTreatment(object sender, CommandEventArgs e)
        {
            // no records if last row deleted
            int currentRecordCount = SchemaPatientsRptr.Items.Count;
            bool doClose = currentRecordCount == 1;

            int patientSchemaId = int.Parse(e.CommandArgument.ToString());
            DeletePatient(patientSchemaId);

            // rebuild list
            BuildSchemaPatients();
            // register updated script
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ReloadArms", "reloadUpdatedSchmeaPatients(" + doClose.ToString().ToLower() + ");", true);
        }

        private void FixEverything(int protocolSchemaId, string username)
        {
            ProtocolMgmtTimelineService.FixSchema(protocolSchemaId, username);
        }

        private static void FixPatientSchedule(int patientSchemaId, string username)
        {
            ProtocolMgmtTimelineService.FixPatientSchema(patientSchemaId, username);
        }

        // delete patient off schema (only admin's can perform action)
        private void DeletePatient(int patientSchemaId)
        {
            if (base.UserType == ProtocolMgmtUsers.ProtocolAdmin)
            {
                PatientProtocolController.DeletePatientFromSchema(patientSchemaId);
            }
        }
    }
}