using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientImagingDataEntry : ProtocolMgmtPatientBasePage
    {
        /// <summary>
        /// Gets the imaging id passed in query string
        /// </summary>
        protected string DiagnosticId
        {
            get
            {
                return Request.QueryString["diagnosticId"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && !string.IsNullOrEmpty(DiagnosticId))
            {
                BindDiagnosticRecord(int.Parse(DiagnosticId));
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void BindDiagnosticRecord(int diagnosticId)
        {
            Diagnostic biz = new Diagnostic();
            biz.Get(diagnosticId);
            base.PopulateForm(biz);

            BindImageFindingsRecords(diagnosticId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="diagnosticId"></param>
        private void BindImageFindingsRecords(int diagnosticId)
        {
			//ImageFinding biz = new ImageFinding();
			//biz.GetByParent(diagnosticId);
			//ImageFindingsGrid.DataSource = biz.DataSourceView;
			DataView view = BusinessObject.GetByParentAsDataView<ImageFinding>(diagnosticId);
			ImageFindingsGrid.DataSource = view;
            ImageFindingsGrid.DataBind();

            //NoImagingRecords.Visible = biz.DataSourceView.Count == 0;
			NoImagingRecords.Visible = view.Count == 0;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            Diagnostic biz = new Diagnostic();
            biz.Get(int.Parse(DiagnosticId));
            CICHelper.SetBOValues(this.Controls, biz, int.Parse(BaseDecryptedPatientId));
            biz.Save();

            RegisterOnSaveScript(DiagnosticId);
        }

        /// <summary>
        /// Registers a script to reload parent page to reflect changes for inserted/updated record
        /// </summary>
        /// <param name="diagnosticId"></param>
        private void RegisterOnSaveScript(string diagnosticId)
        {
            string reloadScript = "if(parent.reloadDiagnostic) { parent.reloadDiagnostic('" + diagnosticId + "'); }";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "ReloadDiagnostics", reloadScript, true);
        }
    }
}
