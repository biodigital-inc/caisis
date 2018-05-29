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
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminManagePatients : ProtocolMgmtBaseAdminPage
    {
        // user for controlling patient identifier output
        Caisis.Controller.PatientController pc = new Caisis.Controller.PatientController();

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(BaseProtocolId))
            {
                BuildList();
            }
        }

        private void BuildList()
        {
            int protocolId = int.Parse(BaseProtocolId);
            var _patients = from row in ProtocolMgmtDa.GetPatientProtocolsAndSchemas(protocolId).AsEnumerable()
                            group row by
                            new
                            {
                                PatientId = (int)row["PatientId"],
                                PtMRN = row["PtMRN"].ToString(),
                                PtLastName = row["PtLastName"].ToString(),
                                PtFirstName = row["PtFirstName"].ToString(),
                                ProtocolId = (int)row["ProtocolId"],
                                PatientProtocolId = (int)row["PatientProtocolId"],
                                PtProtocolScreeningId = row["PtProtocolScreeningId"].ToString(),
                                PtProtocolStudyId = row["PtProtocolStudyId"].ToString()
                            }
                                into g
                                let pp = g.Key
                                let pSchemas = from p in g
                                               where !p.IsNull("ProtocolSchemaId") && !p.IsNull("PatientSchemaId")
                                               select new
                                               {
                                                   ProtocolSchemaId = (int)p["ProtocolSchemaId"],
                                                   ProtocolArmDescription = p["ProtocolArmDescription"].ToString(),
                                                   PatientSchemaId = (int)p["PatientSchemaId"]
                                               }
                                let patient = new
                                {
                                    PatientId = pp.PatientId,
                                    PtMRN = pp.PtMRN,
                                    PtLastName = pp.PtLastName,
                                    PtFirstName = pp.PtFirstName,
                                    ProtocolId = pp.ProtocolId,
                                    PatientProtocolId = pp.PatientProtocolId,
                                    PtProtocolScreeningId = pp.PtProtocolScreeningId,
                                    PtProtocolStudyId = pp.PtProtocolStudyId,
                                    PatientsOnSchemas = pSchemas,
                                    PatientSchemaIds = pSchemas.Select(p => p.PatientSchemaId)
                                }
                                orderby patient.PtProtocolStudyId ascending
                                select patient;
            PatientProtocolsRptr.DataSource = _patients;
            PatientProtocolsRptr.DataBind();
        }

        protected void BuildPatientSchemas(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var patientSchemas = DataBinder.Eval(e.Item.DataItem, "PatientsOnSchemas");
                var schemaRptr = e.Item.FindControl("PatientSchemasRptr") as Repeater;
                schemaRptr.DataSource = patientSchemas;
                schemaRptr.DataBind();

                var ptNameField = e.Item.FindControl("PatientName") as Label;
                string ptFirstName = DataBinder.Eval(e.Item.DataItem, "PtFirstName").ToString();
                string ptLastName = DataBinder.Eval(e.Item.DataItem, "PtLastName").ToString();
                string ptMRN = DataBinder.Eval(e.Item.DataItem, "PtMRN").ToString();
                ptNameField.Text = pc.GetPatientName(ptFirstName, ptLastName, false);

                var ptMRNField = e.Item.FindControl("PtMRN") as Label;
                ptMRNField.Text = pc.GetPatientMRN(ptMRN);

                var deletePPBtn = e.Item.FindControl("DeletePatientProtocolBtn") as Button;
                var schemaIds = DataBinder.Eval(e.Item.DataItem, "PatientSchemaIds") as IEnumerable<int>;
                deletePPBtn.CommandArgument = string.Join(",", schemaIds.Select(a => a.ToString()).ToArray());
            }
        }

        protected void DeletePatientFromProtocol(object sender, CommandEventArgs e)
        {
            var ppField = (sender as Control).NamingContainer.FindControl("PatientProtocolId") as HiddenField;
            var patientProtocolId = int.Parse(ppField.Value);
            var patientSchemaIds = e.CommandArgument.ToString().Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries).Select(a => int.Parse(a));
            DeletePatientProtocol(patientProtocolId, patientSchemaIds);

            RegisterRefreshList();

            BuildList();
        }

        protected void DeletePatientFromTreatment(object sender, CommandEventArgs e)
        {
            // delete patient off schema (only admin's can perform action)
            if (base.UserType == ProtocolMgmtUsers.ProtocolAdmin)
            {
                int patientSchemaId = int.Parse(e.CommandArgument.ToString());
                DeletePatientSchema(patientSchemaId);
            }
            RegisterRefreshList();

            BuildList();
        }

        private void RegisterRefreshList()
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "refreshMain", "refreshMain();", true);
        }

        private void DeletePatientProtocol(int patientProtocolId, IEnumerable<int> patientSchemaIds)
        {
            PatientProtocol patientProtocol = new PatientProtocol();
            foreach (int patientSchemaId in patientSchemaIds)
                DeletePatientSchema(patientSchemaId);
            patientProtocol.Delete(patientProtocolId);
        }

        private void DeletePatientSchema(int patientSchemaId)
        {
            PatientProtocolController.DeletePatientFromSchema(patientSchemaId);
        }
    }
}
