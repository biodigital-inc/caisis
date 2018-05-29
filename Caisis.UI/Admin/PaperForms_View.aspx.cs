using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class PaperForms_View : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            BuildPaperForms();
        }

        private void BuildPaperForms()
        {
            var paperForms = CaisisConfiguration.GetPaperFormConfigList();
            // filter by disease
            if (!string.IsNullOrEmpty(QueryDiseaseName))
            {
                paperForms = paperForms.Where(p => p.Disease.Equals(QueryDiseaseName, StringComparison.OrdinalIgnoreCase));
            }
            // build main data source
            var formsByDisease = from form in paperForms
                                 orderby form.Disease == "General" ? 0 : 1 ascending, form.Disease ascending, form.Name ascending
                                 select form;

            if (formsByDisease.Count() > 0)
            {
                DiseaseFormsRptr.DataSource = formsByDisease;
                DiseaseFormsRptr.DataBind();
                NoResultsMsg.Visible = false;
            }
        }
    }
}