using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.DirectoryServices;
using System.Web;
using System.Web.Security;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;
using System.IO;
using System.Web.UI.WebControls;
using System.Linq;
using System.Reflection;

using Caisis.UI.Core.Classes;
using Caisis.Extensions;

/// <summary>
/// Handles page access to application level configuration data other than that in web.config.
/// </summary>
public static class CaisisConfiguration
{
    private static string appConfigDir = "~\\App_Data\\";
    private static string modulesConfig = appConfigDir + "ModuleRegistry.xml";
    private static string viewConfig = appConfigDir + "ViewRegistry.xml";
    private static string eformConfig = appConfigDir + "EFormRegistry.xml";
    private static string paperFormConfig = appConfigDir + "PaperFormRegistry.xml";
    private static string patientDataConfig = appConfigDir + "PatientDataEntryConfig.xml";
    private static string dataAnalysisConfig = appConfigDir + "DataAnalysisConfig.xml";
    private static string widgetConfig = appConfigDir + "WidgetRegistry.xml";


    #region Data Entry specific attributes

    public static readonly string ATTRIBUTE_Form = "Form";
    public static readonly string ATTRIBUTE_LoadByDefault = "LoadByDefault";
    public static readonly string ATTRIBUTE_Menu = "Menu";
    public static readonly string ATTRIBUTE_MenuOrder = "MenuOrder";
    public static readonly string ATTRIBUTE_DisplayWithParent = "DisplayWithParent";
    public static readonly string ATTRIBUTE_DisplayWithChild = "DisplayWithChild";
    public static readonly string ATTRIBUTE_ChronListOption = "ChronListOption";
    public static readonly string ATTRIBUTE_ChronListText = "ChronListText";
    public static readonly string ATTRIBUTE_NumDisplayColumns = "NumDisplayColumns";
    public static readonly string ATTRIBUTE_FileName = "FileName ";
    public static readonly string ATTRIBUTE_GridView = "GridView";
    public static readonly string ATTRIBUTE_MostRelevantTables = "MostRelevantTables";
    public static readonly string ATTRIBUTE_TotalBlankGridRows = "TotalBlankGridRows";
    public static readonly string ATTRIBUTE_VisibleBlankGridRows = "VisibleBlankGridRows";
    public static readonly string ATTRIBUTE_AllowAbsentEvent = "AllowAbsentEvent";
    public static readonly string ATTRIBUTE_Plugins = "Plugins";
    public static readonly string ATTRIBUTE_CommonDataElement = "CommonDataElement";
    //"DisplayInMainMenu",
    //"DisplayInSubMenu",
    //"DisplayOpened",
    //"MenuTitle",
    //"FilterChronListOnMenuClick",

    /// <summary>
    /// Gets a list of Data Entry Attributes
    /// </summary>
    /// <returns></returns>
    public static IEnumerable<string> GetDataEntryAttributes()
    {
        var attributes = from field in typeof(CaisisConfiguration).GetFields()
                         where field.Name.StartsWith("ATTRIBUTE_")
                         select field.GetValue(null).ToString();
        return attributes;
    }

    #endregion

    /// <summary>
    /// The default time to cache items
    /// </summary>
    private static readonly int DEFAULT_CACHE_LENGTH = 60;

    /// <summary>
    /// Return appsetting values secified in web config
    /// </summary>
    /// <param name="appSetting"></param>
    /// <returns></returns>
    public static string GetWebConfigValue(string appSetting)
    {
        return System.Web.Configuration.WebConfigurationManager.AppSettings[appSetting];
    }

    # region /********** Handle Modules Configuration ********/

    /// <summary>
    /// Gets a complete list of Caisis Tabs as an XmlNodeList. (NOTE: Does not take into account user access)
    /// </summary>
    /// <returns></returns>
    public static XmlNodeList GetTabsList()
    {
        XmlNodeList tabslist = CacheManager.GetFromCache("tabslist") as XmlNodeList;
        if (tabslist == null)
        {
            tabslist = XmlUtil.GetNodesFromXml("modules/module[@isTab='true']", modulesConfig);
            CacheManager.InsertIntoCache("tabslist", tabslist, DEFAULT_CACHE_LENGTH * 4);
        }
        return tabslist;
    }

    /// <summary>
    /// Gets a list of Caisis Modules as an XmlNodeList. Cached for 240 minutes.
    /// </summary>
    /// <returns></returns>
    public static XmlNodeList GetModulesList()
    {
        XmlNodeList moduleslist;
        if (CacheManager.IsInCache("moduleslist"))
        {
            moduleslist = (XmlNodeList)CacheManager.GetFromCache("moduleslist");
        }

        else
        {
            moduleslist = XmlUtil.GetNodesFromXml("modules/module", modulesConfig);
            CacheManager.InsertIntoCache("moduleslist", moduleslist, DEFAULT_CACHE_LENGTH*4);
        }

        return moduleslist;
    }

    # endregion

    # region /********** Handle Patient Data Section Configuration ********/

    /// <summary>
    /// Returns a configuration document for Patient Data related tasks.
    /// </summary>
    /// <returns></returns>
    public static XmlDocument GetPatientDataConfig()
    {
        // get cache key
        string disease = new Caisis.Controller.DiseaseController().GetDiseaseView();
        // check cache, else load doc
        XmlDocument pdeXML = CacheManager.GetPatientDataCache(disease) as XmlDocument;
        if (pdeXML == null)
        {
            // load xml from metadata 
            XDocument xDoc = GetPatientDataConfigFromMetadata(disease);
            pdeXML = new XmlDocument();
            pdeXML.Load(xDoc.CreateReader());

            // place in cache
            CacheManager.InsertPatientDataCache(disease, pdeXML, DEFAULT_CACHE_LENGTH);
        }
        return pdeXML;
    }

    /// <summary>
    /// Returns the patient data configuration from config file.
    /// </summary>
    /// <returns></returns>
    [Obsolete("Use GetPatientDataConfig instead")]
    public static XmlDocument GetPatientDataConfigFromFile()
    {
        // load xml from static file and normalize
        XDocument xDoc = XmlUtil.GetXDoc(patientDataConfig);
        _NormalizePatientDataEntryConfig(xDoc);
        // return normalized document
        XmlDocument pdeXML = new XmlDocument();
        pdeXML.Load(xDoc.CreateReader());
        return pdeXML;
    }

    /// <summary>
    /// Builds a XDocument representation of the PatientDataEntryConfig objects and their relationships.
    /// </summary>
    /// <param name="disease"></param>
    /// <returns></returns>
    private static XDocument GetPatientDataConfigFromMetadata(string disease)
    {
        // get controller reference for querying disease specific mappings
        Caisis.Controller.PatientDataEntryController _dataEntryController = new Caisis.Controller.PatientDataEntryController(disease);
        
        // step 1: get all valid meta tables
        var allTables = _dataEntryController.GetDataEntryMenuNames();

        // step 2: create depth map
        //var depthMap = CacheManager.GetTableDepthMap(allTables);
        // step 3: only concerned about Patients and children (flatten)
        //var patientsDepthMap = depthMap.Where(n => n.Name.LocalName == "Patients").DescendantsAndSelf();

        // step 2: collect metadata for table
        var tableAndMetadata = (from table in allTables
                                // get metadata
                                let metadata = _dataEntryController.GetTableDiseaseMetadata(table)
                                select new
                                {
                                    Table = table,
                                    Metadata = metadata.ToDictionary(a => a.Key, a => a.Value.Value, StringComparer.OrdinalIgnoreCase)
                                }).ToDictionary(a => a.Table, a => a.Metadata);
        // step 3: first get top level tables
        string[] TOP_LEVEL_MENU_NAMES = new string[] 
        {
            "Patients",
            "Encounters",
            "Procedures",
            "Therapies",
            "Diagnostics",
            "Outcomes"
        };
        var topLevelMenu = from topMenu in TOP_LEVEL_MENU_NAMES
                           let childMenus = from t in tableAndMetadata
                                            let table = t.Key
                                            let tableMetadata = t.Value
                                            where tableMetadata.ContainsKey(ATTRIBUTE_Menu)
                                            let parentMenuName = tableMetadata[ATTRIBUTE_Menu]
                                            where parentMenuName.Equals(topMenu, StringComparison.OrdinalIgnoreCase)
                                            select table
                           // no need to select empty top menus
                           where childMenus.Count() > 0
                           select new
                           {
                               MenuName = topMenu,
                               MenuTableNames = childMenus
                           };

        // HELPER function for recusive callbacks

        // get child menus
        Func<string, IEnumerable<string>> getChildDataEntryForms = (table) =>
            {
                var childForms = _dataEntryController.GetChildDataEntryForms(table);
                return childForms.Intersect(allTables);
            };

        Func<string, IDictionary<string, string>> getMetadata =
            (table) =>
            {
                return tableAndMetadata.ContainsKey(table) ? tableAndMetadata[table] : new Dictionary<string, string>();
            };

        // helper function for transforming table metadata into xml attributes
        Func<string, IDictionary<string, string>, IEnumerable<XAttribute>> tableTableAttributes = null;
        tableTableAttributes = (table, metadata) =>
        {
            string tableLabel = _dataEntryController.GetTableLabel(table);
            string tableDescription = _dataEntryController.GetTableDescription(table);
            // build a list of special attributes
            var reserveredAttributes = new XAttribute[] {
                        new XAttribute("tableName", table),
                        new XAttribute("menuTitle", tableLabel),
                        new XAttribute("pageTitle", tableLabel)
                    };
            var reservedAttributeNames = reserveredAttributes.Select(a => a.Name.LocalName);
            // build a list of attributes from metadata, excluding special list
            var tableAttributes = from meta in metadata.Keys.Distinct().Except(reservedAttributeNames)
                                  let attributeName = meta
                                  let attributeValue = metadata[attributeName]
                                  select new XAttribute(attributeName, attributeValue);
            // return concat list
            return reserveredAttributes.Concat(tableAttributes);
        };
        // step 4: build full xml tree (TODO, build xml > 3 levels deep ???)
        var patientDataXML =
        new XDocument(
            new XDeclaration("1.0", "utf-8", "yes"),
            // root <menu>
            new XElement("menus",
            // top level menus <menu>
                from topMenu in topLevelMenu
                select new XElement("menu",
                          new XAttribute("title", topMenu.MenuName),
                          new XAttribute("menuTitle", topMenu.MenuName),
                    // level one
                          from table in topMenu.MenuTableNames
                          let tableMetadata = getMetadata(table)
                          let tableAttributes = tableTableAttributes(table, tableMetadata)
                          let tableLabel = tableAttributes.Where(n => n.Name == "menuTitle").First().Value
                          // ordering (by menu order, then table name)
                          let order = tableMetadata.ContainsKey(ATTRIBUTE_MenuOrder) ? int.Parse(tableMetadata[ATTRIBUTE_MenuOrder]) : int.MaxValue
                          orderby (table == "Patients" ? 0 : 1) ascending, order ascending, tableLabel ascending
                          select new XElement("menuItem", tableAttributes,
                              // level two (do not build children of Patients)
                                 from childTable in table == "Patients" ? new string[] { } : getChildDataEntryForms(table)
                                 let childTableMetadata = getMetadata(childTable)
                                 orderby _dataEntryController.GetTableLabel(childTable) ascending
                                 //orderby childTable ascending
                                 select new XElement("menuItem", tableTableAttributes(childTable, childTableMetadata),
                                     // level three
                                     from grandChildTable in _dataEntryController.GetChildDataEntryForms(childTable)
                                     let grandChildTableMetadata = getMetadata(grandChildTable)
                                     orderby getChildDataEntryForms(grandChildTable) ascending
                                     //orderby grandChildTable ascending
                                     select new XElement("menuItem", tableTableAttributes(grandChildTable, grandChildTableMetadata)))))));

        // determine tables which have yet to be places (add ???)
        var currentXmlTables = patientDataXML.Descendants("menuItem").Select(n => n.Attribute("tableName").Value);
        var tablesWithNoPatentNode = allTables.Except(currentXmlTables);
        if (false && tablesWithNoPatentNode.Count() > 0)
        {
            // place under patients menu
            var patientsMenu = patientDataXML.XPathSelectElement("//menu[@menuTitle='Patients']");
            if (patientsMenu != null)
            {
                var addToParent = tablesWithNoPatentNode.Intersect(_dataEntryController.GetChildDataEntryForms("Patients"));
                // add under patients node
                patientsMenu.Add(from table in addToParent
                                 select new XElement("menuItem", tableTableAttributes(table, getMetadata(table))));
            }
        }

        //// step 5: clean up empty menu groups (i.e., menus with no children)
        //var menuGroups = patientDataXML.XPathSelectElements("//menu[count(//menuItem)=0]");
        //foreach (XElement menuGroup in menuGroups)
        //{
        //    menuGroup.RemoveAll();
        //    menuGroup.Remove();
        //}

        // normalize document
        _NormalizePatientDataEntryConfig(patientDataXML);
        return patientDataXML;
    }

    /// <summary>
    /// Normalize the Patient Data XML document, i.e., add "Summary", "Workflows", etc...
    /// </summary>
    /// <param name="xDoc"></param>
    private static void _NormalizePatientDataEntryConfig(XDocument xDoc)
    {
        XElement menuRoot = xDoc.Root;
        var nodes = xDoc.Descendants("menuItem");

        // step 1: create Summary node
        var patientNode = menuRoot.XPathSelectElement("//menu[@menuTitle='Patients']");
        if (patientNode != null)
        {
            // check for summary node, else insert as first menu item
            if (patientNode.XPathSelectElement("menuItem[@menuTitle='Summary']") == null)
            {
                patientNode.AddFirst(new XElement("menuItem",
                                new XAttribute("loadByDefault", "True"),
                                new XAttribute("fileName", "Summary.ascx"),
                                new XAttribute("menuTitle", "Summary"),
                                new XAttribute("tableName", "Summary"),
                                new XAttribute("pageTitle", "Summary"),
                                new XAttribute("chronListOption", "ListCommon"),
                                new XAttribute("chronListText", "Most Relevant")));
            }
        }

        // step 2: create workflow nodes        
        // get a list of all active workflows
        var allDynamicEforms = from biz in Caisis.BOL.BusinessObject.GetAll<Caisis.BOL.MetadataEForm>()
                               let eform = biz[Caisis.BOL.MetadataEForm.EFormName].ToString()
                               let dynamicEFormPath = VirtualPathUtility.ToAbsolute("~/Core/DynamicEforms/Eform.aspx") + "?eformName=" + HttpUtility.UrlEncode(eform) + "&pde=true"
                               let disease = biz[Caisis.BOL.MetadataEForm.EFormDisease].ToString()
                               // inactive eforms have version=0
                               let active = biz[Caisis.BOL.MetadataEForm.EFormVersionNum].ToString() != "0"
                               where active
                               orderby eform ascending
                               select new
                               {
                                   EformName = eform,
                                   EformPath = dynamicEFormPath,
                                   EformDisease = string.IsNullOrEmpty(disease) ? "All" : disease
                               };

        // validate there are active eforms before showing workflows menu
        if (allDynamicEforms.Count() > 0)
        {
            XElement workFlowNode = menuRoot.XPathSelectElement("//menu[@title='Workflows']");
            // if no workflow node exists, create one for containing workflows
            if (workFlowNode == null)
            {
                workFlowNode = new XElement("menu", new XAttribute("title", "Workflows"), new XAttribute("menuTitle", "Workflows"));
                // insert into root menuItems node
                menuRoot.Add(workFlowNode);
            }

            // create grouping of eforms by diseases
            var groupByDiseases = from eform in allDynamicEforms
                                  group eform by eform.EformDisease into diseaseGroup
                                  select new
                                  {
                                      Disease = diseaseGroup.Key,
                                      Eforms = diseaseGroup
                                  };
            // CREATE XML TREE: create xml tree grouping workflows by disease
            // <menuItem menuTitle="Prostate">
            //   <menuItem menuTitle="Prostate Workflow"></menuItem>
            //   ....
            // </menuItem>
            // <menuItem menuTitle="Thorasic">
            //   <menuItem menuTitle="Thorasic Follow-Up Workflow"></menuItem>
            //   ....
            // </menuItem>
            var workflowsByDisease = from diseaseGroup in groupByDiseases
                                     // create top level disease menu item
                                     select new XElement("menuItem",
                                         new XAttribute("menuTitle", !string.IsNullOrEmpty(diseaseGroup.Disease) && diseaseGroup.Disease.Equals("All") ? "General" : diseaseGroup.Disease), new XAttribute("onclick", "return false"),
                                         // create menu item for each eform under disease node
                                         from eform in diseaseGroup.Eforms
                                         select new XElement("menuItem",
                                          new XAttribute("menuTitle", eform.EformName),
                                          new XAttribute("pageTitle", eform.EformName),
                                          new XAttribute("href", eform.EformPath),
                                          new XAttribute("onclick", "if(startDynamicEformDataEntry) { return startDynamicEformDataEntry(this); }")
                                  ));

            // add dynamic workflows to main workflow menu node
            workFlowNode.Add(workflowsByDisease);
        }
    }
 
    # endregion

    # region /********** Handle Eform Configuration ********/

    /// <summary>
    /// Gets a list of Eforms as an XmlNodeList. Cached for 60 minutes.
    /// </summary>
    /// <returns></returns>
    public static XmlNodeList GetEFormsList()
    {
        XmlNodeList eformslist;
        if (CacheManager.IsInCache("eformslist"))
        {
            eformslist = (XmlNodeList)CacheManager.GetFromCache("eformslist");
        }

        else
        {
            eformslist = XmlUtil.GetNodesFromXml("//eform", eformConfig);
            CacheManager.InsertIntoCache("eformslist", eformslist, DEFAULT_CACHE_LENGTH);
        }
        return eformslist;
    }

    /// <summary>
    /// Returns an enumerable list of Eform Config objects
    /// </summary>
    /// <returns></returns>
    public static IEnumerable<EformConfig> GetEformsConfigList()
    {
        IEnumerable<ICaisisConfiguration> cachedList = GetConfigFromCache("xEformsList");
        if (cachedList == null)
        {
            var eforms = from eform in XmlUtil.GetXElementsFromXml("eform", eformConfig)
                         select new EformConfig(eform);
            CacheManager.InsertIntoCache("xEformsList", eforms, DEFAULT_CACHE_LENGTH);
            return eforms;
        }
        else
        {
            return cachedList as IEnumerable<EformConfig>;
        }
    }

    # endregion

    # region /********** Handle Paper Form Configuration ********/

    /// <summary>
    /// Returns an enumerable list of PaperForm config objects
    /// </summary>
    /// <returns></returns>
    public static IEnumerable<PaperFormConfig> GetPaperFormConfigList()
    {
        IEnumerable<ICaisisConfiguration> cachedList = GetConfigFromCache("xPaperFormList");
        if (cachedList == null)
        {
            var paperFormList = from form in XmlUtil.GetXElementsFromXml("form", paperFormConfig)
                                select new PaperFormConfig(form);
            CacheManager.InsertIntoCache("xPaperFormList", paperFormList, DEFAULT_CACHE_LENGTH);
            return paperFormList;
        }
        else
        {
            return cachedList as IEnumerable<PaperFormConfig>;
        }
    }

    #endregion

    # region /********** Handle View Configuration ********/

    /// <summary>
    /// Gets a list of Views as an XmlNodeList. Cached for 60 minutes.
    /// </summary>
    /// <returns></returns>
    public static XmlNodeList GetViews()
    {
        XmlNodeList viewslist;
        if (CacheManager.IsInCache("viewslist"))
        {
            viewslist = (XmlNodeList)CacheManager.GetFromCache("viewslist");
        }
        else
        {
            viewslist = XmlUtil.GetNodesFromXml("//view", viewConfig);
            CacheManager.InsertIntoCache("viewslist", viewslist, DEFAULT_CACHE_LENGTH);
        }
        return viewslist;
    }

    /// <summary>
    /// Returns an enumerable list of ViewConfig objects
    /// </summary>
    /// <returns></returns>
    public static IEnumerable<ViewConfig> GetViewConfigList()
    {
        IEnumerable<ICaisisConfiguration> cachedList = GetConfigFromCache("xViewList");
        if (cachedList == null)
        {
            var viewList = from view in XmlUtil.GetXElementsFromXml("view", viewConfig)
                           select new ViewConfig(view);
            CacheManager.InsertIntoCache("xViewList", viewList, DEFAULT_CACHE_LENGTH);
            return viewList;
        }
        else
        {
            return cachedList as IEnumerable<ViewConfig>;
        }
    }

    # endregion

    #region /********** Handle Modules Configuration ********/

    public static IEnumerable<ModuleConfig> GetModuleConfigList()
    {
        XDocument xDoc = XmlUtil.GetXDoc(modulesConfig);
        var dataAnalysisConfigList = from module in xDoc.Descendants("module")
                                     select new ModuleConfig(module);
        return dataAnalysisConfigList;
    }

    #endregion

    #region /********** Handle Widget Configuration ********/

    /// <summary>
    /// Returns an enumerable list of Widget config objects
    /// </summary>
    /// <returns></returns>
    public static IEnumerable<WidgetConfig> GetWidgetConfigList()
    {
        var widgetList = from widget in XmlUtil.GetXElementsFromXml("widget", widgetConfig)
                         // create new widget configuration
                         let config = new WidgetConfig(widget)
                         // sorted widget config by order num
                         orderby config.Order ascending
                         select config;
        return widgetList;
    }

    #endregion

    # region /**** Configuration Files Helper Functions ****/
    /// <summary>
    /// Gets EForm Node specified by "displayname"
    /// </summary>
    /// <param name="eformName">"displayname" attribute in XML Doc</param>
    /// <returns></returns>
    public static XmlNode GetEFormNode(string eformName)
    {
        string xpath = "//eform[@name=\"" + eformName + "\"]";
        return XmlUtil.GetSingleNodeFromXml(xpath, eformConfig);
    }

    public static XmlNode GetViewNode(string viewName)
    {
        string xpath = "//eform[@name=\"" + viewName + "\"]";
        return XmlUtil.GetSingleNodeFromXml(xpath, viewConfig);
    }

    /// <summary>
    /// Return specific Config XML Document 
    /// </summary>
    /// <returns></returns>
    public static XmlDocument GetEFormXmlDoc()
    {
        return XmlUtil.GetXmlDoc(eformConfig);
    }

    /// <summary>
    /// Returns the XML Document representing an Eform by EformName
    /// i.e.,"UroProsFU"
    /// </summary>
    /// <param name="eformName"></param>
    /// <returns></returns>
    public static XmlDocument GetEFormsXmlByName(string eformName)
    {
        string modFolder = Caisis.UI.Core.Classes.XmlUtil.GetParentModuleDirectory(eformName + ".xml", "EForms");
        string relPath = string.Format("~/Modules/{0}/EForms/{1}.xml", modFolder, eformName);
        string fullPath = HttpContext.Current.Server.MapPath(relPath);
        return GetEFormsXml(fullPath);
    }

    /// <summary>
    /// Returns the XML Document representing an Eform
    /// </summary>
    /// <param name="pathToEFormXml">The full system path to the Eform XML Document</param>
    /// <returns></returns>
    public static XmlDocument GetEFormsXml(string pathToEFormXml)
    {
        XmlDocument xmlDoc = new XmlDocument();
        xmlDoc.Load(pathToEFormXml);
        return xmlDoc;
    }

    /// <summary>
    /// Returns an enumerable list of ICaisisConfiguration objects if in cache, else null
    /// </summary>
    /// <param name="cacheKey"></param>
    /// <returns></returns>
    private static IEnumerable<ICaisisConfiguration> GetConfigFromCache(string cacheKey)
    {
        if (CacheManager.IsInCache(cacheKey))
        {
            return CacheManager.GetFromCache(cacheKey) as IEnumerable<ICaisisConfiguration>;
        }
        else
        {
            return null;
        }
    }

    # endregion

    /// <summary>
    /// 
    /// </summary>
    /// <returns></returns>
    public static IEnumerable<DataAnalysisConfig> GetDataAnalysisConfigList()
    {
        XDocument xDoc = XmlUtil.GetXDoc(dataAnalysisConfig);
        var dataAnalysisConfigList = from dataConfig in xDoc.Descendants("menuItem")
                                     select new DataAnalysisConfig(dataConfig);

        return dataAnalysisConfigList;
    }

    #region LDAP

    /// <summary>
    /// Returns if the current configuration uses LDAP for authentication
    /// </summary>
    /// <returns></returns>
    public static bool UseLDAP()
    {
        string ldapMode = GetWebConfigValue("LDAPAuthenticationMode");
        if (!string.IsNullOrEmpty(ldapMode) && ldapMode.ToLower() == "on")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    /// <summary>
    /// Pings the current configured LDAP server
    /// </summary>
    /// <returns></returns>
    public static bool PingLDAP()
    {
        return PingLDAP(GetWebConfigValue("LDAPServer"));
    }

    /// <summary>
    /// Pings an LDAP server for a response
    /// </summary>
    /// <param name="serverName">The name of the server to ping</param>
    /// <returns>Returns if the server received the ping</returns>
    public static bool PingLDAP(string serverName)
    {
        using (DirectoryEntry entry = new DirectoryEntry())
        {
            if (!string.IsNullOrEmpty(serverName))
            {
                entry.Path = "LDAP://" + serverName;
            }

            DirectorySearcher searcher = new DirectorySearcher(entry);

            searcher.Filter = "(objectClass=user)";

            try
            {
                searcher.FindOne();
                return true;
            }
            catch (Exception e)
            {
                if (e is DirectoryServicesCOMException && e.Message.Contains("Logon failure"))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }

    #endregion
}

#region Configuration Objects for getting application configuration (data entry form, paper forms, etc...)

/// <summary>
/// An interface which facilitates strongly typed configuration
/// </summary>
public interface ICaisisConfiguration
{
    /// <summary>
    /// Defines a Name for the instance of the configuration
    /// </summary>
    string Name
    {
        get;
    }

    /// <summary>
    /// Defines the Text which is displayed on bound controls or represents a user friendly name of the object
    /// </summary>
    string DisplayName
    {
        get;
    }

    /// <summary>
    ///  Defines the Value which is set on bound controls
    /// </summary>
    string DisplayValue
    {
        get;
    }

    /// <summary>
    /// Defines the disease context of an object
    /// </summary>
    string Disease
    {
        get;
    }

    /// <summary>
    /// Defines the list of diseases of an object
    /// </summary>
    IEnumerable<string> Diseases
    {
        get;
    }

    /// <summary>
    /// Defines if the configuration is "active"
    /// </summary>
    bool Active
    {
        get;
    }

    /// <summary>
    /// Defines a method which determine if a configuration option exists
    /// </summary>
    /// <param name="configName"></param>
    /// <returns></returns>
    bool HasConfigValue(string configName);

    /// <summary>
    /// Defines a method which returns a strongly typed object representing a configuration option
    /// </summary>
    /// <param name="config"></param>
    /// <param name="configType"></param>
    /// <param name="defaultValue"></param>
    /// <returns></returns>
    object GetConfigurationValue(string config, Type configType, object defaultValue);

    /// <summary>
    /// Defines a method which returns a raw configuration option as a string
    /// </summary>
    /// <param name="config"></param>
    /// <returns></returns>
    string GetConfigurationValue(string config);
}

/// <summary>
/// Base class providing strongly type configuration objects
/// </summary>
public abstract class BaseCaisisConfiguration : ICaisisConfiguration
{
    protected string tableName;
    private IDictionary<string, string> _metadata = null;
    private IDictionary<string, string> Metadata
    {
        get
        {
            if (_metadata == null)
            {
                if (!string.IsNullOrEmpty(tableName))
                {
                    string disease = new Caisis.Security.SecurityController().GetViewMode();
                    var meta = Caisis.Controller.PatientDataEntryController.GetTableDiseaseMetadata(tableName, disease);
                    _metadata = meta.ToDictionary(k => k.Key, v => v.Value.Value, StringComparer.OrdinalIgnoreCase);
                }
                else
                    _metadata = new Dictionary<string, string>();
            }
            return _metadata;
        }
    }

    /// <summary>
    /// XElement used for lookuping up attributes with XML based configuration
    /// </summary>
    protected XElement configNode;

    /// <summary>
    /// Gets the metadata table name of the configuratoin
    /// </summary>
    public string TableName
    {
        get
        {
            return tableName;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public virtual string Name
    {
        get
        {
            return GetConfigValue("name", string.Empty);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public virtual string DisplayName
    {
        get
        {
            return Name;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public virtual string DisplayValue
    {
        get
        {
            return Name;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public virtual string Title
    {
        get
        {
            return GetConfigValue("title", DisplayName);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public virtual string Description
    {
        get
        {
            return GetConfigValue("description", string.Empty);
        }
    }

    /// <summary>
    /// Gets the Disease associtaed with the configuration
    /// </summary>
    public virtual string Disease
    {
        get
        {
            // return first disease
            return Diseases.Count() > 0 ? Diseases.First() : string.Empty;
        }
    }

    /// <summary>
    /// Gets a list of Diseases associated with the configuration
    /// </summary>
    public virtual IEnumerable<string> Diseases
    {
        get
        {
            var diseases = GetConfigList("disease");
            return diseases;
        }
    }

    /// <summary>
    /// Gets the menu order of the node, default to MAX int value
    /// </summary>
    public virtual int MenuOrder
    {
        get
        {
            return GetConfigValue("menuOrder", int.MaxValue);
        }
    }

    /// <summary>
    /// Gets if the active configuration is "active"
    /// </summary>
    public virtual bool Active
    {
        get
        {
            return GetConfigValue("active", false);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public BaseCaisisConfiguration()
    {
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="metaTableName"></param>
    public BaseCaisisConfiguration(string metaTableName)
    {
        this.tableName = metaTableName;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="metadata"></param>
    public BaseCaisisConfiguration(IDictionary<string, string> metadata)
    {
        this._metadata = metadata;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="configNode"></param>
    public BaseCaisisConfiguration(XElement configNode)
    {
        this.configNode = configNode;
        this.tableName = GetConfigurationValue("tableName");
    }

    /// <summary>
    /// Returns whether the table has a config associated with it
    /// </summary>
    /// <param name="configName"></param>
    /// <returns></returns>
    public bool HasConfigValue(string configName)
    {
        // xml lookup
        if (configNode != null)
        {
            return configNode.HasAttributes && configNode.Attribute(configName) != null;
        }
        // biz object lookup
        else
        {
            return Metadata.ContainsKey(configName);
        }
    }

    /// <summary>
    /// Returns a configuration value as a strongly typed object as specificed by Type.
    /// Returns default value in case where value is not present
    /// </summary>
    /// <param name="config"></param>
    /// <param name="configType"></param>
    /// <param name="defaultValue"></param>
    /// <returns></returns>
    public object GetConfigurationValue(string config, Type configType, object defaultValue)
    {
        string configValue = GetConfigurationValue(config);
        return GetObjectFromString(configValue, configType, defaultValue);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="configNodeName"></param>
    /// <param name="configType"></param>
    /// <param name="defaultValue"></param>
    /// <returns></returns>
    protected object GetNesterConfigurationValue(string configNodeName, Type configType, object defaultValue)
    {
        var nestedNodes = this.configNode.Descendants(configNodeName);
        if (nestedNodes.Count() > 0)
        {
            string nodeValue = nestedNodes.First().Value;
            return GetObjectFromString(nodeValue, configType, defaultValue);
        }
        else
        {
            return GetObjectFromString(null, configType, defaultValue);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="configValue"></param>
    /// <param name="configType"></param>
    /// <param name="defaultValue"></param>
    /// <returns></returns>
    protected object GetObjectFromString(string configValue, Type configType, object defaultValue)
    {
        if (!string.IsNullOrEmpty(configValue))
        {
            if (configType == typeof(int))
            {
                return int.Parse(configValue);
            }
            else if (configType == typeof(bool))
            {
                return bool.Parse(configValue);
            }
            else
            {
                return configValue;
            }
        }
        else
        {
            return defaultValue;
        }
    }

    /// <summary>
    /// Returns the configuration value
    /// </summary>
    /// <param name="config"></param>
    /// <returns></returns>
    public virtual string GetConfigurationValue(string config)
    {
        if (HasConfigValue(config))
        {
            // if xml node lookup
            if (configNode != null)
            {
                return configNode.Attribute(config).Value;
            }
            // otheriwse biz object lookup
            else
            {
                return Metadata[config];
            }
        }
        else
        {
            return null;
        }
    }

    /// <summary>
    /// Returns a config value as a string, with defaultValue in case of non existent configuration
    /// </summary>
    /// <param name="config"></param>
    /// <param name="defaultValue"></param>
    /// <returns></returns>
    protected string GetConfigValue(string config, string defaultValue)
    {
        return (string)GetConfigurationValue(config, typeof(string), defaultValue);
    }

    /// <summary>
    /// Returns a config value as a bool, with defaultValue in case of non existent configuration
    /// </summary>
    /// <param name="config"></param>
    /// <param name="defaultValue"></param>
    /// <returns></returns>
    protected bool GetConfigValue(string config, bool defaultValue)
    {
        return (bool)GetConfigurationValue(config, typeof(bool), defaultValue);
    }

    /// <summary>
    /// Returns a config value as an int, with defaultValue in case of non existent configuration
    /// </summary>
    /// <param name="config"></param>
    /// <param name="defaultValue"></param>
    /// <returns></returns>
    protected int GetConfigValue(string config, int defaultValue)
    {
        return (int)GetConfigurationValue(config, typeof(int), defaultValue);
    }

    /// <summary>
    /// Returns an enumerable list of strings based on a single parseable CSV string
    /// </summary>
    /// <param name="config"></param>
    /// <returns></returns>
    protected List<string> GetConfigList(string config)
    {
        return GetConfigList(config, false, null).ToList();
    }
 
    /// <summary>
    /// 
    /// </summary>
    /// <param name="config"></param>
    /// <param name="hasDefaultEntry"></param>
    /// <param name="defaultEntry"></param>
    /// <returns></returns>
    protected IEnumerable<string> GetConfigList(string config, bool hasDefaultEntry, string defaultEntry)
    {
        IEnumerable<string> configList = !string.IsNullOrEmpty(defaultEntry) ? new string[] { defaultEntry } : new string[0];
        string configValue = GetConfigValue(config, string.Empty);
        if (!string.IsNullOrEmpty(configValue))
        {
            // split, cleanup, trim
            configList = configValue.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries).Select(c=>c.Trim());
        }
        return configList;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <returns></returns>
    public virtual XElement ToXElement()
    {
        return ToXElement(this.GetType().Name);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="nodeName"></param>
    /// <returns></returns>
    public virtual XElement ToXElement(string nodeName)
    {
        XElement xe = new XElement(nodeName,
        from prop in this.GetType().GetProperties()
        let t = prop.PropertyType
        // normalize attribute names to first letter lower case
        let aName = char.ToLower(prop.Name[0]) + prop.Name.Substring(1)
        where t == typeof(string) || t == typeof(bool) || t == typeof(int) || t == typeof(IEnumerable<string>)
        // special case with boool and lists
        select new XAttribute(aName, t == typeof(IEnumerable<string>) ? string.Join(",", GetConfigList(prop.Name).ToArray()) : t == typeof(bool) ? prop.GetValue(this, null).ToString().ToLower() : prop.GetValue(this, null))
    );
        return xe;
    }
}

/// <summary>
/// A configuration object used for getting common eform related configurations
/// </summary>
public class EformConfig : BaseCaisisConfiguration
{
    public override IEnumerable<string> Diseases
    {
        get
        {
            return base.GetConfigList("disease", true, "General");
        }
    }

    /// <summary>
    /// Name of the EForm (Will be removed from future revisions)
    /// </summary>
    public override string Name
    {
        get
        {
            return base.GetConfigValue("name", string.Empty);
        }
    }

    /// <summary>
    /// The full display name of the EForm
    /// </summary>
    public override string DisplayName
    {
        get
        {
            return base.GetConfigValue("displayname", string.Empty);
        }
    }

    /// <summary>
    /// The value field use for DropDown menus
    /// </summary>
    public override string DisplayValue
    {
        get
        {
            return Name;
        }
    }

    /// <summary>
    /// Full XML filename of EForm
    /// </summary>
    public string FileName
    {
        get
        {
            return base.GetConfigValue("filename", string.Empty);
        }
    }

    /// <summary>
    /// If true, EForm will automatically print when Approved (default to false)
    /// </summary>
    public bool PromptForPrint
    {
        get
        {
            return base.GetConfigValue("promptForPrint", false);
        }
    }

    /// <summary>
    ///
    /// 
    /// </summary>
    public bool EmailReportToUserOnApproval
    {
        get
        {
            return base.GetConfigValue("emailReportToUserOnApproval", false);
        }
    }

    /// <summary>
    /// true or false indicating whether or not to send an email to the user approving the eform
    /// </summary>
    public bool ApprovePermissionRequired
    {
        get
        {
            return base.GetConfigValue("approvePermissionRequired", false);
        }
    }

    /// <summary>
    /// true of false if eform can be entered for day
    /// </summary>
    public bool AllowMultiple
    {
        get
        {
            return base.GetConfigValue("allowMultiple", false);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="configNode"></param>
    public EformConfig(XElement configNode)
        : base(configNode)
    {
    }

    /// <summary>
    /// Gets an Eform Config object by name
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public static EformConfig GetByName(string name)
    {
        var found = from eform in CaisisConfiguration.GetEformsConfigList()
                    where eform.Name == name
                    select eform;
        if (found.Count() > 0)
        {
            return found.First();
        }
        else
        {
            return null;
        }
    }
}

/// <summary>
/// A configuration object used for getting common paper form related configurations
/// </summary>
public class PaperFormConfig : BaseCaisisConfiguration
{
    /// <summary>
    /// 
    /// </summary>
    public override string Name
    {
        get
        {
            return FormName;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public override string DisplayName
    {
        get
        {
            return BatchName;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public override string DisplayValue
    {
        get
        {
            return Page.Replace(".ascx", "");
        }
    }

    /// <summary>
    /// Items with this attribute appear in paper form dropdown lists
    /// </summary>
    public string BatchName
    {
        get
        {
            return base.GetConfigValue("batchName", string.Empty);
        }
    }

    /// <summary>
    /// The name of the form as it apepars in the menu
    /// </summary>
    public string FormName
    {
        get
        {
            return base.GetConfigValue("formName", string.Empty);
        }
    }

    /// <summary>
    /// The name of the control representing the paper form
    /// </summary>
    public string Page
    {
        get
        {
            return base.GetConfigValue("page", string.Empty);
        }
    }

    public override IEnumerable<string> Diseases
    {
        get
        {
            return base.GetConfigList("disease", true, "General");
        }
    }

    public PaperFormConfig(XElement configNode)
        : base(configNode)
    {
    }
}

/// <summary>
/// A configuration object used for getting view related configurations
/// </summary>
public class ViewConfig : BaseCaisisConfiguration
{
    /// <summary>
    /// 
    /// </summary>
    public override string Disease
    {
        get
        {
            return Name;
        }
    }

    public override IEnumerable<string> Diseases
    {
        get
        {
            return new string[] { Name };
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public override string Name
    {
        get
        {
            return base.GetConfigValue("name", string.Empty);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="configNode"></param>
    public ViewConfig(XElement configNode)
        : base(configNode)
    {
    }
}

public class ModuleConfig : BaseCaisisConfiguration
{
    /// <summary>
    /// 
    /// </summary>
    public class ModuleSectionConfig : BaseCaisisConfiguration
    {
        private string sectionName;
        private string sectionTitle;
        private IDictionary<string, string> permissions = new Dictionary<string, string>();

        public string SectionName
        {
            get
            {
                return sectionName;
            }
        }

        public string SectionTitle
        {
            get
            {
                return sectionTitle;
            }
        }

        public IDictionary<string, string> Permissions
        {
            get
            {
                return permissions;
            }
        }

        public ModuleSectionConfig(string sectionName,string sectionTitle, IDictionary<string,string> permissions)
            : base()
        {
            this.sectionName = sectionName;
            this.sectionTitle = sectionTitle;
            this.permissions = permissions;
        }
    }

    private IEnumerable<ModuleSectionConfig> sections = new ModuleSectionConfig[0];
    private IDictionary<string, string> permissions = new Dictionary<string, string>();
    private IDictionary<string, string> globalPermissions = new Dictionary<string, string>();

    public ModuleConfig(XElement xNode)
        : base(xNode)
    {
        BuildSectionsAndPermissions();
    }

    public IEnumerable<ModuleSectionConfig> ModuleSections
    {
        get
        {
            return sections;
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public bool IsTab
    {
        get
        {
            return base.GetConfigValue("isTab", false);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public bool IsCore
    {
        get
        {
            return base.GetConfigValue("isCore", false);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public string Location
    {
        get
        {
            string location = string.Empty;
            var locNodes = base.configNode.Descendants("location");
            if (locNodes.Count() > 0)
            {
                location = locNodes.First().Value;
            }
            return location;
        }
    }

    /// <summary>
    /// Returns a lookup of module name - > description
    /// </summary>
    public IDictionary<string, string> Permissions
    {
        get
        {
            return permissions;
        }
    }

    /// <summary>
    /// Returns a lookup of global permission
    /// </summary>
    public IDictionary<string, string> GlobalPermissions
    {
        get
        {
            return globalPermissions;
        }
    }

    public static ModuleConfig GetByName(string name)
    {
        var configs = from config in CaisisConfiguration.GetModuleConfigList()
                      where config.Name == name
                      select config;
        return configs.FirstOrDefault();
    }

    /// <summary>
    /// Initalize list of permissions and sections
    /// </summary>
    private void BuildSectionsAndPermissions()
    {
        // build global level permissions
        this.globalPermissions = LookupPermissions(configNode.Parent.XPathSelectElements("*/permission"));
        // build module level permissions
        this.permissions = LookupPermissions(configNode.XPathSelectElements("permissions/permission"));
        // build section level permissions
        this.sections = from sNode in this.configNode.XPathSelectElements("sections/section")
                        let sName = sNode.Attribute("name").Value
                        let sTitle = sNode.Attribute("title").Value
                        let pNodes = sNode.XPathSelectElements("permissions/permission")
                        let sectionPermissions = LookupPermissions(pNodes)
                        select new ModuleSectionConfig(sName, sTitle, sectionPermissions);
    }

    private static IDictionary<string, string> LookupPermissions(IEnumerable<XElement> source)
    {
        var lookup = from p in source
                     let name = p.Attribute("name").Value
                     let desc = p.Attribute("description") != null ? p.Attribute("description").Value : string.Empty
                     select new
                     {
                         Name = name,
                         Description = desc
                     };
        return lookup.ToDictionary(p => p.Name, p => p.Description);
    }
}

public class DataAnalysisConfig : BaseCaisisConfiguration
{
    public DataAnalysisConfig(XElement xNode)
        : base(xNode)
    {
    }

    /// <summary>
    /// 
    /// </summary>
    public string Form
    {
        get
        {
            return base.GetConfigValue("form", string.Empty);
        }
    }

    /// <summary>
    /// 
    /// </summary>
    public string Module
    {
        get
        {
            return base.GetConfigValue("module", string.Empty);
        }
    }
}

public class WidgetConfig : BaseCaisisConfiguration
{
    public WidgetConfig(XElement xNode)
        : base(xNode)
    {
    }

    public string HelpText
    {
        get
        {
            return base.GetConfigValue("helpText", string.Empty);
        }
    }

    public IEnumerable<string> Modules
    {
        get
        {
            string modules = base.GetConfigValue("module", string.Empty);
            return !string.IsNullOrEmpty(modules) ? modules.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries) : new string[] { };
        }
    }


    public int Order
    {
        get
        {
            return base.GetConfigValue("order", 0);
        }
    }

    public string DefaultState
    {
        get
        {
            return base.GetConfigValue("defaultState", string.Empty);
        }
    }

    /// <summary>
    /// Returns the WigetConfig (or null) via name.
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    public static WidgetConfig GetByName(string name)
    {
        // find config by name
        var found = CaisisConfiguration.GetWidgetConfigList().Where(w => w.Name == name);
        // return first found or null
        return found.Count() > 0 ? found.First() : null;
    }
}

#endregion