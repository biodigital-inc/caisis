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


using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Plugins.ProtocolsPlugin
{
    public partial class ProtocolsPlugin : CaisisPlugin
    {
        #region Needed to implement for Abstract class CaisisPlugin
        public override Caisis.PluginFramework.PluginType Type
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        public override string Name
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        public override string ControlIdToModify
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterStartupVariables();
        }

        private void RegisterStartupVariables()
        {
            List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(Page);
            foreach (ICaisisInputControl cic in cicList)
            {
                if (cic.Field == Protocol.ProtocolId)
                {
                    string protocolIdClientId = "var protocolIdRef = '" + (cic as Control).ClientID + "';";
                    Page.ClientScript.RegisterStartupScript(typeof(Page), "protocolIdRef", protocolIdClientId, true);
                }
            }
        }
    }
}
