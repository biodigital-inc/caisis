using System;
using System.Xml;
using System.Data;
using System.Collections;
using System.IO;
using System.Web;


namespace Caisis.Controller
{
	/// <summary>
	/// Summary description for TabController.
	/// </summary>
	public class TabController
	{
		private static string _groupViewId = null;

		// match node names in modulesConfig.xml
		private const string displayName = "name";
		private const string icon = "icon";
		private const string location   = "location";

		public TabController(string groupViewId)
		{
			_groupViewId = groupViewId;
		}

		public DataTable CreateTabDataTable(XmlDocument xmlDoc)
		{
			// tab width hardcoded to 100 px; could easily drive this from xml

			DataTable TabDt = new DataTable();
			
			DataColumn HeaderCol;
			HeaderCol = new DataColumn();
			HeaderCol.ColumnName = "TabName";
			HeaderCol.DataType = typeof(System.String);
			TabDt.Columns.Add(HeaderCol);

			HeaderCol = new DataColumn();
			HeaderCol.ColumnName = "TabWidth";
			HeaderCol.DataType = typeof(System.Int32);
			TabDt.Columns.Add(HeaderCol);

            HeaderCol = new DataColumn();
            HeaderCol.ColumnName = "TabDescription";
            HeaderCol.DataType = typeof(System.String);
            TabDt.Columns.Add(HeaderCol);

			HeaderCol = new DataColumn();
			HeaderCol.ColumnName = "Path";
			HeaderCol.DataType = typeof(System.String);
			TabDt.Columns.Add(HeaderCol);

			HeaderCol = new DataColumn();
			HeaderCol.ColumnName = "IsActiveTab";
			HeaderCol.DataType = typeof(System.String);
			TabDt.Columns.Add(HeaderCol);

			HeaderCol = new DataColumn();
			HeaderCol.ColumnName = "RequiresPatient";
			HeaderCol.DataType = typeof(System.String);
			TabDt.Columns.Add(HeaderCol);

            HeaderCol = new DataColumn();
            HeaderCol.ColumnName = "Icon";
            HeaderCol.DataType = typeof(System.String);
            TabDt.Columns.Add(HeaderCol);



            XmlNodeList listOfTabs = CaisisConfiguration.GetTabsList();

            //XmlNodeList listOfTabs		= xmlDoc.SelectNodes("modules/module[@isTab='true']");

			foreach(XmlNode node in listOfTabs)
			{
				string tabTitleUpper = node.Attributes[displayName].Value.ToUpper();
				
				// only display tabs that user group has access to
				if(this.AuthorizeAccess(tabTitleUpper))
				{

                    string modDescription = "";

                    if (node.Attributes["description"] != null)
                    {
                        modDescription = node.Attributes["description"].Value;
                    }

					string modLocation;
				
					if(node.Attributes["isCore"] != null && node.Attributes["isCore"].Value.Equals("true"))
					{
						modLocation = node.SelectSingleNode(location).InnerText;
					}
					else
					{
						modLocation = "/Utilities/ModuleContainer.aspx?mod=" + node.SelectSingleNode("location").InnerText;
					}
                    
					string requiresPatient = "false"; // access to tab requires patient in session
 
					if(node.Attributes["requiresPatient"] != null && node.Attributes["requiresPatient"].Value.Equals("true"))
					{
						requiresPatient = "true";
					}

                    string iconFileName;
                    if (node.SelectSingleNode(icon) != null && !node.SelectSingleNode(icon).InnerText.Equals(""))
                    {
                        iconFileName = node.SelectSingleNode(icon).InnerText;
                    }
                    else { iconFileName = "DashboardModuleButton_Default.png"; }


                    object[] thisRow = { tabTitleUpper, 100, modDescription, modLocation, "false", requiresPatient, iconFileName };
				
					TabDt.Rows.Add(thisRow);
				}
			}

			return TabDt;
		}
		
		private bool AuthorizeAccess(string tabName)
		{
			if(_groupViewId.IndexOf(tabName) > -1) 
				return true; 
			else
				return false;
		}

		/// <summary>
		/// Returns if icon should be displayed on splash page. If module is a tab, then display icon based on user group access.
		/// If mode is not a tab, then display icon as stated in modules.config
		/// </summary>
		/// <param name="imageName"></param>
		/// <param name="xmlDoc"></param>
		/// <returns></returns>
		public bool AuthorizeIconDisplay(string imageName, XmlDocument xmlDoc)
		{
			XmlNodeList listOfModules	= xmlDoc.SelectNodes("modules/module");
				
			foreach(XmlNode node in listOfModules)
			{
                if (node.SelectSingleNode(icon) != null && imageName.Equals(node.SelectSingleNode(icon).InnerText))
				{
					
					if(node.Attributes["isTab"] != null && node.Attributes["isTab"].Value.Equals("true")) 
					{
						string tabName = node.Attributes[displayName].Value.ToUpper();
						return AuthorizeAccess(tabName);
					}
					else
					{
						return true;
					}
				}
			}

			return false;
		}

		public DataTable GetSplashIcons()
		{
			DataTable IconDt = new DataTable();
			
			DataColumn HeaderCol;
			HeaderCol = new DataColumn();
			HeaderCol.ColumnName = "Name";
			HeaderCol.DataType = typeof(System.String);
			IconDt.Columns.Add(HeaderCol);


			HeaderCol = new DataColumn();
			HeaderCol.ColumnName = "LocationPath";
			HeaderCol.DataType = typeof(System.String);
			IconDt.Columns.Add(HeaderCol);

			HeaderCol = new DataColumn();
			HeaderCol.ColumnName = "IconImageName";
			HeaderCol.DataType = typeof(System.String);
			IconDt.Columns.Add(HeaderCol);

			HeaderCol = new DataColumn();
			HeaderCol.ColumnName = "RequiresPatient";
			HeaderCol.DataType = typeof(System.String);
			IconDt.Columns.Add(HeaderCol);

            XmlNodeList listOfTabs = CaisisConfiguration.GetModulesList();

			//XmlNodeList listOfTabs		= xmlDoc.SelectNodes("modules/module");

			foreach(XmlNode node in listOfTabs)
			{
					string tabTitleUpper = node.Attributes[displayName].Value.ToUpper();
				
					// location of module
					string modLocation;
					if(node.Attributes["isCore"] != null && node.Attributes["isCore"].Value.Equals("true"))
					{
						modLocation = node.SelectSingleNode(location).InnerText;
					}
					else
					{
						modLocation = "/Utilities/ModuleContainer.aspx?mod=" + node.SelectSingleNode("location").InnerText;
					}

					// icon name : display icon when image name exists AND if there is a tab, the user group has access to the tab
					string iconImageName = "";
					if(node.SelectSingleNode(icon) != null && !node.SelectSingleNode(icon).InnerText.Equals(""))
					{
					
						if(node.Attributes["isTab"] != null && node.Attributes["isTab"].Value.Equals("true")) 
						{
							if(AuthorizeAccess(tabTitleUpper))
							{
                                iconImageName = node.SelectSingleNode(icon).InnerText;
							}
						}
						else
						{
                            iconImageName = node.SelectSingleNode(icon).InnerText;
						}
					}

					
					// patient required before entering module
					string requiresPatient = "false"; // access to tab requires patient in session
					if(node.Attributes["requiresPatient"] != null && node.Attributes["requiresPatient"].Value.Equals("true"))
					{
						requiresPatient = "true";
					}

					object[] thisRow = { tabTitleUpper, modLocation, iconImageName,  requiresPatient };
				
					IconDt.Rows.Add(thisRow);

			}
			return IconDt;
		}
	}
}
