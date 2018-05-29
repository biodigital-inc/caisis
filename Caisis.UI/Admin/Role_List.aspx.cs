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
    public partial class Role_List : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                BuildRoles();
            }
        }

        private void BuildRoles()
        {
            DataView roles = BusinessObject.GetAllAsDataView<Role>();
            roles.Sort = Role.Role_Field + " ASC";

            RolesRptr.DataSource = roles;
            RolesRptr.DataBind();

            RolesCount.Text = roles.Count.ToString();
        }
    }
}