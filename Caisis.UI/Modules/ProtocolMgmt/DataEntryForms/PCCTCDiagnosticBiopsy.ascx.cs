using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt.DataEntryForms
{
    /// <summary>
    ///	
    /// </summary>
    public partial class PCCTCDiagnosticBiopsy : BaseDataEntryControl
    {
        /// <summary>
        /// Marks the special stamp in Procedure's EnteredBy to mark a baseline record
        /// </summary>
        private static readonly string ENTERED_BY_MATCH = "BX";

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        public override void Populate()
        {
            Procedure diagnosticProcedure = GetBaselineBiopsy();
            int? diagnosticProcedureId = null;
            if (diagnosticProcedure != null)
            {
                // set procedure
                diagnosticProcedureId = (int)diagnosticProcedure[Procedure.ProcedureId];
                ProcedureId.Value = diagnosticProcedureId + "";
                Procedure procedure = new Procedure();
                procedure.Get(diagnosticProcedureId.Value);
                CICHelper.SetFieldValues(DiagnosticBiopsyFields.Controls, procedure);
                // set path stage grade
                PathologyStageGradeId.Value = "";
                Pathology pathology = BusinessObject.GetByFields<Pathology>(new Dictionary<string, object> { { Pathology.PatientId, base.patientId }, { Pathology.ProcedureId, diagnosticProcedureId.Value } }).FirstOrDefault();
                if (pathology != null)
                {
                    int pathologyId = (int)pathology[Pathology.PathologyId];
                    PathologyId.Value = pathologyId + "";
                    CICHelper.SetFieldValues(DiagnosticBiopsyFields.Controls, pathology);
                    PathologyStageGrade stageGrade = BusinessObject.GetByParent<PathologyStageGrade>(pathologyId).FirstOrDefault();
                    PathologyStageGradeId.Value = stageGrade != null ? stageGrade[PathologyStageGrade.PathologyStageGradeId].ToString() : "";
                    if (stageGrade != null)
                    {
                        CICHelper.SetFieldValues(StageGradePanel.Controls, stageGrade);
                    }
                }
            }
            else
            {
                PathologyStageGradeId.Value = "";
            }

            // populate
            // static controls
            //            Control clearBtn = e.Item.FindControl("ClearBtn");
            //          Control lockImg = e.Item.FindControl("LockImage");
            //        clearBtn.Visible = false;
            //      lockImg.Visible = false;

            // get procedure
            int? procedureId = null;
            if (!string.IsNullOrEmpty(ProcedureId.Value))
                procedureId = int.Parse(ProcedureId.Value);
            // valida row
            if (procedureId.HasValue)
            {
                Procedure procedure = new Procedure();
                procedure.Get(procedureId.Value);
                CICHelper.SetFieldValues(this.Controls, procedure);
                ProcedureId.Value = procedureId.Value + "";
                // set button states
                bool isLocked = (procedure[Procedure.LockedBy] + "") != "";
                // lockImg.Visible = isLocked;

                // get pathology
                Pathology pathology = BusinessObject.GetByFields<Pathology>(new Dictionary<string, object>
                {
                    { Patient.PatientId, base.patientId },
                    { Pathology.ProcedureId, procedureId.Value }
                }).FirstOrDefault();
                if (pathology != null && pathology.PrimaryKeyHasValue)
                {
                    // populate pathology
                    int pathologyId = (int)pathology[Pathology.PathologyId];
                    CICHelper.SetFieldValues(this.Controls, pathology);
                    PathologyId.Value = pathologyId + "";
                    // populate path
                    BiopsyProstatePathology biopsyPath = BusinessObject.GetByParent<BiopsyProstatePathology>(pathologyId).FirstOrDefault();
                    if (biopsyPath != null && biopsyPath.PrimaryKeyHasValue)
                    {
                        CICHelper.SetFieldValues(this.Controls, biopsyPath);
                    }
                }
            }
            // blank row
            else
            {
                // clearBtn.Visible = true;
            }
            // set script
            string script = string.Format("calculateBxResult('{0}', '{1}', '{2}');", PathGG1.ClientID, PathGG2.ClientID, PathGGS.ClientID);
            PathGG1.Attributes["onchange"] = script;
            PathGG2.Attributes["onchange"] = script;
        }

        public override IEnumerable<BusinessObject> Save()
        {
            // save diag biopsy
            List<BusinessObject> records = new List<BusinessObject>();
            IEnumerable<ICaisisInputControl> stageGradeFields = CICHelper.GetCaisisInputControls(StageGradePanel);

            int? procedureId = null;
            if (!string.IsNullOrEmpty(ProcedureId.Value))
                procedureId = int.Parse(ProcedureId.Value);
            int? pathologyId = null;
            if (!string.IsNullOrEmpty(PathologyId.Value))
                pathologyId = int.Parse(PathologyId.Value);

            var inputs = CICHelper.GetCaisisInputControls(this);
            var procFields = CICHelper.GetInputControlsByTable<Procedure>(inputs);
            var pathFields = CICHelper.GetInputControlsByTable<Pathology>(inputs);
            var biopsyPathFields = CICHelper.GetInputControlsByTable<BiopsyProstatePathology>(inputs);

            // validation
            if (CICHelper.InputControlsHaveValue(pathFields))
            {
                // step 1: create procedure
                Procedure procedure = new Procedure();
                if (procedureId.HasValue)
                {
                    procedure.Get(procedureId.Value);
                }
                else
                {
                    procedure[Procedure.PatientId] = base.patientId;
                }
                // copy field values
                procedure[Procedure.ProcName] = PathSpecimenType.Value;
                procedure[Procedure.ProcDateText] = ProcDateText.Value;
                procedure[Procedure.ProcDate] = ProcDate.Value;
                procedure[Procedure.ProcSite] = PathSite.Value;
                // get special stamp
                procedure.AppendToUserName(GetEnteredBySuffix());
                procedure.Save();
                //base.SaveBizo(procedure);
                procedureId = (int)procedure[Procedure.ProcedureId];
                ProcedureId.Value = procedureId + "";
                records.Add(procedure);

                // step 2: create path
                Pathology pathology = new Pathology();
                if (pathologyId.HasValue)
                {
                    pathology.Get(pathologyId.Value);
                }
                else
                {
                    pathology[Pathology.PatientId] = base.patientId;
                    pathology[Pathology.ProcedureId] = procedureId;
                    pathology[Pathology.PathDateText] = ProcDateText.Value;
                    pathology[Pathology.PathDate] = ProcDate.Value;
                }
                pathology[Pathology.PathSpecimenType] = PathSpecimenType.Value;
                pathology[Pathology.PathSite] = PathSite.Value;
                CICHelper.SetBOValues(this.Controls, pathology, base.patientId);
                base.SaveBizo(pathology);
                pathologyId = (int)pathology[Pathology.PathologyId];
                PathologyId.Value = pathologyId + "";
                records.Add(pathology);

                // step 3: create biopsy path
                if (CICHelper.InputControlsHaveValue(biopsyPathFields))
                {
                    BiopsyProstatePathology biopsyPath = BusinessObject.GetByParent<BiopsyProstatePathology>(pathologyId.Value).FirstOrDefault();
                    // new
                    if (biopsyPath == null)
                    {
                        biopsyPath = new BiopsyProstatePathology();
                        biopsyPath[BiopsyProstatePathology.PathologyId] = pathologyId.Value;
                    }
                    CICHelper.SetBOValues(this.Controls, biopsyPath, pathologyId.Value);
                    base.SaveBizo(biopsyPath);
                }

                // step 4: save path stage grade
                if (CICHelper.InputControlsHaveValue(stageGradeFields) && !string.IsNullOrEmpty(PathStageT.Value))
                {
                    int? stageGradeId = null;
                    // load by pri key
                    if (!string.IsNullOrEmpty(PathologyStageGradeId.Value))
                    {
                        stageGradeId = int.Parse(PathologyStageGradeId.Value);
                    }
                    // get par key for save
                    else if (!string.IsNullOrEmpty(PathologyId.Value))
                    {
                        pathologyId = int.Parse(PathologyId.Value);
                    }
                    if (pathologyId.HasValue || stageGradeId.HasValue)
                    {
                        PathologyStageGrade stageGrade = base.SaveRecord<PathologyStageGrade>(StageGradePanel, pathologyId, stageGradeId);
                        PathologyStageGradeId.Value = stageGrade[PathologyStageGrade.PathologyStageGradeId] + "";
                        records.Add(stageGrade);
                    }
                }
            }

            //Populate();
            return records;
        }

        private Procedure GetBaselineBiopsy()
        {            
            // 1st pass: first baseline Biopsy procedure
            Procedure baselineBiopsy = ProtocolMgmtServices.GetBaselineBiopsy(base.patientId); 
            if (baselineBiopsy != null)
            {
                return baselineBiopsy;
            }
            // 2nd pass: if no biopsy found, use diagnostic biopsy
            else
            {
                Procedure diagnosticProcedure = BOL.ProtocolMgmtServices.GetDiagnosticBiopsy(patientId);
                return diagnosticProcedure;
            }
        }

        /// <summary>
        /// Gets the specially formatted EnteredBy/UpdatedBy stamp to indicate a baseline prostatectomy
        /// </summary>
        /// <returns></returns>
        private string GetEnteredBySuffix()
        {
            string enteredBy = string.Format("{0} - {1}", AppendToUserName, ENTERED_BY_MATCH);
            return enteredBy;
        }
    }
}
