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
    /// <summary>
    /// Summary description for ProtocolMgmtBaseShemaItemControl
    /// </summary>
    public class ProtocolMgmtBaseShemaItemControl : ProtocolMgmtBaseControl
    {
        public ProtocolMgmtBaseShemaItemControl()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public virtual bool LoadControl(string tableName, string schemaItemId, bool bParentTable, bool bCreateNew)
        {
            return false;
        }

        public virtual void SaveControl(int schemaItemId, bool bParentTable, bool bCreateNew)
        {
        }
    }
}
