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
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    public partial class AdminChildParentLookupCodes : AdminBasePage
    {

        protected override void Page_Load(object sender, EventArgs e)
        {
            // Base Admin Load
            base.Page_Load(sender, e);
            BindLookupCodeDropDowns();
        }

        protected void BindLookupCodeDropDowns()
        {

            LookupCodeDa da = new LookupCodeDa();
            DataTable lookupDataSource = da.GetLookupFieldNames().Tables[0];
            LookupCodes.DataSource = lookupDataSource;
            LookupCodes.DataBind();
            ChildLookupCodeField.DataSource = lookupDataSource;
            ChildLookupCodeField.DataBind();
        }
    }
}
