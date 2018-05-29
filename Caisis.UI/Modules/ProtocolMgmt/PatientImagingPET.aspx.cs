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
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientImagingPET : ProtocolMgmtPatientBasePage
    {
        protected string QueryDiagnosticId
        {
            get
            {
                return Request.QueryString["diagnosticId"];
            }
        }

        private int DiagnosticId
        {
            get
            {
                return int.Parse(QueryDiagnosticId);
            }
        }

        protected bool IsNew
        {
            get
            {
                return string.IsNullOrEmpty(QueryDiagnosticId);
            }
        }

        private DataView diagnosticRecords;
        private DataView DiagnosticRecords
        {
            get
            {
                if (diagnosticRecords == null)
                {
                    DiagnosticDa da = new DiagnosticDa();
                    int patientId = int.Parse(BaseDecryptedPatientId);
                    diagnosticRecords = da.GetDiagnosticsByType(patientId, "PET").DefaultView;
                    // filter by date
                    var dateRange = GetDiagnosticDateRange();
                    List<string> dateFilters = new List<string>();
                    if (dateRange.Key.HasValue)
                        dateFilters.Add("DxDate >= #{0:d}#");
                    if (dateRange.Value.HasValue)
                        dateFilters.Add("DxDate <= #{1:d}#");
                    if (dateFilters.Count() > 0)
                        diagnosticRecords.RowFilter = string.Format(string.Join(" AND ", dateFilters.ToArray()), dateRange.Key, dateRange.Value);
                    diagnosticRecords.Sort = Diagnostic.DxDate + " ASC";
                }
                return diagnosticRecords;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(BaseDecryptedPatientId))
                {
                    BuildDiagnostics(int.Parse(BaseDecryptedPatientId));
                }
                if (!IsNew)
                {
                    this.PopulateForm(DiagnosticId);
                    this.PopulateGrids(DiagnosticId);
                }
                else
                {
                    ScanDetailTitle.Text = "New PET Scan";
                    this.PopulateGrids(null);
                }
            }

            // set buttons
            DeleteBtn.Visible = !IsNew;
        }

        protected void RebindOnDelete(object sender, EventArgs e)
        {
            int? diagId = null;
            if (!IsNew)
            {
                diagId = DiagnosticId;
            }
            this.PopulateGrids(diagId);
        }

        protected void SaveClick(object sender, EventArgs e)
        {
            // Save Diagnostic Record
            Diagnostic biz = new Diagnostic();

            // load existing record
            if (!IsNew)
            {
                biz.Get(DiagnosticId);
            }
            // important, get current uptake value before setting biz fields
            string currentDBDxResult = biz[Diagnostic.DxResult].ToString();

            // set biz fields from control fields
            CICHelper.SetBOValues(this.Controls, biz, (int.Parse(BaseDecryptedPatientId)));

            // handle tracer uptake, use existing db value andget computed value           
            //biz[Diagnostic.DxResult] = GetTracerUptake(currentDBDxResult);

            // finally save diagnostic and child findings
            biz.Save();
            int diagnosticId = (int)biz[Diagnostic.DiagnosticId];
            // Save DxImageFindings
            DxGrid1.Save(diagnosticId);
            DxGrid2.Save(diagnosticId);

            // Re-populate form with new request
            ReloadPage(diagnosticId.ToString());
        }

        protected void DeleteClick(object sender, EventArgs e)
        {
            if (!IsNew)
            {
                Diagnostic biz = new Diagnostic();
                biz.Delete(DiagnosticId);
            }
            ReloadPage(string.Empty);
        }

        private void BuildDiagnostics(int patientId)
        {
            DiagnosticsRptr.DataSource = DiagnosticRecords;
            DiagnosticsRptr.DataBind();
        }

        protected void PopulateForm(int diagnosticId)
        {
            Diagnostic biz = new Diagnostic();
            biz.Get(diagnosticId);
            // set fields in panel
            base.PopulateForm(this, biz);


            // set data label
            //DxDateLabel.Text = string.Format("{0:d}", biz[Diagnostic.DxDate]);
            //// set support baseline checkbox to sycn fields
            //SupportImgBaseline.Checked = ImgBaseline.Checked;
            //// display baseline display text if is baseline
            //if (ImgBaseline.Checked)
            //{
            //    DxBaselineLabel.Style.Remove("display");
            //}
            //else
            //{
            //    DxBaselineLabel.Style["display"] = "none";
            //}

            //// SPECIAL CASE:  for current diagnostic, check if there is a related record, used as compare to for follow up scans
            //var relatedDiagnostics = Caisis.Controller.RelatedRecordController.GetRelatedRecords(biz.TableName, diagnosticId, biz.TableName);
            //if (relatedDiagnostics.Count() > 0)
            //{
            //    // get related diagnostic id
            //    int relatedDiagnosticId = (int)relatedDiagnostics.First()[RelatedRecord.DestPrimaryKey];
            //    PageUtil.SelectDropDownItem(PrevScans, relatedDiagnosticId.ToString());
            //}

            //string currentDxResult = biz[Diagnostic.DxResult].ToString();
            //bool? doCheck = IsTracerUptake(currentDxResult);
            //// no selection
            //if (doCheck == null)
            //{
            //    TracerUptake.ClearSelection();
            //}
            //// yes
            //else if (doCheck == true)
            //{
            //    TracerUptake.SelectedIndex = 0;
            //}
            //// no
            //else if (doCheck == false)
            //{
            //    TracerUptake.SelectedIndex = 1;
            //}

            //// set baseline toggle panels
            //if (ImgBaseline.Checked)
            //{
            //    // hide follow up panel and impression fields, clear follow up num new value
            //    FollowUpPanel.Style["display"] = "none";
            //    ClinicalImpressionPanel.Style["display"] = "none";
            //    DxTotalNumTumorsFollowUp.Value = string.Empty;
            //    // show baseline panel and impression
            //    BaselinePanel.Style.Remove("display");
            //}
            //else
            //{
            //    // hide baseline panel and show follow up and impression fields, clear baseline num new value
            //    BaselinePanel.Style["display"] = "none";
            //    DxTotalNumTumorsBaseline.Value = string.Empty;
            //    // show no baseline panel
            //    FollowUpPanel.Style.Remove("display");
            //    ClinicalImpressionPanel.Style.Remove("display");
            //}

            //// Populate fields when populating form
            //this.OnPopulateDxImagingField(diagnosticId);
        }

        private void PopulateGrids(int? diagnosticId)
        {
            int parKey = diagnosticId.HasValue ? diagnosticId.Value : int.MinValue;
            DataView dataSource = BOL.BusinessObject.GetByParentAsDataView<BOL.ImageFinding>(parKey);

            DxGrid1.DataSource = dataSource;
            DxGrid1.DataBind();

            DxGrid2.DataSource = new DataView(dataSource.Table);
            DxGrid2.DataBind();
        }
        
        /// <summary>
        /// Gets a start and end date filter for Diagnostics
        /// </summary>
        /// <returns></returns>
        private KeyValuePair<DateTime?, DateTime?> GetDiagnosticDateRange()
        {
            PatientProtocolController ppc = new PatientProtocolController(int.Parse(PatientProtocolId));
            DateTime? startDate = ppc.GetStatusDate(PatientProtocolController.OnStudy);
            // 90 days before on study
            if (startDate.HasValue)
                startDate = startDate.Value.AddDays(-90);
            DateTime? endDate = ppc.GetStatusDate(PatientProtocolController.OffStudy);
            return new KeyValuePair<DateTime?, DateTime?>(startDate, endDate); ;
        }

        private void ReloadPage(string diagnosticId)
        {
            string url = GetQueryString("PatientImagingPET.aspx") + "&diagnosticId=" + diagnosticId;
            Response.Redirect(url);
        }
    }
}