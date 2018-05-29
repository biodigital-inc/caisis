using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Reflection;
using System.Xml;
using System.Linq;

using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core
{
    public partial class PluginLoader : System.Web.UI.UserControl
    {
        private bool _enabled = true;
        private List<Type> pluginTypes = new List<Type>();
        private List<string> pluginControls = new List<string>();
        private string PLUGINS_BASE = "Caisis.UI.Plugins";
        private string BASE_PLUGIN_DIR = "~/Plugins";

        /// <summary>
        /// Gets or sets the enabled state to notify plugins.
        /// </summary>
        public bool Enabled
        {
            get
            {
                return _enabled;
            }
            set
            {
                _enabled = true;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Loads a list of plugins into the control.
        /// </summary>
        /// <param name="plugins">List of plugin names as defined in the Plugins Registry.</param>
        public void LoadPlugins(List<string> plugins)
        {
            PluginsController plc = new PluginsController();
            foreach (string plugin in plugins)
            {
                XmlNode pluginNode = plc.GetPlugin(plugin);
                if (pluginNode != null)
                {
                    string pluginName = pluginNode.Attributes["name"].Value;
                    string pluginClassName = pluginNode.Attributes["className"].Value;
                    string pathToControl = BASE_PLUGIN_DIR + "/" + pluginName + "/" + pluginClassName + ".ascx";

                    if (System.IO.File.Exists(Server.MapPath(pathToControl)))
                    {
                        try
                        {
                            Control pluginControl = LoadControl(pathToControl);
                            SetControlValues(pluginName, pluginControl, pluginNode);
                            Panel p = new Panel();
                            p.Controls.Add(pluginControl);
                            p.Style.Add("margin-left", "auto");
                            p.Style.Add("margin-right", "auto");
                            p.Style.Add("padding", "5px");
                            p.Style.Add("float", "right");
                            PluginHolder.Controls.Add(pluginControl);
                        }
                        catch (Exception ex)
                        {
                            Label l = new Label();
                            l.Text = "Unable to Load " + plugin + " Plugin";
                            PluginHolder.Controls.Add(l);

                            // supress error to user but log
                            ExceptionHandler.Publish(ex);
                        }
                    }
                }
                else
                {
                    Label l = new Label();
                    l.Text = "Unable to Load " + plugin + " Plugin";
                    PluginHolder.Controls.Add(l);
                }
            }
        }

        public void SetControlValues(string pluginName, Control pluginControl, XmlNode pluginNode)
        {
            XmlNodeList attributesNodes = pluginNode.SelectNodes("//attributes/attribute");
            foreach (XmlNode attNode in attributesNodes)
            {
                string name = attNode.Attributes["name"].Value;
                string type = attNode.Attributes["type"].Value;
                string val = attNode.Attributes["value"].Value;

                PropertyInfo prop = pluginControl.GetType().GetProperty(name);
                if (prop != null)
                {
                    switch (type.ToLower())
                    {
                        case ("int"):
                            prop.SetValue(pluginControl, int.Parse(val), null);
                            break;
                        case ("double"):
                            prop.SetValue(pluginControl, double.Parse(val), null);
                            break;
                        case ("bool"):
                            prop.SetValue(pluginControl, bool.Parse(val), null);
                            break;
                        // default is string
                        default:
                            prop.SetValue(pluginControl, val, null);
                            break;
                    }
                }
            }
        }

        /// <summary>
        /// Sets the state of the plugins
        /// </summary>
        /// <param name="enable"></param>
        private void SetPluginsEnabledState(bool enable)
        {
            var caisisPlugins = PluginHolder.Controls.OfType<CaisisPlugin>();
            foreach (var plugin in caisisPlugins)
            {
                plugin.Enabled = enable;
            }
        }
    }
}