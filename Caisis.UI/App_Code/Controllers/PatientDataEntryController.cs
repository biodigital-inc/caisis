using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml;
using System.Collections.Generic;

using System.Linq;
using System.Xml.Linq;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Security;
using Caisis.UI.Core.Classes;

namespace Caisis.Controller
{
    /// <summary>
    /// Provides communication between the Business logic and UI.
    /// Allows querying table and field attributes, form configurations, menus ordering, in a disease sensitive context.
    /// </summary>
    public class PatientDataEntryController
    {
        /// <summary>
        /// Represents the default disease metadata disease key
        /// </summary>
        public static readonly string DEFAULT_METADATA_KEY = "All";

        /// <summary>
        /// Represents the table attribute which signifies a table is a data entry form
        /// </summary>
        public static readonly string DATA_ENTRY_FORM_ATTRIBUTE = "Form";

        public static readonly string MENUITEM_FORM_ATTRIBUTE = "MenuItem";

        /// <summary>
        /// The disease view used for metadata lookup
        /// </summary>
        private string disease = "";

        private IEnumerable<string> _dataEntryFormNames;

        /// <summary>
        /// Returns a locally cached list of data entry form names
        /// </summary>
        private IEnumerable<string> DataEntryFormNames
        {
            get
            {
                // cache locally
                if (_dataEntryFormNames == null)
                {
                    _dataEntryFormNames = GetDataEntryForms();
                }
                return _dataEntryFormNames;
            }
        }

        private IEnumerable<string> _allTableNames;
        private IEnumerable<string> AllTableNames
        {
            get
            {
                // cache locally
                if (_allTableNames == null)
                {
                    _allTableNames = BOL.BusinessObject.GetAllTableNames();
                }
                return _allTableNames;
            }
        }

        private XmlDocument _xDoc;
        private XmlDocument TableXmlDoc
        {
            get
            {
                if (_xDoc == null)
                {
                    _xDoc = CaisisConfiguration.GetPatientDataConfig();
                }
                return _xDoc;
            }
        }

        /// <summary>
        /// Initalize a new instance of the PatientDataEntryController using current disease view.
        /// </summary>
        public PatientDataEntryController()
            : this(new Caisis.Controller.DiseaseController().GetDiseaseView())
        {
        }

        // legacy, use metadata going forward, but use for static nodes, i.e., Summary
        public XmlNode GetConfigurationNode(string tableName)
        {
            XmlNode node = TableXmlDoc.SelectSingleNode("//menuItem[@tableName='" + tableName + "']");
            return node;
        }

        /// <summary>
        /// Initalize a new instance of the PatientDataEntryController using the specified disease.
        /// NOTE: NULL or empty values will initalize disease view to default.
        /// </summary>
        /// <param name="disease"></param>
        public PatientDataEntryController(string disease)
        {
            // normalize disease lookup key
            this.disease = NormalizeDisease(disease);
        }

        /// <summary>
        /// Returns the disease view for querying metadata
        /// </summary>
        /// <returns></returns>
        public string GetDisease()
        {
            return this.disease;
        }

        /// <summary>
        /// Gets a list of Chronological Items
        /// </summary>
        /// <returns></returns>
        public DataTable GetChronListDropDownItems()
        {
            Func<string, int> getPriority = (chronListText) =>
                {
                    int priority = 2;

                    switch (chronListText)
                    {
                        case "Most Relevant":
                            priority = 4;
                            break;
                        case "List All":
                            priority = 3;
                            break;
                        case "Missing Items":
                            priority = 1;
                            break;
                        case "Pending Items":
                            priority = 0;
                            break;
                    }
                    return priority;
                };
            // From the current data entry forms, build chron list (from current data entry forms or all tables ???)
            var dataEntryForms = AllTableNames; //DataEntryFormNames
            var dataEntryChronItems = from table in dataEntryForms
                                      select new
                                      {
                                          ChronListText = GetChronListText(table),
                                          ChronListOption = GetChronListOption(table),
                                          ChronListPriority = getPriority(GetChronListText(table))
                                      };
            var xmlEntryChronItems = from node in TableXmlDoc.SelectNodes("//menuItem[@chronListOption and @chronListText]").Cast<XmlNode>()
                                     select new
                                     {
                                         ChronListText = node.Attributes["chronListText"].Value,
                                         ChronListOption = node.Attributes["chronListOption"].Value,
                                         ChronListPriority = getPriority(node.Attributes["chronListText"].Value)
                                     };
            var chronListItems = from datarow in dataEntryChronItems.Concat(xmlEntryChronItems)
                                 where !string.IsNullOrEmpty(datarow.ChronListOption)
                                 group datarow by datarow.ChronListText into g
                                 let entry = g.First()
                                 select new object[] 
                                 {
                                     entry.ChronListText,
                                     entry.ChronListOption,                                     
                                     entry.ChronListPriority                                 
                                 };

            //var chronListItems = from table in DataEntryFormNames
            //                     let chronListText = GetChronListText(table)
            //                     let chronListOption = GetChronListOption(table)
            //                     where !string.IsNullOrEmpty(chronListOption) && !string.IsNullOrEmpty(chronListText)
            //                     let chronListPriority = getPriority(chronListText)
            //                     let datarow = new object[]
            //                     {
            //                         chronListText,
            //                         chronListOption,                                     
            //                         chronListPriority
            //                     }
            //                     // get distinct chron list items
            //                     group datarow by chronListText into g
            //                     select g.First();
            // create data table
            DataTable dt = new DataTable();
            DataColumn chronText = new DataColumn("ChronListDisplayText");
            DataColumn chronValue = new DataColumn("ChronListValue");
            DataColumn chronPriority = new DataColumn("ChronListPriority");
            dt.Columns.Add(chronText);
            dt.Columns.Add(chronValue);
            dt.Columns.Add(chronPriority);
            // set pri key
            dt.PrimaryKey = new DataColumn[] { chronText };

            // fill data table
            foreach (object[] item in chronListItems)
            {
                dt.Rows.Add(item);
            }
            return dt;
        }

        //methods that control the embedding of child forms within parent based on config file

        /// <summary>
        /// Add the parent table because the attribute of the child table node says to
        /// </summary>
        /// <param name="tableNames">the list of tables</param>
        /// <param name="menuNode">the xml config node representing the selected data entry form</param>
        /// <returns>the appended list of tables</returns>
        public List<string> AddParentTableBasedOnChild(List<string> tableNames, XmlNode menuNode)
        {
            string displayWithParent = XmlUtil.GetAttributeValue(menuNode, "displayWithParent");
            if (!string.IsNullOrEmpty(displayWithParent) && displayWithParent.ToLower().Equals("true"))
            {
                tableNames.Add(menuNode.ParentNode.Attributes["tableName"].Value);
            }
            return tableNames;
        }

        /// <summary>
        /// Add the child tables because the attribute of the parent table node says to
        /// </summary>
        /// <param name="tableNames">the list of tables</param>
        /// <param name="menuNode">the xml config node representing the selected data entry form</param>
        /// <returns>the appended list of tables</returns>
        public List<string> AddChildTablesBasedOnParent(List<string> tableNames, XmlNode menuNode)
        {
            var displayWithChild = XmlUtil.GetAttributeValue(menuNode, "displayWithChild");

            if (!string.IsNullOrEmpty(displayWithChild))
            {
                char[] splitter = { ',' };
                string val = displayWithChild.Replace(" ", ""); // no spaces
                string[] childTables = val.Split(splitter);

                foreach (string childTable in childTables)
                {
                    // check too see table is already in list before adding it
                    if (tableNames.Contains(childTable) == false)
                    {
                        tableNames.Add(childTable);
                    }
                }
            }
            return tableNames;
        }

        /// <summary>
        /// if parent records exists, a child record exists AND parent has allowOnlyOneChild attribute set to true, then add the child tablename
        /// </summary>
        /// <param name="tableNames">the list of tables</param>
        /// <param name="menuNode">the xml config node representing the selected data entry form</param>
        /// <param name="primaryKeyValue">primary key value of parent record</param>
        /// <returns>the appended list of tables</returns>
        public List<string> AddChildTablesBasedOnParentAndChildRecordCount(List<string> tableNames, XmlNode menuNode, int primaryKeyValue)
        {
            if (primaryKeyValue != 0)// && this.AllowOnlyOneSubForm(menuNode))
            {
                // now we need to see who has records from complete list of child nodes
                foreach (XmlNode node in menuNode.ChildNodes)
                {
                    string childTableName = XmlUtil.GetAttributeValue(node, "tableName");
                    int subFormRecordCount = this.GetSubFormRecordCount(childTableName, primaryKeyValue); //primaryKeyValue is parentkey (FK) to child tables
                    if (subFormRecordCount > 0)
                    {
                        tableNames.Add(childTableName);
                    }
                }
            }
            return tableNames;
        }

        /// <summary>
        /// Menu items can specify that if one of their child forms has data, then do not show links to other child forms (applies to Procedures table)
        /// </summary>
        /// <param name="menuNode"></param>
        /// <returns></returns>
        public bool AllowOnlyOneSubForm(XmlNode menuNode)
        {
            string allowOnlyOneChildForm = XmlUtil.GetAttributeValue(menuNode, "allowOnlyOneChildForm");
            if (!string.IsNullOrEmpty(allowOnlyOneChildForm) && allowOnlyOneChildForm.ToLower() == "true")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// Get record count based on parent key. Use to activate links to sub forms and publish corresponding recordcount
        /// </summary>
        /// <param name="subFormName">name of child form</param>
        /// <param name="parentKeyName">parent key value (fk)</param>
        /// <returns></returns>
        public int GetSubFormRecordCount(string tableName, int parentKeyValue)
        {
            BusinessObject bizo = BusinessObjectFactory.BuildBusinessObject(tableName);
            string parentKeyName = bizo.ParentKeyName;

            // get record count using parent key defined in da
            GlobalDa gda = new GlobalDa();
            int recordCount = gda.GetRecordCount(tableName, parentKeyName, parentKeyValue);

            return recordCount;
        }

        #region DISPLAY HELPERS
        /// <summary>
        /// Returns a bool indicating if a node should be displayed 
        /// based on "attribute" value
        /// </summary>
        /// <param name="node">node to check</param>
        /// <param name="attribute">name of attribute containing bool</param>
        /// <returns></returns>
        public bool IsDisplayable(XmlNode node, string attribute)
        {
            string attVal = XmlUtil.GetAttributeValue(node, attribute);
            if (!string.IsNullOrEmpty(attVal))
            {
                bool displayNode = bool.Parse(attVal);
                return displayNode;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// General Method to determine if a node is displayabled based
        /// on "display" attribute
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        public bool IsDisplayable(XmlNode node)
        {
            return IsDisplayable(node, "display");
        }

        /// <summary>
        /// Determine if a node is displayable in Main Menu
        /// based on "displayInMainMenu" attribute
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        public bool IsDisplayInMainMenu(XmlNode node)
        {
            return IsDisplayable(node, "displayInMainMenu");
        }

        /// <summary>
        /// Determine if a node is displayable in Sub Menu
        /// based on "displayInSubMenu" attribute
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        public bool IsDisplayInSubMenu(XmlNode node)
        {
            return IsDisplayable(node, "displayInSubMenu");
        }

        /// <summary>
        /// "All" view displays all menu items. If the config does not have an includeViews or excludeViews attribute then the menu item is displayed in all views. 
        /// Otherwise includeViews override excludeViews. 
        /// </summary>
        /// <param name="node"></param>
        /// <returns></returns>
        public bool IsDisplayInView(XmlNode node)
        {
            string currentView = new SecurityController().GetViewMode();
            if (currentView == "All")
            {
                return true;
            }

            string inclusions = null;
            string exclusions = null;

            inclusions = XmlUtil.GetAttributeValue(node, "includeViews");
            exclusions = XmlUtil.GetAttributeValue(node, "excludeViews");

            if (!string.IsNullOrEmpty(inclusions))
            {
                string[] inclusionFields = inclusions.Split(new Char[] { ',' });
                if (inclusionFields != null)
                {
                    foreach (string field in inclusionFields)
                    {
                        string viewField = field.Trim();
                        //if (viewField == currentView || viewField == "All")
                        if (viewField == currentView)
                        {
                            return true;
                        }
                    }
                    return false;
                }
            }
            if (!string.IsNullOrEmpty(exclusions))
            {
                string[] exclusionFields = exclusions.Split(new Char[] { ',' });
                if (exclusionFields != null)
                {
                    foreach (string field in exclusionFields)
                    {
                        string viewField = field.Trim();
                        //if (viewField == currentView || viewField == "All")
                        if (viewField == currentView)
                        {
                            return false;
                        }
                    }
                }
            }

            return true;
        }

        #endregion

        // creates mapping : we may want to use this again to load Operating Room Details etc. when optional FK exists in referring form
        public void DefaultFieldsBasedOnTableAssociation(IBusinessObject bizo, string brotherTableName, int brotherFKValue)
        {
            // must this return the bizo if filled? ; brother tables are those that contain optional foreign key values to the current table (ie Procedures/Pathology)
            if (brotherFKValue != 0 && brotherTableName.Length > 0)
            {
                //Invoke ORDetails Object
                IBusinessObject broBizo = BusinessObjectFactory.BuildBusinessObject(brotherTableName);
                broBizo.Get(brotherFKValue);

                // must create a mapping: do in Bizos? do it here? xml? here for now
                if (bizo.TableName.Equals("Procedures"))
                {
                    if (brotherTableName.Equals("OperatingRoomDetails"))
                    {
                        // what ORDetails fields should be used in new Procedures record? Date, Surgeon, Institution. 
                        bizo[Procedure.OperatingRoomDetailId] = brotherFKValue;
                        bizo[Procedure.ProcDate] = broBizo[OperatingRoomDetail.OpDate];
                        bizo[Procedure.ProcDateText] = broBizo[OperatingRoomDetail.OpDateText];
                        bizo[Procedure.ProcSurgeon] = broBizo[OperatingRoomDetail.OpCaseSurgeon];
                        bizo[Procedure.ProcInstitution] = broBizo[OperatingRoomDetail.OpInstitution];
                    }
                    else if (brotherTableName.Equals("Pathology"))
                    {
                        // do nothing
                    }
                }
                else if (bizo.TableName.Equals("Pathology"))
                {
                    if (brotherTableName.Equals("Procedures"))
                    {
                        bizo[Pathology.ProcedureId] = brotherFKValue;
                    }
                    else if (brotherTableName.Equals("OperatingRoomDetails"))
                    {
                        bizo[Pathology.OperatingRoomDetailId] = brotherFKValue;
                    }

                }
                else if (bizo.TableName.Equals("OperatingRoomDetails"))
                {
                    if (brotherTableName.Equals("Procedures"))
                    {
                        bizo[OperatingRoomDetail.OpDate] = broBizo[Procedure.ProcDate];
                        bizo[OperatingRoomDetail.OpDateText] = broBizo[Procedure.ProcDateText];
                        bizo[OperatingRoomDetail.OpCaseSurgeon] = broBizo[Procedure.ProcSurgeon];
                        bizo[OperatingRoomDetail.OpInstitution] = broBizo[Procedure.ProcInstitution];
                    }
                    else if (brotherTableName.Equals("Pathology"))
                    {
                        // do nothing
                    }

                }
            }
        }

        // v6 configurations

        #region TABLE CONFIGURATIONS
                
        /// <summary>
        /// For the current table and and pri key, build an ordered list of table names representing parent and child data entry forms.
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="tablePriKey"></param>
        /// <returns></returns>
        public List<string> EnumerateTableNames(string tableName, int? tablePriKey)
        {
            List<string> tables = new List<string>();
            bool displayWithParent = false;
            string parentTableName = string.Empty;
            if (!string.IsNullOrEmpty(tableName))
            {
                // step 1: add parent table
                displayWithParent = IsDisplayWithParent(tableName);
                if (displayWithParent)
                {
                    string parentTable = GetParentTableName(tableName);
                    // filter by data entry form
                    if (!string.IsNullOrEmpty(parentTable) && IsDataEntryForm(parentTable))
                    {
                        parentTableName = parentTable;
                        tables.Add(parentTable);
                    }
                }

                // step 2: add self
                tables.Add(tableName);

                // step 3: add child tables with records (exclude patients)
                var displayChildFormNames = DisplayWithChild(tableName);
                if (tablePriKey.HasValue && !tableName.Equals("Patients", StringComparison.OrdinalIgnoreCase))
                {
                    // (display with child UNION child table) + is data entry form - not yet in list
                    //var childFormNames = GetChildDataEntryForms(tableName);
                    //var searchChildFormNames = displayChildFormNames.Union(childFormNames).Intersect(DataEntryFormNames).Except(tables);
                    
                    // always check all child records
                    var searchChildFormNames = BOL.BusinessObject.GetChildTableNames(tableName);
                    // get a list of child forms with records
                    var childrenWithRecords = from childTable in searchChildFormNames
                                              // retrict to child tables with records
                                              where GetSubFormRecordCount(childTable, tablePriKey.Value) > 0
                                              select childTable;
                    tables.AddRange(childrenWithRecords);
                }

                // step 4: add display with child which haven't been added       
                var displayWithChildrenNotInList = displayChildFormNames.Except(tables);
                tables.AddRange(displayWithChildrenNotInList);

                // step 5: add display with children from parent configuration
                if (displayWithParent && !string.IsNullOrEmpty(parentTableName))
                {
                    var parentDisplayWithChild = DisplayWithChild(parentTableName).Except(tables);
                    tables.AddRange(parentDisplayWithChild);
                }
            }
            return NormlizeList(tables);
        }

        public IEnumerable<string> GetSiblingTableNames(string tableName)
        {
            List<string> siblingTableNames = new List<string>();
            string parentTableName = GetParentTableName(tableName);
            if (!string.IsNullOrEmpty(parentTableName))
            {
                var childTableNames = GetChildDataEntryForms(parentTableName).Except(new string[] { tableName });
                siblingTableNames.AddRange(childTableNames.Intersect(DataEntryFormNames));
            }
            return NormlizeList(siblingTableNames);
        }

        /// <summary>
        /// Returns a list of displayable child tables
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public IEnumerable<string> DisplayWithChild(string tableName)
        {
            List<string> childTables = new List<string>();
            string displayWithChild = GetTableAttribute(tableName, CaisisConfiguration.ATTRIBUTE_DisplayWithChild);
            if (!string.IsNullOrEmpty(displayWithChild))
            {
                var childTableNames = displayWithChild.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                childTables.AddRange(childTableNames.Intersect(DataEntryFormNames));
            }
            return NormlizeList(childTables);
        }

        /// <summary>
        /// Returns a list of relevant table names
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public IEnumerable<string> GetRelevantTableNames(string tableName)
        {
            List<string> relevantTableNames = new List<string>();
            string relevantTablesAttribute = GetTableAttribute(tableName, CaisisConfiguration.ATTRIBUTE_MostRelevantTables);
            if (!string.IsNullOrEmpty(relevantTablesAttribute))
            {
                var tables = relevantTablesAttribute.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries);
                relevantTableNames.AddRange(tables);
            }
            return NormlizeList(relevantTableNames);
        }

        /// <summary>
        /// Gets if the current table is a Table
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public bool IsTable(string tableName)
        {
            return AllTableNames.Contains(tableName);
        }

        /// <summary>
        /// Gets the default table name
        /// </summary>
        /// <returns></returns>
        public string GetDefaultTableName()
        {
            // search metadata
            var defaultTables = from table in DataEntryFormNames
                                let isDefault = GetTableAttribute(table, CaisisConfiguration.ATTRIBUTE_LoadByDefault)
                                where !string.IsNullOrEmpty(isDefault) && isDefault.Equals(bool.TrueString, StringComparison.OrdinalIgnoreCase)
                                select table;
            if (defaultTables.Count() > 0)
            {
                return defaultTables.First();
            }
            // XML fallback
            else
            {
                var defaultTablesNodes = from node in TableXmlDoc.SelectNodes("//menuItem[@tableName]").Cast<XmlNode>()
                                         let table = XmlUtil.GetAttributeValue(node, "TableName", false)
                                         let isDefault = XmlUtil.GetAttributeValue(node, "LoadByDefault", false)
                                         where !string.IsNullOrEmpty(isDefault) && isDefault.Equals(bool.TrueString, StringComparison.OrdinalIgnoreCase)
                                         select table;
                return defaultTablesNodes.Count() > 0 ? defaultTablesNodes.First() : "";
            }
        }

        public string GetTableLabel(string tableName)
        {
            if (!IsTable(tableName))
            {
                return string.Empty;
            }
            string metaTableLabel = GetTableAttribute(tableName, "TableLabel");
            return !string.IsNullOrEmpty(metaTableLabel) ? metaTableLabel : tableName;
        }

        public string GetTableDescription(string tableName)
        {
            if (!IsTable(tableName))
            {
                return string.Empty;
            }
            string metaTableDescription = GetTableAttribute(tableName, "TableDescription");
            return !string.IsNullOrEmpty(metaTableDescription) ? metaTableDescription : string.Empty;
        }

        public string GetFieldLabel(string tableName, string fieldName)
        {
            string fieldLabel = GetFieldAttribute(tableName, fieldName, "FieldLabel");
            return !string.IsNullOrEmpty(fieldLabel) ? fieldLabel : fieldName;
        }

        public string GetParentTableName(string tableName)
        {
            if (BOL.BusinessObjectFactory.CanBuildBusinessObject(tableName) && BOL.BusinessObject.HasParentTable(tableName))
            {
                return BOL.BusinessObject.GetParentTablename(tableName);
            }
            return string.Empty;
        }

        /// <summary>
        /// Returns the relative path to the table's icon (optionally validate if icon exists)
        /// </summary>
        /// <param name="tableName">The table name</param>
        /// <param name="validatePath">True or false if to validate icon image exists</param>
        /// <returns>A relative path to the icon, i.e., ~/Path/To/Icon.gif, or empty if not found</returns>
        public string GetTableIcon(string tableName, bool validatePath)
        {
            string relativeIconPath = "~/Images/Icon_" + tableName + ".png";
            if (validatePath)
            {
                // if file not found, return empty
                if (!System.IO.File.Exists(HttpContext.Current.Server.MapPath(relativeIconPath)))
                {
                    return string.Empty;
                }
            }
            return relativeIconPath;
        }

        /// <summary>
        /// Gets the number of data entry columns
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public int GetNumDisplayColumns(string tableName)
        {
            int defaultColCount = 1;
            string colValue = GetTableAttribute(tableName, CaisisConfiguration.ATTRIBUTE_NumDisplayColumns);
            int colCount = !string.IsNullOrEmpty(colValue) && PageUtil.IsInteger(colValue) ? int.Parse(colValue) : defaultColCount;
            return colCount;
        }

        /// <summary>
        /// Gets a list of fields marked a Common Data Elements
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public IEnumerable<string> GetCommonDataElements(string tableName)
        {
            return GetFieldsByAttribute(tableName, CaisisConfiguration.ATTRIBUTE_CommonDataElement, bool.TrueString);
        }

        /// <summary>
        /// Gets if the data entry form will be represented as a GridView, i.e., tabular data
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public bool IsGridView(string tableName)
        {
            bool isGridView = false;
            string gridView = GetTableAttribute(tableName, CaisisConfiguration.ATTRIBUTE_GridView);
            if (!string.IsNullOrEmpty(gridView) && gridView.ToLower().Equals("true"))
            {
                isGridView = true;
            }
            return isGridView;
        }

        public bool IsDisplayWithParent(string tableName)
        {
            bool display = false;
            string isDisplay = GetTableAttribute(tableName, CaisisConfiguration.ATTRIBUTE_DisplayWithParent);
            if (!string.IsNullOrEmpty(isDisplay) && isDisplay.ToLower().Equals("true"))
            {
                display = true;
            }
            return display;
        }

        public int GetTotalBlankGridRows(string tableName)
        {
            int defaultBlankRows = 6;
            string rows = GetTableAttribute(tableName, CaisisConfiguration.ATTRIBUTE_TotalBlankGridRows);
            return !string.IsNullOrEmpty(rows) && PageUtil.IsInteger(rows) ? int.Parse(rows) : defaultBlankRows;
        }

        public int GetVisibleBlankGridRows(string tableName)
        {
            int defaultVisibleBlankRows = 3;
            string rows = GetTableAttribute(tableName, CaisisConfiguration.ATTRIBUTE_VisibleBlankGridRows);
            return !string.IsNullOrEmpty(rows) && PageUtil.IsInteger(rows)  ? int.Parse(rows) : defaultVisibleBlankRows;
        }

        public string GetStaticFileName(string tableName)
        {
            string fileName = GetTableAttribute(tableName, "FileName");
            return fileName;
        }

        public string GetChronListOption(string tableName)
        {
            string chronListOption = GetTableAttribute(tableName, CaisisConfiguration.ATTRIBUTE_ChronListOption);
            return chronListOption;
        }

        public string GetChronListText(string tableName)
        {
            string chronListText = GetTableAttribute(tableName, CaisisConfiguration.ATTRIBUTE_ChronListText);
            return chronListText;
        }

        /// <summary>
        /// Gets a list of Absent Event tables lookup, key=table name, value=table label
        /// </summary>
        /// <returns></returns>
        public IDictionary<string, string> GetAbsentEventTables()
        {
            var tables = GetTablesByAttribute(CaisisConfiguration.ATTRIBUTE_AllowAbsentEvent, true.ToString());
            return GetDataEntryFormLabels(tables);
        }

        /// <summary>
        /// Gets a list of Absent Event fields for the specified table
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public IDictionary<string, string> GetAbsentEventFields(string tableName)
        {
            var fields = GetFieldsByAttribute(tableName, CaisisConfiguration.ATTRIBUTE_AllowAbsentEvent, true.ToString());
            return fields.ToDictionary(f => f, f => GetFieldLabel(tableName, f));
        }

        /// <summary>
        /// Gets a list of plugin names for the specified table
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public List<string> GetPlugins(string tableName)
        {
            List<string> plugins = new List<string>();
            string plugin = GetTableAttribute(tableName, CaisisConfiguration.ATTRIBUTE_Plugins);
            if (!string.IsNullOrEmpty(plugin))
            {
                plugins.AddRange(plugin.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries));
            }
            return NormlizeList(plugins);
        }

        /// <summary>
        /// Returns a normalized string list (i.e., white space trimmed)
        /// </summary>
        /// <param name="sourceList">The source string list</param>
        /// <returns>A normalized string list</returns>
        private List<string> NormlizeList(List<string> sourceList)
        {
            List<string> normalizedList = new List<string>();
            sourceList.ForEach(s => normalizedList.Add(s.Trim()));
            return normalizedList;
        }

        #endregion

        // v6
        #region METADATA (contains metadata normalization between BOL and UI)

        /// <summary>
        /// 
        /// </summary>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        public IEnumerable<string> GetTablesByAttribute(string attributeName)
        {
            return GetTablesByAttribute(attributeName, null);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="attributeName"></param>
        /// <param name="attributeValue"></param>
        /// <returns></returns>
        public IEnumerable<string> GetTablesByAttribute(string attributeName, string attributeValue)
        {
            return GetTablesByAttribute(attributeName, attributeValue, disease);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="attributeName"></param>
        /// <param name="attributeValue"></param>
        /// <param name="disease"></param>
        /// <returns></returns>
        public static IEnumerable<string> GetTablesByAttribute(string attributeName, string attributeValue, string disease)
        {
            return BOL.BusinessObject.GetTableNamesWithMetadataAttributeValue(attributeName, attributeValue, disease);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="attributeName"></param>
        /// <returns></returns>
        public IEnumerable<string> GetFieldsByAttribute(string tableName, string attributeName)
        {
            return GetFieldsByAttribute(tableName, attributeName, null);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="attributeName"></param>
        /// <param name="attributeValue"></param>
        /// <returns></returns>
        public IEnumerable<string> GetFieldsByAttribute(string tableName, string attributeName, string attributeValue)
        {
            return GetFieldsByAttribute(tableName, attributeName, attributeValue, disease);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="attributeName"></param>
        /// <param name="attributeValue"></param>
        /// <param name="disease"></param>
        /// <returns></returns>
        public static IEnumerable<string> GetFieldsByAttribute(string tableName, string attributeName, string attributeValue, string disease)
        {
            return BOL.BusinessObject.GetFieldNamesWithMetadataAttributeValue(tableName, attributeName, attributeValue, disease);
        }

        /// <summary>
        /// Gets a list of tables which are Data Entry Forms
        /// </summary>
        /// <returns>A list of data entry forms</returns>
        public IEnumerable<string> GetDataEntryForms()
        {
            return GetDataEntryForms(disease);
        }

        /// <summary>
        /// Gets a lookup of data entry form names to their table label
        /// </summary>
        /// <returns></returns>
        public IDictionary<string, string> GetDataEntryFormLabels()
        {
            return GetDataEntryFormLabels(DataEntryFormNames);
        }

        /// <summary>
        /// Gets a lookup of data entry form names to their table label
        /// </summary>
        /// <param name="tables"></param>
        /// <returns></returns>
        public IDictionary<string, string> GetDataEntryFormLabels(IEnumerable<string> tables)
        {
            return tables.ToDictionary(t => t, t => GetTableLabel(t));
        }

        /// <summary>
        /// Gets a list of tables which are data entry forms + displayable in main menu
        /// </summary>
        /// <returns></returns>
        public IEnumerable<string> GetDataEntryMenuNames()
        {
            // restrict to menu items which are data entry forms
            var menuItemForms = GetTablesByAttribute(MENUITEM_FORM_ATTRIBUTE, bool.TrueString);
            return DataEntryFormNames.Intersect(menuItemForms);
        }

        /// <summary>
        /// Gets a list of tables which are Data Entry Forms
        /// </summary>
        /// <param name="disease">The disease view to query tables</param>
        /// <returns>A list of data entry forms</returns>
        public static IEnumerable<string> GetDataEntryForms(string disease)
        {
            var dataEntryFormNames = GetTablesByAttribute(DATA_ENTRY_FORM_ATTRIBUTE, bool.TrueString, disease);
            return dataEntryFormNames;
        }

        /// <summary>
        /// Gets if the table is a Data Entry Form
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public bool IsDataEntryForm(string tableName)
        {
            return DataEntryFormNames.Contains(tableName);
        }

        /// <summary>
        /// Gets a list of child tables which are Data Entry Forms
        /// </summary>
        /// <param name="tableName">The parent table</param>
        /// <returns>A list of child data entry forms</returns>
        public IEnumerable<string> GetChildDataEntryForms(string tableName)
        {
            // all child tables
            var childTables = BOL.BusinessObject.GetChildTableNames(tableName);
            // child tables which are data entry forms
            var childDataEntryTableNames = childTables.Intersect(DataEntryFormNames);
            return childDataEntryTableNames;
        }

        /// <summary>
        /// Gets the table's attribute value
        /// </summary>
        /// <param name="table"></param>
        /// <param name="attribute"></param>
        /// <returns></returns>
        public string GetTableAttribute(string table, string attribute)
        {
            return GetTableAttribute(table, attribute, disease);
        }

        /// <summary>
        /// Gets the field's attribute value
        /// </summary>
        /// <param name="table"></param>
        /// <param name="field"></param>
        /// <param name="attribute"></param>
        /// <returns></returns>
        public string GetFieldAttribute(string table, string field, string attribute)
        {
            return GetFieldAttribute(table, field, attribute, disease);
        }

        private static string GetTableAttribute(string table, string attribute, string disease)
        {
            disease = NormalizeDisease(disease);
            bool isDefault = IsDefaultDisease(disease);
            if (HasTableAttribute(table, attribute, disease))
            {
                return BOL.BusinessObject.GetMetadataTableAttribute(table, attribute, disease);
            }
            else if (!isDefault && HasTableAttribute(table, attribute, DEFAULT_METADATA_KEY))
            {
                return BOL.BusinessObject.GetMetadataTableAttribute(table, attribute, DEFAULT_METADATA_KEY);
            }
            else
            {
                return string.Empty;
            }
        }

        private static bool HasTableAttribute(string table, string attribute, string disease)
        {
            return BOL.BusinessObject.HasMetadataTableAttribute(table, attribute, disease);
        }

        private static string GetFieldAttribute(string table, string field, string attribute, string disease)
        {
            disease = NormalizeDisease(disease);
            bool isDefault = IsDefaultDisease(disease);
            bool hasField = BOL.BusinessObject.HasField(table, field);
            if (hasField)
            {
                if (HasFieldAttribute(table, field, attribute, disease))
                {
                    return BOL.BusinessObject.GetMetadataFieldAttribute(table, field, attribute, disease);
                }
                else if (!isDefault && HasFieldAttribute(table, field, attribute, DEFAULT_METADATA_KEY))
                {
                    return BOL.BusinessObject.GetMetadataFieldAttribute(table, field, attribute, DEFAULT_METADATA_KEY);
                }
            }
            return string.Empty;
        }

        private static bool HasFieldAttribute(string table, string field, string attribute, string disease)
        {
            return BOL.BusinessObject.HasField(table, field) && BOL.BusinessObject.HasMetadataFieldAttribute(table, field, attribute, disease);
        }

        /// <summary>
        /// Returns the metadata lookup dictionary for fields in table, i.e, lookup[field][fieldAttribute] -> fieldAttributeValue
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        public Dictionary<string, Dictionary<string, string>> GetTableFieldsMetadata(string table)
        {
            return GetTableFieldsMetadata(table, disease);
        }

        /// <summary>
        /// Returns the metadata lookup dictionary for fields in table, i.e, lookup[field][fieldAttribute] -> fieldAttributeValue
        /// </summary>
        /// <param name="disease"></param>
        /// <param name="table"></param>
        /// <returns></returns>
        public static Dictionary<string, Dictionary<string, string>> GetTableFieldsMetadata(string table, string disease)
        {
            disease = NormalizeDisease(disease);
            bool isDefault = IsDefaultDisease(disease);

            if (BOL.BusinessObject.HasMetadataTableFieldsAttributes(table, disease))
            {
                var fieldsMetadata = BOL.BusinessObject.GetMetadataTableFieldAttributes(table, disease);
                return fieldsMetadata.ToDictionary(a => a.Key, a => a.Value.ToDictionary(b => b.Key, b => b.Value.Value, StringComparer.OrdinalIgnoreCase), StringComparer.OrdinalIgnoreCase);
            }
            else if (!isDefault && BOL.BusinessObject.HasMetadataTableFieldsAttributes(table, DEFAULT_METADATA_KEY))
            {
                var fieldsMetadata = BOL.BusinessObject.GetMetadataTableFieldAttributes(table, DEFAULT_METADATA_KEY);
                return fieldsMetadata.ToDictionary(a => a.Key, a => a.Value.ToDictionary(b => b.Key, b => b.Value.Value, StringComparer.OrdinalIgnoreCase), StringComparer.OrdinalIgnoreCase);
            }
            else
            {
                return new Dictionary<string, Dictionary<string, string>>();
            }
        }


        /// <summary>
        /// Returns metadata for the given table, i.e., lookup[tableAttribute] -> tableAttributeValue
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        public IDictionary<string, string> GetTableMetadata(string table)
        {
            var metadata = GetTableDiseaseMetadata(table, disease);
            return metadata.ToDictionary(a => a.Key, a => a.Value.Value, StringComparer.OrdinalIgnoreCase);
        }

        /// <summary>
        /// Returns the metadata lookup dictionary for field in the table, i.e., lookup[fieldAttribute] -> fieldAttributeValue
        /// </summary>
        /// <param name="table"></param>
        /// <param name="field"></param>
        /// <returns></returns>
        public IDictionary<string, string> GetFieldMetadata(string table, string field)
        {
            var metadata = GetTableFieldDiseaseMetadata(table, field, disease);
            return metadata.ToDictionary(a => a.Key, a => a.Value.Value, StringComparer.OrdinalIgnoreCase);
        }

        /// <summary>
        /// Returns the disease specific metadata lookup dictionary for the table, i.e., lookup[tableAttribute] -> (isDefault, tableAttributeValue)
        /// </summary>
        /// <param name="table"></param>
        /// <returns></returns>
        public IDictionary<string, KeyValuePair<bool, string>> GetTableDiseaseMetadata(string table)
        {
            return GetTableDiseaseMetadata(table, disease);
        }

        /// <summary>
        /// Returns the disease specific metadata lookup dictionary for the table, i.e., lookup[tableAttribute] -> (isDefault, tableAttributeValue)
        /// </summary>
        /// <param name="table"></param>
        /// <param name="disease"></param>
        /// <returns></returns>
        public static IDictionary<string, KeyValuePair<bool, string>> GetTableDiseaseMetadata(string table, string disease)
        {
            disease = NormalizeDisease(disease);
            bool isDefault = IsDefaultDisease(disease);

            // check disease specific metadata
            if (BOL.BusinessObject.HasMetadataTableAttributes(table, disease))
            {
                return BOL.BusinessObject.GetMetadataTableAttributes(table, disease);
            }
            // check default metadata
            else if (!isDefault && BOL.BusinessObject.HasMetadataTableAttributes(table, DEFAULT_METADATA_KEY))
            {
                return BOL.BusinessObject.GetMetadataTableAttributes(table, DEFAULT_METADATA_KEY);
            }
            else
            {
                return new Dictionary<string, KeyValuePair<bool, string>>();
            }
        }

        public Dictionary<string, Dictionary<string, KeyValuePair<bool, string>>> GetAllTableFieldDiseaseMetadata(string table)
        {
            return GetAllTableFieldDiseaseMetadata(table, disease);
        }

        public static Dictionary<string, Dictionary<string, KeyValuePair<bool, string>>> GetAllTableFieldDiseaseMetadata(string table, string disease)
        {
            disease = NormalizeDisease(disease);
            bool isDefault = IsDefaultDisease(disease);

            // check disease specific metadata
            if (BOL.BusinessObject.HasMetadataTableFieldAttributes(table, disease))
            {
                return BOL.BusinessObject.GetMetadataTableFieldAttributes(table, disease);
            }
            // check default metadata
            else if (!isDefault && BOL.BusinessObject.HasMetadataTableFieldAttributes(table, DEFAULT_METADATA_KEY))
            {
                return BOL.BusinessObject.GetMetadataTableFieldAttributes(table, DEFAULT_METADATA_KEY);
            }
            else
            {
                return new Dictionary<string, Dictionary<string, KeyValuePair<bool, string>>>();
            }
        }

        public static IDictionary<string, KeyValuePair<bool, string>> GetTableFieldDiseaseMetadata(string table, string field, string disease)
        {
            disease = NormalizeDisease(disease);
            bool isDefault = IsDefaultDisease(disease);
            bool hasField = BOL.BusinessObject.HasField(table, field);
            if (hasField)
            {
                // check disease specific metadata
                if (BOL.BusinessObject.HasMetadataFieldAttributes(table, field, disease))
                {
                    return BOL.BusinessObject.GetMetadataFieldAttributes(table, field, disease);
                }
                // check default metadata
                else if (!isDefault && BOL.BusinessObject.HasMetadataFieldAttributes(table, field, DEFAULT_METADATA_KEY))
                {
                    return BOL.BusinessObject.GetMetadataFieldAttributes(table, field, DEFAULT_METADATA_KEY);
                }
            }
            return new Dictionary<string, KeyValuePair<bool, string>>();            
        }

        public static IEnumerable<XElement> GetTableDepthMap(IEnumerable<string> tables)
        {
            // get depth map
            var depthLookup = _GetTableDepthMapLookup(tables);

            // recursively build xelement map
            Func<string, IDictionary<string, int>, IEnumerable<XElement>> getChildNodes = null;
            getChildNodes = (table, lookup) =>
            {
                // get natural child tables included in lookup
                var children = BOL.BusinessObject.GetChildTableNames(table).Intersect(lookup.Keys);
                return from child in children
                       orderby child ascending
                       select new XElement(child, getChildNodes(child, lookup));
            };

            // get top level tables
            var rootsTables = (from pair in depthLookup
                               group pair by pair.Value into g
                               orderby g.Key ascending
                               select g).FirstOrDefault();

            // return depth tree
            if (rootsTables != null)
            {
                // build map inwards
                var xDepthMap = from pair in rootsTables
                                let table = pair.Key
                                where !string.IsNullOrEmpty(table)
                                //orderby table ascending
                                select new XElement(table, getChildNodes(table, depthLookup));
                return xDepthMap;
            }
            else
            {
                return new List<XElement>();
            }
        }

        public static IDictionary<string, int> GetTableDepthMapLookup(IEnumerable<string> tables)
        {
            return GetTableDepthMapLookup(tables, true);
        }

        /// <summary>
        /// Gets a depth map of tables
        /// </summary>
        /// <param name="tables"></param>
        /// <param name="isPatientTop"></param>
        /// <returns></returns>
        public static IDictionary<string, int> GetTableDepthMapLookup(IEnumerable<string> tables, bool isPatientTop)
        {
            // filter valid tables
            var lookup = tables.Where(t => BOL.BusinessObjectFactory.CanBuildBusinessObject(t));
            if (isPatientTop)
            {
                // reorder Patients to top of list
                var patients = lookup.Where(t => t == "Patients");
                lookup = patients.Concat(lookup.Except(patients));
            }
            // get map and flatten to table and depth
            var xMap = GetTableDepthMap(lookup);
            return xMap.DescendantsAndSelf().ToDictionary(
                    n => n.Name.LocalName,
                    n => BOL.BusinessObject.GetTableDepth(n.Name.LocalName));
        }

        public static IDictionary<string, int> GetPatientDataEntryMapLookup(IEnumerable<string> tables)
        {
            // step 1: add Patients to get full tree
            var tableNames = tables.ToList();
            bool hasPatients = tables.Contains("Patients");
            if (!hasPatients)
            {
                tableNames.Add("Patients");
            }
            // step 2: get xml map
            var xMap = GetTableDepthMap(tableNames);
            // step 3: filter to patients and children
            IEnumerable<string> depthTableNames = xMap.Where(n => n.Name.LocalName == "Patients").SelectMany(n => n.DescendantsAndSelf().Select(a => a.Name.LocalName));
            // step 4: remove patients if not in original list
            if (!hasPatients)
            {
                depthTableNames = depthTableNames.Except(new string[] { "Patients" });
            }
            return GetTableDepthMapLookup(depthTableNames, true);
        }

        private static IDictionary<string, int> _GetTableDepthMapLookup(IEnumerable<string> tables)
        {
            return tables.Where(
                    t => BOL.BusinessObjectFactory.CanBuildBusinessObject(t)
                        ).ToDictionary(
                            t => t, t => BOL.BusinessObject.GetTableDepth(t));
        }

        #endregion

        #region HELPERS

        /// <summary>
        /// Gets if the specified disease key is the default
        /// </summary>
        /// <param name="disease"></param>
        /// <returns></returns>
        private static bool IsDefaultDisease(string disease)
        {
            return disease == DEFAULT_METADATA_KEY;
        }

        /// <summary>
        /// Gets the normalized disease lookup key
        /// </summary>
        /// <param name="disease"></param>
        /// <returns></returns>
        private static string NormalizeDisease(string disease)
        {
            return !string.IsNullOrEmpty(disease) ? disease : DEFAULT_METADATA_KEY;
        }

        #endregion
    }
}