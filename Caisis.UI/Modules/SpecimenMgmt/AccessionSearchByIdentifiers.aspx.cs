using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Security;
using System.Security.Principal;
using System.Security.Permissions;

using Caisis.Security;
using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using Caisis.BOL;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    public partial class AccessionSearchByIdentifiers : SpecimenMgmtBasePage
    {
        private int patientId=0;
        private bool setCriteria;
        private bool isPostBack;
        private string _identifierType;
        private string searchType;
        private static readonly string searchTypeKey = "searchTypeValue";

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            // get ID type from web config
            _identifierType = CaisisConfiguration.GetWebConfigValue("SpecimenModuleDefaultId");
            IdentifierType.Value = _identifierType;
            IdentifierLbl.Text = _identifierType;

            // Set Helper variables
            isPostBack = Page.IsPostBack;
            setCriteria = !string.IsNullOrEmpty(getQS("setCriteria")); // No Value or Non-existant makes this false
            if (!isPostBack)
            {
                LoadPriorQueryParams();
            }

            searchType = Request.Form[searchTypeKey];
        }
  
        private void LoadPriorQueryParams()
        {
            if (PermissionManager.HasPermission(PermissionManager.ViewPatientIdentifiers))
            {
                LastNameMRNOption.Visible = true;
                LastNameMRNOption.Checked = true;
                LastNameMRNLbl.Visible = true;
            }
            else
            {
                IdentifierType.Checked = true;
                searchTxtBox.Style.Add("padding-bottom","3px");
            }

            if (setCriteria)
            {

            }
        }

        protected void btnSearch_Click(object sender, CommandEventArgs e)
        {
            string strSearch = searchTxtBox.Value;             

            string datasetSql = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);

            SpecimenManagerDa da = new SpecimenManagerDa();
            SearchController sc = new SearchController();
            DataTable dt;
            if (searchType == "LastNameMRN")
            {
                dt = sc.FindPatient(strSearch, datasetSql).Tables[0]; ;
            }
            else
            {
                dt = sc.FindPatientByIdentifier(strSearch, _identifierType, datasetSql).Tables[0];
            }

            int n = dt.Rows.Count;

            if (n > 0)
            {
                if (n == 1)
                {
                    patientId = Int32.Parse(dt.Rows[0]["PatientId"].ToString());
                    Response.Redirect("AccessionsContainer.aspx?patientId=" + EncryptPatientId(patientId.ToString()) + "&specimenaccessionId=0");
                }
                else
                {
                    PatientResults.DataSource = dt;
                    PatientResults.DataBind();

                    PDFormDiv.Style.Add("display", "block");
                    noRecordsFound.Visible = false;
                }
            }
            else
            {
                PDFormDiv.Style.Add("display", "none");
                noRecordsFound.Visible = true;
            }
        }

        protected void rptItemCreated(Object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //to show patient identifiers on permission
                if (PermissionManager.HasPermission(PermissionManager.ViewPatientIdentifiers))
                {
                    HtmlTableCell Name = (HtmlTableCell)e.Item.FindControl("dataName");
                    Name.Style.Add("visibility", "visible");
                    HtmlTableCell DOB = (HtmlTableCell)e.Item.FindControl("dataDOB");
                    DOB.Style.Add("visibility", "visible");
                }
                Label idCol = e.Item.FindControl("dataID") as Label;
                string colName = searchType == "LastNameMRN" ? "PtMRN" : "Identifier";
                string colVal = DataBinder.Eval(e.Item.DataItem, colName).ToString();
                idCol.Text = Server.HtmlEncode(colVal);
            }
        }
    }
}
