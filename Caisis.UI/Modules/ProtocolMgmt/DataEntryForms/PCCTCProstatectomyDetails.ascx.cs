using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.ComponentModel;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt.DataEntryForms
{
    /// <summary>
    /// 
    /// </summary>
    public partial class PCCTCProstatectomyDetails : BaseDataEntryControl
    {
        /// <summary>
        /// Marks the special stamp in Procedure's EnteredBy to mark a baseline record
        /// </summary>
        private static readonly string ENTERED_BY_MATCH = "PT";

        private static readonly string[] PROSTATECTOMY_PROC_NAMES = new string[]
        {
            "Radical Prostatectomy",
            "RP",
            "RRP",
            "LP",
            "RALP",
            "CP",
            "PP",
            "SalvRP",
            "SalvLP",
            "SalvCP",
            "Partial RP"
        };

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            base.InitDirtyControlTracking(ProstatectomyDetailsFields);
            base.InitDirtyControlTracking(GradeDetailsPanel);
        }

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        public override void Populate()
        {
            BuildSurgicalHistory();
        }

        protected void BuildSurgicalHistory()
        {
            PopulateProstatectomyDetails();

            ChronoDa da = new ChronoDa();
            int patientId = (int)Session[SessionKey.PatientId];

            // build a list of prior surgeries
            DataTable proceduresTable = da.GetChronoList(patientId, "Procedures", Page.User.Identity.Name).Tables[0];
        }

        private void PopulateProstatectomyDetails()
        {
            // build Prostatectomy: single entry
            int? prostatectomyId = null;
            int? pathologyId = null;
            Procedure prostatectomy = GetProstatectomy();
            if (prostatectomy != null && prostatectomy.PrimaryKeyHasValue)
            {
                prostatectomyId = (int?)prostatectomy[Procedure.ProcedureId];
                Pathology pathology = GetPathology(prostatectomyId.Value);
                if (pathology != null && pathology.PrimaryKeyHasValue)
                {
                    pathologyId = (int)pathology[Pathology.PathologyId];
                }
            }

            PopulateProstatectomyFields(prostatectomyId);

            // determine missed event
            ProstatectomyAbsentEvent.SetAbsentEvent(base.patientId);
            // set "yes"
            if (prostatectomyId.HasValue)
                ProstatectomyAbsentEvent.YesChecked = true;

            // populate Grade Details
            PopulateGradeDetails(pathologyId);
        }

        protected void PopulateProstatectomyFields(int? procedureId)
        {
            // static controls
            LockImage.Visible = false;

            // valida row
            if (procedureId.HasValue)
            {
                Procedure procedure = new Procedure();
                procedure.Get(procedureId.Value);
                CICHelper.SetFieldValues(ProstatectomyDetailsFields.Controls, procedure);
                ProcedureId.Value = procedureId.Value + "";
                // set button states
                bool isLocked = (procedure[Procedure.LockedBy] + "") != "";
                LockImage.Visible = isLocked;

                // lock fields
                if (isLocked)
                    base.SetControlsLockState(ProstatectomyDetailsFields, true);

                // get pathology
                Pathology pathology = GetPathology(procedureId.Value);
                if (pathology != null && pathology.PrimaryKeyHasValue)
                {
                    // populate pathology
                    int pathologyId = (int)pathology[Pathology.PathologyId];
                    CICHelper.SetFieldValues(ProstatectomyDetailsFields.Controls, pathology);
                    PathologyId.Value = pathologyId + "";
                    // populate path
                    ProstatectomyPathology prostatePath = BusinessObject.GetByParent<ProstatectomyPathology>(pathologyId).FirstOrDefault();
                    if (prostatePath != null && prostatePath.PrimaryKeyHasValue)
                    {
                        CICHelper.SetFieldValues(ProstatectomyDetailsFields.Controls, prostatePath);
                    }
                }
                // no path: hide
                else
                {
                    //e.Item.Visible = false;
                }
            }
            // set script
            string script = string.Format("calculateBxResult('{0}', '{1}', '{2}');", PathGG1.ClientID, PathGG2.ClientID, PathGGS.ClientID);
            PathGG1.Attributes["onchange"] = script;
            PathGG2.Attributes["onchange"] = script;
        }

        public void PopulateGradeDetails(int? pathologyId)
        {
            // clear fields
            CICHelper.ClearCaisisInputControlValues(GradeDetailsPanel);
            if (pathologyId.HasValue)
            {
                // set pathstagegrade
                PathologyStageGrade pathStageGrade = BusinessObject.GetByParent<PathologyStageGrade>(pathologyId.Value).FirstOrDefault();
                if (pathStageGrade != null)
                {
                    int pathologyStageGradeId = (int)pathStageGrade[PathologyStageGrade.PathologyStageGradeId];
                    CICHelper.SetFieldValues(this.Controls, pathStageGrade);
                    PathologyStageGradeId.Value = pathologyStageGradeId + "";
                }
            }
        }

        public override IEnumerable<BusinessObject> Save()
        {
            List<BusinessObject> records = new List<BusinessObject>();
            // save prostatectomy
            records.AddRange(SaveProstatectomy());

            // update absent event
            ProstatectomyAbsentEvent.SaveAbsentEvent(base.patientId);

            return records.ToArray();
        }

        private IEnumerable<BusinessObject> SaveProstatectomy()
        {
            // save prostatectomies
            List<BusinessObject> records = new List<BusinessObject>();
            IEnumerable<Control> dirtyControls = base.GetDirtyInputControls(ProstatectomyDetailsFields);
            var inputs = CICHelper.GetCaisisInputControls(ProstatectomyDetailsFields);
            bool isDirty = dirtyControls.Contains(ProstatectomyDetailsFields);
            if (isDirty)
            {
                int? procedureId = null;
                if (!string.IsNullOrEmpty(ProcedureId.Value))
                    procedureId = int.Parse(ProcedureId.Value);
                int? pathologyId = null;
                if (!string.IsNullOrEmpty(PathologyId.Value))
                    pathologyId = int.Parse(PathologyId.Value);

                var procFields = CICHelper.GetInputControlsByTable<Procedure>(inputs);
                var pathFields = CICHelper.GetInputControlsByTable<Pathology>(inputs);
                var prostatectomyPathFields = CICHelper.GetInputControlsByTable<ProstatectomyPathology>(inputs);

                // create/update proc
                if (CICHelper.InputControlsHaveValue(procFields))
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
                    CICHelper.SetBOValues(ProstatectomyDetailsFields.Controls, procedure, base.patientId);

                    // copy field values
                    procedure[Procedure.ProcName] = ProcName.Value;
                    procedure[Procedure.ProcDateText] = ProcDateText.Value;
                    procedure[Procedure.ProcDate] = ProcDate.Value;
                    // special case: special stamp to mark inital proc
                    //base.SaveBizo(procedure);
                    procedure.AppendToUserName(GetEnteredBySuffix());
                    procedure.Save();

                    procedureId = (int)procedure[Procedure.ProcedureId];
                    ProcedureId.Value = procedureId + "";

                    // update biz list
                    records.Add(procedure);
                }
                // step 2: create/udpate path
                if (pathologyId.HasValue || (CICHelper.InputControlsHaveValue(pathFields) && procedureId.HasValue))
                {
                    Pathology pathology = new Pathology();
                    if (pathologyId.HasValue)
                    {
                        pathology.Get(pathologyId.Value);
                    }
                    else
                    {
                        pathology[Pathology.PatientId] = base.patientId;
                        pathology[Pathology.ProcedureId] = procedureId;
                        pathology[Pathology.PathSpecimenType] = ProcName.Value;
                        pathology[Pathology.PathDateText] = ProcDateText.Value;
                        pathology[Pathology.PathDate] = ProcDate.Value;
                        pathology[Pathology.PathDisease] = "Prostate";
                    }
                    CICHelper.SetBOValues(ProstatectomyDetailsFields.Controls, pathology, base.patientId);
                    base.SaveBizo(pathology);
                    pathologyId = (int)pathology[Pathology.PathologyId];
                    PathologyId.Value = pathologyId + "";
                    records.Add(pathology);
                }
                // step 3: create/udpate Prostatectomy Path
                if (CICHelper.InputControlsHaveValue(prostatectomyPathFields) && pathologyId.HasValue)
                {
                    ProstatectomyPathology prostatePath = new ProstatectomyPathology();
                    // load existing
                    prostatePath.Get(pathologyId.Value);
                    // else create
                    if (prostatePath.IsEmpty)
                        prostatePath[ProstatectomyPathology.PathologyId] = pathologyId;
                    CICHelper.SetBOValues(ProstatectomyDetailsFields.Controls, prostatePath, pathologyId.Value);
                    base.SaveBizo(prostatePath);
                    records.Add(prostatePath);
                }
            }
            // save grade details
            if (!string.IsNullOrEmpty(PathologyId.Value))
            {
                int pathologyId = int.Parse(PathologyId.Value);
                records.AddRange(SaveGradeDetails(pathologyId));
            }
            return records;
        }

        public IEnumerable<BusinessObject> SaveGradeDetails(int pathologyId)
        {
            List<BusinessObject> records = new List<BusinessObject>();
            bool formIsDirty = dirtyControls.Contains(GradeDetailsPanel);
            if (formIsDirty)
            {
                var inputs = CICHelper.GetCaisisInputControls(GradeDetailsPanel);
                var stageGradeFields = CICHelper.GetInputControlsByTable<PathologyStageGrade>(inputs);
                bool stageGradeHasValue = CICHelper.InputControlsHaveValue(stageGradeFields);
                if (stageGradeHasValue)
                {
                    int? pathStageGradeId = null;
                    if (!string.IsNullOrEmpty(PathologyStageGradeId.Value))
                        pathStageGradeId = int.Parse(PathologyStageGradeId.Value);
                    PathologyStageGrade pathStageGrade = new PathologyStageGrade();
                    // udpate
                    if (pathStageGradeId.HasValue)
                    {
                        pathStageGrade.Get(pathStageGradeId.Value);
                    }
                    // insert
                    else
                    {
                        pathStageGrade[PathologyStageGrade.PathologyId] = pathologyId;
                    }
                    CICHelper.SetBOValues(GradeDetailsPanel.Controls, pathStageGrade, pathologyId);
                    base.SaveBizo(pathStageGrade);
                    if (pathStageGrade.PrimaryKeyHasValue)
                    {
                        pathStageGradeId = (int)pathStageGrade[PathologyStageGrade.PathologyStageGradeId];
                        PathologyStageGradeId.Value = pathStageGradeId + "";
                        records.Add(pathStageGrade);
                    }
                }
            }
            return records.ToArray();
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

        /// <summary>
        /// Get the Prostatectomy
        /// </summary>
        /// <returns></returns>
        private Procedure GetProstatectomy()
        {
            // 1st pass: first baseline stamped Prostatectomy procedure
            string enteredBy = GetEnteredBySuffix();
            IEnumerable<Procedure> patientProcedures = BOL.BusinessObject.GetByParent<Procedure>(patientId);
            Procedure prostatectomy = patientProcedures.FirstOrDefault(p => p[Procedure.EnteredBy].ToString().Contains(enteredBy) || p[Procedure.UpdatedBy].ToString().Contains(enteredBy));
            // 2nd pass: if no prostatectomy found, search by procedure names
            if (prostatectomy == null)
            {
                var foundProstatectomies = from p in patientProcedures
                                           let procName = p[Procedure.ProcName] + ""
                                           // validate date
                                           where !p.IsNull(Procedure.ProcDate)
                                           let procDate = (DateTime)p[Procedure.ProcDate]
                                           // match special proc names or prostatectomy
                                           where procName.ToLower().Contains("prostatectomy") || PROSTATECTOMY_PROC_NAMES.Contains(procName)
                                           // order by date
                                           orderby procDate ascending
                                           select p;
                prostatectomy = foundProstatectomies.FirstOrDefault();
            }
            return prostatectomy;
        }

        private Pathology GetPathology(int procedureId)
        {
            return BusinessObject.GetByFields<Pathology>(new Dictionary<string, object>
                {
                    { Patient.PatientId, base.patientId },
                    { Pathology.ProcedureId, procedureId }
                }).FirstOrDefault();
        }

        private IEnumerable<Procedure> GetProstateProcedures(IEnumerable<string> procNames)
        {
            List<Procedure> prostateProcedures = new List<Procedure>();
            QueryProstateProcedures(procNames, (procName, procedures) =>
                {
                    prostateProcedures.AddRange(procedures);
                    return true;
                });
            return prostateProcedures;
        }

        private void QueryProstateProcedures(IEnumerable<string> procNames, Func<string, IEnumerable<Procedure>, bool> callback)
        {
            foreach (string procName in procNames)
            {
                IEnumerable<Procedure> proceduresByType = BusinessObject.GetByFields<Procedure>(new Dictionary<string, object> { { Procedure.PatientId, base.patientId }, { Procedure.ProcName, procName } });
                if (callback(procName, proceduresByType))
                    continue;
            }
        }
    }
}
