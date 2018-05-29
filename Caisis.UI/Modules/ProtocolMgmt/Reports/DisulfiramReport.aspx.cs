using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Xml;
using System.Xml.Linq;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Modules.ProtocolMgmt
{
    public partial class DisulfiramReport : BaseReportPage
    {
        private static string DISULFIRAM_PROTOCOL_NUM = "c10-065";

        protected override void Page_Load(object sender, EventArgs e)
        {
            int? protocolId = GetProtocolId();
            var qParams = base.GetUserParams();
            if (protocolId.HasValue)
            {
                details.BuildReport(protocolId.Value, true);
            }
            else
            {
                details.Visible = false;
                ErrorText.Visible = true;
            }
            base.Page_Load(sender, e);
        }

        private int? GetProtocolId()
        {
            int? protocolId = null;
            var protocols = BusinessObject.GetByFields<Protocol>(
                            new Dictionary<string, object>
                            {
                                { Protocol.ProtocolNum, DISULFIRAM_PROTOCOL_NUM }
                            });
            if (protocols.Count() > 0)
            {
                protocolId = (int)protocols.First()[Protocol.ProtocolId];
            }
            return protocolId;
        }
    }
}