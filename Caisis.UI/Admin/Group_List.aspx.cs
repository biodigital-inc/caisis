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
    public partial class Group_List : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildUserGroups();
        }

        /// <summary>
        /// 
        /// </summary>
        private void BuildUserGroups()
        {
            GroupDa gda = new GroupDa();
            DataView groups = gda.GetGroups().Tables[0].DefaultView;
            GroupsRptr.DataSource = groups;
            GroupsRptr.DataBind();

            // set count
            GroupsCount.Text = groups.Count.ToString();
        }
    }
}
