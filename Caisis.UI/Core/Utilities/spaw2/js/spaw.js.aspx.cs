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
using System.IO;

namespace Solmetra.Spaw2
{
    public partial class spaw2_js : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "application/x-javascript";
            Response.AddHeader("Content-Disposition", "filename=\"spaw.js\"");

            string agent_name = Agent.GetAgentName();
            string js_dir_path = Directory.GetParent(Server.MapPath(Request.Url.LocalPath)).ToString();

            // load common javascript files
            string[] common_js_files = Directory.GetFiles(js_dir_path + "\\common", "*.js");
            foreach (string js_file in common_js_files)
                Response.Write(File.ReadAllText(js_file));

            // load browser specific javascript files
            string[] agent_js_files = Directory.GetFiles(js_dir_path + "\\" + agent_name, "*.js");
            foreach (string js_file in agent_js_files)
                Response.Write(File.ReadAllText(js_file));

            // plugin scripts
            string[] pluginDirs = Directory.GetDirectories(Configuration.PhysicalPluginDirectory);
            foreach (string pluginDir in pluginDirs)
            {
                // all browsers
                if (Directory.Exists(pluginDir + "\\js\\common\\"))
                {
                    string[] pluginJSs = Directory.GetFiles(pluginDir + "\\js\\common\\", "*.js");
                    foreach (string pluginJS in pluginJSs)
                        Response.Write(File.ReadAllText(pluginJS));
                }
                // specific browser
                if (Directory.Exists(pluginDir + "\\js\\" + agent_name + "\\"))
                {
                    string[] pluginJSs = Directory.GetFiles(pluginDir + "\\js\\" + agent_name + "\\", "*.js");
                    foreach (string pluginJS in pluginJSs)
                        Response.Write(File.ReadAllText(pluginJS));
                }
            }

            // spaw dir
            Response.Write("SpawEngine.setSpawDir(\"" + Configuration.SpawDirectory + "\"); SpawEngine.setPlatform(\"aspx\");");
        
        }
    }
}