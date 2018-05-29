using System;
using System.Collections;
using System.Collections.Generic;
using System.Xml;
using System.IO;
using System.Web;
using System.Configuration;
using System.Data;
using System.Xml.Linq;
using System.Xml.XPath;
using System.Linq;

using Caisis.Security;


namespace Caisis.UI.Core.Classes
{

	public class XmlUtil 
	{
		
		// all module config files must be in the format Viewmode_SectionMenus.xml, i.e Testis_DataEntryFormMenus.xml or Prostate_EFormMenus.xml
		public const string PatientDataMenusConfig	  = "PatientDataMenus.xml";
		public const string PaperFormMenusConfig	  = "PaperFormMenus.xml";
		public const string ReportMenusConfig		  = "DataAnalysisMenus.xml";
		public const string EFormMenusConfig		  = "EFormMenus.xml";

        /// <summary>
        /// Gets the value of a Node by its specified attribute (case insensitive), returns empty string if attribute not found.
        /// </summary>
        /// <param name="node">Node in which to check for attribute</param>
        /// <param name="attName">Name of attribute to check</param>
        /// <returns></returns>
        public static string GetAttributeValue(XmlNode node, string attName)
        {
            return GetAttributeValue(node, attName, false);
        }

        /// <summary>
        /// Gets the value of a Node by its specified attribute using specificed case search, returns empty string if attribute not found.
        /// </summary>
        /// <param name="node">Node in which to check for attribute</param>
        /// <param name="attName">Name of attribute to check</param>
        /// <param name="caseSensitive">true or false if to use case sensitive search</param>
        /// <returns></returns>
        public static string GetAttributeValue(XmlNode node, string attName, bool caseSensitive)
        {
            XmlAttribute foundAttribute = null;
            if (caseSensitive)
            {
                foundAttribute = node.Attributes[attName];
            }
            // case insensitive search
            else
            {
                foundAttribute = node.Attributes.Cast<XmlAttribute>().Where(a => a.Name.Equals(attName, StringComparison.OrdinalIgnoreCase)).FirstOrDefault();
            }
            return foundAttribute != null ? foundAttribute.Value : string.Empty;             
        }

        /// <summary>s 
        /// Converts a list of Xml nodes to a DataTable.
        /// </summary>
        /// <param name="nodelist">List of Xml nodes</param>
        /// <returns>DataTable</returns>
        /// <remarks>
        /// This method convert
        /// </remarks>
        public static DataTable GetDataTable(XmlNodeList nodelist)
        {
            DataTable table = null;
            XmlNode node = null;
            if (nodelist == null)
                return null;

            // get parameter names
            node = nodelist.Item(0);
            if (node == null)
                return null;

            XmlAttributeCollection attrCollection = node.Attributes;
            if (attrCollection == null)
                return null;
            if (attrCollection.Count == 0)
                return null;

            // create data table
            table = new DataTable();
            foreach (XmlAttribute attr in attrCollection)
            {
                table.Columns.Add(attr.Name);
            }

            // add rows
            DataRow row = null;
            foreach (XmlNode n in nodelist)
            {
                row = table.NewRow();
                foreach (XmlAttribute a in n.Attributes)
                {
                    row[a.Name] = a.Value;
                }
                table.Rows.Add(row);
            }

            table.AcceptChanges();
            return table;
        }

        /// <summary>
        /// For the specific list of strings, return a DataTable with a single String column, [Value]
        /// </summary>
        /// <param name="values"></param>
        /// <returns></returns>
        public static DataTable GetDataTable(IEnumerable<string> values)
        {
            var nodes = from value in values
                        select new XElement("Value",
                                new XElement("Value", value));
            return GetDataTable(nodes);
        }

        /// <summary>
        /// For the specific list of strings, return a DataTable with 2 String columns, [Key] + [Value]
        /// </summary>
        /// <param name="values"></param>
        /// <returns></returns>
        public static DataTable GetDataTable(Dictionary<string, string> values)
        {
            var nodes = from data in values
                        select new XElement("Value",
                                new XElement("Key", data.Key),
                                new XElement("Value", data.Value));
            return GetDataTable(nodes);
        }

        /// <summary>
        /// For the specified elements, create a DataTable based on child element names and values
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static DataTable GetDataTable(IEnumerable<XElement> data)
        {
            // use first item as prototype for table name + columns
            XElement prototype = data.First();
            string tableName = prototype.Name.LocalName;
            string[] columnNames = prototype.Elements().Where(e => !e.HasElements).Select(e => e.Name.LocalName).ToArray();
            // call overloaded method
            return GetDataTable(data, tableName, columnNames);
        }

        /// <summary>
        /// For the specified elements, create a DataTable based on element column names and values
        /// </summary>
        /// <param name="data"></param>
        /// <param name="tableName"></param>
        /// <param name="columnNames"></param>
        /// <returns></returns>
        public static DataTable GetDataTable(IEnumerable<XElement> data, string tableName, string[] columnNames)
        {
            // create table
            DataTable dt = new DataTable(tableName);
            // add columns
            dt.Columns.AddRange(columnNames.Select(c => new DataColumn(c)).ToArray());
            // add data
            foreach (XElement xRow in data)
            {
                // new row
                DataRow row = dt.NewRow();
                // fill columns
                foreach (string column in columnNames)
                {
                    XElement xColumnData = xRow.Element(column);
                    row[column] = xColumnData != null ? xColumnData.Value : "";
                }
                // commit
                dt.Rows.Add(row);
            }
            dt.AcceptChanges();

            return dt;
        }

		/// <summary>
		/// Gets the XML config file based on current view mode(disease). If XML config file is not defined for that view mode, then the default config file is used.
		/// </summary>
		/// <param name="xmlFileName"></param>
		/// <returns></returns>
		public static XmlDocument GetXmlConfigFile(string xmlFileName)
		{
			string pathToXmlDoc;
			XmlDocument xmlDoc = new XmlDocument();

			CustomPrincipal cp = System.Threading.Thread.CurrentPrincipal as CustomPrincipal;
			string viewMode = cp.UserProfile["diseaseView"].ToString();

            pathToXmlDoc = AppDomain.CurrentDomain.BaseDirectory + "App_Data\\" + viewMode + "_" + xmlFileName;
			
			bool fileExist = System.IO.File.Exists(pathToXmlDoc);
			if(fileExist)
			{	
				xmlDoc.Load(pathToXmlDoc);
			}
			else
			{
				// if module does not have its own configuration file, use the default
                pathToXmlDoc = AppDomain.CurrentDomain.BaseDirectory + "App_Data\\Default_" + xmlFileName;
				xmlDoc.Load(pathToXmlDoc);
			}		
			return xmlDoc;
		}	
		
		#region deprecated 3.1 code for getting configuration files 
		/*public static XmlDocument GetXmlConfigFile(string xmlFileName)
		{
			string pathToXmlDoc; 
			XmlDocument xmlDoc = new XmlDocument();

			CustomPrincipal cp = System.Threading.Thread.CurrentPrincipal as CustomPrincipal;
			string disease = cp.UserProfile["diseaseView"].ToString();

			// TODO v3: put xml in cache

			pathToXmlDoc = HttpContext.Current.Server.MapPath("~\\Modules\\" + disease + "\\Config\\" + xmlFileName);	
			bool fileExist = System.IO.File.Exists(pathToXmlDoc);

			if(fileExist)
			{	
				xmlDoc.Load(pathToXmlDoc);
			}
			else
			{
				// if module does not have its own configuration file, use the default menus in the all section
				pathToXmlDoc = HttpContext.Current.Server.MapPath("~\\Modules\\All\\Config\\" + xmlFileName);
				xmlDoc.Load(pathToXmlDoc);
			}		
			return xmlDoc;
		}*/
		# endregion
		
		/// <summary>
		/// Gets xml document given relative path. GetXmlConfigFile() should be used for module configuration(menu) files.
		/// </summary>
		/// <param name="relativePath">relative path. Use "~\\" for web root</param>
		/// <returns>Xml Document</returns>
		public static XmlDocument GetXmlDoc(string relativePath)
		{
			string pathToXmlDoc; 
			XmlDocument xmlDoc = new XmlDocument();
			
			pathToXmlDoc = HttpContext.Current.Server.MapPath(relativePath);	
			bool fileExist = System.IO.File.Exists(pathToXmlDoc);
			
			if(fileExist)
			{	
				xmlDoc.Load(pathToXmlDoc);
			}
			
			return xmlDoc;
		}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="relativePath"></param>
        /// <returns></returns>
        public static XDocument GetXDoc(string relativePath)
        {
            string pathToXmlDoc;
            XDocument xDoc = null;

            pathToXmlDoc = HttpContext.Current.Server.MapPath(relativePath);
            bool fileExist = System.IO.File.Exists(pathToXmlDoc);

            if (fileExist)
            {
                XmlDocument xml = GetXmlDoc(relativePath);
                xDoc = XDocument.Parse(xml.OuterXml);
            }
            return xDoc;
        }

		/// <summary>
		/// Gets the xml file specifying application view and module properties
		/// </summary>
		/// <returns>xml document</returns>
		public static XmlDocument GetModulesConfigXml() // TODO: ModulesRegistry should be in cache
		{
			XmlDocument xmlDoc = new XmlDocument();
            //string pathToXmlDoc = HttpContext.Current.Server.MapPath("~\\App_Data\\ModulesRegistry.xml");	
            string pathToXmlDoc = AppDomain.CurrentDomain.BaseDirectory + "App_Data\\ModuleRegistry.xml"; 	
			bool fileExist = System.IO.File.Exists(pathToXmlDoc);	
			if(fileExist)
			{	
				xmlDoc.Load(pathToXmlDoc);
			}	
			return xmlDoc;
		}

        /// <summary>
        /// Gets the xml file specifying follow up module properties
        /// </summary>
        /// <returns>xml document</returns>
        public static XmlDocument GetFollowUpXml()
        {
            XmlDocument xmlDoc = new XmlDocument();
            string pathToXmlDoc = AppDomain.CurrentDomain.BaseDirectory + "App_Data\\FollowUpRegistry.xml";
            bool fileExist = System.IO.File.Exists(pathToXmlDoc);
            if (fileExist)
            {
                xmlDoc.Load(pathToXmlDoc);
            }
            return xmlDoc;
        }

		/// <summary>
		///  Returns the name of the parent directory of the .ascx control passed and directory passed in
		///  ie.. pass in EncRectalExamsForm and DataEntryForms, returns "Prostate"
		///  Directory name only needed to make search process more efficient
		/// </summary>
		/// <param name="controlName"></param>
		/// <returns></returns>
		public static string GetParentModuleDirectory(string controlName, string directoryName)
		{
			
			string moduleName = "";//Does Not Exist

			string root = AppDomain.CurrentDomain.BaseDirectory.ToString();
			
			string searchPath = root + "\\Modules\\";
			
			DirectoryInfo di = new DirectoryInfo(@searchPath);
				
				//FileSystemInfo[] dirs = di.GetDirectories(GetDirectories();
				DirectoryInfo[] dirs = di.GetDirectories();

				foreach(DirectoryInfo modeDir in dirs)
				{
					
					DirectoryInfo[] subDirs = modeDir.GetDirectories(directoryName);
				
					foreach(DirectoryInfo controlDir in subDirs)
					{
						System.IO.FileInfo[] webcontrols = controlDir.GetFiles("*.*");
				
						foreach(FileInfo file in webcontrols)
						{
							//System.Web.HttpContext.Current.Response.Write("<br> File.Name " + file.Name);  
							
							if(file.Name.Equals(controlName))
							{
								moduleName = modeDir.Name;

								break;
							}
						}
					}
				}

				return moduleName;
		}
		
		/// <summary>
		/// Returns all data entry controls and their parent mode directory name
		/// </summary>
		/*public static void GetDataEntryControls()
		{
			try
			{
			    // Should not use absolute paths only relative paths
                //DirectoryInfo di = new DirectoryInfo(@"~\Modules\");
				DirectoryInfo di = new DirectoryInfo(@"C:\Projects\CaisisV3\Caisis.UI\Modules\");
				// Get only subdirectories that contain the letter "p."
			
				//FileSystemInfo[] dirs = di.GetDirectories(GetDirectories();
				DirectoryInfo[] dirs = di.GetDirectories();

				foreach(DirectoryInfo modeDir in dirs)
				{
					System.Web.HttpContext.Current.Response.Write("<br>Directory Name: " + modeDir.Name);

					DirectoryInfo[] subDirs = modeDir.GetDirectories("DataEntryForms");
				
					foreach(DirectoryInfo controlDir in subDirs)
					{
						System.IO.FileInfo[] webcontrols = controlDir.GetFiles("*.ascx");
				
						foreach(FileInfo file in webcontrols)
						{
							System.Web.HttpContext.Current.Response.Write("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + file.Name);
						}
					}
				}
			}
			catch (Exception e) 
			{
				System.Web.HttpContext.Current.Response.Write("The process failed: " + e.ToString());
			}
			
		}*/

        /// <summary>
        /// Get XmlNodes from specified xpath.
        /// </summary>
        /// <param name="xpath"></param>
        /// <param name="filename"></param>
        /// <returns></returns>
        public static XmlNodeList GetNodesFromXml(string xpath, string filename)
        {
            XmlDocument xmlDoc = GetXmlDoc(filename);
            XmlNodeList nodes = xmlDoc.SelectNodes(xpath);
            return nodes;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="xName"></param>
        /// <param name="filename"></param>
        /// <returns></returns>
        public static IEnumerable<XElement> GetXElementsFromXml(string xName, string filename)
        {
            XDocument xDoc = GetXDoc(filename);
            return xDoc.Descendants(xName);
        }

        public static XmlNode GetSingleNodeFromXml(string xpath, string filename)
        {
            XmlDocument xmlDoc = GetXmlDoc(filename);
            return xmlDoc.SelectSingleNode(xpath);
        }

        #region DataTransformation

        /// <summary>
        /// For the given data source, transform into an Xml structure using all columns
        /// </summary>
        /// <param name="dataTable"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public static List<XElement> TransformTableToNodes(DataTable dataTable, string tableName)
        {
            return TransformTableToNodes(dataTable, tableName, dataTable.Columns.Cast<DataColumn>().Select(c => c.ColumnName));
        }

        /// <summary>
        /// For the given data source, transform into an Xml structure using the specified columns
        /// </summary>
        /// <param name="dataTable"></param>
        /// <param name="tableName"></param>
        /// <param name="fieldNames"></param>
        /// <returns></returns>
        public static List<XElement> TransformTableToNodes(DataTable dataTable, string tableName, IEnumerable<string> fieldNames)
        {
            var tableNodes = from row in dataTable.AsEnumerable()
                             // i.e., <Diagnostics></Diagnostics>
                             select new XElement(tableName,
                                    from field in fieldNames
                                    // i.e., <DxType></DxTyppe>
                                    select new XElement(field, row[field].ToString()));
            return tableNodes.ToList();
        }

        /// <summary>
        /// For the given data table and XmlNodeList, combine into normalized structure.
        /// </summary>
        /// <param name="dataName"></param>
        /// <param name="dbData"></param>
        /// <param name="xNodeList"></param>
        /// <returns></returns>
        public static IEnumerable<XElement> ComibineTableAndXData(string dataName, DataTable dbData, XmlNodeList xNodeList)
        {
            // XmlNodList => IEnumerable<XElement>
            var xData = xNodeList.Cast<XmlNode>().Select(x => new XElement(x.Name, x.InnerXml));
            return ComibineTableAndXData(dataName, dbData, xData);
        }

        /// <summary>
        /// For the given data table and XElements, combine into normalized structure.
        /// </summary>
        /// <param name="dataName">The name of each data row element and xData element. i.e., "Diagnostics"</param>
        /// <param name="dbData"></param>
        /// <param name="xData"></param>
        /// <returns></returns>
        public static IEnumerable<XElement> ComibineTableAndXData(string dataName, DataTable dbData, IEnumerable<XElement> xData)
        {
            // transform table to XElements
            List<XElement> dbElements = TransformTableToNodes(dbData, dataName);

            // tag db Elements
            string trueString = bool.TrueString.ToLower();
            foreach (XElement dbElement in dbElements)
                dbElement.Add(new XAttribute("IsDB", trueString));

            // validation
            xData = xData.Where(x => x.Name == dataName);

            // combine db with xData
            var combinedDataElements = dbElements.Concat(xData);
            return combinedDataElements;
        }

        /// <summary>
        /// For the given list of XElements, sort by value of named element
        /// </summary>
        /// <param name="xData"></param>
        /// <param name="xSortType"></param>
        /// <param name="xSortName"></param>
        /// <returns></returns>
        public static IOrderedEnumerable<XElement> SortXData(IEnumerable<XElement> xData, Type xSortType, string xSortName)
        {
            IEnumerable<XElement> sorted = xData;
            // sort as date values, null at start of list
            if (xSortType == typeof(DateTime))
            {
                DateTime nullValue = DateTime.MinValue;
                DateTime unparseableValue = DateTime.MinValue.AddDays(1);
                // sorter func
                Func<string, DateTime> getSortDate = (dateString) =>
                {
                    DateTime parseDate = DateTime.MinValue;
                    if (!string.IsNullOrEmpty(dateString))
                        return DateTime.TryParse(dateString, out parseDate) ? parseDate : unparseableValue;
                    else
                        return nullValue;
                };
                return xData.OrderBy(x => getSortDate(x.Element(xSortName).Value));
            }
            else if (xSortType == typeof(int))
            {
                int nullValue = int.MinValue;
                int unparseableValue = int.MinValue + 1;
                // sorter func
                Func<string, int> getSortInt = (intString) =>
                {
                    int parseInt = int.MinValue;
                    if (!string.IsNullOrEmpty(intString))
                        return int.TryParse(intString, out parseInt) ? parseInt : unparseableValue;
                    else
                        return nullValue;
                };
                return xData.OrderBy(x => getSortInt(x.Element(xSortName).Value));
            }
            else
            {
                return xData.OrderBy(x => x.Element(xSortName).Value);
            }
        }

        /// <summary>
        /// For the given list of XElements, sort by Int value of named element
        /// </summary>
        /// <param name="xData"></param>
        /// <param name="xDateName"></param>
        /// <returns></returns>
        public static IOrderedEnumerable<XElement> SortXDataByInt(IEnumerable<XElement> xData, string xIntName)
        {
            return SortXData(xData, typeof(int), xIntName);
        }

        /// <summary>
        /// For the given list of XElements, sort by DateTime value of named element
        /// </summary>
        /// <param name="xData"></param>
        /// <param name="xDateName"></param>
        /// <returns></returns>
        public static IOrderedEnumerable<XElement> SortXDataByDate(IEnumerable<XElement> xData, string xDateName)
        {
            return SortXData(xData, typeof(DateTime), xDateName);
        }

        #endregion

    }
}