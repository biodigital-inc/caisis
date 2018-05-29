using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.Controller;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities.Widget
{
    public partial class PhysicianClinicListWidget : BaseWidgetControl
    {
        private PatientController pc = new PatientController();

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            if (!Page.IsPostBack && ListClinicPhysicians())
            {
                SetInitialPhysician();
                SetClinicList(this, e);
            }
        }

        /// <summary>
        /// Ajax callback to dynamically rendered updated clinic list
        /// </summary>
        /// <param name="e"></param>
        protected void GetNewClinicList(Caisis.UI.ClientScript.Ajax.CaisisAjaxEventArgs e)
        {
            string physician = e.ClientParam;
            // populate clinic list
            BuildClinicList(physician);
            // return result to be rendered
            e.ReturnValue = PhysicianClinicRptr;
        }

        protected override void SetRptIdentifiers(object Sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label patientName = e.Item.FindControl("PatientName") as Label;
                Label patientIdentifier = e.Item.FindControl("PatientIdentifier") as Label;
                Literal encPID = e.Item.FindControl("encPID") as Literal;
                string ptId = DataBinder.Eval(e.Item.DataItem, BOL.Appointment.ApptPatientId).ToString();
                string ptFirstName = DataBinder.Eval(e.Item.DataItem, BOL.Appointment.ApptFirstName).ToString();
                string ptLastName = DataBinder.Eval(e.Item.DataItem, BOL.Appointment.ApptLastName).ToString();
                string ptMRN = DataBinder.Eval(e.Item.DataItem, BOL.Appointment.ApptMRN).ToString();

                // set display name
                patientName.Text = pc.GetPatientLastName(ptLastName) + ", " + pc.GetPatientFirstName(ptFirstName);
                string epid = Caisis.Security.CustomCryptoHelper.Encrypt(ptId);
                encPID.Text = epid;

                // set display identifier
                patientIdentifier.Text = pc.GetPatientMRN(ptMRN);
            }
        }

        /// <summary>
        /// Builds a list of Clinic Physicians
        /// </summary>
        private bool ListClinicPhysicians()
        {
            bool physiciansListed = false;

            AppointmentDa aptDa = new AppointmentDa();
            DataTable dt = aptDa.GetDistinctAppointmentPhysicians().Tables[0];
            if (dt.Rows.Count > 0)
            {
                ClinicPhysiciansList.DataSource = dt;
                ClinicPhysiciansList.DataBind();
                physiciansListed = true;
            }
            else
            {
                ClinicPhysiciansList.Visible = false;
                ClinicPhysiciansListLabel.Text = "No clinics have been scheduled.";
                SetUserMessage("NO PHYSICIANS");
            }

            return physiciansListed;

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="physician"></param>
        private void BuildClinicList(string physician)
        {
            if (!string.IsNullOrEmpty(physician))
            {
                SelectPhysicianMessage.Visible = false;
                string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
                string date = DateTime.Today.ToShortDateString();
                int maxRows = 200;

                PatientListController ct = new PatientListController();
                DataSet ds = ct.GetList(datasetSql, "Clinic", physician, date, BOL.Appointment.ApptTime, 0, maxRows, date, "");

                if (ds.Tables[0].Rows.Count > 0)
                {
                    PhysicianClinicRptr.DataSource = ds.Tables[0];
                    PhysicianClinicRptr.DataBind();
                }
                else { SetUserMessage("NO RESULTS"); }

                PutClinicInSession(physician);
            }
            else { SetUserMessage("SELECT PHYSICIAN"); }
        }




        /// <summary>
        /// 
        /// </summary>
        /// <param name="physician"></param>
        private void SetInitialPhysician()
        {
            if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") && Session[SessionKey.CurrentListCrit] != null)
            {
                string pName = Session[SessionKey.CurrentListCrit].ToString();
                ClinicPhysiciansList.SelectedValue = pName;
            }

        }



        /// <summary>
        /// 
        /// </summary>
        /// <param name="physician"></param>
        private void PutClinicInSession(string physician)
        {
            if (!String.IsNullOrEmpty(physician))
            {
            	Session[SessionKey.CurrentListType] = "Clinic";
                Session[SessionKey.CurrentListCrit] = physician;
                if (Session[SessionKey.CurrentClinicDate] == null || Session[SessionKey.CurrentClinicDate].ToString().Length < 1)
                {
                    Session[SessionKey.CurrentClinicDate] = DateTime.Now.ToShortDateString();
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetClinicList(object sender, EventArgs e)
        {
            string physician = ClinicPhysiciansList.SelectedValue;
            BuildClinicList(physician);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetUserMessage(string messageType)
        {
            bool ShowNoPhysiciansMsg = false;
            bool ShowSelectPhysicianMsg = false;
            bool ShowNoResultsMsg = false;

            switch (messageType.ToUpper())
            {
                case "NO PHYSICIANS":
                    ShowNoPhysiciansMsg = true;
                    break;
                case "SELECT PHYSICIAN":
                    ShowSelectPhysicianMsg = true;
                    break;
                case "NO RESULTS":
                    ShowNoResultsMsg = true;
                    break;
            }

            NoPhysiciansMessage.Visible = ShowNoPhysiciansMsg;
            SelectPhysicianMessage.Visible = ShowSelectPhysicianMsg;
            NoResultsMessage.Visible = ShowNoResultsMsg;

        }
    }
}