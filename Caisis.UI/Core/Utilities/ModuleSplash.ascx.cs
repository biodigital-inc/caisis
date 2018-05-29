using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

using Caisis.Security;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Utilities
{
    public partial class ModuleSplash : BaseControl
    {
        public event RepeaterItemEventHandler BuildModuleSection;

        private string moduleName;

        /// <summary>
        /// Gets or sets the module named used to build the splash
        /// </summary>
        public virtual string ModuleName
        {
            get
            {
                return moduleName;
            }
            set
            {
                moduleName = value;
            }
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            BuildSplash();
        }

        /// <summary>
        /// Builds the splash by module name.
        /// </summary>
        public virtual void BuildSplash()
        {
            List<XmlNode> nodes = new List<XmlNode>();
            if (!string.IsNullOrEmpty(ModuleName))
            {
                // get module config
                XmlDocument xDoc = XmlUtil.GetModulesConfigXml();
                // get module nodes
                XmlNodeList moduleNodes = xDoc.SelectNodes("/modules//module");
                // get module node
                XmlNode moduleNode = xDoc.SelectSingleNode("/modules//module[@name='" + ModuleName + "']");

                if (moduleNode != null)
                {
                    // get enabled sections
                    XmlNodeList sections = moduleNode.SelectNodes("sections//section[@enabled='true']");
                    // filter by permission
                    foreach (XmlNode section in sections)
                    {
                        XmlNodeList permissionNodes = section.SelectNodes("permissions/permission");
                        if (permissionNodes.Count > 0)
                        {
                            bool hasPermission = false;
                            // (AND or OR???) to show section
                            foreach (XmlNode permissionNode in permissionNodes)
                            {
                                string permission = permissionNode.Attributes["name"].Value;
                                if (PermissionManager.HasPermission(permission))
                                {
                                    hasPermission = true;
                                    break;
                                }
                            }
                            if (hasPermission)
                            {
                                nodes.Add(section);
                            }
                        }
                        else
                        {
                            nodes.Add(section);
                        }
                    }

                    SplashIconsRptr.DataSource = nodes;
                    SplashIconsRptr.DataBind();
                }
            }
        }

        /// <summary>
        /// Process client events
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ModuleItemBuilt(object sender, RepeaterItemEventArgs e)
        {
            // dispatch rptr event to subscribers
            if (BuildModuleSection != null)
            {
                BuildModuleSection(sender, e);
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            // supress if empty/no visible controls
            var items = SplashIconsRptr.Items.Cast<RepeaterItem>();
            if (items.Count() == 0 || items.Where(i => i.Visible).Count() == 0)
            {
                NoTabMessage.Visible = true;
            }
            else
            {
                NoTabMessage.Visible = false;
            }
            base.Render(writer);
        }
    }
}
