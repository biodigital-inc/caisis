using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.Controller;
using Caisis.UI.Core.Classes;
using Caisis.DataAccess;

namespace Caisis.UI.Core.Utilities.Widget
{
    public partial class UserPatientViewWidget : BaseWidgetControl
    {
 
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            BuildPatientViews();
        }

        private void BuildPatientViews()
        {
            UserController uc = new UserController();
            int userId = uc.GetUserId();
            string datasetSQL = CacheManager.GetDatasetSQL(Session[SessionKey.DatasetId]);
            UserDa da = new UserDa();

            UserPatientViewRpt.DataSource = da.GetPatientView(userId, datasetSQL, 20, true);
            UserPatientViewRpt.DataBind();
        }
    }
}