using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.Security;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.Controller;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class PatientRandomization : ProtocolMgmtPatientBasePage
    {
        bool areFieldsDirty = false;

        protected void MarkFormDirty(ICaisisInputControl sender, EventArgs e)
        {
            areFieldsDirty = true;
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.Form["ajax"]))
            {
                ProcessAjaxRequest();
            }
            if (!Page.IsPostBack)
            {
                BuildInterfaces();
            }
            // register save btn script
            PageUtil.RegitserControlPostBackScript(RandomizeBtn, "doSavePage");
        }

        private void ProcessAjaxRequest()
        {
            float? dbl = null;
            string parseData = Request.Form["psaData"];
            // parse date=psa data
            if (!string.IsNullOrEmpty(parseData))
            {
                var labsByDate = from p1 in parseData.Split('&')
                                 let p2 = p1.Split('=')
                                 where p2.Count() == 2
                                 let labDate = DateTime.Parse(p2[0])
                                 let labResult = float.Parse(p2[1])
                                 select new KeyValuePair<float, DateTime>(labResult, labDate);
                dbl = GetDoublingTime(labsByDate);

            }
            Response.Clear();
            Response.Write(dbl.HasValue ? dbl.ToString() : "");
            Response.End();
        }

        private float? GetDoublingTime(IEnumerable<KeyValuePair<float, DateTime>> labsByDate)
        {
            float? dbl = ProtocolMgmtUtil.GetPSADoublingTime(labsByDate);
            // smooth output
            if (dbl.HasValue)
            {
                dbl = (float)Math.Round(dbl.Value, 2);
            }
            return dbl;
        }

        private void BuildInterfaces()
        {
            BuildLabTestsInterface();
            BuildGleasonInterface();
        }

        private void BuildLabTestsInterface()
        {
            int patientProtocolId = int.Parse(PatientProtocolId);
            var labs = PatientProtocolController.GetPatientRelatedRecords<LabTest>(patientProtocolId);
            var sortedLabs = from lab in labs
                             where lab[LabTest.LabTest_Field].ToString() == "PSA"
                             orderby (lab.IsNull(LabTest.LabTestId) ? int.MaxValue : (int)lab[LabTest.LabTestId]) ascending
                             orderby (lab.IsNull(LabTest.LabDate) ? DateTime.MaxValue : (DateTime)lab[LabTest.LabDate]) ascending
                             select lab;
            var labsView = sortedLabs.AsDataView<LabTest>();

            LabTestsGrid.BlankRows = 15;
            LabTestsGrid.VisibleBlankRows = labsView.Count > 2 ? 2 : 4;
            LabTestsGrid.DataSource = labsView;
            LabTestsGrid.DataBind();

            // run inital calculation
            CalculatePSADoublingTime();
        }

        private void BuildGleasonInterface()
        {
            int patientProtocolId = int.Parse(PatientProtocolId);
            KeyValuePair<Pathology, BusinessObject>? gleasonPair = ProtocolMgmtUtil.GetGleasonPathologyRecord(patientProtocolId);
            if (gleasonPair.HasValue)
            {
                // get pair, determin type of pathology
                Pathology path = gleasonPair.Value.Key;
                BusinessObject pathProcedure = gleasonPair.Value.Value;
                // validation
                if (path.IsEmpty)
                    return;

                int pathologyId = (int)path[Pathology.PathologyId];
                string pathType = path[Pathology.PathSpecimenType].ToString();
                // manually set Path Fields
                PathDateText.Value = path[Pathology.PathDateText].ToString();
                PathDate.Value = path[Pathology.PathDate].ToString();
                PathSpecimenType.Value = pathType;
                // manuall set child records
                if (pathProcedure is ProstatectomyPathology)
                {
                    ProstatectomyPathology prostatectomy = pathProcedure as ProstatectomyPathology;
                    GleasonField1.Text = prostatectomy[ProstatectomyPathology.PathGG1].ToString();
                    GleasonField2.Text = prostatectomy[ProstatectomyPathology.PathGG2].ToString();
                    GleasonFieldSum.Text = prostatectomy[ProstatectomyPathology.PathGGS].ToString();
                }
                else if (pathProcedure is BiopsyProstatePathology)
                {
                    BiopsyProstatePathology biopsy = pathProcedure as BiopsyProstatePathology;
                    GleasonField1.Text = biopsy[BiopsyProstatePathology.PathGG1].ToString();
                    GleasonField2.Text = biopsy[BiopsyProstatePathology.PathGG2].ToString();
                    GleasonFieldSum.Text = biopsy[BiopsyProstatePathology.PathGGS].ToString();
                }
                else
                {
                    CICHelper.ClearCaisisInputControlValues(GleasonFields);
                }
            }
            else
            {
                CICHelper.ClearCaisisInputControlValues(GleasonFields);
            }
        }

        protected void SaveDetails(object sender, EventArgs e)
        {
            if (areFieldsDirty)
                SaveDetails();
            // register parent page update
            //string script = "if(window.parent.doSavePage) { window.parent.doSavePage(); }";
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "saveParentPage", script, true);

            // register parent update script
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "goToNextRegistrationStep", "goToNextRegistrationStep();", true);
        }

        protected void CalculatePSADoublingTime(object sender, EventArgs e)
        {
            CalculatePSADoublingTime();
        }

        protected void RebindOnDelete(object sender, GridViewDeletedEventArgs e)
        {
            // cleanup related record
            int patientProtocolId = int.Parse(PatientProtocolId);

            string labTestId = e.Keys[LabTest.LabTestId].ToString();
            if (!string.IsNullOrEmpty(labTestId))
            {
                RelatedRecordController.DeleteRelatedRecord(new LabTest().TableName, int.Parse(labTestId), new PatientProtocol().TableLabel, patientProtocolId);
            }
            // rebuild interface
            BuildLabTestsInterface();
        }

        protected void CalculatePSADoublingTime()
        {
            var labsByDate = from row in LabTestsGrid.Rows.Cast<GridViewRow>()
                             let lookup = CICHelper.GetCaisisInputControlDictionary(row)
                             let labResult = lookup[LabTest.LabResult].Value
                             let labDate = lookup[LabTest.LabDate].Value
                             where !string.IsNullOrEmpty(labResult) && !string.IsNullOrEmpty(labDate)
                             select new KeyValuePair<float, DateTime>(float.Parse(labResult), DateTime.Parse(labDate));
            float? dbl = GetDoublingTime(labsByDate);
            if (dbl.HasValue)
            {
                PSADoublingTime.Text = dbl + " Months";
            }
            else
            {
                PSADoublingTime.Text = "N/A";
            }
        }

        /// <summary>
        /// Inserts/Updates the relevent labs and gleason calculations
        /// </summary>
        private void SaveDetails()
        {
            // validation
            int patientId = int.Parse(BaseDecryptedPatientId);
            int patientProtocolId = int.Parse(PatientProtocolId);
            PatientProtocol patientProtocol = new PatientProtocol();
            patientProtocol.Get(patientProtocolId);

            var relatedLabTestIds = GetRelatedLabTestIds(patientProtocolId);

            // LABS (PSA)
            List<KeyValuePair<float, DateTime>> labResults = new List<KeyValuePair<float, DateTime>>();
            foreach (GridViewRow row in LabTestsGrid.Rows)
            {
                LabTest lab = new LabTest();
                // load???
                string currentRowId = LabTestsGrid.DataKeys[row.RowIndex][LabTest.LabTestId].ToString();
                if (!string.IsNullOrEmpty(currentRowId))
                {
                    lab.Get(int.Parse(currentRowId));
                }
                CICHelper.SetBOValues(row.Controls, lab, patientId);
                if (!lab.IsEmpty)
                {
                    lab[LabTest.LabTest_Field] = "PSA";
                    lab.Save();
                    int labTestId = (int)lab[LabTest.LabTestId];

                    string labTest = lab[LabTest.LabTest_Field].ToString();
                    string labResult = lab[LabTest.LabResult].ToString();
                    float labResultValue = 0;
                    if (labTest.Equals("PSA") && float.TryParse(labResult, out labResultValue) && !lab.IsNull(LabTest.LabDate))
                    {
                        DateTime labDate = (DateTime)lab[LabTest.LabDate];
                        labResults.Add(new KeyValuePair<float, DateTime>(labResultValue, labDate));
                    }

                    // RELATED RECORD
                    if (!relatedLabTestIds.Contains(labTestId))
                    {
                        BOL.RelatedRecord relatedRecord = RelatedRecordController.CreateRelatedRecord(lab, patientProtocol);
                    }
                }
            }

            // calculate doubling time
            float? dbl = ProtocolMgmtUtil.GetPatientPSADoublingTime(patientProtocolId);
            if (dbl.HasValue)
            {
                PSADoublingTime.Text = dbl + " Months";
            }
            else
            {
                PSADoublingTime.Text = "N/A";
            }

            // GLEASON SCORE
            Pathology pathology = PatientProtocolController.GetPatientRelatedRecords<Pathology>(patientProtocolId).FirstOrDefault();
            // create new patholgy if needed
            if (!string.IsNullOrEmpty(PathSpecimenType.Value))
            {
                bool isNewPathology = pathology == null;
                string pathType = PathSpecimenType.Value;
                if (isNewPathology)
                {
                    pathology = new Pathology();
                    pathology[Pathology.PatientId] = patientId;
                }
                pathology[Pathology.PathSpecimenType] = pathType;
                pathology[Pathology.PathDateText] = PathDateText.Value;
                pathology[Pathology.PathDate] = PathDate.Value;
                pathology.Save();
                if (!pathology.IsEmpty)
                {
                    int pathologyId = (int)pathology[Pathology.PathologyId];
                    // create child record
                    if (pathType.Equals("Prostatectomy"))
                    {
                        var prostatectomy = BusinessObject.GetByParent<ProstatectomyPathology>(pathologyId).FirstOrDefault();
                        if (prostatectomy == null)
                        {
                            prostatectomy = new ProstatectomyPathology();
                            prostatectomy[ProstatectomyPathology.PathologyId] = pathologyId;
                        }
                        prostatectomy[ProstatectomyPathology.PathGG1] = GleasonField1.Text;
                        prostatectomy[ProstatectomyPathology.PathGG2] = GleasonField2.Text;
                        prostatectomy[ProstatectomyPathology.PathGGS] = GleasonFieldSum.Text;
                        prostatectomy.Save();
                    }
                    else if (pathType == "Biopsy")
                    {
                        var biopsy = BusinessObject.GetByParent<BiopsyProstatePathology>(pathologyId).FirstOrDefault();
                        if (biopsy == null)
                        {
                            biopsy = new BiopsyProstatePathology();
                            biopsy[BiopsyProstatePathology.PathologyId] = pathologyId;
                        }
                        biopsy[BiopsyProstatePathology.PathGG1] = GleasonField1.Text;
                        biopsy[BiopsyProstatePathology.PathGG2] = GleasonField2.Text;
                        biopsy[BiopsyProstatePathology.PathGGS] = GleasonFieldSum.Text;
                        biopsy.Save();
                    }
                    // create related record if needed
                    if (isNewPathology)
                    {
                        BOL.RelatedRecord relatedPathology = RelatedRecordController.CreateRelatedRecord(pathology, patientProtocol);
                    }
                }
            }

            // rebuild UI
            BuildInterfaces();
        }


        /// <summary>
        /// Return a list of LabTest Ids related to the current PatientProtocol
        /// </summary>
        /// <param name="patientProtocolId"></param>
        /// <returns></returns>
        private IEnumerable<int> GetRelatedLabTestIds(int patientProtocolId)
        {
            var relatedLabs = PatientProtocolController.GetPatientRelatedRecords(patientProtocolId, "LabTests");
            return relatedLabs.Select(b => int.Parse(b[RelatedRecord.SrcPrimaryKey].ToString()));
        }
    }
}