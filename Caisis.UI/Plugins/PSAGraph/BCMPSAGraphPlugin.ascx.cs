using System;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.PluginFramework;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Plugins.PSAGraph
{
    /// <summary>
    /// Summary description for BCMPSAGraphPlugin.
    /// </summary>
    public partial class BCMPSAGraphPlugin : CaisisPlugin
    {

        protected override void OnLoad(EventArgs e)
        {
            string graphMode = CaisisConfiguration.GetWebConfigValue("ShowLabGraph");

            if (string.Equals(graphMode, "All", StringComparison.InvariantCultureIgnoreCase))
            {
                labOpenGraph.Visible = true;
            }
            else if(string.Equals(graphMode, "PSA", StringComparison.InvariantCultureIgnoreCase))
            {
                psaOpenGraph.Visible = true;
            }
            else if (string.Equals(graphMode, "Both", StringComparison.InvariantCultureIgnoreCase))
            {
                labOpenGraph.Visible = true;
                psaOpenGraph.Visible = true;
            }
            
            base.OnLoad(e);
        }

        #region CaisisPlugin members

        public override string ControlIdToModify
        {
            get
            {
                return null;
            }
        }

        public override PluginType Type
        {
            get
            {
                return Caisis.PluginFramework.PluginType.WebHtml;
            }
        }

        public override string Name
        {
            get
            {
                return "Lab Graphs";
            }
        }

        #endregion
    }
}
