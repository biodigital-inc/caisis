    using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Security.Cryptography;
using System.Text;

using Caisis.Security;
using Caisis.BOL;
using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities
{

    public partial class SetAccessLevel : BasePage
    {
        private UserController _uc;
        private int _loginId;
        private string _userName; 
        private string _purpose;
        private int? _datasetId = null;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

             SetDefaults();
             SetDataset();
        }

        protected void SetDefaults()
        {
            Session[SessionKey.FormStyle] = "populated"; // what is this?
            _loginId = (int)Session[SessionKey.LoginId];
            _userName = new SecurityController().GetUserName();
            _purpose = String.IsNullOrEmpty(Request.QueryString["purpose"]) ? "default" : Request.QueryString["purpose"].ToString();
            _uc = new UserController();
        }

        private void SetDataset()
        {
            DataTable uaDt = new DataTable();
            DataTable dataSetsTable = _uc.GetUserDatasets().Tables[0];
            string sAtttributeValue = _uc.GetUserAttributeValue(UserAttributeName.DatasetId);
            int attributeValue;

            // load by selected value
            if (Page.IsPostBack && !String.IsNullOrEmpty(DatasetId.Value))
            {
                _datasetId = int.Parse(DecryptDatasetId(DatasetId.Value));

            }
            // load by user attribute
            else if (int.TryParse(sAtttributeValue, out attributeValue))
            {
                // if one datasetId exists, verify user still has access
                DataRow[] dr = dataSetsTable.Select(Dataset.DatasetId + " = " + attributeValue + "");

                if (dr.Length > 0)
                {
                    _datasetId = attributeValue;
                }
            }
            // load single dataset users
            if (!_datasetId.HasValue)
            {
                if (dataSetsTable.Rows.Count == 1)
                {
                    _datasetId = int.Parse(dataSetsTable.Rows[0][Dataset.DatasetId].ToString());
                }
                else
                {
                    // first time user logged in; force them to select a default dataset
                    this.ShowDatasetButtons();
                }
            }

            if (_datasetId.HasValue)
            {
                Session[SessionKey.DatasetId] = _datasetId.Value;
                this.SetUserPermissions();
                this.SetModuleAccess();
                this.SetViewMode(_datasetId);
                this.GotoDashboard();
            }
        }


        private void SetUserPermissions()
        {
            _uc.SetPermissions(_purpose, _datasetId.Value, _loginId, _userName);
        }

        private void SetModuleAccess()
        {
            Session[SessionKey.GroupViewCode] = _uc.SetGroupViewCode(_datasetId.Value);
        }

        private void SetViewMode(int? datasetId)
        {
            if (datasetId.HasValue)
            {
                DiseaseController dc = new DiseaseController();
                var datasetDisease = dc.GetDiseaseAttributeValue(Dataset.DatasetId, datasetId.Value.ToString());
                if (datasetDisease != null)
                {
                    var disease = new Disease();
                    disease.Get((int)datasetDisease[DiseaseAttributeValue.DiseaseId]);
                    Caisis.Security.CustomPrincipal cp = System.Threading.Thread.CurrentPrincipal as Caisis.Security.CustomPrincipal;
                    string diseaseView = disease[Disease.DiseaseName].ToString();
                    cp.UserProfile["diseaseView"] = diseaseView;
                }
            }
        }

        private void ShowDatasetButtons()
        {
            // get users datasets
            DataTable dataSetsTable = _uc.GetUserDatasets().Tables[0];
            DatasetButtons.DataSource = dataSetsTable.DefaultView;
            DatasetButtons.DataBind();

            //if user group been assigned has zero datasets
            if (dataSetsTable.Rows.Count == 0)
            {
                DataAnalysisSelectAReportTitle.Visible = false;
                NoDatasetAccess.Visible = true;
            }
        }

        private void GotoDashboard()
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected string EncryptDatasetId(string datasetId)
        {
            return Caisis.Security.CustomCryptoHelper.Encrypt(datasetId);
        }

        protected string DecryptDatasetId(string encDatasetId)
        {
            return Caisis.Security.CustomCryptoHelper.Decrypt(encDatasetId);
        }
    }
}
