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

using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Core.Utilities
{
    public partial class ProtocolsCallBack : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string protocolNumber = Request.Form["protocolNumber"];
            if (!string.IsNullOrEmpty(protocolNumber))
            {
                Protocol biz = new Protocol();
                biz.Get(int.Parse(protocolNumber));
                //ProtocolRepeater.DataSource = biz.DataSourceView;
				ProtocolRepeater.DataSource = new Protocol[] { biz }.AsDataView();
                ProtocolRepeater.DataBind();
            }
        }
    }
}
