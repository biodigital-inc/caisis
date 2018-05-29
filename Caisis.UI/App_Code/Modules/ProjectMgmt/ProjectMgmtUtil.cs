using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProjectMgmt
{

    /// <summary>
    /// Class containing various utility functions and ProjectMgmt constants
    /// </summary>
    public static class ProjectMgmtUtil
    {
        #region CONSTANTS
        public static readonly string PROJECT_TYPE_CODE = "ProjectType";
        public static readonly string PROJECT_STAGE_TYPE_CODE = "ProjectStages";
        public static readonly string PROJECT_STAGE_EVENT_TYPE_CODE = "ProjectStageEvents";
        public static readonly string PROJECT_EVENT_ATTRIBUTE_TYPE_CODE = "ProjectEventAttributes";
        private static readonly string LKP_SORT_ORDER = LookupCode.LkpOrder + " ASC";
        #endregion

        /// <summary>
        /// Creates child ProjectStage, ProectStageEvents and ProjectEventAttributes records
        /// based off of child/parent Lookup scheme.
        /// NOTE: Child records will not be created if any ProjectStage records exists.
        /// </summary>
        /// <param name="projectId">ProjectId for Project record.</param>
        public static void CreateProjectChildRecords(int projectId)
        {
            Project biz = new Project();
            biz.Get(projectId);
            CreateProjectRecords(biz);
        }

        /// <summary>
        /// Creates child ProjectStage, ProectStageEvents and ProjectEventAttributes records
        /// based off of child/parent Lookup scheme.
        /// NOTE: Child records will not be created if any ProjectStage records exists.
        /// </summary>
        /// <param name="projectBiz">A populate Project BusinessObject.</param>
        public static void CreateProjectChildRecords(Project projectBiz)
        {
            CreateProjectRecords(projectBiz);
        }

        /// <summary>
        /// Deletes a project record and all decendent tables, Stages,Events,EventArrtibutes
        /// </summary>
        /// <param name="projectId">Primary key of the project to remove.</param>
        public static void DeleteProjectRecord(int projectId)
        {
            Project biz = new Project();
            biz.Get(projectId);
            DeleteAProjectRecord(biz);
        }

        /// <summary>
        /// Deletes a project record and all decendent tables, Stages,Events,EventArrtibutes
        /// </summary>
        /// <param name="projectBiz">A populate Project BusinessObject.</param>
        public static void DeleteProjectRecord(Project projectBiz)
        {
            DeleteAProjectRecord(projectBiz);
        }

        #region PROJECT CREATION
        /// <summary>
        /// Creates child ProjectStage, ProjectStageEvents and ProjectEventAttributes records
        /// based off of child/parent Lookup scheme.
        /// NOTE: Child records will not be created if any ProjectStage records exists.
        /// </summary>
        /// <param name="projBiz"></param>
        private static void CreateProjectRecords(Project projBiz)
        {
            int projectId = int.Parse(projBiz[Project.ProjectId].ToString());

            ProjectManagementDa m = new ProjectManagementDa();
            DataTable dt = m.GetProjectOrganizationsByProjectId(projectId);

            CreateProjectStagesRecords(projBiz, dt);
        }

        /// <summary>
        /// Creates child ProjectStage, ProjectStageEvents and ProjectEventAttributes records
        /// based off of child/parent Lookup scheme.
        /// NOTE: Child records will not be created if any ProjectStage records exists. 
        /// </summary>
        /// <param name="biz"></param>
        /// <param name="dt"></param>
        public static void CreateProjectStagesRecords(Project biz, DataTable dt)
        {
			// bas: Does a Project have existing children (ProjectStages)?
			var criteria = new Dictionary<string, object>() { { Project.ProjectId, (int) biz[Project.ProjectId] } };
			bool childRecordsExist = BusinessObject.Exists<ProjectStage>(criteria);

			//BusinessObject parentBiz = biz;
			//BusinessObject childBiz = new ProjectStage();
			//ProjectStage projectStage = new ProjectStage();
			//projectStage.GetByParent(int.Parse(biz[Project.ProjectId].ToString()));

			//if (projectStage.DataSourceView.Count == 0)

			if (!childRecordsExist)
            {
                LookupCodeDa da = new LookupCodeDa();
                string projectType = biz[Project.Type].ToString();
                DataTable projectCodes = da.GetLookupsByFieldName("ProjectType").Tables[0];
                DataRow[] projectTypesFound = projectCodes.Select(LookupCode.LkpCode + " = '" + projectType.Replace("'", "''") + "'");
                if (projectTypesFound.Length > 0)
                {
                    int projectTypeLkpId = int.Parse(projectTypesFound[0][LookupCode.LookupCodeId].ToString());
                    DataRow[] stagesCodes = da.GetChildCodesByLookupIdAndChildLookupName(projectTypeLkpId, PROJECT_STAGE_TYPE_CODE).Select("", LKP_SORT_ORDER);

                    // Get Color Attribute (should be 1 row)
                    DataTable colorAttributes = da.GetLookupAttributeByName("Color");
                    DataTable allStagesColors = null;
                    int colorAttributeId = -1;
                    if (colorAttributes.Rows.Count > 0)
                    {
                        colorAttributeId = int.Parse(colorAttributes.Rows[0][LookupAttribute.AttributeId].ToString());
                        allStagesColors = da.GetLookupCodeAttributesByAttributeId(colorAttributeId);
                    }

                    foreach (DataRow stageCode in stagesCodes)
                    {
                        ProjectStage stageBiz = new ProjectStage();
                        stageBiz[ProjectStage.ProjectId] = biz[Project.ProjectId].ToString();
                        stageBiz[ProjectStage.Name] = stageCode[LookupCode.LkpCode].ToString();

                        // Get color atttibute for this Stage lookup code, if any
                        int stageLkpId = int.Parse(stageCode[LookupCode.LookupCodeId].ToString());
                        if (colorAttributeId > -1 && allStagesColors != null)
                        {
                            // See if there is a color attribute value for this by attribute id and lookup code id
                            DataRow[] stageColors = allStagesColors.Select(LookupCodeAttribute.AttributeId + " = " + colorAttributeId + " AND LookupCodeId = " + stageLkpId);
                            if (stageColors.Length > 0)
                            {
                                stageBiz[ProjectStage.ColorCode] = stageColors[0][LookupCodeAttribute.AttributeValue].ToString();
                            }
                        }

                        stageBiz.Save();
                        CreateProjectStageEvents(stageBiz);
                    }
                }
            }

        }

        /// <summary>
        /// Creates child ProjectStageEvents and ProjectEventAttributes records
        /// based off of child/parent Lookup scheme.
        /// NOTE: Child records will not be created if any ProjectStageEvents records exists.
        /// </summary>
        /// <param name="biz"></param>
        public static void CreateProjectStageEvents(ProjectStage biz)
        {
            BusinessObject parentBiz = biz;
            BusinessObject childBiz = new ProjectStageEvent();
            List<BusinessObject> stageEvents = CreateChildRecordByBizLkpCodes(parentBiz, childBiz, ProjectStage.Name, ProjectStageEvent.Name, PROJECT_STAGE_TYPE_CODE, PROJECT_STAGE_EVENT_TYPE_CODE, true, true);
            foreach (BusinessObject stageEvent in stageEvents)
            {
                CreateProjectStageEventAttributes(stageEvent as ProjectStageEvent);
            }
        }

        /// <summary>
        /// Creates child ProjectEventAttributes records
        /// based off of child/parent Lookup scheme.
        /// NOTE: Child records will not be created if any ProjectEventAttributes records exists.
        /// </summary>
        /// <param name="biz"></param>
        public static void CreateProjectStageEventAttributes(ProjectStageEvent biz)
        {
            BusinessObject parentBiz = biz;
            BusinessObject childBiz = new ProjectEventAttribute();
            CreateChildRecordByBizLkpCodes(parentBiz, childBiz, ProjectStageEvent.Name, ProjectEventAttribute.AttributeName, PROJECT_STAGE_EVENT_TYPE_CODE, PROJECT_EVENT_ATTRIBUTE_TYPE_CODE, true, true);
        }
        #endregion

        /// <summary>
        /// Helper function used to create child records for projects based on lookup codes
        /// </summary>
        /// <param name="parentBizo"></param>
        /// <param name="childBizo"></param>
        /// <param name="parentBizoNameField"></param>
        /// <param name="childBizoNameField"></param>
        /// <param name="PARENT_LKP_FIELD_TYPE"></param>
        /// <param name="CHILD_LKP_FIELD_TYPE"></param>
        /// <param name="validate">Whether to check if parent has child records before inserting</param>
        /// <param name="doSave">true if to save populated biz objects before returning </param>
        /// <returns></returns>
        private static List<BusinessObject> CreateChildRecordByBizLkpCodes(BusinessObject parentBizo, BusinessObject childBizo, string parentBizoNameField, string childBizoNameField, string PARENT_LKP_FIELD_TYPE, string CHILD_LKP_FIELD_TYPE, bool validate, bool doSave)
        {
            List<BusinessObject> childBizList = new List<BusinessObject>();
            int bizPriKey = int.Parse(parentBizo[parentBizo.PrimaryKeyName].ToString());
            string bizNameField = parentBizo[parentBizoNameField].ToString();

            // Check child Bizo to ensure no records have been created

			//BusinessObject checker = BusinessObjectFactory.BuildBusinessObject(childBizo.TableName);
			//checker.GetByParent(bizPriKey);
			//if (checker.RecordCount > 0 && validate)
			//{
			//    return childBizList;
			//}

			if (validate)
			{
				string tablename = childBizo.TableName;
				string parentKeyName = BusinessObject.GetParentKeyName(tablename);
				var criteria = new Dictionary<string, object>() { { parentKeyName, bizPriKey } };

				if (BusinessObject.Exists(tablename, criteria))
					return childBizList;
			}

            LookupCodeDa da = new LookupCodeDa();
            DataRow[] lkpRecords = da.GetLookupsByFieldName(PARENT_LKP_FIELD_TYPE).Tables[0].Select("", LKP_SORT_ORDER);

            foreach (DataRow lkpRecord in lkpRecords)
            {
                string lkpCode = lkpRecord[LookupCode.LkpCode].ToString();
                if (lkpCode == bizNameField)
                {
                    int lkpCodeId = int.Parse(lkpRecord[LookupCode.LookupCodeId].ToString());
                    DataRow[] childLkpRecords = da.GetChildCodesByLookupIdAndChildLookupName(lkpCodeId, CHILD_LKP_FIELD_TYPE).Select("", LKP_SORT_ORDER);
                    foreach (DataRow childLkpRecord in childLkpRecords)
                    {
                        string childLkpCode = childLkpRecord[LookupCode.LkpCode].ToString();
                        BusinessObject childBiz = BusinessObjectFactory.BuildBusinessObject(childBizo.TableName);
                        childBiz[childBiz.ParentKeyName] = bizPriKey;
                        childBiz[childBizoNameField] = childLkpCode;
                        childBiz.Save();

                        childBizList.Add(childBiz);
                    }
                }
            }
            return childBizList;
        }

        /// <summary>
        /// Deletes a project records and decendents, Stages, Events, EventAttributes by tracing the 
        /// Project record's children and grandchildren and deleteing from bottom to top.
        /// </summary>
        /// <param name="biz"></param>
        private static void DeleteAProjectRecord(Project project)
        {
            //if (project.RecordCount > 0)
			if (!project.IsEmpty)
            {

                int projectId = int.Parse(project[project.PrimaryKeyName].ToString());
				//ProjectStage stages = new ProjectStage();
				//stages.GetByParent(projectId);
				DataView stages = BusinessObject.GetByParentAsDataView<ProjectStage>(projectId);
                List<int> stageList = new List<int>();
                foreach (DataRow stageRecord in stages.Table.Rows)
                {
                    int stageId = int.Parse(stageRecord[ProjectStage.StageId].ToString());
					//ProjectStageEvent events = new ProjectStageEvent();
					//events.GetByParent(stageId);
					DataView events = BusinessObject.GetByParentAsDataView<ProjectStageEvent>(stageId);
                    List<int> eventList = new List<int>();
                    foreach (DataRow eventRecord in events.Table.Rows)
                    {
                        int eventId = int.Parse(eventRecord[ProjectStageEvent.StageEventId].ToString());
						//ProjectEventAttribute eventAttributes = new ProjectEventAttribute();
						//eventAttributes.GetByParent(eventId);
						DataView eventAttributes = BusinessObject.GetByParentAsDataView<ProjectEventAttribute>(eventId);
                        List<int> attList = new List<int>();
                        foreach (DataRow attRecord in eventAttributes.Table.Rows)
                        {
                            int attId = int.Parse(attRecord[ProjectEventAttribute.EventAttributeId].ToString());
                            attList.Add(attId);

                        }
                        foreach (int key in attList)
                        {
                            eventAttributes.Delete(key);
                        }
                        eventList.Add(eventId);

                        //// Delete All Event Attributes
                        //eventAttributes.Delete();


                    }
                    foreach (int key in eventList)
                    {
                        events.Delete(key);
                    }
                    stageList.Add(stageId);
                }
                foreach (int key in stageList)
                {
                    stages.Delete(key);
                }

                project.Delete(projectId);
                //// Delete Stage after its events have been deleted
                //stages.Delete();
            }
            //// Finally Delete Project
            //project.Delete();
        }

        /// <summary>
        /// Bind Admin Level Gant Chart based on participating organizations.
        /// </summary>
        public static void BuildAdminLevelGantChart(GantChart chart, int projectId)
        {
            chart.GantTitle = "List Of Organizations";

            List<GantItem> listGantItems = new List<GantItem>();

            //ProjectGantChart.Controls.Clear();
            ProjectManagementDa da = new ProjectManagementDa();
            DataTable projectOrgs = da.GetAllOrganizationsByProjectId(projectId);
            // Loop through all organizations for this project
            foreach (DataRow projectOrg in projectOrgs.Rows)
            {
                int orgId = int.Parse(projectOrg[ProjectOrganization.OrganizationId].ToString());
                string orgColor = projectOrg[ProjectOrganization.ColorCode].ToString();
                DataTable orgStages = da.GetStagesByProjectAndOrganization(projectId, orgId);
                DateTime startDate = DateTime.MinValue;
                DateTime endDate = DateTime.MaxValue;

                // Keep track of all the events over all the stages
                // and how many of then are completed 
                int totalStageEventsForOrganization = 0;
                int totalCompletedStageEvents = 0;
                string orgName = projectOrg[ProjectOrganization.ShortName].ToString();
                // Loop through each stage for an organization
                foreach (DataRow orgStage in orgStages.Rows)
                {
                    int stageId = int.Parse(orgStage[ProjectStage.StageId].ToString());
					//ProjectStageEvent biz = new ProjectStageEvent();
					//biz.GetByParent(stageId);

					//DataView listOfStageEvents = biz.DataSourceView;

					DataView listOfStageEvents = BusinessObject.GetByParentAsDataView<ProjectStageEvent>(stageId);


                    totalStageEventsForOrganization += listOfStageEvents.Count;
                    // Loop through each event for a stage
                    foreach (DataRow row in listOfStageEvents.Table.Rows)
                    {
                        bool hasStart = false;
                        bool hasEnd = false;
                        if (row[ProjectStageEvent.EventStartDate] != null && !string.IsNullOrEmpty(row[ProjectStageEvent.EventStartDate].ToString()))
                        {
                            hasStart = true;
                            DateTime recordStartDate = (DateTime)row[ProjectStageEvent.EventStartDate];
                            if (startDate == DateTime.MinValue || recordStartDate < startDate)
                            {
                                startDate = recordStartDate;
                            }
                        }

                        if (row[ProjectStageEvent.EventEndDate] != null && !string.IsNullOrEmpty(row[ProjectStageEvent.EventEndDate].ToString()))
                        {
                            hasEnd = true;
                            DateTime recordEndDate = (DateTime)row[ProjectStageEvent.EventEndDate];
                            if (endDate == DateTime.MaxValue || recordEndDate > endDate)
                            {
                                endDate = recordEndDate;
                            }
                        }
                        if (hasStart && hasEnd)
                        {
                            totalCompletedStageEvents++;
                        }
                    }
                    // int hasStartEnd = listOfStageEvents.Table.Select("EventStartDate <> " + DBNull.Value.ToString() + " AND EventEndDate <> " + DBNull.Value.ToString()).Length;
                }
                string myOrgId = projectOrg[ProjectOrganization.OrganizationId].ToString();
                string tableName = "ProjectOrganization";

                // If this organization has no stages, and therefore no events, do not add to chart
                if (orgStages.Rows.Count > 0)
                {
                    GantItem gant = GetGantItem(startDate, endDate, totalStageEventsForOrganization, totalCompletedStageEvents, tableName, myOrgId, orgName);
                    listGantItems.Add(gant);
                    // Set Color Code if Applicable
                    if (!string.IsNullOrEmpty(orgColor))
                    {
                        gant.Color = orgColor;
                    }
                    //chart.Controls.Add(gant);
                }
            }
            // sort in ascending order
            listGantItems.Sort(delegate(GantItem gant1, GantItem gant2)
            {
                return
                    gant1.StartDate.CompareTo(gant2.StartDate);
            });

            foreach (GantItem tempItem in listGantItems)
                chart.Controls.Add(tempItem);

        }

        /// <summary>
        /// Builds an organzational level Gant Chart where items on chart represents each
        /// stage belonging to the organization
        /// </summary>
        /// <param name="chart"></param>
        /// <param name="projectId"></param>
        /// <param name="organizationId"></param>
        public static void BuildOrganizationLevelGantChart(GantChart chart, int projectId, int organizationId)
        {
            ProjectOrganization orgBiz = new ProjectOrganization();
            orgBiz.Get(organizationId);

            string gantTitle = "Stages for [" + orgBiz[ProjectOrganization.Name].ToString() + "]";
            chart.GantTitle = gantTitle;

            ProjectManagementDa da = new ProjectManagementDa();
            DataTable orgStages = da.GetStagesByProjectAndOrganization(projectId, organizationId);

            // Loop through all stages in this organization
            foreach (DataRow orgStage in orgStages.Rows)
            {
                string stageName = orgStage[ProjectStage.Name].ToString();
                string stageColor = orgStage[ProjectStage.ColorCode].ToString();
                DateTime startDate = DateTime.MinValue;
                DateTime endDate = DateTime.MaxValue;

				//ProjectStageEvent stageEventBiz = new ProjectStageEvent();
				//stageEventBiz.GetByParent(int.Parse(orgStage[ProjectStage.StageId].ToString()));
				//DataTable orgStageEvents = stageEventBiz.DataSourceView.Table;

				DataView orgStageEventsView = BusinessObject.GetByParentAsDataView<ProjectStageEvent>((int) orgStage[ProjectStage.StageId]);
				DataTable orgStageEvents = orgStageEventsView.Table;

                // Increment total events by adding events in this stage
                int totalStageEventsForStage = orgStageEvents.Rows.Count;
                int totalCompletedStageEvents = 0;

                // Loop though all events in this stage
                foreach (DataRow orgStageEvent in orgStageEvents.Rows)
                {
                    bool hasStart = false;
                    bool hasEnd = false;
                    if (orgStageEvent[ProjectStageEvent.EventStartDate] != null)
                    {
                        if (!string.IsNullOrEmpty(orgStageEvent[ProjectStageEvent.EventStartDate].ToString()))
                        {
                            DateTime recordStartDate = (DateTime)orgStageEvent[ProjectStageEvent.EventStartDate];
                            hasStart = true;

                            if (startDate == DateTime.MinValue || recordStartDate < startDate)
                            {
                                startDate = recordStartDate;
                            }
                        }
                    }

                    if (orgStageEvent[ProjectStageEvent.EventEndDate] != null)
                    {
                        if (!string.IsNullOrEmpty(orgStageEvent[ProjectStageEvent.EventEndDate].ToString()))
                        {
                            DateTime recordEndDate = (DateTime)orgStageEvent[ProjectStageEvent.EventEndDate];
                            hasEnd = true;

                            if (endDate == DateTime.MaxValue || recordEndDate > endDate)
                            {
                                endDate = recordEndDate;
                            }
                        }
                    }
                    if (hasStart && hasEnd)
                    {
                        totalCompletedStageEvents++;
                    }
                }

                if (orgStageEvents.Rows.Count > 0)
                {
                    string stageId = orgStage[ProjectStage.StageId].ToString();
                    string tableName = "ProjectStage";
                    GantItem gant = GetGantItem(startDate, endDate, totalStageEventsForStage, totalCompletedStageEvents, tableName, stageId, stageName);
                    if (!string.IsNullOrEmpty(stageColor))
                    {
                        gant.Color = stageColor;
                    }
                    chart.Controls.Add(gant);
                }
            }

        }

        /// <summary>
        /// Builds a stage level Gant Chart where each item represents an event of the stage.
        /// </summary>
        /// <param name="chart"></param>
        /// <param name="stageId"></param>
        public static void BuildStageLevelGantChart(GantChart chart, int stageId)
        {
            chart.Controls.Clear();

            ProjectStage stageBiz = new ProjectStage();
            stageBiz.Get(stageId);

            string gantTitle = stageBiz[ProjectStage.Name].ToString() + " [Events]";
            chart.GantTitle = gantTitle;


            string stageColor = stageBiz[ProjectStage.ColorCode].ToString();

			//ProjectStageEvent biz = new ProjectStageEvent();
			//biz.GetByParent(stageId);
			//foreach (DataRow stageEventRecord in biz.DataSourceView.Table.Rows)

			DataView view = BusinessObject.GetByParentAsDataView<ProjectStageEvent>(stageId);
			foreach (DataRow stageEventRecord in view.Table.Rows)
            {
                string stageEventName = stageEventRecord[ProjectStageEvent.Name].ToString();
                DateTime startDate = DateTime.MinValue;
                DateTime endDate = DateTime.MaxValue;
                if (stageEventRecord[ProjectStageEvent.EventStartDate] != null)
                {
                    string dateString = stageEventRecord[ProjectStageEvent.EventStartDate].ToString();
                    if (!string.IsNullOrEmpty(dateString))
                    {
                        startDate = DateTime.Parse(dateString);
                    }
                }
                if (stageEventRecord[ProjectStageEvent.EventEndDate] != null)
                {
                    string dateString = stageEventRecord[ProjectStageEvent.EventEndDate].ToString();
                    if (!string.IsNullOrEmpty(dateString))
                    {
                        endDate = DateTime.Parse(dateString);
                    }
                }
                if (!(startDate == DateTime.MinValue && endDate == DateTime.MaxValue))
                {
                    GantItem item = new GantItem(startDate, endDate);
                    item.Description = stageEventName;
                    string startText = startDate.ToShortDateString();
                    string endText = endDate.ToShortDateString();
                    item.ToolTip = "Start Date: " + startText + " - End Date: " + endText;

                    // Color item based on it's parent stage.
                    if (!string.IsNullOrEmpty(stageColor))
                    {
                        item.Color = stageColor;
                    }
                    chart.Controls.Add(item);
                }
            }
        }

        /// <summary>
        /// Returns a GantItem which is constructed based on provided arguments.
        /// </summary>
        /// <param name="start"></param>
        /// <param name="end"></param>
        /// <param name="totalItems"></param>
        /// <param name="completedItems"></param>
        /// <param name="tableName"></param>
        /// <param name="priKey"></param>
        /// <param name="title"></param>
        /// <returns></returns>
        public static GantItem GetGantItem(DateTime start, DateTime end, int totalItems, int completedItems, string tableName, string priKey, string title)
        {
            int percentComplete = 0;
            if (totalItems != 0 && completedItems != 0)
            {
                percentComplete = (int)(((double)completedItems / (double)totalItems) * 100.0);
            }

            GantItem gantItem = new GantItem(start, end);
            gantItem.OnMouseClick = "loadChildGant(this,event,'" + tableName + "'," + priKey + ",color);";
            gantItem.PercentComplete = percentComplete;
            string startText = start != DateTime.MinValue ? start.ToShortDateString() : "N/A";
            string endText = end != DateTime.MaxValue ? end.ToShortDateString() : "N/A";
            gantItem.ToolTip = "Start Date: " + startText + " - End Date: " + endText + " - (" + percentComplete + "%)";
            gantItem.Description = title;

            return gantItem;
        }
    }
}