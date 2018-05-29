using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

using Caisis.DataAccess;
using Caisis.Security;

using System.Linq;

namespace Caisis.BOL
{
    /// <summary>
    /// Support for the saving a protocol manager timeline via dynamic sql.
    /// </summary>
    public class TimelineServices
    {
        #region the idea
        /*
		DECLARE @ProtocolSchemaId int -- external, remove DECLARE in dynamic sql

		DECLARE @TimelineId int
		DECLARE @SchemaItemId int
		
		-- begin transaction

		-- for each timeline column
			-- insert timeline record (@ProtocolSchemaId)
			-- @TimelineId <- @@identity

			-- for each (checked) schema item
				-- insert itemtimeline record (@TimelineId, @SchemaItemId)
		
		-- end transaction
		*/
        #endregion

        private static Timeline _timeline = new Timeline();
        private static ItemTimeline _itemTimeline = new ItemTimeline();
        private static RelatedRecord _relatedRecord = new RelatedRecord();

        private static Dictionary<string, object> exclude = new Dictionary<string, object>();

        private TimelineSqlBuilder sql = new TimelineSqlBuilder();

        static TimelineServices()
        {
            // load the exclusion map
            exclude[Timeline.UpdatedBy] = null;
            exclude[Timeline.UpdatedTime] = null;
            exclude[Timeline.LockedBy] = null;
            exclude[Timeline.LockedTime] = null;
        }

        public TimelineServices(int schemaId) // schema id as a parameter?
        {
            DeclareInt(Timeline.ProtocolSchemaId);
            DeclareInt(Timeline.TimelineId);
            DeclareInt(ItemTimeline.SchemaItemId);

            DeclareString(Timeline.DisplayUnitName);
            DeclareInt(Timeline.DisplayColumnPosition);
            DeclareInt(Timeline.NumberOfUnits);
            DeclareString(Timeline.BufferUnitName);
            DeclareInt(Timeline.BufferNumberOfUnitsPlus);
            DeclareInt(Timeline.BufferNumberOfUnitsMinus);

            // NEW Fields for 5.0
            DeclareString(Timeline.VisitLabel);
            DeclareString(Timeline.ItemIntervalType);
            DeclareBit(Timeline.PreStudySchemaItem);

            // handle user, time here
            DeclareString(Timeline.EnteredBy);
            DeclareDate(Timeline.EnteredTime);

            // declare related records paramaters
            DeclareInt(RelatedRecord.RelatedRecordId);
            DeclareString(RelatedRecord.SrcTableName);
            DeclareInt(RelatedRecord.SrcPrimaryKey);
            DeclareString(RelatedRecord.SrcPrimaryKeyText);
            DeclareInt(RelatedRecord.SrcSecPrimaryKey);
            DeclareString(RelatedRecord.SrcSecPrimaryKeyText);
            DeclareString(RelatedRecord.DestTableName);
            DeclareInt(RelatedRecord.DestPrimaryKey);
            DeclareString(RelatedRecord.SrcSystem);
            DeclareInt(RelatedRecord.RelationStrength);

            // InitializeTransaction(buf);

            SetVariable(Timeline.ProtocolSchemaId, schemaId);
            SetString(Timeline.EnteredBy, new SecurityController().GetUserName());
            SetCurrentDate(Timeline.EnteredTime);

            // run cleanup script before inserting timeline
            sql.BuildCleanUpScript();
        }

        public void InsertTimeline(string unitName, int position, int numUnits, string bufUnitName, int bufPlus, int bufMinus, string visitLabel, IEnumerable<string> intervalTypes, object preStudyBit, int? optDependentTimelineIndex, int? optDependentSchemaItemId)
        {
            // set (non-pk) params
            SetString(Timeline.DisplayUnitName, unitName);
            SetVariable(Timeline.DisplayColumnPosition, position);
            SetVariable(Timeline.NumberOfUnits, numUnits);
            SetString(Timeline.BufferUnitName, bufUnitName);
            SetVariable(Timeline.BufferNumberOfUnitsPlus, bufPlus);
            SetVariable(Timeline.BufferNumberOfUnitsMinus, bufMinus);

            // NEW 5.0 Fields
            SetString(Timeline.VisitLabel, visitLabel);
            // SPECIAL: create pipe delimited lsit of interval types
            //          i.e., "Dependent", "Recurring", "Recurring|Dependent", "Recurring|Dependent Off Study", etc...

            string itemIntervalTypeValues = string.Join("|", intervalTypes.ToArray());
            
            SetString(Timeline.ItemIntervalType, itemIntervalTypeValues);
            SetVariable(Timeline.PreStudySchemaItem, preStudyBit);

            // insert
            Insert(_timeline);

            // set TimelineId
            SetVariableToReturnedKey(Timeline.TimelineId); // sets @TimelineId
           
            // after inserting Timeline, insert dependent record (if applicable)
            if (optDependentTimelineIndex.HasValue && optDependentSchemaItemId.HasValue)
            {
                InsertRelatedRecord(optDependentTimelineIndex.Value, optDependentSchemaItemId.Value);
            }
        }

        public void InsertItemTimeline(int schemaItemId)
        {
            // set (non-pk) params; assume TimelineId is already set
            SetVariable(ItemTimeline.SchemaItemId, schemaItemId);

            // insert
            Insert(_itemTimeline);
        }

        private void InsertRelatedRecord(int dependentTimelineIndex, int dependentSchemaItemId)
        {
            // get ItemTimelineId by TimelineId and SchemaItemId
            string getItemTimelineId =
            string.Format(@"
            (
                SELECT TOP 1 ItemTimelineId
                FROM ProtocolMgr_ItemTimeline pit
                INNER JOIN
                (
	                SELECT
		                TimelineId
	                FROM
	                (
                        SELECT
	                        TimelineId,
	                        ROW_NUMBER() OVER (ORDER BY TimelineId ASC) - 1 AS ColIndex
                        FROM
                        -- flatten repeating visits to only get first visit of repeating sequence
                        -- repeating visits have same display column position
                        (
	                        SELECT
		                        MIN(TimelineId) AS TimelineId,
		                        PreStudySchemaItem,
		                        DisplayColumnPosition
	                        FROM ProtocolMgr_Timeline
	                        WHERE ProtocolSchemaId = @ProtocolSchemaId
	                        GROUP By PreStudySchemaItem,DisplayColumnPosition
                        ) pt
	                ) pt
	                WHERE pt.ColIndex = {0}
                ) pt
                ON pt.TimelineId = pit.TimelineId
                WHERE pit.SchemaItemId = {1}
            )
            ", dependentTimelineIndex, dependentSchemaItemId);

            // source is Timeline
            SetString(RelatedRecord.SrcTableName, _timeline.TableName);
            SetVariable(RelatedRecord.SrcPrimaryKey,"@" + Timeline.TimelineId);// GetTimelineIdKeyName(timelineIndex));
            // destination is ItemTimeline
            SetString(RelatedRecord.DestTableName, _itemTimeline.TableName);
            SetVariable(RelatedRecord.DestPrimaryKey, getItemTimelineId);
            // Caisis is both source and destination
            SetString(RelatedRecord.SrcSystem, RelatedRecordsDa.CAISIS_SRC_SYSTEM);

            // insert related record
            Insert(_relatedRecord);
        }

        public void Save()
        {
            // FinalizeTransaction(buf);
            // throw an exception if transaction rolled back

            sql.Execute();
        }

        #region column enumeration (the functionality that these methods suggest will (one day) find their way into bizo)
        private IEnumerable<string> GetColumnsToSave(IBusinessObject b)
        {
            foreach (string c in b.FieldNames)
            {
                if (c != b.PrimaryKeyName && !exclude.ContainsKey(c))
                {
                    yield return c;
                }
            }
        }
        #endregion

        #region transaction handling - not implemented
        private void InitializeTransaction(StringBuilder b)
        {
            // TODO: begin transaction
        }

        private void FinalizeTransaction(StringBuilder b)
        {
            // TODO: end transaction
        }
        #endregion

        #region utilities, primitives
        private void DeclareDate(string name)
        {
            sql.DeclareDate(name);
        }

        private void DeclareInt(string name)
        {
            sql.DeclareInt(name);
        }

        private void DeclareString(string name)
        {
            sql.DeclareString(name);
        }

        private void DeclareBit(string name)
        {
            sql.DeclareBit(name);
        }

        private void Insert(IBusinessObject b)
        {
            sql.Insert(b.TableName, GetColumnsToSave(b));
        }

        private void SetCurrentDate(string name)
        {
            sql.SetCurrentDate(name);
        }

        private void SetVariable(string name, object val)
        {
            sql.SetVariable(name, val);
        }

        private void SetString(string name, string val)
        {
            sql.SetString(name, val);
        }

        private void SetVariableToReturnedKey(string name)
        {
            sql.SetVariableToReturnedKey(name);
        }

        #endregion
    }
}
