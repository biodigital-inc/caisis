using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using Caisis.BOL;
using Caisis.DataAccess;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Permission_List : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                BuildPermissions();
            }
        }

        private void BuildPermissions()
        {
            var permissions = BOL.BusinessObject.GetAllAsDataView<BOL.Permission>();
            permissions.Sort = BOL.Permission.Permission_Field + " ASC";
            PermissionsRptr.DataSource = permissions;
            PermissionsRptr.DataBind();

            PermissionsCount.Text = permissions.Count.ToString();
        }

    }
}