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
using System.Collections.Specialized;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminManageSpecimens : ProtocolMgmtBaseAdminPage
    {
        protected static readonly Dictionary<string, string> DISPLAY_COLUMNS = new Dictionary<string, string>
        {
            { "PtProtocolStudyId", "Study ID" },
            { "SpecimenReferenceNumber", "Specimen ID" },
            { "SpecimenSubType", "Specimen Type" },
            { "AccessionAnatomicSite", "Biopsy Site" },
            { "AccessionProcName", "Collection Method" },
            { "SpecimenPreservationType", "Processing Method" },
            { "AccessionDate", "Collection Date" },
            { "SpecimenCollectionTime", "Collection Time" },
            { "SpecimenFrozenTime", "Time Frozen" },
            { "SpecimenStatus", "Status" }
       };

        private SpecimenManagerDa da = new SpecimenManagerDa();

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            InitSpecimensGrid();
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // build subject selection
                BuildSubjects();
                //// get default list
                //DataTable defaultSpecimens = GetSpecimensInventory("", "");
                //// build list
                //BuildInventory(defaultSpecimens.DefaultView);
            }
        }

        private void BuildSubjects()
        {
            int protocolId = int.Parse(BaseProtocolId);
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]) + "";
            DataTable patients = ProtocolMgmtDa.GetPatientsByProtocol(protocolId, datasetSQL, base.ShowPatientIdentifiers(), true);

            SubjectSelection.DataSource = patients;
            SubjectSelection.DataBind();
        }

        /// <summary>
        /// Dynamically set columns
        /// </summary>
        private void InitSpecimensGrid()
        {
            SpecimenAccession accession = new SpecimenAccession();
            Specimen specimen = new Specimen();
            var accessionFields = accession.FieldNames;
            var specimenFields = specimen.FieldNames;
            var specimenMetadata = CICHelper.GetCaisisInputControlsByTableName(specimen.TableName, "").ToDictionary(f => f.Field, f => f);
            //SpecimenInventory.Columns.Clear();
            foreach (var column in GetSpecimenColumns())
            {
                string fieldName = column.Key;
                string fieldLabel = column.Value;
                // get input
                CaisisTextBox defaultInput = new CaisisTextBox();
                ICaisisInputControl fieldInput = defaultInput;
                // special case: lookup controls map to distinct combo values
                if (specimenFields.Contains(fieldName) && specimenMetadata.ContainsKey(fieldName))
                {
                    fieldInput = specimenMetadata[fieldName];
                    // select, radio list, check list => combo box
                    if (fieldInput is ICaisisLookupControl && !(fieldInput is CaisisComboBox))
                        fieldInput = new CaisisComboBox();
                    fieldInput.Table = specimen.TableName;
                }

                // global
                fieldInput.Field = fieldName;
                fieldInput.FieldLabel = fieldLabel;
                fieldInput.ShowLabel = false;

                CaisisDataBoundField boundField = new CaisisDataBoundField(fieldInput);
                SpecimenInventory.Columns.Add(boundField);
            }
            // only enable specimen fields for edit
            SpecimenInventory.RowCreated += (o, e) =>
                {
                    var inputs = CICHelper.GetCaisisInputControls(e.Row);
                    foreach (var fieldInput in inputs)
                    {
                        if (fieldInput.Table == specimen.TableName)
                        {
                            fieldInput.Enabled = true;
                            // special lookup distinct
                            if (fieldInput is ICaisisLookupControl)
                                (fieldInput as ICaisisLookupControl).LookupDistinct = string.Format("{0};{1};{2}", specimen.TableName, fieldInput.Field, fieldInput.Field);
                        }
                        else
                        {
                            fieldInput.Enabled = false;
                        }
                    }
                };
        }

        protected void BuildPatientSpecimens(object sender, EventArgs e)
        {
            DataView inventory = null;
            string subjectId = SubjectSelection.Value;
            if (!string.IsNullOrEmpty(subjectId))
            {
                inventory = GetSpecimensInventory(subjectId, PatientProtocol.PtProtocolStudyId).DefaultView;
            }
            BuildInventory(inventory);
        }

        protected void BindSpecimenColumns(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemIndex > -1)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                string[] values = DISPLAY_COLUMNS.Keys.Select(c => string.Format(c.EndsWith("Date") ? "{0:d}" : "{0}", row[c])).ToArray();
                Repeater columnsRptr = e.Item.FindControl("SpecimenInventoryColumns") as Repeater;
                columnsRptr.DataSource = values;
                columnsRptr.DataBind();
            }
        }

        protected void UpdateSpecimens(object sender, EventArgs e)
        {
            foreach (GridViewRow dirtyRow in SpecimenInventory.DirtyGridRows)
            {
                var keys = SpecimenInventory.DataKeys[dirtyRow.RowIndex];
                int specimenAccessionId = (int)keys[Specimen.SpecimenAccessionId];
                int specimenId = (int)keys[Specimen.SpecimenId];
                Specimen specimen = new Specimen();
                specimen.Get(specimenId);
                CICHelper.SetBOValues(dirtyRow.Controls, specimen, specimenAccessionId);
                specimen.Save();
            }
        }

        private void BuildInventory(DataView inventoryView)
        {
            if (inventoryView == null || inventoryView.Count == 0)
            {
                SpecimenInventory.DataSource = null;
                SpecimenInventory.DataBind();

                RecordCount.Text = 0 + " Record(s)";
                SpecimenInventory.Visible = false;
                UpdateBtn.Visible = false;
            }
            else
            {
                SpecimenInventory.DataSource = inventoryView;
                SpecimenInventory.DataBind();

                RecordCount.Text = inventoryView.Count + " Record(s)";

                SpecimenInventory.Visible = true;
                UpdateBtn.Visible = inventoryView.Count > 0;
            }
        }

        /// <summary>
        /// Get search results for selected speicmen query
        /// </summary>
        /// <param name="search"></param>
        /// <param name="column"></param>
        /// <returns></returns>
        private DataTable GetSpecimensInventory(string search, string column)
        {
            int protocolId = int.Parse(BaseProtocolId);
            string datasetSQL = base.GetSpecimenPatientsDatasetSQL();
            // for collection mode, show all statuses
            DataTable inventory = da.GetSpecimenInventoryByProtocol(protocolId, datasetSQL, search, column, new string[0], new string[0]);
            return inventory;
        }

        /// <summary>
        /// Get a listing of the display columns
        /// </summary>
        /// <returns></returns>
        private Dictionary<string, string> GetSpecimenColumns()
        {
            return DISPLAY_COLUMNS;
        }
    }
}