using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;

namespace Caisis.UI.Admin
{
    public partial class AdminSystemConfig : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildDiseaseViews();
        }

        /// <summary>
        /// Builds a list of available diseases
        /// </summary>
        private void BuildDiseaseViews()
        {
            // get a list of diseases by attiribute
            Caisis.Controller.DiseaseController dc = new Caisis.Controller.DiseaseController();
            var diseases = dc.GetDiseaseViews();
            DiseaseViewRptr.DataSource = diseases;
            DiseaseViewRptr.DataBind();
        }
    }
}