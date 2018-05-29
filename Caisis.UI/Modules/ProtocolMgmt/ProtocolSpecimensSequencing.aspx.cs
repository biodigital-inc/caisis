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

using Caisis.DataAccess;
using Caisis.BOL;
using System.Collections.Specialized;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

using System.Linq;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class ProtocolSpecimensSequencing : ProtocolMgmtBasePage
    {
        private static readonly string ANSWER_YES = "Yes";
        private static readonly string ANSWER_NO = "No";

        /// <summary>
        /// A dictionary of mode to possible event types (i.e., statuses)
        /// </summary>
        private static Dictionary<SpecimenInventoryMode, IEnumerable<string>> EVENT_TYPES = new Dictionary<SpecimenInventoryMode, IEnumerable<string>>
        {
            { SpecimenInventoryMode.Pathology, new string[] { "Pathology Review Completed", "Banked by Pathology" } },
            { SpecimenInventoryMode.Sequencing, new string[] { "Tissue Extraction Successful", "Tissue Extraction Unsuccessful", "Library Construction Successful","Library Construction Unsuccessful", "Sequenced", "Sequencing Unsuccessful"} },
            { SpecimenInventoryMode.Analysis, new string[] { "Analysis Complete", "Analysis Unsuccessul" } }
        };

        private static Dictionary<SpecimenInventoryMode, int[]> EVENT_TYPE_INDEXES = new Dictionary<SpecimenInventoryMode, int[]>
        {          
            { SpecimenInventoryMode.Sequencing, new int[] { 3,4,5,6 } },
            { SpecimenInventoryMode.Analysis, new int[] { 7,8 } },
            { SpecimenInventoryMode.Pathology, new int[] { 9,10 } }
        };

        //private int? SpecimenId
        //{
        //    get
        //    {
        //        string sid = Request.QueryString["specimenId"];
        //        if (!string.IsNullOrEmpty(sid))
        //            return int.Parse(sid);
        //        else
        //            return null;
        //    }
        //}

        private SpecimenInventoryMode InventoryMode
        {
            get
            {
                string mode = Request.QueryString["mode"];
                if (mode == "analysis")
                    return SpecimenInventoryMode.Analysis;
                else if (mode == "pathology")
                    return SpecimenInventoryMode.Pathology;
                else
                    return SpecimenInventoryMode.Sequencing;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // set UI state
                //Pathology_Fields.Visible = InventoryMode == SpecimenInventoryMode.Pathology;
                //Sequncing_Fields.Visible = InventoryMode == SpecimenInventoryMode.Sequencing;
                //Analysis_Fields.Visible = InventoryMode == SpecimenInventoryMode.Analysis;

                //if (SpecimenId.HasValue)
                //    PopulateSpecimenDetails(SpecimenId.Value);

                // bulk
                BuildBulkEditForm();
            }
            // set title
            HeadingTitle.Text = "Manage Specimen " + InventoryMode.ToString();
        }

        /// <summary>
        /// Build a data grid interface for updating in bulk
        /// </summary>
        private void BuildBulkEditForm()
        {
            string postedSpecimens = Request.Form["specimens"] + "";
            IEnumerable<int> specimenIds = postedSpecimens.Split(',').Select(s => int.Parse(s));

            // get a list of Specimens
            List<Specimen> specimens = new List<Specimen>();
            foreach (int specimenId in specimenIds)
            {
                Specimen specimen = new Specimen();
                specimen.Get(specimenId);
                specimens.Add(specimen);
            }
            // data bind
            DataView specimenDataView = specimens.AsDataView<Specimen>();
            BulkEditGrid.DataSource = specimenDataView;
            BulkEditGrid.DataBind();

            // adjust UI
            int startIndex = 3; // exclude required columns
            int endIndex = BulkEditGrid.Columns.Count - 1; // exclude date column
            var showIndexes = EVENT_TYPE_INDEXES[InventoryMode];
            for (int i = startIndex; i < endIndex; i++)
            {
                BulkEditGrid.Columns[i].Visible = showIndexes.Contains(i);

            }
        }

        #region grid events

        protected void PopulateSpecimenDetailsRow(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int specimenId = (int)DataBinder.Eval(e.Row.DataItem, Specimen.SpecimenId);
                PopulateSpecimenDetailsRow(e.Row, specimenId);
            }
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateClick(object sender, EventArgs e)
        {
            foreach (GridViewRow row in BulkEditGrid.Rows)
            {
                HiddenField sidField = row.FindControl("SpecimenId") as HiddenField;
                int specimenId = int.Parse(sidField.Value);
                UpdateSpecimenDetailsRow(row, specimenId);
            }
            // register update script
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "registerUpdateScript", "if(parent.doTransferUpdated) parent.doTransferUpdated();", true);
        }

        #region CRUD
        private void UpdateSpecimenDetailsRow(Control row, int specimenId)
        {
            // Core
            HiddenField SpecimenNumField = row.FindControl("SpecimenNumField") as HiddenField;
            HiddenField SpecimenSubTypeField = row.FindControl("SpecimenSubTypeField") as HiddenField;
            CaisisTextBox StatusDate = row.FindControl("StatusDate") as CaisisTextBox;
            // Sequencing
            CaisisSelect Sequencing_Failed_Reason = row.FindControl("Sequencing_Failed_Reason") as CaisisSelect;
            CaisisRadioButtonList Extraction_Radio = row.FindControl("Extraction_Radio") as CaisisRadioButtonList;
            CaisisRadioButtonList Library_Radio = row.FindControl("Library_Radio") as CaisisRadioButtonList;
            CaisisRadioButtonList Sequenced_Radio = row.FindControl("Sequenced_Radio") as CaisisRadioButtonList;
            // Analysis
            CaisisRadioButtonList Analysis_Radio = row.FindControl("Analysis_Radio") as CaisisRadioButtonList;
            CaisisRadioButtonList Pathology_Radio = row.FindControl("Pathology_Radio") as CaisisRadioButtonList;
            // Pathology
            CaisisSelect Analysis_Failed_Reason = row.FindControl("Analysis_Failed_Reason") as CaisisSelect;
            CaisisComboBox SpecimenConditionNotes = row.FindControl("SpecimenConditionNotes") as CaisisComboBox;


            // shared variables
            string status = "";
            DateTime? statusDate = null;
            if (!string.IsNullOrEmpty(StatusDate.Value))
                statusDate = DateTime.Parse(StatusDate.Value);
            if (InventoryMode == SpecimenInventoryMode.Sequencing)
            {
                string failedReason = Sequencing_Failed_Reason.Value;
                string statusResult = "";
                // determine new status, top down
                if (Extraction_Radio.Value == ANSWER_NO)
                {
                    status = "Tissue Extraction Unsuccessful";
                    statusResult = failedReason;
                }
                else if (Extraction_Radio.Value == ANSWER_YES)
                {
                    if (Library_Radio.Value == ANSWER_NO)
                    {
                        status = "Library Construction Unsuccessful";
                        statusResult = failedReason;
                    }
                    else if (Library_Radio.Value == ANSWER_YES)
                    {
                        if (Sequenced_Radio.Value == ANSWER_NO)
                        {
                            status = "Sequencing Unsuccessful";
                            statusResult = failedReason;
                        }
                        else if (Sequenced_Radio.Value == ANSWER_YES)
                        {
                            status = "Sequenced";
                        }
                        else
                        {
                            status = "Library Construction Successful";
                        }
                    }
                    else
                    {
                        status = "Tissue Extraction Successful";
                    }
                }
                // update event
                if (!string.IsNullOrEmpty(status) || statusDate.HasValue || !string.IsNullOrEmpty(statusResult))
                    UpdateSequencingEvent(specimenId, status, statusDate, statusResult);
            }
            else if (InventoryMode == SpecimenInventoryMode.Pathology)
            {
                if (Pathology_Radio.Value == ANSWER_YES)
                {
                    status = "Pathology Review Completed";
                }
                else if (Analysis_Radio.Value == ANSWER_NO)
                {
                    status = "Banked by Pathology";
                }
                // update event
                if (!string.IsNullOrEmpty(status) || statusDate.HasValue)
                    UpdateSequencingEvent(specimenId, status, statusDate, "");
            }
            else if (InventoryMode == SpecimenInventoryMode.Analysis)
            {
                string failedReason = Analysis_Failed_Reason.Value;
                if (Analysis_Radio.Value == ANSWER_YES)
                {
                    status = "Analysis Complete";
                    // on successful analysis, update event
                    UpdateSequencingEvent(specimenId, status, statusDate, "");
                }
                else if (Analysis_Radio.Value == ANSWER_NO)
                {
                    status = "Analysis Unsuccessul";
                    UpdateSequencingEvent(specimenId, status, statusDate, failedReason);
                }
            }
            // update specimen status
            if (!string.IsNullOrEmpty(status))
            {
                Specimen specimen = new Specimen();
                specimen.Get(specimenId);
                specimen[Specimen.SpecimenStatus] = status;
                // special case
                if (InventoryMode == SpecimenInventoryMode.Pathology)
                    specimen[Specimen.SpecimenNotes] = SpecimenConditionNotes.Value;
                specimen.Save();
            }

        }

        private void PopulateSpecimenDetailsRow(Control row, int specimenId)
        {
            // Core
            HiddenField SpecimenNumField = row.FindControl("SpecimenNumField") as HiddenField;
            HiddenField SpecimenSubTypeField = row.FindControl("SpecimenSubTypeField") as HiddenField;
            CaisisTextBox StatusDate = row.FindControl("StatusDate") as CaisisTextBox;
            // Sequencing
            CaisisSelect Sequencing_Failed_Reason = row.FindControl("Sequencing_Failed_Reason") as CaisisSelect;
            CaisisRadioButtonList Extraction_Radio = row.FindControl("Extraction_Radio") as CaisisRadioButtonList;
            CaisisRadioButtonList Library_Radio = row.FindControl("Library_Radio") as CaisisRadioButtonList;
            CaisisRadioButtonList Sequenced_Radio = row.FindControl("Sequenced_Radio") as CaisisRadioButtonList;
            // Analysis
            CaisisRadioButtonList Analysis_Radio = row.FindControl("Analysis_Radio") as CaisisRadioButtonList;
            CaisisRadioButtonList Pathology_Radio = row.FindControl("Pathology_Radio") as CaisisRadioButtonList;
            // Pathology
            CaisisSelect Analysis_Failed_Reason = row.FindControl("Analysis_Failed_Reason") as CaisisSelect;
            CaisisComboBox SpecimenConditionNotes = row.FindControl("SpecimenConditionNotes") as CaisisComboBox;

            Specimen specimen = new Specimen();
            specimen.Get(specimenId);
            string num = specimen[BOL.Specimen.SpecimenReferenceNumber].ToString();
            string status = specimen[BOL.Specimen.SpecimenStatus].ToString();
            string notes = specimen[BOL.Specimen.SpecimenNotes].ToString();
            SpecimenNumField.Value = num;
            SpecimenSubTypeField.Value = specimen[BOL.Specimen.SpecimenSubType].ToString();

            SpecimenEvents specimenEvent = GetSequencingEvent(specimenId);
            // applies to all
            if (specimenEvent != null)
                StatusDate.Value = string.Format("{0:d}", specimenEvent[SpecimenEvents.EventDate]);
            // set relevant radios
            if (InventoryMode == SpecimenInventoryMode.Sequencing)
            {
                switch (status)
                {
                    case "Tissue Extraction Successful":
                        Extraction_Radio.Value = ANSWER_YES;
                        break;
                    case "Tissue Extraction Unsuccessful":
                        Extraction_Radio.Value = ANSWER_NO;
                        if (specimenEvent != null && !specimenEvent.IsNull(SpecimenEvents.EventResult))
                            Sequencing_Failed_Reason.Value = specimenEvent[SpecimenEvents.EventResult].ToString();
                        break;
                    case "Library Construction Successful":
                        Extraction_Radio.Value = ANSWER_YES;
                        Library_Radio.Value = ANSWER_YES;
                        break;
                    case "Library Construction Unsuccessful":
                        Extraction_Radio.Value = ANSWER_YES;
                        Library_Radio.Value = ANSWER_NO;
                        if (specimenEvent != null && !specimenEvent.IsNull(SpecimenEvents.EventResult))
                            Sequencing_Failed_Reason.Value = specimenEvent[SpecimenEvents.EventResult].ToString();
                        break;
                    case "Sequenced":
                        Extraction_Radio.Value = ANSWER_YES;
                        Library_Radio.Value = ANSWER_YES;
                        Sequenced_Radio.Value = ANSWER_YES;
                        break;
                    case "Sequencing Unsuccessful":
                        Extraction_Radio.Value = ANSWER_YES;
                        Library_Radio.Value = ANSWER_YES;
                        Sequenced_Radio.Value = ANSWER_NO;
                        if (specimenEvent != null && !specimenEvent.IsNull(SpecimenEvents.EventResult))
                            Sequencing_Failed_Reason.Value = specimenEvent[SpecimenEvents.EventResult].ToString();
                        break;
                    default:
                        Extraction_Radio.ClearSelection();
                        Library_Radio.ClearSelection();
                        Sequenced_Radio.ClearSelection();
                        break;
                }
            }
            else if (InventoryMode == SpecimenInventoryMode.Analysis)
            {
                switch (status)
                {
                    case "Analysis Complete":
                        Analysis_Radio.Value = ANSWER_YES;
                        break;
                    case "Analysis Unsuccessul":
                        Analysis_Radio.Value = ANSWER_NO;
                        if (specimenEvent != null && !specimenEvent.IsNull(SpecimenEvents.EventResult))
                            Analysis_Failed_Reason.Value = specimenEvent[SpecimenEvents.EventResult].ToString();
                        break;
                    default:
                        Analysis_Radio.ClearSelection();
                        break;
                }
            }
            else if (InventoryMode == SpecimenInventoryMode.Pathology)
            {
                switch (status)
                {
                    case "Pathology Review Completed":
                        Pathology_Radio.Value = ANSWER_YES;
                        break;
                    case "Banked by Pathology":
                        Pathology_Radio.Value = ANSWER_NO;
                        break;
                    default:
                        Pathology_Radio.ClearSelection();
                        break;
                }
                // build condition list, fill into notes field
                DataTable conditions = new DataTable();
                conditions.Columns.Add("Condition");
                string foundCondition = "";
                foreach (string condition in specimenController.GetConditions())
                {
                    // find selected
                    if (specimenController.GetSpecimenCondition(notes) == condition)
                        foundCondition = condition;
                    // add data
                    conditions.Rows.Add(new object[] { condition });
                }

                SpecimenConditionNotes.BuildComboData(conditions, "Condition", "Condition");

                SpecimenConditionNotes.Value = notes;
            }
        }
        #endregion

        #region update/delete Sequence Events

        private SpecimenEvents UpdateSequencingEvent(int specimenId, string status, DateTime? statusDate, string statusResult)
        {
            SpecimenEvents sequenceEvent = GetSequencingEvent(specimenId);
            if (sequenceEvent == null)
            {
                sequenceEvent = new SpecimenEvents();
                sequenceEvent[SpecimenEvents.SpecimenId] = specimenId;
                sequenceEvent[SpecimenEvents.EventType] = status;
            }
            if (statusDate.HasValue)
            {
                sequenceEvent[SpecimenEvents.EventDate] = statusDate.Value;
                sequenceEvent[SpecimenEvents.EventDateText] = statusDate.Value.ToShortDateString();
            }
            else
            {
                sequenceEvent[SpecimenEvents.EventDate] = null;
                sequenceEvent[SpecimenEvents.EventDateText] = null;
            }
            sequenceEvent[SpecimenEvents.EventResult] = statusResult;

            sequenceEvent.Save();

            return sequenceEvent;
        }

        private void DeleteSequencingEvent(int specimenId)
        {
            SpecimenEvents sequenceEvent = GetSequencingEvent(specimenId);
            if (sequenceEvent != null)
                sequenceEvent.Delete((int)sequenceEvent[sequenceEvent.PrimaryKeyName]);
        }

        private SpecimenEvents GetSequencingEvent(int specimenId)
        {
            // get a list of events possible for this mode
            IEnumerable<string> eventTypes = EVENT_TYPES[InventoryMode];
            // search for first occurance of event
            foreach (string eventType in eventTypes)
            {
                var events = BOL.BusinessObject.GetByFields<SpecimenEvents>(new Dictionary<string, object>
                {
                    { SpecimenEvents.SpecimenId, specimenId  },
                    { SpecimenEvents.EventType, eventType }
                });
                if (events.Count() > 0)
                    return events.First();
            }
            return null;
        }

        #endregion
    }
}