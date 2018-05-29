using System;
using System.Data;
using System.Configuration;
using System.Collections.Generic;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Linq;
using System.Xml;

using Caisis.UI.Core.Classes;

namespace Caisis.Controller
{
    /// <summary>
    /// Handles loading, listing, and manipulation of CaisisPlugins.
    /// </summary>
    public class PluginsController
    {
        private string configPath = "~/App_Data/PluginsRegistry.xml";
        private string BASE_PLUGIN_DIR = "~/Plugins";

        private Dictionary<string, XmlNode> _pluginLookup;

        private Dictionary<string, XmlNode> Plugins
        {
            get
            {
                // build inital lookup
                if (_pluginLookup == null)
                {
                    _pluginLookup = new Dictionary<string, XmlNode>();
                    try
                    {
                        XmlDocument _pluginDoc = XmlUtil.GetXmlDoc(configPath);
                        _pluginLookup = _pluginDoc.SelectNodes("//plugins/plugin").Cast<XmlNode>().ToDictionary(a => a.Attributes["name"].Value, a => a);
                    }
                    catch (Exception ex)
                    {
                    }
                }
                return _pluginLookup;
            }
        }

        /// <summary>
        /// Creates a new instance
        /// </summary>
        public PluginsController()
        {
        }

        /// <summary>
        /// Returns a list of plugins defined in the Plugins Registry file.
        /// </summary>
        /// <returns></returns>
        public List<XmlNode> GetListOfPlugins()
        {
            return Plugins.Values.ToList();
        }

        /// <summary>
        /// Returns a list of Plugin names
        /// </summary>
        /// <returns></returns>
        public List<string> GetPluginNames()
        {
            return Plugins.Keys.ToList();
        }

        /// <summary>
        /// Returns a plugin node based on name of the plugin.
        /// </summary>
        /// <param name="pluginName">Name of the plugin.</param>
        /// <returns></returns>
        public XmlNode GetPlugin(string pluginName)
        {
            if (Plugins.ContainsKey(pluginName))
            {
                return Plugins[pluginName];
            }
            else
            {
                return null;
            }
        }
    }
}
