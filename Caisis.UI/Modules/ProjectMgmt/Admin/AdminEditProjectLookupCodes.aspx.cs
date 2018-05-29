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

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class AdminEditProjectLookupCodes : ProjectMgmtBasePage
    {

        private int lookupCodeId;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            string parentCodeId = Request.QueryString["lookupCodeId"];
            string childLookupType = Request.QueryString["childLookupType"];
            if (!string.IsNullOrEmpty(parentCodeId) && !string.IsNullOrEmpty(childLookupType))
            {
                LookupCodeDa da = new LookupCodeDa();
                DataTable myChildCodes = da.GetChildCodesByLookupIdAndChildLookupName(int.Parse(parentCodeId), childLookupType);
                DataTable allChildCodes = da.GetLookupsByFieldName(childLookupType).Tables[0];


                foreach (DataRow row in myChildCodes.Rows)
                {
                    string lkpCode = row["LkpCode"].ToString();
                    if (myChildCodes.Select("LkpCode = '" + PageUtil.EscapeSingleQuotesForSql(lkpCode) + "'").Length == 0)
                    {
                        Response.Write(lkpCode + ",");
                    }
                }

            }
        }
    }
}
