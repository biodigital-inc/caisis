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
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminReview : ProtocolMgmtBaseAdminPage
    {
        private static readonly string PRE_STUDY_RPTR_ID = "PreStudyItems";
        private static readonly string ON_STUDY_RPTR_ID = "OnStudyItems";

        /// <summary>
        /// A SQL Expression defining items defined as Pre-Study
        /// </summary>
        private static readonly string PRE_STUDY_EXPR = "(PreStudySchemaItem IS NOT NULL AND PreStudySchemaItem = 1)";

        /// <summary>
        /// A SQL Expression defining items defined as On-Study
        /// </summary>
        private static readonly string ON_STUDY_EXPR = "(PreStudySchemaItem IS NULL OR PreStudySchemaItem = 0)";

        /// <summary>
        /// Default sort-column for all Timeline records
        /// </summary>
        private static readonly string SORT_COL = "SortColumn";

        /// <summary>
        /// Defines a method which will return a RepeaterItemEventHandler, which is used for 
        /// initalizating of a RepeaterItem.
        /// </summary>
        /// <param name="mirrorRptr"></param>
        /// <returns></returns>
        delegate RepeaterItemEventHandler ProtocolRptrCreator(Repeater mirrorRptr);

        private DataView timelineVisits;
        private DataView onStudyTimeline;
        private DataView preStudyTimeline;
        private DataTable itemTimelineRecords;

        private int protocolSchemaId = -1;

        /// <summary>
        /// Gets the SchemaId for current Protocol Schema, used for determining On-Sudy/Pre-Study/Schema Items
        /// </summary>
        public int ProtocolSchemaId
        {
            get
            {
                if (protocolSchemaId == -1)
                {
                    protocolSchemaId = int.Parse(BaseSchemaId);
                }
                return protocolSchemaId;
            }
        }

        /// <summary>
        /// Gets a list of Pre-Study Timeline records
        /// </summary>
        private DataView PreStudyTimeline
        {
            get
            {
                if (preStudyTimeline == null)
                {
                    preStudyTimeline = GetFilteredStudies(PRE_STUDY_EXPR, 0);
                }
                return preStudyTimeline;
            }
        }

        /// <summary>
        /// Gets a list of On-Study Timeline records
        /// </summary>
        private DataView OnStudyTimeline
        {
            get
            {
                if (onStudyTimeline == null)
                {
                    onStudyTimeline = GetFilteredStudies(ON_STUDY_EXPR, 0);
                }
                return onStudyTimeline;
            }
        }

        /// <summary>
        /// Gets a list of all ItemTimeline records belonging to current ProtocolSchema
        /// </summary>
        private DataTable ItemTimelineRecords
        {
            get
            {
                if (itemTimelineRecords == null)
                {
                    itemTimelineRecords = ProtocolMgmtDa.GetTimelineItemsBySchemaId(ProtocolSchemaId);
                }
                return itemTimelineRecords;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            // During first load build interface
            if (!Page.IsPostBack)
            {
                // If no records exist yet, show default number of visits
                BindItems();
            }

        }

        /// <summary>
        /// Build interface based on various Repeaters
        /// </summary>
        protected void BindItems()
        {
            // HEADER ROW and COLUMNS (Controls columns which represents Visits)
            PreStudyItemsRptr.DataSource = PreStudyTimeline;
            PreStudyItemsRptr.DataBind();

            OnStudyItemsRptr.DataSource = OnStudyTimeline;
            OnStudyItemsRptr.DataBind();

            // POPUP DATA ENTRY LAYER for each Visit
            PreStudyItemsLayerRptr.DataSource = PreStudyTimeline;
            PreStudyItemsLayerRptr.DataBind();

            OnStudyItemsLayerRptr.DataSource = OnStudyTimeline;
            OnStudyItemsLayerRptr.DataBind();

            DataView SchemaItemsList = GetSchemaItemsList();
            // SCHEMA ITEM ROWS
            SchemaItemsRptr.DataSource = SchemaItemsList;
            SchemaItemsRptr.DataBind();

            // SCHEMA ITEM ROWS for EACH TIMELINEITEM (n-Columns for each x-Row)
            SchemaItemsTimelineItemRptr.DataSource = SchemaItemsList;
            SchemaItemsTimelineItemRptr.DataBind();
        }

        /// <summary>
        /// Returns a filterd list of Timeline records, with blank rows
        /// </summary>
        /// <param name="expr">The filter expression used for filtering view</param>
        /// <param name="blankRows">The number of blank rows to insert into filtered table</param>
        /// <returns></returns>
        private DataView GetFilteredStudies(string expr, int blankRows)
        {
            // Get a filtered table from underlying view
            DataView TimelineVisits = GetTimelineVisits();
            TimelineVisits.RowFilter = expr;
            DataTable filteredTable = TimelineVisits.ToTable();
            // Clear filter for next usage
            TimelineVisits.RowFilter = "";

            // Add blank rows
            for (int i = 0; i < blankRows; i++)
            {
                DataRow blankRow = filteredTable.NewRow();
                blankRow[SORT_COL] = 0;
                filteredTable.Rows.Add(blankRow);
            }

            // Return filtered table with n-blank rows
            DataView view = filteredTable.DefaultView;
            view.Sort = SORT_COL + " DESC, " + Timeline.DisplayColumnPosition + " ASC";
            return view;
        }

        /// <summary>
        /// Gets a view of all the Timeline records belonging to the current Protocol Schema
        /// </summary>
        protected DataView GetTimelineVisits()
        {
			//Timeline biz = new Timeline();
			//biz.GetByParent(ProtocolSchemaId);
			//DataTable rawTable = biz.DataSourceView.Table;
			DataView view = BusinessObject.GetByParentAsDataView<Timeline>(ProtocolSchemaId);
			DataTable rawTable = view.Table;
            // Set Default Sorting
            DataColumn sortCol = new DataColumn(SORT_COL, typeof(Int32));
            sortCol.DefaultValue = 1;
            rawTable.Columns.Add(sortCol);

            // Remove restrictions and constraints
            foreach (DataColumn col in rawTable.Columns)
            {
                col.AllowDBNull = true;
            }
            rawTable.Constraints.Clear();

            //timelineVisits = biz.DataSourceView;
			timelineVisits = view;
            // Defaults
            timelineVisits.RowFilter = "";
            timelineVisits.Sort = SORT_COL + " DESC";

            return timelineVisits;

        }

        /// <summary>
        /// Returns a list of SchemaItems for current Protocol Schema
        /// </summary>
        protected DataView GetSchemaItemsList()
        {
			//SchemaItem biz = new SchemaItem();
			//biz.GetByParent(ProtocolSchemaId);
			//DataView schemaItemsList = biz.DataSourceView;

			//return schemaItemsList;
			return BusinessObject.GetByParentAsDataView<SchemaItem>(ProtocolSchemaId);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindStudyItems(object sender, RepeaterItemEventArgs schemaItemArg)
        {
            RepeaterItem schemaItemRow = schemaItemArg.Item;
            if (schemaItemRow.ItemType == ListItemType.Header || schemaItemRow.ItemType == ListItemType.Item || schemaItemRow.ItemType == ListItemType.AlternatingItem)
            {
                // Locate child PreStudy and OnStudy Repeaters
                Repeater preStudyItems = schemaItemRow.FindControl(PRE_STUDY_RPTR_ID) as Repeater;
                Repeater onStudyItems = schemaItemRow.FindControl(ON_STUDY_RPTR_ID) as Repeater;
                CaisisHidden schemaItemIdField = schemaItemRow.FindControl("SchemaItemIdField") as CaisisHidden;

                // Set Schema-Item Field
                if (schemaItemIdField != null)
                {
                    schemaItemIdField.Value = DataBinder.Eval(schemaItemRow.DataItem, SchemaItem.SchemaItemId).ToString();
                }

                // When SchemaItem is binding, bind child PreStudy and OnStudy Repeaters
                // These columns will be the assciation between a SchemaItem (row) and Timeline (col)
                schemaItemRow.DataBinding += new EventHandler(delegate(object schemaItemRptr, EventArgs schemaItemArgs)
                 {
                     preStudyItems.DataSource = PreStudyTimeline;
                     preStudyItems.DataBind();

                     onStudyItems.DataSource = OnStudyTimeline;
                     onStudyItems.DataBind();
                 });

                // CLOSURES

                // A method which returns and RepeaterItemEventHandler used for handling the creation
                // of each column/checkbox, containing logic for updating/populating the ItemTimeline table
                ProtocolRptrCreator GetCreator = new ProtocolRptrCreator(delegate(Repeater mirrorRptr)
                {
                    // Create a new instance of the OnItemCreate Handler
                    RepeaterItemEventHandler creationHandler = new RepeaterItemEventHandler(delegate(object o, RepeaterItemEventArgs timelineItemEventArg)
                    {
                        if (timelineItemEventArg.Item.ItemType == ListItemType.Item || timelineItemEventArg.Item.ItemType == ListItemType.AlternatingItem)
                        {
                            // Repeater item repsents a ItemTimline columns in current SchemaItem row
                            RepeaterItem itemTimelineCol = timelineItemEventArg.Item;
                            // This Timeline data entry layer will contain the foreign TimelineId record
                            // During inserts and update of ItemTime records, foreign key will come from this 
                            RepeaterItem timelineDataEntryCol = mirrorRptr.Items[itemTimelineCol.ItemIndex];

                            // Current Timeline Index
                            int colIndex = timelineDataEntryCol.ItemIndex;
                            // Current SchemaItem
                            int rowIndex = schemaItemRow.ItemIndex;

                            bool isRowColumnDirty = false;

                            PlaceHolder colCheckBoxHolder = itemTimelineCol.FindControl("CheckBoxHolder") as PlaceHolder;

                            // Create anonmous EventHandler to determine checkbox state when binding to data
                            itemTimelineCol.DataBinding += new EventHandler(delegate(object oo, EventArgs ee)
                            {
                                string timelineId = DataBinder.Eval(itemTimelineCol.DataItem, Timeline.TimelineId).ToString();
                                string schemaItemId = schemaItemIdField.Value;

                                if (!string.IsNullOrEmpty(schemaItemId) && !string.IsNullOrEmpty(timelineId))
                                {
                                    // If ItemTimeline records are found based, check check-box
                                    DataRow[] foundRecords = FindItemTimelineRecords(schemaItemId, timelineId);
                                    if (foundRecords.Length > 0)
                                    {
                                        // checkbox chcked
                                        Image img = new Image();
                                        img.ID = "ColCheckBox";
                                        img.ImageUrl = "Images/Review_Check.PNG";

                                        colCheckBoxHolder.Controls.Add(img);
                                    }
                                    else
                                    {
                                        //colCheckBox.Checked = false;
                                    }
                                }
                                else
                                {
                                    //colCheckBox.Checked = false;
                                }
                            });
                        }
                    });
                    return creationHandler;
                });

                // During ItemCreation of TimelineItems
                if (schemaItemRow.ItemType == ListItemType.Item || schemaItemRow.ItemType == ListItemType.AlternatingItem)
                {
                    // Attach Handlers
                    preStudyItems.ItemCreated += GetCreator(PreStudyItemsLayerRptr);
                    onStudyItems.ItemCreated += GetCreator(OnStudyItemsLayerRptr);
                }
            }
        }

        /// <summary>
        /// Returs whether the sepecified SchemaItemId and TimelineId are found in the Table of ItemTimeline records
        /// </summary>
        /// <param name="schemaItemId"></param>
        /// <param name="timelineId"></param>
        /// <returns></returns>
        private DataRow[] FindItemTimelineRecords(string schemaItemId, string timelineId)
        {
            string searchExpr = SchemaItem.SchemaItemId + " = " + schemaItemId + " AND " + Timeline.TimelineId + " = " + timelineId;
            DataRow[] foundRecords = ItemTimelineRecords.Select(searchExpr);
            return foundRecords;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void PrevClick(object sender, EventArgs e)
        {
            // navigate to previous step
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void NextClick(object sender, EventArgs e)
        {

        }

        protected void SaveClick(object sender, EventArgs e)
        {

        }
    }
}
