using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Xml;
using System.Xml.Linq;

using Caisis.BOL;
using Caisis.Data;
using Caisis.DataAccess;
using Caisis.Extensions;
using Caisis.UI.Core.Classes;
using Caisis.Security;
using Caisis.Controller;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    /// <summary>
    /// Defines the controller logic for handling Protocol level tasks.
    /// </summary>
    public class ProtocolMgmtController
    {
        private static readonly string[] AUDIT_FIELD_NAMES = new string[] { "EnteredBy", "EnteredTime", "UpdatedBy", "UpdatedTime", "LockedBy", "LockedTime" };
        public static readonly int RANDOMIZATION_TRIES = 100;

        private static readonly string XML_CONFIGURATION_PATH = "~/App_Data/Modules/ProtocolMgmt.xml";

        /// <summary>
        /// Creates a new Protocol Version (with schemas, timeline, items) based on the base Protocol Version.
        /// </summary>
        /// <param name="baseProtocolVersionId"></param>
        /// <returns></returns>
        public static ProtocolVersion CopyProtocolVersion(int baseProtocolVersionId)
        {
            // PROCESS VERSION

            // load existing base version
            ProtocolVersion baseVersion = new ProtocolVersion();
            baseVersion.Get(baseProtocolVersionId);
            // create new verion
            ProtocolVersion newVersion = new ProtocolVersion();
            // copy fields from existing into new version
            foreach (string field in baseVersion.FieldNames)
            {
                if (field != baseVersion.PrimaryKeyName)
                {
                    newVersion[field] = baseVersion[field];
                }
            }
            // menually update title
            newVersion[ProtocolVersion.VersionNumber] = "Copy of " + baseVersion[ProtocolVersion.VersionNumber].ToString();
            newVersion.Save();

            // PROCESS SCHEMAS
            SecurityController sc = new SecurityController();
            string username = sc.GetUserName();
            // load exising schemas for version
            var baseSchemas = ProtocolSchema.GetByParent<ProtocolSchema>(baseProtocolVersionId);
            // for each schema, clone
            foreach (ProtocolSchema schema in baseSchemas)
            {
                int baseSchemaId = (int)schema[ProtocolSchema.ProtocolSchemaId];
                int? newSchemaId = CopyProtocolSchema(baseSchemaId, username);
                if (newSchemaId.HasValue)
                {
                    ProtocolSchema newSchema = new ProtocolSchema();
                    newSchema.Get(newSchemaId.Value);
                    // set foreign key
                    newSchema[ProtocolSchema.ProtocolVersionId] = newVersion[ProtocolVersion.ProtocolVersionId];
                    // save new schema
                    newSchema.Save();
                }
            }
            return newVersion;
        }

        /// <summary>
        /// Creates a new Protocol Schema from the specified Schema with timeline and items.
        /// </summary>
        /// <param name="schemaId">The SchemaId of the source schema to use as a template for copying.</param>
        /// <returns>Returns the SchemaId of the new schema if copy was successful.</returns>
        public static int? CopyProtocolSchema(int schemaId)
        {
            SecurityController sc = new SecurityController();
            string username = sc.GetUserName();
            return CopyProtocolSchema(schemaId, username);
        }

        /// <summary>
        /// Creates a new Protocol Schema from the specified Schema with timeline and items.
        /// </summary>
        /// <param name="schemaId">The SchemaId of the source schema to use as a template for copying.</param>
        /// <param name="username">The username to use as entered by for copied items.</param>
        /// <returns>Returns the SchemaId of the new schema if copy was successful.</returns>
        private static int? CopyProtocolSchema(int schemaId, string username)
        {
            int? newSchemaId = null;
            // load source schema
            ProtocolSchema biz = new ProtocolSchema();
            biz.Get(schemaId);

            if (!biz.IsEmpty)
            {
                DataView dv = BusinessObject.GetByParentAsDataView<Timeline>(schemaId);
                dv.Sort = Timeline.DisplayColumnPosition + " ASC";

                int timelineId = -1;

                if (dv.Count > 0)
                {
                    if (!int.TryParse(dv[0][Timeline.TimelineId].ToString(), out timelineId))
                        return null;
                }


                newSchemaId = ProtocolMgmtDa.AddNewArm(schemaId,
                                         "Copy of " + biz[ProtocolSchema.ProtocolArmNumber].ToString(),
                                         "Copy of " + biz[ProtocolSchema.ProtocolArmDescription].ToString(),
                                         timelineId,
                                         username);
                // COPY: Dependent Items
                DataTable sourceSchemaTimeline = ProtocolMgmtDa.GetTimelineBySchmeaId(schemaId);
                var dependentItems = from row in sourceSchemaTimeline.AsEnumerable()
                                     where !row.IsNull("DependentItemTimelineId")
                                     select row;
                var newSchemaItems = ProtocolMgmtDa.GetTimelineBySchmeaId(newSchemaId.Value).AsEnumerable();
                // find items in old schema which are dependent, and find associated item in new schema
                var join = from d in dependentItems
                           join d2 in newSchemaItems on
                           new { prestudy = d["PreStudySchemaItem"], col = d["DisplayColumnPosition"] } equals new { prestudy = d2["PreStudySchemaItem"], col = d2["DisplayColumnPosition"] }
                           select new
                           {
                               Source = d,
                               Destination = d2
                           };
                foreach (var j in join)
                {
                    // load previous schema item
                    int sourceSchemaItemId = (int)j.Source["DependentSchemaItemId"];
                    var sourceSchemaItem = new SchemaItem();
                    sourceSchemaItem.Get(sourceSchemaItemId);
                    // load previous timeline
                    int sourceTimelineId = (int)j.Source["DependentTimelineId"];
                    var sourceTimeline = new Timeline();
                    sourceTimeline.Get(sourceTimelineId);

                    // the timeline which will be depdendent on a previous visit
                    int dependentTimelineId = (int)j.Destination[Timeline.TimelineId];

                    // find target item's schema item
                    var destSchemaItem = BusinessObject.GetByFields<SchemaItem>(new Dictionary<string, object>
                    {
                        { SchemaItem.ProtocolSchemaId, newSchemaId.Value },
                        { SchemaItem.ItemDescription, sourceSchemaItem[SchemaItem.ItemDescription] }
                    }).FirstOrDefault();

                    // find target item's timeline
                    var destTimeline = BusinessObject.GetByFields<Timeline>(new Dictionary<string, object>
                    {
                        { Timeline.ProtocolSchemaId, newSchemaId.Value },
                        { Timeline.DisplayColumnPosition, sourceTimeline[Timeline.DisplayColumnPosition] },
                        { Timeline.PreStudySchemaItem, sourceTimeline[Timeline.PreStudySchemaItem] }
                    }).FirstOrDefault();

                    // validate
                    if (destSchemaItem != null && destTimeline != null)
                    {
                        // find target item
                        var destItemTimeline = BusinessObject.GetByFields<ItemTimeline>(new Dictionary<string, object>
                        {
                            { ItemTimeline.SchemaItemId, destSchemaItem[ItemTimeline.SchemaItemId] },
                            { ItemTimeline.TimelineId, destTimeline[ItemTimeline.TimelineId] },
                        }).FirstOrDefault();
                        // validate
                        if (destItemTimeline != null)
                        {
                            // create mapping that timeline is dependent on previous item
                            int dependentItemTimelineId = (int)destItemTimeline[ItemTimeline.ItemTimelineId];
                            RelatedRecordController.CreateRelatedRecord("ProtocolMgr_Timeline", dependentTimelineId, "ProtocolMgr_ItemTimeline", dependentItemTimelineId);
                        }
                    }
                }

            }

            return newSchemaId;
        }

        #region PATIENT DATA METADATA

        /// <summary>
        /// For the specific table, get a list of fields and metadata
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public static Dictionary<string, IDictionary<string, string>> GetTableFieldsMetadata(string tableName)
        {
            Dictionary<string, IDictionary<string, string>> fieldToMetadata = new Dictionary<string, IDictionary<string, string>>();
            // get table keys
            List<string> keyNames = new List<string>();
            // add pri key
            keyNames.Add(BOL.BusinessObject.GetPrimaryKeyName(tableName));
            // add foreign keys
            if (BOL.BusinessObject.HasParentTable(tableName))
                keyNames.AddRange(BOL.BusinessObject.GetForeignKeyNames(tableName));
            var fieldMetadata = from field in BOL.BusinessObject.GetFieldNames(tableName)
                                // ignore audit fields
                                where !AUDIT_FIELD_NAMES.Contains(field)
                                // show non-key suppressed fields
                                let isSuppressed = BOL.BusinessObject.IsSuppressed(tableName, field)
                                where !isSuppressed || !keyNames.Contains(field)
                                // ignore missing metadata
                                where BOL.BusinessObject.HasMetadataFieldAttributes(tableName, field, null)
                                let order = BOL.BusinessObject.GetFieldOrder(tableName, field) ?? int.MaxValue
                                orderby order ascending
                                select new
                                {
                                    FieldName = field,
                                    FieldMetadata = BOL.BusinessObject.GetMetadataFieldAttributes(tableName, field)
                                };
            return fieldMetadata.ToDictionary(f => f.FieldName, f => f.FieldMetadata);
        }

        #endregion

        #region SCHEDULING

        /// <summary>
        /// For the given schema, create new ItemTimelines (i.e., visit items) and update all assigned patients' schedules
        /// </summary>
        /// <param name="protocolSchemaId">The Protocol Schema in which to create new items</param>
        /// <param name="timelineIdSchemaItemIdPairs">A list of KeyValue(key=TimelineId,value=SchemaItemId) pairs to insert ItemTimeline</param>
        /// <param name="username">The username creating the new mapping</param>
        public static void ScheduleNewPatientItems(int protocolSchemaId, List<KeyValuePair<int, int>> timelineIdSchemaItemIdPairs, string username)
        {
            // step 1: create visit items
            foreach (var pair in timelineIdSchemaItemIdPairs)
            {
                int timelineId = pair.Key;
                int schemaItemId = pair.Value;
                ItemTimeline it = new ItemTimeline();
                it[ItemTimeline.TimelineId] = timelineId;
                it[ItemTimeline.SchemaItemId] = schemaItemId;
                it.Save();
            }
            // step 2: create new scheduled for new visit items
            PatientProtocolController.ScheduleNewPatientItems(protocolSchemaId, username);
        }

        #endregion

        #region RANDOMIZATION

        /// <summary>
        /// Returns a random ProtocolSchemaId representing a randomly selected trail (based on weights)
        /// </summary>
        /// <param name="protocolId"></param>
        /// <returns></returns>
        public static int? RandomizeTrial(int protocolId)
        {
            return ProtocolMgmtUtil.RandomizeTrial(protocolId);
        }

        /// <summary>
        /// Returns a random ProtocolSchemaId representing a randomly selected trail (based on weights)
        /// </summary>
        /// <param name="schemasAndWeights"></param>
        /// <param name="filledStatus"></param>
        /// <returns></returns>
        public static int? RandomizeTrial(IDictionary<int, int> schemasAndWeights, IDictionary<int, bool> filledStatus)
        {
            int? randomSchemaId = null;
            // try N times til a successful match found
            for (int i = 0; i < RANDOMIZATION_TRIES; i++)
            {
                // attempt to get using original ratios
                randomSchemaId = ProtocolMgmtUtil.RandomizeTrial(schemasAndWeights);
                // validation
                if (randomSchemaId.HasValue)
                {
                    // if schema is already filled, do not allow, try next
                    if (filledStatus.ContainsKey(randomSchemaId.Value) && filledStatus[randomSchemaId.Value])
                    {
                        randomSchemaId = null;
                        continue;
                    }
                    // valid id
                    else
                    {
                        break;
                    }
                }
            }
            return randomSchemaId;
        }

        #endregion

        #region CONFIGURATIONS

        /// <summary>
        /// Gets the XML configuration document
        /// </summary>
        /// <returns></returns>
        public static XmlDocument GetXmlConfiguration()
        {
            return XmlUtil.GetXmlDoc(XML_CONFIGURATION_PATH);
        }

        /// <summary>
        /// Gets the XmlNode containing configurations for the specified protocol
        /// </summary>
        /// <param name="fieldName"></param>
        /// <param name="fieldValue"></param>
        /// <param name="xPath"></param>
        /// <returns></returns>
        public static XmlNode GetConfigurationNode(string fieldName, object fieldValue, string xPath)
        {
            XmlDocument config = GetXmlConfiguration();
            if (config != null)
            {
                XmlNodeList nodes = config.SelectNodes(xPath);
                DataView protocolsView = BusinessObject.GetByFields<Protocol>(new Dictionary<string, object> { { fieldName, fieldValue } }).AsDataView<Protocol>();
                if (nodes.Count > 0 && protocolsView.Count > 0)
                {
                    foreach (XmlNode node in nodes)
                    {
                        if (node.Attributes["match"] != null)
                        {
                            string match = node.Attributes["match"].InnerText;
                            protocolsView.RowFilter = match;
                            if (protocolsView.Count > 0)
                                return node;
                        }
                    }
                }
            }
            return null;
        }

        /// <summary>
        /// For the specified Protocol, get the SQL for displaying range of visits (calendar)
        /// </summary>
        /// <param name="datasetSQL">The patient dataset SQL</param>
        /// <param name="protocolId">The protocol id</param>
        /// <returns></returns>
        public static string GetVisitDatasetSQL(string datasetSQL, int protocolId)
        {
//            // default visit dataset
//            string defaultVisitSQL = string.Format(
//@"
//SELECT DISTINCT
//	pp.ProtocolId,
//	pp.PatientId,
//	pp.PatientProtocolId,
//	-- patient item info
//	b.PatientSchemaId,
//	b.PatientItemId,
//	b.ItemTimelineId,
//	b.ScheduledDate,
//	b.FirstAnticipatedDate,
//	b.LastAnticipatedDate,
//	b.Status
//FROM PatientProtocols pp
//INNER JOIN Protocols p
//	ON pp.ProtocolId = p.ProtocolId
//INNER JOIN
//(
//	SELECT
//		c.ProtocolId,
//		b.ProtocolSchemaId,
//		b.ProtocolArmDescription,
//		a.PatientId,
//		a.PatientSchemaId			
//	FROM ProtocolMgr_PatientSchemas a
//	INNER JOIN ProtocolMgr_ProtocolSchemas b
//		ON a.ProtocolSchemaId = b.ProtocolSchemaId
//	INNER JOIN ProtocolMgr_ProtocolVersions c
//		ON b.ProtocolVersionId = c.ProtocolVersionId
//) pps
//	ON pp.ProtocolId = pps.ProtocolId AND pp.PatientId = pps.PatientId
//INNER JOIN ProtocolMgr_PatientItems b
//	ON pps.PatientSchemaId = b.PatientSchemaId
//WHERE
//	p.ProtocolId = {0}
//", protocolId);

            // get visit config node
            string customVisitSQL = "";
            XmlNode visitNode = GetConfigurationNode(Protocol.ProtocolId, protocolId, "//visits/visit");
            // get visit dataset SQL
            if (visitNode != null)
            {
                XmlNode sqlNode = visitNode.SelectSingleNode("sql");
                if (sqlNode != null)
                    customVisitSQL = sqlNode.InnerText;
            }
            return customVisitSQL;

            /*
            // get visit SQL
            string visitSQL = !string.IsNullOrEmpty(customVisitSQL) ? customVisitSQL : defaultVisitSQL;

            string format =
            @"
                SELECT
                    b.*
                -- restrict to dataset
                FROM ({0}) a
                INNER JOIN ({1}) b
                ON a.PatientId = b.PatientId
                    -- restrict to Protocol
                    AND b.ProtocolId = {2}
            ";
            string fullDatasetSQL = string.Format(format, datasetSQL, visitSQL, protocolId);
            return fullDatasetSQL;
            */
        }

        #endregion

    }

    /// <summary>
    /// Defines the controller lolgic for handling a Patient's actions, events, triggers and statuses on a Protocol.
    /// </summary>
    public class PatientProtocolController
    {
        /// <summary>
        /// The LookupCode where LkpFieldName="IdType" representing the Patient's Protocol Participant Id
        /// </summary>
        protected static readonly string PROTOCOL_PARTICIPANT_ID_CODE = "Participant ID";

        /// <summary>
        /// The LookupCode where LkpFieldName="IdType" representing the Patient's Protocol Study Id
        /// </summary>
        protected static readonly string PROTOCOL_STUDY_ID_CODE = "Study Id";

        /// <summary>
        /// The table which is the source system for an unplanned visit related record
        /// </summary>
        private static readonly string UNPLANN_VISIT_SRC_TABLE = "ProtocolMgr_PatientItems";

        public static readonly string ScreeningFailed = "Failed Screening";
        public static readonly string ScreeningPassed = "Passed Screening";
        public static readonly string Consented = "Consented";
        public static readonly string Ineligible = "Ineligible";
        public static readonly string Eligible = "Eligible";
        public static readonly string RegistrationPending = "Registration Pending";
        public static readonly string Registered = "Registered";
        public static readonly string OnStudy = "On Study";
        public static readonly string OffTreatment = "Off Treatment";
        public static readonly string OffStudy = "Off Study";

                // eligibility statuses
        private static readonly string ELIGIBILITY_INCOMPLETE = "Incomplete";
        private static readonly string ELIGIBILITY_ELIGIBLE = PatientProtocolController.Eligible;
        private static readonly string ELIGIBILITY_INELIGIBLE = PatientProtocolController.Ineligible;

        /// <summary>
        /// An ordered list of Patient Protocol Statuses
        /// </summary>
        public static readonly string[] PatientStatusSequence = new string[] 
        {
            ScreeningFailed,
            ScreeningPassed,
            Consented,
            Ineligible,
            Eligible,
            RegistrationPending,
            Registered,
            OnStudy,
            OffTreatment,
            OffStudy
        };

        /// <summary>
        /// The PatientProtocolId used to query statuses
        /// </summary>
        private int patientProtocolId;

        /// <summary>
        /// BusinessObject holder PatientProtocolStatus records for PatientProtocolId
        /// </summary>
        private DataTable statusTable = null;

        /// <summary>
        /// Creates a new instance by using the specified patientProtocolId
        /// </summary>
        /// <param name="patientProtocolId"></param>
        public PatientProtocolController(int patientProtocolId)
        {
            this.patientProtocolId = patientProtocolId;
            // load statuses
            ReloadStatuses();
        }

        /// <summary>
        /// Re-queries Status Records from db
        /// </summary>
        public void ReloadStatuses()
        {
            statusTable = BusinessObject.GetByParentAsDataView<PatientProtocolStatus>(patientProtocolId).Table;
        }

        /// <summary>
        /// Returns the latest status in a Patient's ProtocolStatus list
        /// </summary>
        /// <returns></returns>
        public string GetLatestStatus()
        {
            return GetLatestPatientStatus(statusTable, null);
        }

        /// <summary>
        /// Returns true if the specified Status is found in the list of PatientProtocolStatus records
        /// </summary>
        /// <param name="status"></param>
        /// <returns></returns>
        public bool HasStatus(string status)
        {
            return FindStatus(statusTable, status, null).Length > 0;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="status"></param>
        /// <returns></returns>
        public DataRow GetStatus(string status)
        {
            return GetStatus(statusTable, status);
        }

        /// <summary>
        /// Gets the Date of the specified status
        /// </summary>
        /// <param name="status"></param>
        /// <returns></returns>
        public DateTime? GetStatusDate(string status)
        {
            DateTime? statusDate = null;
            DataRow statusRow =  GetStatus(status);
            if (statusRow != null && !statusRow.IsNull(PatientProtocolStatus.PtProtocolStatusDate))
            {
                statusDate = (DateTime)statusRow[PatientProtocolStatus.PtProtocolStatusDate];
            }
            return statusDate;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="status"></param>
        /// <returns></returns>
        private DataRow[] FindStatus(string status)
        {
            return FindStatus(statusTable, status, null);
        }

        /// <summary>
        /// Creates a patient protocol status by status if one doesn't exist
        /// </summary>
        /// <param name="status"></param>
        /// <returns></returns>
        public PatientProtocolStatus CreateStatus(string status)
        {
            PatientProtocolStatus biz = new PatientProtocolStatus();
            // if status exists, return
            if (HasStatus(status))
            {
                int id = (int)GetStatus(status)[PatientProtocolStatus.PatientProtocolStatusId];
                biz.Get(id);
                return biz;
            }
            // otherwise create
            else
            {
                biz[PatientProtocolStatus.PatientProtocolId] = patientProtocolId;
                biz[PatientProtocolStatus.PtProtocolStatus] = status;
                biz.Save();
                // refresh list on update
                ReloadStatuses();
                return biz;
            }
        }

        #region STATIC METHODS

        /// <summary>
        /// use GetLatestStatus() instead
        /// </summary>
        /// <param name="protocolId"></param>
        /// <returns></returns>
        public static DataView GetProtocolStatuses(int protocolId)
        {
            string dataset = CacheManager.GetDatasetSQL(HttpContext.Current.Session[SessionKey.DatasetId]);
            return ProtocolMgmtDa.GetProtocolStatuses(protocolId, dataset).DefaultView;
        }

        /// <summary>
        /// Returns a list of status records by status, optionally filter by patient protocol id
        /// </summary>
        /// <param name="searchTable">the datatable containing patient protocol status records</param>
        /// <param name="searchStatus">the status by which to filter list</param>
        /// <param name="patientProtocolId">filters list by patient protocol id, null values for no patient protocol filter</param>
        /// <returns></returns>
        public static DataRow[] FindStatus(DataTable searchTable, string searchStatus, int? patientProtocolId)
        {
            string testStatus = searchStatus.Replace("'", "''");
            string searchExpression = PatientProtocolStatus.PtProtocolStatus + " = '" + testStatus + "'";
            // determine if table needs to be filtered by PatientProtocolId
            if (patientProtocolId.HasValue)
            {
                searchExpression += " AND " + PatientProtocolStatus.PatientProtocolId + " = " + patientProtocolId;
            }
            return searchTable.Select(searchExpression);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="searchTable"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public static DataRow GetStatus(DataTable searchTable, string status)
        {
            DataRow[] foundStatuses = FindStatus(searchTable, status, null);
            if (foundStatuses.Length > 0)
            {
                return foundStatuses[0];
            }
            return null;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="searchList"></param>
        /// <param name="patientProtocolId"></param>
        /// <returns></returns>
        public static string GetLatestPatientStatus(DataTable searchList, int? patientProtocolId)
        {
            string lastStatus = string.Empty;
            // iterate through possible statuses and find last occurance in patientprotocol status list
            for (int i = 0; i < PatientStatusSequence.Length; i++)
            {
                string status = PatientStatusSequence[i];
                DataRow[] foundStatus = FindStatus(searchList, status, patientProtocolId);
                if (foundStatus.Length > 0)
                {
                    string rowStatus = foundStatus[0][PatientProtocolStatus.PtProtocolStatus].ToString();
                    lastStatus = rowStatus;
                }
            }
            return lastStatus;
        }

        #endregion

        #region Unplanned Visits

        /// <summary>
        /// Returns if the specified table and key has an Unplanned Visit RelatedRecord
        /// </summary>
        /// <param name="patientItemId"></param>
        /// <param name="unplannedTable"></param>
        /// <param name="unplannedTableKey"></param>
        /// <returns></returns>
        public static bool HasUnplannedVisitRelatedRecord(int patientItemId, string unplannedTable, int unplannedTableKey)
        {
            DataTable relatedRecords = RelatedRecordsDa.GetRecord(UNPLANN_VISIT_SRC_TABLE, patientItemId, unplannedTable, unplannedTableKey);
            return relatedRecords.Rows.Count > 0;
        }

        /// <summary>
        /// Returns the Unplanned Visit RelatedRecordId for the specificed table and key
        /// </summary>
        /// <param name="patientItemId"></param>
        /// <param name="unplannedTable"></param>
        /// <param name="unplannedTableKey"></param>
        /// <returns></returns>
        public static int GetUnplannedVisitRelatedRecord(int patientItemId, string unplannedTable, int unplannedTableKey)
        {
            DataTable relatedRecords = RelatedRecordsDa.GetRecord(UNPLANN_VISIT_SRC_TABLE, patientItemId, unplannedTable, unplannedTableKey);
            int relatedRecordId = (int)relatedRecords.Rows[0][RelatedRecord.RelatedRecordId];
            return relatedRecordId;
        }

        /// <summary>
        /// Creates (if doesn't exist) an Unplanned Visit RelatedRecord with the specificed table and key
        /// </summary>
        /// <param name="patientItemId"></param>
        /// <param name="unplannedTable"></param>
        /// <param name="unplannedTableKey"></param>
        /// <returns></returns>
        public static int CreateUnplannedVisitRelatedRecord(int patientItemId, string unplannedTable, int unplannedTableKey)
        {
            // if unplanned visit related record exists, return
            if (HasUnplannedVisitRelatedRecord(patientItemId, unplannedTable, unplannedTableKey))
            {
                return GetUnplannedVisitRelatedRecord(patientItemId, unplannedTable, unplannedTableKey);
            }
            // otherwise create unplanned visit related record
            else
            {
                /*
                RelatedRecord relatedRecord = new RelatedRecord();
                relatedRecord[RelatedRecord.SrcTableName] = UNPLANN_VISIT_SRC_TABLE;
                relatedRecord[RelatedRecord.SrcPrimaryKey] = patientItemId;
                relatedRecord[RelatedRecord.DestTableName] = unplannedTable;
                relatedRecord[RelatedRecord.DestPrimaryKey] = unplannedTableKey;
                relatedRecord[RelatedRecord.SrcSystem] = RelatedRecordsDa.CAISIS_SRC_SYSTEM;
                relatedRecord.Save();
                */

                RelatedRecord relatedRecord = RelatedRecordController.CreateRelatedRecord(UNPLANN_VISIT_SRC_TABLE, patientItemId, unplannedTable, unplannedTableKey);
                int relatedRecordId = (int)relatedRecord[relatedRecord.PrimaryKeyName];

                // return newly create related record id
                return relatedRecordId;
            }
        }

        #endregion

        #region StudyId, ScreeningId and ParticipantId Generatation

        /// <summary>
        /// Returns if the current patient has a Participant Id in the Identifiers table.
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public static bool HasParticipantId(int protocolId, int patientId)
        {
            DataRow foundRow = _GetParticipantIdIdentifierRecord(protocolId, patientId);
            return foundRow != null;
        }

        /// <summary>
        /// Returns the Current Patient's Participant Id Identifier
        /// </summary>
        /// <param name="protocolId"></param>
        /// <param name="patientId"></param>
        /// <returns></returns>
        public static string GetParticipantId(int protocolId, int patientId)
        {
            DataRow foundRow = _GetParticipantIdIdentifierRecord(protocolId, patientId);
            if (foundRow != null)
            {
                return foundRow[Identifier.Identifier_Field].ToString();
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// For the specified Patient Protocol, create a Participant Id Identifier.
        /// NOTE: Only 1 Participant Id per patient.
        /// </summary>
        /// <param name="ptProtocolId">The primary key of the Patient Protocol record.</param>
        /// <returns>A populated Identifier containing the Participant Id.</returns>
        public static Identifier CreateParticipantIdIdentifier(int ptProtocolId)
        {
            PatientProtocol ptProtocolBiz = new PatientProtocol();
            ptProtocolBiz.Get(ptProtocolId);
            return CreateParticipantIdIdentifier(ptProtocolBiz);
        }

        /// <summary>
        /// For the specified Patient Protocol, create a Participant Id Identifier.
        /// NOTE: Only 1 Participant Id per patient.
        /// </summary>
        /// <param name="ptProtocolBiz">The populated Patient Protocol Biz.</param>
        /// <returns>A populated Identifier containing the Participant Id.</returns>
        public static Identifier CreateParticipantIdIdentifier(PatientProtocol ptProtocolBiz)
        {
            // get keys
            int protocolId = (int)ptProtocolBiz[PatientProtocol.ProtocolId];
            int patientId = (int)ptProtocolBiz[PatientProtocol.PatientId];
            return CreateParticipantIdIdentifier(protocolId, patientId);
        }

        /// <summary>
        /// For the specified Patient Protocol, create a Participant Id Identifier.
        /// NOTE: Only 1 Participant Id per patient.
        /// </summary>
        /// <param name="protocolId">The pri key of the Protocol rcord.</param>
        /// <param name="patientId">The pri key of the Patient record.</param>
        /// <returns>A populated Identifier containing the Participant Id.</returns>
        public static Identifier CreateParticipantIdIdentifier(int protocolId, int patientId)
        {
            DataRow foundRow = _GetParticipantIdIdentifierRecord(protocolId, patientId);
            if (foundRow != null)
            {
                Identifier idBiz = new Identifier();
                int priKey = (int)foundRow[Identifier.IdentifierId];
                idBiz.Get(priKey);

                return idBiz;
            }
            else
            {
                Identifier idBiz = new Identifier();
                string partId = GenerateParticipantId(protocolId);
                // Create Participant Id identifier for Patient
                Identifier identifierBiz = new Identifier();
                identifierBiz[Identifier.PatientId] = patientId;
                identifierBiz[Identifier.IdType] = PROTOCOL_PARTICIPANT_ID_CODE;
                identifierBiz[Identifier.Identifier_Field] = partId;
                identifierBiz.Save();

                // update notes field for patient with Participant ID
                Patient existingPatientRecord = new Patient();
                existingPatientRecord.Get(patientId);
                string prevNotes = existingPatientRecord[Patient.PtNotes].ToString();
                existingPatientRecord[Patient.PtNotes] = prevNotes + " | " + PROTOCOL_PARTICIPANT_ID_CODE + ": " + partId;
                existingPatientRecord.Save();

                return idBiz;
            }
        }

        /// <summary>
        /// For the specified Patient Protocol, create a new Identifier record for the patient on a protocol
        /// comprising of the protocol num.
        /// NOTE: Only created records if identifier doesn't exist, will also delete "orphaned" identifiers. 
        /// </summary>
        /// <param name="ptProtocolId">The primary key of the Patient Protocol record.</param>
        /// <returns></returns>
        public static Identifier CreateStudyIdIdentifier(int ptProtocolId)
        {
            PatientProtocol ptProtocolBiz = new PatientProtocol();
            ptProtocolBiz.Get(ptProtocolId);
            return CreateStudyIdIdentifier(ptProtocolBiz);
        }

        /// <summary>
        /// For the specified Patient Protocol, create a new Identifier record for the patient on a protocol
        /// comprising of the protocol num.
        /// NOTE: Only created records if identifier doesn't exist, will also delete "orphaned" identifiers. 
        /// </summary>
        /// <param name="ptProtocolBiz">The populated Patient Protocol Biz.</param>
        /// <returns>A populated Identifier Biz of the Identifier created/loaded.</returns>
        public static Identifier CreateStudyIdIdentifier(PatientProtocol ptProtocolBiz)
        {
            // get keys
            int protocolId = (int)ptProtocolBiz[PatientProtocol.ProtocolId];
            int patientId = (int)ptProtocolBiz[PatientProtocol.PatientId];

            // get protocol name
            Protocol protocolBiz = new Protocol();
            protocolBiz.Get(protocolId);

            string protocolNum = protocolBiz[Protocol.ProtocolNum].ToString();
            string studyIdValue = ptProtocolBiz[PatientProtocol.PtProtocolStudyId].ToString();

            // new study identifier in form 'protocol num-patient protocol study id'
            string computedStudyIdIdentifier = string.Format("{0}-{1}", protocolNum, studyIdValue);

            // get a list of current patient's current study id's
            IdentifierDa da = new IdentifierDa();
            DataTable dt = da.GetPatientIdentifierTableByIdType(patientId, PROTOCOL_STUDY_ID_CODE);

            // if there are study id identifiers, check if any match computed, otherwise create
            if (dt.Rows.Count > 0)
            {
                // get a list of study id identifiers which start with this protocol num, which will be filtered
                var startsWithProtocolNum = from record in dt.AsEnumerable()
                                            let identifierId = (int)record[Identifier.IdentifierId]
                                            let identifier = record[Identifier.Identifier_Field].ToString()
                                            where identifier.StartsWith(protocolNum)
                                            select new
                                            {
                                                StudyId = identifier,
                                                IdentifierId = identifierId
                                            };
                // get those study ids which match exactly
                var exactMatches = startsWithProtocolNum.Where(s => s.StudyId.Equals(computedStudyIdIdentifier, StringComparison.CurrentCultureIgnoreCase));
                // get those which are LIKE, but don't match exactly
                // TODO: cleanup ???
                var inexactMatches = startsWithProtocolNum.Except(exactMatches);
                /*
                // patient should only have 1 study id that begins with this protocol num, delete others
                var delete = startsWithProtocolNum.Except(exactMatches);
                Identifier idBiz = new Identifier();
                foreach (var p in delete)
                {
                    idBiz.Delete(p.IdentifierId);
                }
                */

                // if computed study id exists, return first instance
                if (exactMatches.Count() > 0)
                {
                    Identifier biz = new Identifier();
                    int identifierId = exactMatches.First().IdentifierId;
                    biz.Get(identifierId);
                    return biz;
                }

                // if there existing study id like this protocol num, update to new computed value
                if (startsWithProtocolNum.Count() > 0)
                {
                    Identifier biz = new Identifier();
                    biz.Get(startsWithProtocolNum.First().IdentifierId);
                    biz[Identifier.Identifier_Field] = computedStudyIdIdentifier;
                    biz.Save();
                    return biz;
                }

                // else continue inserting
            }
            //otherwise, create new Identifier
            Identifier identifierBiz = new Identifier();
            // populate required fields
            identifierBiz[Identifier.PatientId] = patientId;
            // set identifier type field "Study Id"
            identifierBiz[Identifier.IdType] = PROTOCOL_STUDY_ID_CODE;
            // set identifier field "ct05-25-25"
            identifierBiz[Identifier.Identifier_Field] = computedStudyIdIdentifier;
            // save and return
            identifierBiz.Save();

            // return populated instance
            return identifierBiz;
        }

        /// <summary>
        /// For the specified Protocol, returns a genterate Participant Id
        /// </summary>
        /// <param name="protocolId"></param>
        /// <returns></returns>
        public static string GenerateParticipantId(int protocolId)
        {
            return ProtocolMgmtDa.GetNextParticipantID().ToString();
        }

        /// <summary>
        /// For the specified Protocol, generate the next Study Id
        /// </summary>
        /// <param name="protocolId"></param>
        /// <returns></returns>
        public static string GenerateStudyId(int protocolId)
        {
            int? nextStudyId = null;
            bool calculateStudyIdBySite = ProtocolMgmtUtil.GenerateStudyIdByOrganization();
            // calculate site specific study id
            if (calculateStudyIdBySite)
            {
                int parseValue = -1;

                Protocol protocol = new Protocol();
                protocol.Get(protocolId);
                string protocolNum = protocol[Protocol.ProtocolNum].ToString();
                string strippedProtocolNum = protocolNum.Contains("-") ? protocolNum.Substring(protocolNum.LastIndexOf("-") + 1) : protocolNum;

                if (int.TryParse(strippedProtocolNum, out parseValue))
                {
                    int normalizedProtocolNum = int.Parse(strippedProtocolNum);
                    int userId = new UserController().GetUserId();
                    DataTable userOrganizations = new UserDa().GetUserOrganizations(userId);
                    if (userOrganizations.Rows.Count > 0)
                    {
                        int organizationId = (int)userOrganizations.Rows[0][ProjectOrganization.OrganizationId];
                        // OLD CODE
                        // nextStudyId = ProtocolMgmtDa.GetNextStudyId(protocolId, organizationId);

                        var organization = new ProjectOrganization();
                        organization.Get(organizationId);
                        string orgNum = organization[ProjectOrganization.OrgNum].ToString();

                        // validation: requires OrgNum
                        if (!string.IsNullOrEmpty(orgNum))
                        {
                            // get a list of all Patients on Protocol
                            var patientProtocols = BusinessObject.GetByFields<PatientProtocol>(new Dictionary<string, object> { { PatientProtocol.ProtocolId, protocolId } });
                            List<int> normalizedStudyIds = new List<int>();
                            // for each patient, collection StudyId for trial
                            foreach (var patientProtocol in patientProtocols)
                            {
                                // full compound id
                                string fullStudyId = patientProtocol[PatientProtocol.PtProtocolStudyId].ToString();
                                // strip last 3 numbers for patient seq #
                                if (fullStudyId.Length >= 3)
                                {
                                    string normalizedStudyId = fullStudyId.Substring(fullStudyId.Length - 3, 3);
                                    // validate int, add to collection
                                    if (int.TryParse(normalizedStudyId, out parseValue))
                                    {
                                        normalizedStudyIds.Add(int.Parse(normalizedStudyId));
                                    }
                                }
                            }
                            if (normalizedStudyIds.Count() > 0)
                            {
                                // get next study id (current MAX + 1)
                                // TODO: MAX (i.e., 1, 2, 15, 16, then 17) or NEXT (i.e., 1, 2, 15, 16, then 3)
                                var maxNormalizedStudyId = normalizedStudyIds.Max();
                                int nextNormalizedStudyId = maxNormalizedStudyId + 1;

                                // FORMAT: 2 digit org num + 3 digit protocol id + 3 digit incremental subject id
                                string nextFullStudyId = string.Format("{0:d2}{1:d3}{2:d3}", orgNum, normalizedProtocolNum, nextNormalizedStudyId);
                                
                                return nextFullStudyId;
                            }
                        }
                    }
                }
                
                
            }
            // default logic  
            else
            {
                nextStudyId = ProtocolMgmtDa.GetNextStudyId(protocolId);
            }

            // return calculated value
            return nextStudyId.HasValue ? nextStudyId.ToString() : "";
        }

        /// <summary>
        /// Generate the next Screening Id
        /// </summary>
        /// <returns></returns>
        public static string GenerateScreeningId()
        {
            return ProtocolMgmtDa.GetNextScreeningId().ToString();
        }

        private static DataRow _GetParticipantIdIdentifierRecord(int protocolId, int patientId)
        {
            DataRow foundRow = null;
            IdentifierDa da = new IdentifierDa();
            // for current patient get a list of participant ids
            DataTable patientParticipantIds = da.GetPatientIdentifierTableByIdType(patientId, PROTOCOL_PARTICIPANT_ID_CODE);
            if (patientParticipantIds.Rows.Count > 0)
            {
                return patientParticipantIds.Rows[0];
            }
            else
            {
                return null;
            }
        }

        #endregion

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientProtocolId"></param>
        /// <param name="patientSchemaId"></param>
        /// <param name="offTreatmentDate"></param>
        /// <returns></returns>
        public static PatientProtocolStatus PutPatientOffTreatment(int patientProtocolId, int patientSchemaId, DateTime offTreatmentDate)
        {
            // first remove patient item and fields
            //ProtocolMgmtDa.DeletePatientItems(patientProtocolId, patientSchemaId, offTreatmentDate);
            // then, create off study status if needed
            PatientProtocolController ppc = new PatientProtocolController(patientProtocolId);
            return ppc.CreateStatus(PatientProtocolController.OffTreatment);
        }

        /// <summary>
        /// Places the patient off study and removes future visits.
        /// </summary>
        /// <param name="patientProtocolId"></param>
        /// <param name="patientSchemaId"></param>
        /// <param name="offStudyDate"></param>
        /// <returns></returns>
        public static PatientProtocolStatus PutPatientOffStudy(int patientProtocolId, int patientSchemaId, DateTime offStudyDate)
        {
            // first remove patient item and fields
            //ProtocolMgmtDa.DeletePatientItems(patientProtocolId, patientSchemaId, offStudyDate);
            // then, create off study status if needed
            PatientProtocolController ppc = new PatientProtocolController(patientProtocolId);
            return ppc.CreateStatus(PatientProtocolController.OffStudy);
        }

        /// <summary>
        /// Removes the patient from the specified treatment arm.
        /// </summary>
        /// <param name="patientSchemaId">The patient schema id</param>
        public static void DeletePatientFromSchema(int patientSchemaId)
        {
            ProtocolMgmtDa.DeletePatientFromSchema(patientSchemaId);
        }

        #region RELATED RECORDS

        /// <summary>
        /// Returns a list of T which T = SrcTable and PatientProtocol = DestTable.
        /// i.e., Return a List of LabTests related to the PatientProtocol
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="patientProtocolId"></param>
        /// <returns></returns>
        public static IEnumerable<T> GetPatientRelatedRecords<T>(int patientProtocolId)
            where T : BusinessObject, IBusinessObject, new()
        {
            PatientProtocol patientProtocol = new PatientProtocol();
            patientProtocol.Get(patientProtocolId);
            return RelatedRecordController.GetRelatedRecordsByDestination<T>(patientProtocol);
        }

        /// <summary>
        /// Return a list of RelatedRecords, restricted to SrcTable=srcTable and DestTable = PatientProtocol.
        /// </summary>
        /// <param name="patientProtocolId"></param>
        /// <returns></returns>
        public static IEnumerable<RelatedRecord> GetPatientRelatedRecords(int patientProtocolId, string srcTable)
        {
            var relatedLabs = RelatedRecordController.GetRelatedRecordsByDest(srcTable, "PatientProtocols", patientProtocolId);
            return relatedLabs;
        }

        #endregion

        #region SCHEDULING

        /// <summary>
        /// For all patient items on this schema, schedule unscheduled items which are dependent on a PatientProtocolStatus.
        /// </summary>
        /// <param name="patientSchemaId">The patient schema id representing the Patient on a treatment arm.</param>
        public static void ScheduleDependentItemsByPatientStatus(int patientSchemaId)
        {
            SecurityController sc = new SecurityController();
            string username = sc.GetUserName();
            ProtocolMgmtDa.ScheduleDependentPatientItemsByStatus(patientSchemaId, username);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="patientItemId">The primary key of the patient visit item.</param>
        /// <param name="status">The status of the item which will trigger dependent item scheduling.</param>
        public static void ScheduleDependentItemsByItemStatus(int patientItemId, string status)
        {
            // trigger scheduling for dependent items
            if (status.Equals("Performed", StringComparison.CurrentCultureIgnoreCase))
            {
                Caisis.Security.SecurityController sc = new Caisis.Security.SecurityController();
                string username = sc.GetUserName();
                ProtocolMgmtDa.ScheduleDependentPatientItems(patientItemId, username);
            }
        }

        /// <summary>
        /// Schedules new Patient Items for all patients on a schema
        /// </summary>
        /// <param name="protocolSchemaId">The Protocol Schema in which to create new items</param>
        /// <param name="username">The username creating the new mapping</param>
        public static void ScheduleNewPatientItems(int protocolSchemaId, string username)
        {
            ProtocolMgmtDa.ScheduleNewPatientItems(protocolSchemaId, username);
        }

        #endregion

        #region Utilities

        /// <summary>
        /// For the specified table, sort by study id (right X characters)
        /// </summary>
        /// <param name="patientsList"></param>
        /// <param name="sortDirection"></param>
        /// <returns></returns>
        public static DataView SortPatientsByStudyId(DataTable patientsList, string sortDirection)
        {
            // validation
            if (patientsList.Rows.Count == 0)
                return patientsList.DefaultView;

            // num of right digits representing the study id
            int rightSortCount = 3;
            // sort by study id asc
            IEnumerable<DataRow> sortedByStudyId = from row in patientsList.AsEnumerable()
                                                   let studyId = row[PatientProtocol.PtProtocolStudyId].ToString()
                                                   let right = !string.IsNullOrEmpty(studyId) && studyId.Length >= rightSortCount ? studyId.Substring(studyId.Length - rightSortCount) : studyId
                                                   let simpleId = !string.IsNullOrEmpty(right) && PageUtil.IsInteger(right) ? int.Parse(right) : 0
                                                   orderby simpleId ascending
                                                   select row;

            // if sorting desc, reverse order
            if (sortDirection.Equals("DESC", StringComparison.OrdinalIgnoreCase))
                sortedByStudyId = sortedByStudyId.Reverse();

            // set sort View
            return new DataView(sortedByStudyId.CopyToDataTable());

        }
        #endregion

        #region ELIGIBILITY

        public static bool? IsPatientEligible(int ptProtocolId)
        {
            PatientProtocol ptProtocol = new PatientProtocol();
            ptProtocol.Get(ptProtocolId);
            int protocolId = (int)ptProtocol[PatientProtocol.ProtocolId];
            // get most recent version with a survey
            var metaSurveyIds = from version in BOL.BusinessObject.GetByParent<ProtocolVersion>(protocolId)
                                where !version.IsNull(ProtocolVersion.MetadataSurveyId)
                                let metaSurveyId = (int)version[ProtocolVersion.MetadataSurveyId]
                                orderby (int)version[ProtocolVersion.ProtocolVersionId] descending
                                select metaSurveyId;
            if (metaSurveyIds.Count() > 0)
            {
                int metaSurveyId = metaSurveyIds.First();
                PatientProtocolRegistration registration = BOL.BusinessObject.GetByParent<PatientProtocolRegistration>(ptProtocolId).FirstOrDefault();
                if (registration != null)
                {
                    int registrationId = (int)registration[PatientProtocolRegistration.PatientProtocolRegistrationId];
                    bool? eligible = IsPatientEligible(ptProtocolId, metaSurveyId, registrationId);
                    return eligible;
                }
            }
            return null;
        }

        public static bool? IsPatientEligible(int ptProtocolId, int metaSurveyId, int registrationId)
        {
            MetadataSurvey survey = new MetadataSurvey();
            survey.Get(metaSurveyId);
            string name = survey[MetadataSurvey.SurveyType].ToString();

            var responses = BOL.BusinessObject.GetByParent<PatientProtocolRegQuestionnaire>(registrationId);
            var rawResponses = responses.Select(r => r[PatientProtocolRegQuestionnaire.Response].ToString()).ToArray();
            var xSurvey = GetEligibleCriteria(name);
            // if not mapping found, use generic criteria
            if (xSurvey != null)
                return IsPatientCustomEligible(xSurvey, rawResponses);
            else
                return IsPatientGenericEligible(responses);
        }

        /// <summary>
        /// Returns the string to display based on the patient's eligibility status
        /// </summary>
        /// <param name="isEligible"></param>
        /// <returns></returns>
        public static string PatientEligiblityString(bool? isEligible)
        {
            if (!isEligible.HasValue)
            {
                return ELIGIBILITY_INCOMPLETE;
            }
            else
            {
                if (isEligible.Value == true)
                {
                    return ELIGIBILITY_ELIGIBLE;
                }
                else
                {
                    return ELIGIBILITY_INELIGIBLE;
                }
            }
        }

        // Values inserted into PatientProtocolRegQuestionnaire.Response field depening on response
        private static readonly string RESPONSE_ELIGIBLE = "Eligible";
        private static readonly string RESPONSE_INELIGIBLE = "Ineligible";
        private static readonly string RESPONSE_NOTAPPLICABLE = "N/A";

        private static bool IsPatientGenericEligible(IEnumerable<PatientProtocolRegQuestionnaire> responses)
        {
            var qestionnaire = from q in responses
                               // restirct to actual questions answered
                               where !q.IsNull(PatientProtocolRegQuestionnaire.PatientProtocolRegQuestionnaireId)
                               && !q.IsNull(PatientProtocolRegQuestionnaire.Question)
                               select new
                               {
                                   Question = q[PatientProtocolRegQuestionnaire.Question] + "",
                                   Response = q[PatientProtocolRegQuestionnaire.Response].ToString() + "",
                                   Override = !q.IsNull(PatientProtocolRegQuestionnaire.IneligibleResponseOverride) ? q[PatientProtocolRegQuestionnaire.IneligibleResponseOverride].ToString() == "1" : false
                               };
            bool isEligible = false;

            // step 1: validate
            int questionCount = qestionnaire.Count();
            int questionsAnswered = qestionnaire.Where(q => !string.IsNullOrEmpty(q.Response)).Count();
            bool answeredAll = questionCount == questionsAnswered;
            var eligible = qestionnaire.Where(q => q.Response.StartsWith(RESPONSE_ELIGIBLE, StringComparison.OrdinalIgnoreCase) || q.Override);
            var ineligible = qestionnaire.Where(q => q.Response.StartsWith(RESPONSE_INELIGIBLE, StringComparison.OrdinalIgnoreCase) && !q.Override);
            var na = qestionnaire.Where(q => q.Response.StartsWith(RESPONSE_NOTAPPLICABLE, StringComparison.OrdinalIgnoreCase));
            var others = qestionnaire.Except(eligible).Except(ineligible).Except(na);

            int eligibleCount = eligible.Count();
            int ineligibleCount = ineligible.Count();
            int naCount = na.Count();
            // mark ineligible

            // all eligible: eligible status
            if (eligibleCount == questionCount || (eligibleCount + naCount) == questionCount)
            {
                isEligible = true;
            }

            return isEligible;
        }

        public static XElement GetEligibleCriteria(string surveyName)
        {
            var xDoc = Caisis.UI.Core.Classes.XmlUtil.GetXDoc("~/App_Data/ProtocolMgmt/Eligibility.xml");
            if (xDoc != null)
            {
                var survey = xDoc.Descendants("survey").Where(s => s.Attribute("name").Value == surveyName).FirstOrDefault();
                if (survey != null)
                {
                    return survey;
                }
            }
            return null;
        }

        public static bool? IsPatientCustomEligible(XElement survey, string[] responses)
        {
            // match count
            int explicitPass = 0;
            int explicitFail = 0;
            int explicitNA = 0;
            bool answeredAllResponses = responses.Count(r => !string.IsNullOrEmpty(r)) == responses.Count();
            // for each node, validate expected responses against reponses
            foreach (var eligible in survey.Elements("eligible"))
            {
                string[] eligibleRespones = eligible.Attribute("response").Value.Split(',');
                int repsonseLength = responses.Length;
                // step 1: validate length
                if (repsonseLength == eligibleRespones.Length)
                {
                    // step 2: validate response to expectancy
                    int validResponseCount = 0;
                    int invalidResponseCount = 0;
                    bool invalidFirstResponse = false;
                    for (int i = 0; i < repsonseLength; i++)
                    {
                        string response = responses[i].Trim();
                        string eligibleRespone = eligibleRespones[i].Trim();
                        // step 3: wildcard or match response
                        if (!string.IsNullOrEmpty(response) && eligibleRespone.Equals("*") || eligibleRespone.Equals(response, StringComparison.OrdinalIgnoreCase))
                        {
                            validResponseCount++;
                        }
                        // first failure, mark ineligible, check others
                        else if (!string.IsNullOrEmpty(response))
                        {
                            invalidResponseCount++;
                            if (i == 0)
                                invalidFirstResponse = true;
                            continue;
                        }
                    }
                    // if all responses  match, pass
                    if (validResponseCount == repsonseLength)
                        explicitPass++;
                    // fail explicityly when first response fail or failed in other case 
                    else if (invalidFirstResponse || (invalidResponseCount > 0 && answeredAllResponses))
                        explicitFail++;
                    else
                        explicitNA++;
                }
            }
            if (explicitPass > 0)
                return true;
            else if (explicitFail > 0)
                return false;
            else
                return null;
        }

        //private static bool DoResponsesMatch(string[] responses, string[] expectedResponses)
        //{
        //    int repsonseLength = responses.Length;
        //    if (repsonseLength == expectedResponses.Length)
        //    {
        //        // step 2: validate response to expectancy
        //        int validResponseCount = 0;
        //        for (int i = 0; i < repsonseLength; i++)
        //        {
        //            string response = responses[i].Trim();
        //            string eligibleRespone = expectedResponses[i].Trim();
        //            // step 3: wildcard or match response
        //            if (eligibleRespone.Equals("*") || eligibleRespone.Equals(response, StringComparison.OrdinalIgnoreCase))
        //                validResponseCount++;
        //            // no need to continue on failure
        //            else
        //                break;
        //        }
        //        // if all responses  match, return true
        //        if (validResponseCount == repsonseLength)
        //            return true;
        //    }
        //    return false;
        //}

        #endregion

    }
}