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
    public partial class PCCTCSurgicalHistory : BaseDataEntryControl
    {
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

        private static readonly string[] BIOPSY_NAMES = new string[]
        {
            "Biopsy",
            "Core Biopsy",
            "Needle Biopsy",
            "TRUS Biopsy"
        };

        private static readonly string[] PROSTATE_PROC_NAMES = new string[]
        {              
            "Fine Needle Aspirate",                
            "Needle Aspiration",               
            "Nerve Graft",
            "Orchiectomy",               
            "PLND",
            "TURP"
        };

        private DataTable procedureLookupNames = new DataTable();

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            LookupCodeDa da = new LookupCodeDa();
            DataView procNameView = da.GetLookupCodesByAttributeByNameAndValue("ProcName", "Baseline Form Prostate", "PCCTC").DefaultView;
            if (procNameView.Count == 0)
            {
                procNameView = CacheManager.GetLookupCodeList("ProcName").DefaultView;
            }
            if (procNameView.Count > 0)
            {
                procNameView.Sort = LookupCode.LkpCode + " ASC";
                procedureLookupNames = procNameView.ToTable();
            }
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
            ChronoDa da = new ChronoDa();
            int patientId = (int)Session[SessionKey.PatientId];

            // get a list of non-prostatectomy/biopsy procedures
            IEnumerable<Procedure> procedures = GetProcedures();
            DataView proceduresView = procedures.AsDataView<Procedure>();
            int prostateProceduresCount = proceduresView.Count;
            bool hasProstateProcedures = prostateProceduresCount > 0;

            PriorSurgeriesGrid.VisibleBlankRows = hasProstateProcedures ? 0 : 2;
            PriorSurgeriesGrid.DataSource = proceduresView;
            PriorSurgeriesGrid.DataBind();

            // set yes/no
            if (hasProstateProcedures)
                AdditionalAbsentEvent.YesChecked = true;
        }

        public override IEnumerable<BusinessObject> Save()
        {
            List<BusinessObject> records = new List<BusinessObject>();

            // save additional procedures
            PriorSurgeriesGrid.Save(patientId);

            // update absent event
            AdditionalAbsentEvent.SaveAbsentEvent(base.patientId);

            return records.ToArray();
        }

        protected void SetProcedures(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // set proc name drop down
                CaisisComboBox combo = e.Row.FindControl("ProcName") as CaisisComboBox;
                if (combo != null)
                {
                    combo.BuildComboData(procedureLookupNames, "LkpCode", "LkpDescription");
                }
            }
        }

        protected void PopulateAdditionalProcedures(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // set button states
                bool isLocked = (DataBinder.Eval(e.Row.DataItem, BusinessObject.LockedBy) + "") != "";
                var exists = (DataBinder.Eval(e.Row.DataItem, Procedure.ProcedureId) + "") == "";
                Control lockImg = e.Row.FindControl("LockImage");
                Control clearImg = e.Row.FindControl("ClearImage");
                lockImg.Visible = isLocked;
                clearImg.Visible = exists;
                // lock fields
                if (isLocked)
                    base.SetControlsLockState(e.Row, true);
            }
        }

        /// <summary>
        /// Get the Prostatectomy
        /// </summary>
        /// <returns></returns>
        private Procedure GetProstatectomy()
        {
            Procedure procedure = null;
            QueryProstateProcedures(PROSTATECTOMY_PROC_NAMES, (proName, procedures) =>
                {
                    // end search
                    if (procedures.Count() > 0)
                    {
                        procedure = procedures.First();
                        return false;
                    }
                    // get next not found
                    return true;
                });
            return procedure;
        }

        private Pathology GetPathology(int procedureId)
        {
            return BusinessObject.GetByFields<Pathology>(new Dictionary<string, object>
                {
                    { Patient.PatientId, base.patientId },
                    { Pathology.ProcedureId, procedureId }
                }).FirstOrDefault();
        }

        private Pathology GetRPPathology()
        {
            Procedure procedure = GetProstatectomy();
            if (procedure != null && procedure[Procedure.ProcName].ToString().Equals("RP", StringComparison.OrdinalIgnoreCase))
            {
                int procedureId = (int)procedure[Procedure.ProcedureId];
                return BOL.BusinessObject.GetByFields<Pathology>(new Dictionary<string, object>
                {
                    { Pathology.PatientId, base.patientId },
                    { Pathology.ProcedureId, procedureId },
                    { Pathology.PathSpecimenType, "RP" },
                }).FirstOrDefault();
            }
            return null;
        }

        /// <summary>
        /// Return a list of non-prostatectomy/biopsy procedures
        /// </summary>
        /// <returns></returns>
        private IEnumerable<Procedure> GetProcedures()
        {
            // get Procedure names
            var procedureNames = procedureLookupNames.AsEnumerable().Select(a => a[LookupCode.LkpCode].ToString());
            var procedures = BOL.BusinessObject.GetByParent<Procedure>(base.patientId);
            return from procedure in procedures
                   let procName = procedure[Procedure.ProcName].ToString()
                   let enteredby = procedure[Procedure.EnteredBy].ToString()
                   where
                       // only allow white listed procedures
                       procedureNames.Contains(procName, StringComparer.OrdinalIgnoreCase)
                       ||
                       // or specially stamped Procedures
                       (!string.IsNullOrEmpty(AppendToUserName) && enteredby.Contains(AppendToUserName))
                   // restrict to special procedures
                   where procName.ToLower() != "prostatectomy" && !PROSTATECTOMY_PROC_NAMES.Contains(procName) && !BIOPSY_NAMES.Contains(procName)
                   // special case
                   where !enteredby.Contains(" - PT")
                   // sort by date
                   orderby !procedure.IsNull(Procedure.ProcDate) ? (DateTime)procedure[Procedure.ProcDate] : DateTime.MaxValue
                   select procedure;
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
