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
using System.ComponentModel;
using System.Text.RegularExpressions;
using System.Xml;

using Caisis.Controller;

namespace Caisis.UI.Core.Classes
{
    /// <summary>
    /// Summary description for CustomHeaderMenu
    /// </summary>
    [DefaultProperty("Text"), ControlBuilder(typeof(CustomBuilder)), PersistChildren(true), ParseChildren(false), ToolboxData("<{0}:CustomMenu runat=server></{0}:CustomMenu>")]
    public class CustomMenu : DataBoundControl, INamingContainer
    {
        // Private Variables
        private string XML_FILE_NAME = "";
        private XmlDocument xDoc;
        private PatientDataEntryController pedc;
        private string XPATH = "";
        private int DEPTH = -1;
        private int howdeep = 0;
        private string staticHeight;

        // Internal Hash containing MenuBindings for Nodes in XML File
        private Hashtable NodeBindings = new Hashtable();

        public CustomMenu()
            : this(new XmlDocument())
        {
        }

        public CustomMenu(XmlDocument document)
        {
            this.xDoc = document;
            pedc = new PatientDataEntryController();
        }

        private string caisisConfigurationType;

        /// <summary>
        /// Gets or sets the CaisisConfiguration type name which is used to retrieve configuration nodes as an xml document, parseable as a menu
        /// </summary>
        public string CaisisConfigurationType
        {
            get
            {
                return caisisConfigurationType;
            }
            set
            {
                caisisConfigurationType = value;
            }
        }

        #region Child Binding Events
        /// <summary>
        /// Limit children to MenuBinding Controls
        /// Throws an error on duplicate bindings
        /// </summary>
        /// <param name="obj">Child to be added to CustomMenu Control</param>
        protected override void AddParsedSubObject(object obj)
        {
            base.AddParsedSubObject(obj);

            if (obj is MenuBinding)
            {
                MenuBinding item = (MenuBinding)obj;
                try
                {
                    NodeBindings.Add(item.DataMember, item);
                }
                catch (Exception e)
                {
                    throw new Exception("A Node with the name " + item.DataMember + " has already been bound to this Menu.");
                }
            }
        }

        protected void EnsureDataBindings(ControlCollection controls)
        {
            foreach (Control control in controls)
            {
                if (control is MenuBinding)
                {
                    MenuBinding item = (MenuBinding)control;
                    try
                    {
                        NodeBindings.Add(item.DataMember, item);
                    }
                    catch (Exception e)
                    {
                        //throw new Exception("A Node with the name " + item.DataMember + " has already been bound to this Menu.");
                    }
                }
            }
        }

        #endregion

        #region PUBLIC PROPERTIES
        /// <summary>
        /// The path to the XML File used to bind Menu
        /// </summary>
        public string XMLMenuFile
        {
            get
            {
                return XML_FILE_NAME;
            }
            set
            {
                XML_FILE_NAME = value;
            }
        }

        /// <summary>
        /// Gets or Sets the XPath of Menu Nodes, default is top level Nodes
        /// </summary>
        public string XPath
        {
            get
            {
                return XPATH;
            }
            set
            {
                XPATH = value;
            }
        }

        /// <summary>
        /// Gets or Sets the Depth of the Menu Tree.
        /// </summary>
        public string Depth
        {
            get
            {
                return DEPTH.ToString();
            }
            set
            {
                DEPTH = int.Parse(value);
            }
        }

        /// <summary>
        /// Gets or sets the static height of a menu (specified as int, ex: "400")
        /// </summary>
        public string StaticHeight
        {
            get
            {
                return staticHeight;
            }
            set
            {
                staticHeight = value;
            }
        }

        #endregion

        /// <summary>
        /// Renders the CusotmMenu Control to the specified HtmlTextWriter
        /// </summary>
        /// <param name="output">Output writer</param>
        protected override void Render(HtmlTextWriter output)
        {
            EnsureDataBindings(this.Controls);
            this.EnableViewState = false;
            MenuList menu;
            string viewMode = new Caisis.Security.SecurityController().GetViewMode();
            // special case
            if (!string.IsNullOrEmpty(CaisisConfigurationType) && CaisisConfigurationType == "PatientDataEntryConfig")
            {
                xDoc = CaisisConfiguration.GetPatientDataConfig();
                menu = LoadMenusFromXml();                
            }
            else
            {
                xDoc.Load(this.MapPathSecure(this.XMLMenuFile));
                if (CacheManager.IsInCache(this.XMLMenuFile + "XmlDoc") && CacheManager.IsInCache(this.XMLMenuFile + viewMode))
                {
                    XmlDocument cachedXml = (XmlDocument)CacheManager.GetFromCache(this.XMLMenuFile + "XmlDoc");
                    if (xDoc.InnerXml == cachedXml.InnerXml)
                    {
                        menu = (MenuList)CacheManager.GetFromCache(this.XMLMenuFile + viewMode);
                    }
                    else
                    {
                        menu = LoadMenusFromXml();
                        CacheManager.InsertIntoCache(this.XMLMenuFile + viewMode, menu, 10);
                        CacheManager.InsertIntoCache(this.XMLMenuFile + "XmlDoc", xDoc, 10);
                    }
                }
                else
                {
                    menu = LoadMenusFromXml();
                    CacheManager.InsertIntoCache(this.XMLMenuFile + viewMode, menu, 10);
                    CacheManager.InsertIntoCache(this.XMLMenuFile + "XmlDoc", xDoc, 10);
                }
            }
            menu.RenderControl(output);
            Literal l = new Literal();
            l.Text = "<script type='text/javascript' language='javascript'>if(InitMenu) { InitMenu(); }</script>";
            l.RenderControl(output);
        }

        /// <summary>
        /// Returns an hierarchical bound HTML unordered list
        /// </summary>
        /// <returns></returns>
        private MenuList LoadMenusFromXml()
        {
            // If no datasource or xmlfilename is specified, return empty menu
            if (this.DataSource == null && this.DataSourceID == "" && this.XMLMenuFile == "" && this.xDoc == null)
            {
                return new MenuList();
            }

            // Else construct a new menu based on datasource
            else
            {
                if (this.xDoc != null)
                {

                }
                else
                {
                    xDoc = new XmlDocument();
                    // If an XmlDataSource is specified, use as binding for menu
                    if (this.DataSource != null)
                    {
                        if (this.DataSource is XmlDataSource)
                        {
                            XmlDataSource source = (XmlDataSource)this.DataSource;
                            xDoc = source.GetXmlDocument();
                            XPath = source.XPath;
                        }
                        else if (this.DataSource is XmlDocument)
                        {
                            XmlDocument source = (XmlDocument)this.DataSource;
                            xDoc = source;
                        }
                    }
                    /// Else, use the DataSourceID to find the XMLDataSource Control
                    else if (this.DataSourceID != "")
                    {
                        Control con = this.NamingContainer.FindControl(this.DataSourceID);
                        if (con is XmlDataSource)
                        {
                            XmlDataSource source = (XmlDataSource)con;
                            xDoc = source.GetXmlDocument();
                            XPath = source.XPath;
                        }
                    }

                    // Else, use the file specified by the XMLMenuFile property
                    else
                    {
                        xDoc.Load(this.MapPathSecure(XMLMenuFile));
                    }
                }

                // Setup Main Menu
                MenuList MainMenu = new MenuList();
                MainMenu.ID = this.ID;

                XmlNodeList ParentNodes;
                if (XPath == "")
                {
                    ParentNodes = xDoc.DocumentElement.ChildNodes;
                }
                else
                {
                    ParentNodes = xDoc.SelectNodes(XPath);
                }

                foreach (XmlNode Parent in ParentNodes)
                {
                    RecursiveMenuBind(MainMenu, Parent);
                }
                return MainMenu;
            }
        }

        /// <summary>
        /// Recursively binds a 
        /// </summary>
        /// <param name="list"></param>
        /// <param name="node"></param>
        private void RecursiveMenuBind(MenuList list, XmlNode node)
        {
            // Only bind Element nodes, not comments
            if (pedc.IsDisplayInMainMenu(node) && pedc.IsDisplayInView(node) && node.NodeType == XmlNodeType.Element)
            {
                MenuListItem Item = GetFormattedListItem(node);
                list.Controls.Add(Item);
                if (node.HasChildNodes)
                {
                    howdeep++;
                    if (howdeep < DEPTH || DEPTH < 0)
                    {
                        MenuList SubMenu = new MenuList();
                        Item.Controls.Add(SubMenu);
                        foreach (XmlNode child in node.ChildNodes)
                        {
                            RecursiveMenuBind(SubMenu, child);
                            AddLinkStyle(SubMenu);
                        }
                        // Logic to set static heights and overflow
                        // Need to set widths inline to prevent collapsing in som DOM browsers
                        if (!string.IsNullOrEmpty(StaticHeight) && SubMenu.Controls.Count > 20)
                        {
                            SubMenu.Style.Add("height", StaticHeight + "px");
                            if (SubMenu.Controls[0] is MenuListItem)
                            {
                                if (SubMenu.Controls[0].HasControls())
                                {
                                    if (SubMenu.Controls[0].Controls[0] is HyperLink)
                                    {
                                        string width = ((HyperLink)SubMenu.Controls[0].Controls[0]).Style["width"];
                                        if (!string.IsNullOrEmpty(width))
                                        {
                                            string subMenuWidth = int.Parse(width.Replace("em", "")) + 2 + "em";
                                            SubMenu.Style.Add("width", subMenuWidth);
                                        }
                                    }
                                }
                            }
                            SubMenu.Style.Add("overflow", "auto");
                        }

                        if (!SubMenu.HasControls() && SubMenu.Parent != null)
                        {
                            SubMenu.Parent.Controls.Remove(SubMenu);
                        }
                    }
                    howdeep--;
                }
            }
        }

        private void AddLinkStyle(MenuList menu)
        {
            int minWidth = 15;
            foreach (Control li in menu.Controls)
            {
                Literal l = (Literal)li.Controls[0].Controls[1];
                int len = l.Text.Length;
                if (len > minWidth)
                {
                    minWidth = len;
                }
            }
            string style = (minWidth * 6.25) + "px";
            menu.Style.Add("width", style);
            foreach (Control li in menu.Controls)
            {

                ((HyperLink)li.Controls[0]).Style.Add("width", style);
                foreach (Control c in li.Controls)
                {
                    if (c is MenuList)
                    {
                        MenuList sub = (MenuList)c;
                        //((HyperLink)li.Controls[0]).Style.Add("background-image", "url('../../Images/icon_calnextArrow.gif')");
                        //((HyperLink)li.Controls[0]).Style.Add("background-repeat", "no-repeat");
                        //((HyperLink)li.Controls[0]).Style.Add("background-position", "center right");
                        sub.Style.Add("left", (minWidth * 6.25) + "px");
                        //AddLinkStyle(sub);
                    }
                }
            }
        }

        /// <summary>
        /// Gets the MenuBinding for the specified XMLNode.
        /// Null if NodeBindings does not contain a node with the Node name
        /// </summary>
        /// <param name="node">Node to compare against bindings</param>
        /// <returns></returns>
        public MenuBinding GetMenuBinding(XmlNode node)
        {
            MenuBinding Binding = (MenuBinding)NodeBindings[node.Name];
            return Binding;
        }

        /// <summary>
        /// Returns the display text for a DataMember specified by its DataTextField,
        /// try attribute "name", else return the Node name.
        /// </summary>
        /// <param name="node">Node name</param>
        /// <returns></returns>
        private string GetDataBoundTextField(XmlNode node)
        {
            MenuBinding Item = GetMenuBinding(node);
            if (Item != null)
            {
                string attributeValue = XmlUtil.GetAttributeValue(node, Item.DataTextField);
                string nameAttribute = XmlUtil.GetAttributeValue(node, "name");
                if (!string.IsNullOrEmpty(attributeValue))
                {
                    return attributeValue;
                }
                else if (!string.IsNullOrEmpty(nameAttribute))
                {
                    return nameAttribute;
                }
            }
            return node.Name;
        }

        /// <summary>
        /// Wraps the XmlNode into a MenuListItem with inner controls
        /// </summary>
        /// <param name="node">Node to wrap as a MenuListItem</param>
        /// <returns></returns>
        public MenuListItem GetFormattedListItem(XmlNode node)
        {
            // Create base objects
            MenuListItem Item = new MenuListItem();
            Literal ItemText = new Literal();
            HyperLink ItemLink = new HyperLink();
            Image itemImage = new Image();
            itemImage.Visible = false;
            // Set default values
            ItemText.Text = GetDataBoundTextField(node);
            ItemLink.Text = GetDataBoundTextField(node);
            //ItemLink.NavigateUrl = "#";

            MenuBinding ItemBinding = GetMenuBinding(node);
            if (ItemBinding != null)
            {
                //string[] OptFields = GetPopulatedFields(node);

                string href = XmlUtil.GetAttributeValue(node, "href");
                if (!string.IsNullOrEmpty(href))
                {
                    ItemLink.NavigateUrl = href;
                }
                // Set the url for the hyperlink
                else if (ItemBinding.URL != null)
                {
                    ItemLink.NavigateUrl = GetPopulatedField(node, ItemBinding.URL);
                }

                // If defined, set the URL Target
                string target = XmlUtil.GetAttributeValue(node, "target");
                if (!string.IsNullOrEmpty(target))
                {
                    ItemLink.Target = target;
                }
                else if (ItemBinding.URLTarget != null)
                {
                    ItemLink.Target = GetPopulatedField(node, ItemBinding.URLTarget);
                }
                string onclick = XmlUtil.GetAttributeValue(node, "onclick");
                if (!string.IsNullOrEmpty(onclick))
                {
                    string ClientAction = onclick;
                    ItemLink.Attributes.Add("onclick", ClientAction);
                }
                //Client click
                else if (ItemBinding.OnClientClick != null)
                {
                    string ClientAction = GetPopulatedField(node, ItemBinding.OnClientClick);
                    ItemLink.Attributes.Add("onclick", ClientAction);
                }
                // set icon
                string tableName = XmlUtil.GetAttributeValue(node, "tableName");

                itemImage.Visible = false;
                if (!string.IsNullOrEmpty(tableName))
                {
                    string iconPath = pedc.GetTableIcon(tableName, true);
                    if (!string.IsNullOrEmpty(iconPath))
                    {
                        itemImage.ImageUrl = iconPath;
                        itemImage.CssClass = "MenuItemIcon";
                        itemImage.Visible = true;
                    }
                }
            }

            // Combine the controls to produce MenuListItem
            ItemLink.Controls.Add(itemImage);
            ItemLink.Controls.Add(ItemText);
            
            Item.Controls.Add(ItemLink);
            return Item;
        }

        private string SpecialStringFormat(XmlNode node)
        {
            MenuBinding Item = GetMenuBinding(node);
            if (Item != null)
            {
                // Item.DataFields;
            }
            Regex r = new Regex("{p.[0-9]}");
            return "";
        }

        /// <summary>
        /// Returns an array of strings which contain a 
        /// map of optional MenuBinding DataFields to the 
        /// Node's attrubutes
        /// </summary>
        /// <param name="node">Node to extract optional bindings</param>
        /// <returns></returns>
        public string GetPopulatedField(XmlNode node, string FormatField)
        {
            MenuBinding Item = GetMenuBinding(node);
            string[] Fields = Item.GetDataFields();
            string NewFormattedString = new String(FormatField.ToCharArray());

            Regex par = new Regex("{p.[0-9]}");
            Regex std = new Regex("{[0-9]}");
            if (Item != null && Fields.Length > 0)
            {
                Match stdMatch = std.Match(FormatField);
                if (stdMatch != null)
                {
                    foreach (Group g in stdMatch.Groups)
                    {
                        if (g.Value.Length > 0)
                        {
                            int fieldIndex = int.Parse(g.Value[1].ToString());
                            string attValue = XmlUtil.GetAttributeValue(node, Fields[fieldIndex]);
                            NewFormattedString = NewFormattedString.Replace(g.Value, attValue);
                        }
                    }
                }

                Match parMatch = par.Match(FormatField);
                if (parMatch != null)
                {
                    foreach (Group g in parMatch.Groups)
                    {
                        if (g.Value.Length > 0)
                        {
                            int fieldIndex = int.Parse(g.Value[3].ToString());
                            string attName = Fields[fieldIndex];
                            string attValue = XmlUtil.GetAttributeValue(node.ParentNode, attName);
                            NewFormattedString = NewFormattedString.Replace(g.Value, attValue);
                        }
                    }
                }
            }
            return NewFormattedString;
        }






    }

    #region HELPER CLASSES
    public class MenuBinding : DataBoundControl
    {
        private string clientclick;
        private string[] datafields = new string[0];
        private string urltarget;
        private string url;
        private string displayfield;

        public string OnClientClick
        {
            get
            {
                return clientclick;
            }
            set
            {
                clientclick = value;
            }
        }

        public string URL
        {
            get
            {
                return url;
            }
            set
            {
                url = value;
            }
        }

        public string URLTarget
        {
            get
            {
                return urltarget;
            }
            set
            {
                urltarget = value;
            }
        }

        public string DataTextField
        {
            get
            {
                object o = ViewState["DataTextField"];
                if (o != null)
                {
                    return o.ToString();
                }
                else
                {
                    return string.Empty;
                }
            }
            set
            {
                ViewState["DataTextField"] = value;
                if (Initialized)
                {
                    OnDataPropertyChanged();
                }
            }
        }

        public string DisplayNodeField
        {
            get
            {
                return this.displayfield;
            }
            set
            {
                this.displayfield = value;
            }
        }

        public string DataFields
        {
            get
            {
                return datafields.ToString();
            }
            set
            {
                datafields = value.Split(',');
                for (int i = 0; i < datafields.Length; i++)
                {
                    datafields[i] = datafields[i].Trim();
                }
            }
        }


        public string[] GetDataFields()
        {
            return datafields;
        }
    }

    public class CustomBuilder : ControlBuilder
    {
        public override Type GetChildControlType(String tagName, IDictionary attributes)
        {
            if (tagName.Contains("MenuBinding"))
                return typeof(MenuBinding);

            else
            {
                throw new Exception("Tag \"" + tagName + "\" not allowed in Menu control.");
            }
        }

        public override void AppendLiteralString(string s)
        {
            // Ignores literals between rows.
        }

    }

    /// <summary>
    /// Encapsulates an unordered list(ul)
    /// </summary>
    public class MenuList : HtmlGenericControl
    {
        public MenuList()
            : base()
        {
            this.TagName = "ul";
        }
    }

    /// <summary>
    /// Encapsulates a ListItem(li)
    /// </summary>
    public class MenuListItem : HtmlGenericControl
    {
        public MenuListItem()
            : base()
        {
            base.TagName = "li";
        }

        public string Text
        {
            get
            {
                return this.InnerText;
            }
            set
            {
                this.InnerText = value;
            }
        }

    }
    #endregion
}