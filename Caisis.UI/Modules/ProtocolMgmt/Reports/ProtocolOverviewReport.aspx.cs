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
    public partial class ProtocolOverviewReport : BaseReportPage
    {
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

        protected int? GetProtocolId()
        {
            int? protocolId = null;
            var qParams = base.GetUserParams();
            if (qParams.ContainsKey("ProtocolId"))
            {
                string pid = qParams["ProtocolId"];
                if (!string.IsNullOrEmpty(pid))
                {
                    protocolId = int.Parse(pid);
                }
            }
            return protocolId;
        }

    }
}