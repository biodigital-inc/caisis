using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Xml;
using Caisis.BOL;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.DataAccess;
using System.Collections.Specialized;
using System.Reflection;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class AdminManageTimeline : ProtocolMgmtBaseAdminPage
    {
        private Dictionary<int, List<int>> dirtyItemTimelineIndexes = new Dictionary<int, List<int>>();
        private List<int> dirtyTimelineIndexes = new List<int>();

        private DataView timeline = null;
        private DataView itemTimelineView = null;

        Dictionary<KeyValuePair<int, int>, int> itemTimelineLookup = new Dictionary<KeyValuePair<int, int>, int>();

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int protocolId = int.Parse(BaseProtocolId);
                SchemaSelection.DataSource = from row in ProtocolMgmtDa.GetSchemasByProtocol(protocolId).AsEnumerable()
                                             // ProtocolSchemaId, ProtocolArmDescription, ProtocolVersionId, VersionNumber
                                             select new
                                                 {
                                                     ItemText = string.Format("{0} (v{1})", row["ProtocolArmDescription"], row["VersionNumber"]),
                                                     ItemValue = string.Format("{0}", row["ProtocolSchemaId"])
                                                 };
                SchemaSelection.DataBind();
            }
        }

        protected void BuildSchemaTimeline(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(SchemaSelection.Value))
            {
                int schemaId = int.Parse(SchemaSelection.Value);
                timeline = ProtocolMgmtDa.GetTimelineBySchmeaId(schemaId).DefaultView;

                dirtyTimelineIndexes.Clear();
                dirtyItemTimelineIndexes.Clear();

                TimelinePanel.Visible = true;

                TimelineRptr.DataSource = timeline;
                TimelineRptr.DataBind();

                //DataView schemaItems = BusinessObject.GetByParentAsDataView<SchemaItem>(schemaId);
                DataView schemaItems = ProtocolMgmtDa.GetDistinctSchemaItems(schemaId).DefaultView;

                var kvp = from row in ProtocolMgmtDa.GetTimelineItemsBySchemaId(schemaId).AsEnumerable()
                          let rowTimelineId = (int)row[Timeline.TimelineId]
                          let rowSchemaItemId = (int)row[SchemaItem.SchemaItemId]
                          let rowItemTimelineId = (int)row[ItemTimeline.ItemTimelineId]
                          select new
                          {
                              TimelineId = rowTimelineId,
                              SchemaItemId = rowSchemaItemId,
                              ItemTimelineId = rowItemTimelineId
                          };
                itemTimelineLookup = kvp.ToDictionary(a => new KeyValuePair<int, int>(a.TimelineId, a.SchemaItemId), a => a.ItemTimelineId);

                itemTimelineView = ProtocolMgmtDa.GetTimelineItemsBySchemaId(schemaId).DefaultView;

                SchemaItemsRptr.DataSource = schemaItems;
                SchemaItemsRptr.DataBind();
            }
            else
            {
                TimelinePanel.Visible = false;
            }
        }

        protected void MarkUpdatedItemTimeline(object sender, EventArgs e)
        {
            CheckBox cb = sender as CheckBox;
            RepeaterItem timelineRptrItem = cb.NamingContainer as RepeaterItem;
            RepeaterItem schemaItemRptrItem = timelineRptrItem.NamingContainer.NamingContainer as RepeaterItem;

            int timelineIndex = timelineRptrItem.ItemIndex;
            int schemaItemIndex = schemaItemRptrItem.ItemIndex;
            if (!dirtyItemTimelineIndexes.ContainsKey(timelineIndex))
                dirtyItemTimelineIndexes.Add(timelineIndex, new List<int>());
            dirtyItemTimelineIndexes[timelineIndex].Add(schemaItemIndex);
        }

        protected void TrackFieldUpdates(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var row = e.Item.DataItem as DataRowView;
                int rowIndex = e.Item.ItemIndex;
                var inputs = CICHelper.GetCaisisInputControls(e.Item);
                inputs.ForEach(input =>
                {
                    input.ValueChanged += (a, b) =>
                    {
                        if (!dirtyTimelineIndexes.Contains(rowIndex))
                            dirtyTimelineIndexes.Add(rowIndex);
                    };
                });
            }
        }

        protected void SetFieldValues(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var row = e.Item.DataItem as DataRowView;
                var inputs = CICHelper.GetCaisisInputControls(e.Item);
                foreach (var input in inputs)
                    input.Value = string.Format("{0}", row[input.Field]);
            }
        }

        protected void SetSchemaFields(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // set field values
                SetFieldValues(sender, e);

                var row = e.Item.DataItem as DataRowView;
                int schemaItemId = (int)row[SchemaItem.SchemaItemId];
                var rptr = e.Item.FindControl("ItemTimelineRptr") as Repeater;
                rptr.DataSource = timeline;
                rptr.DataBind();
            }
        }

        protected void SetItemTimeline(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // set field values
                SetFieldValues(sender, e);

                HiddenField itemTimeleinIdField = e.Item.FindControl("ItemTimelineId") as HiddenField;
                CheckBox cb = e.Item.FindControl("ItemTimelineCheckBox") as CheckBox;
                // locate foreign keys
                RepeaterItem schemaItemRow = e.Item.NamingContainer.NamingContainer as RepeaterItem;
                int timelineId = (int)DataBinder.Eval(e.Item.DataItem, Timeline.TimelineId);
                int schemaItemId = (int)DataBinder.Eval(schemaItemRow.DataItem, SchemaItem.SchemaItemId);
                int? itemTimelineId = GetItemTimelineId(timelineId, schemaItemId);

                // set pri key
                itemTimeleinIdField.Value = itemTimelineId + "";

                // set current state
                cb.Checked = itemTimelineId.HasValue;
            }
        }


        protected void UpdateClick(object sender, EventArgs e)
        {
            string username = new Security.SecurityController().GetUserName();
            // update item timeline (insert, delete)
            UpdateItemTimelines(username);
            // update timeline (fix schedules)
            UpdateTimelines(username);

            // re-bind
            BuildSchemaTimeline(sender, e);
        }

        protected void DeleteTimelineClick(object sender, CommandEventArgs e)
        {
            int timelineId = int.Parse(e.CommandArgument.ToString());
            // delete item itemline
            foreach (ItemTimeline it in BOL.BusinessObject.GetByFields<ItemTimeline>(new Dictionary<string, object> { { ItemTimeline.TimelineId, timelineId } }))
            {
                int itemTimelineIdValue = (int)it[it.PrimaryKeyName];
                ProtocolMgmtDa.DeleteItemTimeline(itemTimelineIdValue);
            }
            // delete timeline
            // TODO: refactor to DA
            Timeline timeline = new Timeline();
            timeline.Delete(timelineId);
            // re-bind
            BuildSchemaTimeline(sender, e);
        }

        private void UpdateTimelines(string username)
        {
            // update timeline
            foreach (int index in dirtyTimelineIndexes)
            {
                RepeaterItem timelineItem = TimelineRptr.Items[index];
                var inputs = CICHelper.GetCaisisInputControlDictionary(timelineItem);
                int timelineId = int.Parse(inputs[Timeline.TimelineId].Value);
                string visitLabel = inputs[Timeline.VisitLabel].Value;
                string displayUnitName = inputs[Timeline.DisplayUnitName].Value;
                int numberOfUnits = int.Parse(inputs[Timeline.NumberOfUnits].Value);
                string bufferUnitName = inputs[Timeline.BufferUnitName].Value;
                int bufferUnitPlus = int.Parse(inputs[Timeline.BufferNumberOfUnitsPlus].Value);
                int bufferUnitMinus = int.Parse(inputs[Timeline.BufferNumberOfUnitsMinus].Value);
                string itemIntervalType = inputs[Timeline.ItemIntervalType].Value;
                ProtocolMgmtDa.UpdateTimeline(timelineId, visitLabel, displayUnitName, numberOfUnits, bufferUnitName, bufferUnitPlus, bufferUnitMinus, itemIntervalType, username);
            }
        }

        private void UpdateItemTimelines(string username)
        {
            // update itemtimeline
            bool scheduleNewItems = false;
            foreach (int timelineIndex in dirtyItemTimelineIndexes.Keys)
            {
                foreach (int schemaItemIndex in dirtyItemTimelineIndexes[timelineIndex])
                {
                    RepeaterItem schemaItemRptrItem = SchemaItemsRptr.Items[schemaItemIndex];
                    RepeaterItem itemTimelineRptrItem = (schemaItemRptrItem.FindControl("ItemTimelineRptr") as Repeater).Items[timelineIndex];
                    // checkbox
                    CheckBox cb = itemTimelineRptrItem.FindControl("ItemTimelineCheckBox") as CheckBox;
                    // item timeline id
                    string itemTimelineId = (itemTimelineRptrItem.FindControl("ItemTimelineId") as HiddenField).Value;
                    // timeline id
                    string timelineId = (itemTimelineRptrItem.FindControl("TimelineId") as CaisisHidden).Value;
                    // schema item id
                    string schemaItemId = (schemaItemRptrItem.FindControl("SchemaItemId") as CaisisHidden).Value;
                    // add
                    if (cb.Checked)
                    {
                        if (string.IsNullOrEmpty(itemTimelineId))
                        {
                            ItemTimeline biz = new ItemTimeline();
                            biz[ItemTimeline.TimelineId] = int.Parse(timelineId);
                            biz[ItemTimeline.SchemaItemId] = int.Parse(schemaItemId);
                            biz.Save();

                            // require scheduling
                            scheduleNewItems = true;
                        }
                    }
                    // remove
                    {
                        if (!string.IsNullOrEmpty(itemTimelineId))
                        {
                            int itemTimelineIdValue = int.Parse(itemTimelineId);
                            ProtocolMgmtDa.DeleteItemTimeline(itemTimelineIdValue);
                        }
                    }
                }
            }
            if (scheduleNewItems)
            {
                int schemaId = int.Parse(SchemaSelection.Value);
                ProtocolMgmtDa.ScheduleNewPatientItems(schemaId, username);
            }
        }

        private int? GetItemTimelineId(int timelineId, int schemaItemId)
        {
            var key = new KeyValuePair<int, int>(timelineId, schemaItemId);
            if (itemTimelineLookup.ContainsKey(key))
                return itemTimelineLookup[key];
            return null;
        }
    }
}
