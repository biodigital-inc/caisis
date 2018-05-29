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
    public partial class Workflow_List : AdminBasePage
    {
        protected override void OnInit(EventArgs e)
        {
            ProcessAJAXRequest();
            base.OnInit(e);
        }
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            BuildWorkflows();
        }
        
        /// <summary>
        /// Updates the workflow active status
        /// </summary>
        private void ProcessAJAXRequest()
        {
            string method = Request.Form["method"];
            if (!string.IsNullOrEmpty(method))
            {
                if (method == "setEFormActive")
                {
                    int eformId = int.Parse(Request.Form["eformId"]); ;
                    bool isActive = bool.Parse(Request.Form["isActive"]);
                    MetadataEForm biz = new MetadataEForm();
                    biz.Get(eformId);
                    biz[MetadataEForm.EFormVersionNum] = isActive ? 1 : 0;
                    biz.Save();
                    Response.End();
                }
            }
        }

        private void BuildWorkflows()
        {
            // get dynamic eforms
            var dynamicEForms = from eform in MetadataEForm.GetAll<MetadataEForm>()
                                let eformName = eform[MetadataEForm.EFormName].ToString()
                                let eformVersionNum = eform[MetadataEForm.EFormVersionNum].ToString()
                                orderby eformName ascending
                                select new
                                {
                                    Name = eformName,
                                    Disease = eform[MetadataEForm.EFormDisease].ToString(),
                                    FileName = string.Empty,
                                    EFormType = "dynamic",
                                    EFormId = eform[MetadataEForm.MetadataEFormId].ToString(),
                                    Active = eformVersionNum != "0"
                                };
            // filter by disease
            if (QueryDiseaseId.HasValue)
            {
                dynamicEForms = dynamicEForms.Where(e => e.Disease.Equals(QueryDiseaseName, StringComparison.OrdinalIgnoreCase));
            }

            if (dynamicEForms.Count() > 0)
            {
                WorkflowsRptr.DataSource = dynamicEForms;
                WorkflowsRptr.DataBind();
                NoResultsMsg.Visible = false;
            }
        }
    }
}
