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
    public partial class PCCTCAdditionalBiopsies : BaseDataEntryControl
    {
        private static readonly string[] BIOPSY_NAMES = new string[]
        {
            "Biopsy",
            "Core Biopsy",
            "Needle Biopsy",
            "TRUS Biopsy"
        };

        protected static readonly int BlankRows = 3;

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            base.InitDirtyControlTracking(BiopsiesRptr);
        }

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
        }

        public override void Populate()
        {
            // get a list of biopsies
            IEnumerable<Procedure> biopsies = GetBiopsies(BIOPSY_NAMES);
            // exclude diagnostic biopsy
            Procedure diagnosticBiopsy = BOL.ProtocolMgmtServices.GetDiagnosticBiopsy(patientId);
            // get a list of procedure ids
            List<int?> procedureIds = biopsies.Select(p => (int?)p[Procedure.ProcedureId]).ToList();
            int? diagnosticProcedureId = null;
            if (diagnosticBiopsy != null && diagnosticBiopsy.PrimaryKeyHasValue)
            {
                diagnosticProcedureId = (int)diagnosticBiopsy[Procedure.ProcedureId];
                if (procedureIds.Contains(diagnosticProcedureId))
                    procedureIds.Remove(diagnosticProcedureId);
            }

            // populate control
            Populate(procedureIds.ToArray());
        }

        public virtual void Populate(params int?[] procedureIds)
        {
            // load procedures including blank records
            List<Procedure> procedures = new List<Procedure>();
            List<int?> _procedureIds = procedureIds.ToList();
            List<int?> blankProcedureIds = Enumerable.Range(0, BlankRows).Select(i => (int?)null).ToList();
            _procedureIds.AddRange(blankProcedureIds);
            foreach (int? procedureId in _procedureIds)
            {
                Procedure biz = new Procedure();
                if (procedureId.HasValue)
                {
                    biz.Get(procedureId.Value);
                }
                procedures.Add(biz);
            }
            // build data source
            var dataSource = from p in procedures
                             // sort by real records
                             let hasRecord = p.PrimaryKeyHasValue
                             orderby hasRecord ? 0 : 1
                             // sort by date
                             orderby p.PrimaryKeyHasValue && !p.IsNull(Procedure.ProcDate) ? (DateTime)p[Procedure.ProcDate] : DateTime.MaxValue
                             select p;
            BiopsiesRptr.DataSource = dataSource;
            BiopsiesRptr.DataBind();
        }

        public override IEnumerable<BusinessObject> Save()
        {
            List<BusinessObject> records = new List<BusinessObject>();
            IEnumerable<Control> dirtyControls = base.GetDirtyInputControls(BiopsiesRptr);
            foreach (RepeaterItem dirtyRow in dirtyControls)
            {
                // key controls
                HiddenField procIdField = dirtyRow.FindControl("ProcedureId") as HiddenField;
                HiddenField pathIdField = dirtyRow.FindControl("PathologyId") as HiddenField;
                int? procedureId = null;
                if (!string.IsNullOrEmpty(procIdField.Value))
                    procedureId = int.Parse(procIdField.Value);
                int? pathologyId = null;
                if (!string.IsNullOrEmpty(pathIdField.Value))
                    pathologyId = int.Parse(pathIdField.Value);

                var inputs = CICHelper.GetCaisisInputControls(dirtyRow);
                var procFields = CICHelper.GetInputControlsByTable<Procedure>(inputs);
                var pathFields = CICHelper.GetInputControlsByTable<Pathology>(inputs);
                var biopsyPathFields = CICHelper.GetInputControlsByTable<BiopsyProstatePathology>(inputs);

                // special fields
                ICaisisInputControl pathType = dirtyRow.FindControl("PathSpecimenType") as ICaisisInputControl;
                ICaisisInputControl procDateText = dirtyRow.FindControl("ProcDateText") as ICaisisInputControl;
                ICaisisInputControl procDate = dirtyRow.FindControl("ProcDate") as ICaisisInputControl;
                ICaisisInputControl pathSite = dirtyRow.FindControl("PathSite") as ICaisisInputControl;

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
                    procedure[Procedure.ProcName] = pathType.Value;
                    procedure[Procedure.ProcSite] = pathSite.Value;
                    procedure[Procedure.ProcDateText] = procDateText.Value;
                    procedure[Procedure.ProcDate] = procDate.Value;
                    
                    base.SaveBizo(procedure);
                    procedureId = (int)procedure[Procedure.ProcedureId];
                    procIdField.Value = procedureId + "";
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
                        pathology[Pathology.PathDateText] = procDateText.Value;
                        pathology[Pathology.PathDate] = procDate.Value;
                    }
                    pathology[Pathology.PathSpecimenType] = pathType.Value;
                    pathology[Pathology.PathSite] = pathSite.Value;
                    CICHelper.SetBOValues(dirtyRow.Controls, pathology, base.patientId);
                    base.SaveBizo(pathology);
                    pathologyId = (int)pathology[Pathology.PathologyId];
                    pathIdField.Value = pathologyId + "";

                    // update biz list
                    records.Add(procedure);
                    records.Add(pathology);
                }
                // step 3: create biopsy path
                if (CICHelper.InputControlsHaveValue(biopsyPathFields) && pathologyId.HasValue)
                {
                    BiopsyProstatePathology biopsyPath = new BiopsyProstatePathology();
                    // load existing
                    biopsyPath.Get(pathologyId.Value);
                    // else create
                    if (biopsyPath.IsEmpty)
                        biopsyPath[BiopsyProstatePathology.PathologyId] = pathologyId;
                    CICHelper.SetBOValues(dirtyRow.Controls, biopsyPath, pathologyId.Value);
                    base.SaveBizo(biopsyPath);
                    records.Add(biopsyPath);
                }
            }
            //Populate();
            return records.ToArray();
        }

        protected void PopulateRowValues(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // get procedure
                Procedure procedure = e.Item.DataItem as Procedure;

                // key controls
                HiddenField procIdField = e.Item.FindControl("ProcedureId") as HiddenField;
                HiddenField pathIdField = e.Item.FindControl("PathologyId") as HiddenField;
                // static controls
                Control clearBtn = e.Item.FindControl("ClearBtn");
                Control lockImg = e.Item.FindControl("LockImage");
                clearBtn.Visible = false;
                lockImg.Visible = false;

                // validate real row
                if (procedure.PrimaryKeyHasValue)
                {
                    int procedureId = (int)procedure[Procedure.ProcedureId];
                    CICHelper.SetFieldValues(e.Item.Controls, procedure);
                    procIdField.Value = procedureId + "";
                    // set button states
                    bool isLocked = (procedure[Procedure.LockedBy] + "") != "";
                    lockImg.Visible = isLocked;

                    // get pathology
                    Pathology pathology = BusinessObject.GetByFields<Pathology>(new Dictionary<string, object>
                {
                    { Patient.PatientId, base.patientId },
                    { Pathology.ProcedureId, procedureId }
                }).FirstOrDefault();
                    if (pathology != null && pathology.PrimaryKeyHasValue)
                    {
                        // populate pathology
                        int pathologyId = (int)pathology[Pathology.PathologyId];
                        CICHelper.SetFieldValues(e.Item.Controls, pathology);
                        pathIdField.Value = pathologyId + "";
                        // populate path
                        BiopsyProstatePathology biopsyPath = BusinessObject.GetByParent<BiopsyProstatePathology>(pathologyId).FirstOrDefault();
                        if (biopsyPath != null && biopsyPath.PrimaryKeyHasValue)
                        {
                            CICHelper.SetFieldValues(e.Item.Controls, biopsyPath);
                        }
                    }
                    // no path: hide
                    else
                    {
                        e.Item.Visible = false;
                    }
                }
                // blank row
                else
                {
                    clearBtn.Visible = true;
                }
                // set script
                CaisisTextBox gg1 = e.Item.FindControl("PathGG1") as CaisisTextBox;
                CaisisTextBox gg2 = e.Item.FindControl("PathGG2") as CaisisTextBox;
                CaisisTextBox ggs = e.Item.FindControl("PathGGS") as CaisisTextBox;
                string script = string.Format("calculateBxResult('{0}', '{1}', '{2}');", gg1.ClientID, gg2.ClientID, ggs.ClientID);
                gg1.Attributes["onchange"] = script;
                gg2.Attributes["onchange"] = script;
            }
        }

        private IEnumerable<Procedure> GetBiopsies(IEnumerable<string> procNames)
        {
            var proceduresByType = from procName in procNames
                                   let procByType = BusinessObject.GetByFields<Procedure>(new Dictionary<string, object> { { Procedure.PatientId, base.patientId }, { Procedure.ProcName, procName } })
                                   select procByType;
            return proceduresByType.SelectMany(p => p);
        }
    }
}
