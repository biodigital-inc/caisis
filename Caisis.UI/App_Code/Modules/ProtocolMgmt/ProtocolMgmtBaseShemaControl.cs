using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public enum ButtonStatus { VersionCopy = 1, ArmCopy = 2, ArmReplaceNew = 4 };
    /// <summary>
    /// Summary description for ProtocolMgmtBaseShemaControl
    /// </summary>
    public class ProtocolMgmtBaseShemaControl : ProtocolMgmtBaseControl
    {
        public ProtocolMgmtBaseShemaControl()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public virtual bool LoadControl(string protocolId, ButtonStatus status)
        {
            return false;
        }

        public virtual void SaveControl(string protocolId)
        {
        }
    }
}
