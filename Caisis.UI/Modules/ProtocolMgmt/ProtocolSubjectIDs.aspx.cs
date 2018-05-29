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

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Controller;
using System.Collections.Specialized;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class ProtocolSubjectIDs : ProtocolMgmtBasePage
    {

        protected string QueryIdType
        {
            get
            {
                return Request.QueryString["idType"];
            }
        }

        private static readonly string[] ID_TYPES = new string[] { "Broad Subject ID", "Michigan Subject ID", "Local Subject ID" };

        private List<int> dirtyRows = new List<int>();

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            ProtocolPatientIdentifiers.DataBinding += (o, eRowArgs) => dirtyRows.Clear();
            ProtocolPatientIdentifiers.RowCreated += (o, eRowArgs) => CICHelper.GetCaisisInputControls(eRowArgs.Row).ForEach(i => i.ValueChanged += (a, b) => dirtyRows.Add(eRowArgs.Row.RowIndex));
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string type = GetIdType();
                if (!string.IsNullOrEmpty(type))
                {
                    BuildIdentifiers(type);
                    UpdateBtn.Text = "Update " + type;
                }
            }
        }

        private string GetIdType()
        {
            string type = "";
            if (QueryIdType == "broad")
                type = ID_TYPES[0];
            if (QueryIdType == "michigan")
                type = ID_TYPES[1];
            if (QueryIdType == "local")
                type = ID_TYPES[2];
            return type;
        }


        protected void BuildIdentifiers(string type)
        {
            int protocolId = int.Parse(BaseProtocolId);
            string datasetSQL = base.GetSpecimenPatientsDatasetSQL();

            DataTable patientIdentifiers = ProtocolMgmtDa.GetProtocolPatientIdentifiers(protocolId, datasetSQL);
            DataView patientView = PatientProtocolController.SortPatientsByStudyId(patientIdentifiers, "ASC");
            // set column visibility
            ProtocolPatientIdentifiers.Columns[1].Visible = type == ID_TYPES[0];
            ProtocolPatientIdentifiers.Columns[2].Visible = type == ID_TYPES[1];
            ProtocolPatientIdentifiers.Columns[3].Visible = type == ID_TYPES[2];
            // delete column
            ProtocolPatientIdentifiers.Columns[4].Visible = false;// todo: UserType == ProtocolMgmtUsers.ProtocolAdmin;

            ProtocolPatientIdentifiers.DataSource = patientView;
            ProtocolPatientIdentifiers.DataBind();

            UpdateBtn.Visible = patientView.Count > 0;
            ProtocolPatientIdentifiers.Visible = true;
        }

        protected void SetDeleteBtn(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string idType = GetIdType();
                string htmlIdType = idType.Replace(" ", "_");
                string priKeyName = htmlIdType + "_IdentifierId";
                string identifierId = DataBinder.Eval(e.Row.DataItem, priKeyName).ToString();
                Button deleteBtn = e.Row.FindControl("DeleteBtn") as Button;
                if (!string.IsNullOrEmpty(identifierId))
                {
                    deleteBtn.CommandArgument = identifierId;
                    deleteBtn.Visible = true;
                }
                else
                {
                    deleteBtn.Visible = false;
                }
            }
        }

        protected void UpdateIdentifiers(object sender, EventArgs e)
        {
            string idType = GetIdType();
            foreach (int rowIndex in dirtyRows)
            {
                GridViewRow row = ProtocolPatientIdentifiers.Rows[rowIndex];
                int patientId = (int)ProtocolPatientIdentifiers.DataKeys[rowIndex]["PatientId"];
                //foreach (string idType in ID_TYPES)
                {
                    string htmlIdType = idType.Replace(" ", "_");
                    string identifierId = (row.FindControl(htmlIdType + "_IdentifierId") as ICaisisInputControl).Value;
                    string identifier = (row.FindControl(htmlIdType) as ICaisisInputControl).Value;
                    if (!string.IsNullOrEmpty(identifier))
                    {
                        Identifier biz = new Identifier();
                        if (!string.IsNullOrEmpty(identifierId))
                            biz.Get(int.Parse(identifierId));
                        biz[Identifier.PatientId] = patientId;
                        biz[Identifier.IdType] = idType;
                        biz[Identifier.Identifier_Field] = identifier;
                        biz.Save();
                    }
                }
            }
            // re-build
            BuildIdentifiers(idType);
        }

        protected void DeleteIdentifier(object sender, CommandEventArgs e)
        {
            string idType = GetIdType();
            string identifierId = e.CommandArgument.ToString();
            if (!string.IsNullOrEmpty(identifierId))
            {
                // delete Identifier
                int priKey = int.Parse(identifierId);
                Identifier biz = new Identifier();
                biz.Delete(priKey);

                // re-bind
                BuildIdentifiers(idType);
            }
        }
    }
}