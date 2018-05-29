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
    public partial class EForms_List : AdminBasePage
    {
        private static readonly string MODULES_BASE_PATH = "~/Modules";
        protected string EFormType = "EForm";

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["view"]))
                {
                    BuildEFormComponents();
                }
                else
                {
                    BuildEForms();
                }
            }
        }

        /// <summary>
        /// Builds a list of EForms filtered by disease (if applicable)
        /// </summary>
        private void BuildEForms()
        {
            // set visibility
            EformComponentHolder.Visible = false;
            EformListPanel.Visible = true;

            // get static eforms
            var masterEformList = from eform in CaisisConfiguration.GetEformsConfigList()
                                  orderby (eform.Disease == "General" ? 0 : 1) ascending, eform.Disease ascending, eform.Name ascending
                                  select new
                                  {
                                      Name = eform.Name,
                                      Disease = eform.Disease,
                                      FileName = eform.FileName,
                                      EFormType = "static",
                                      EFormId = string.Empty,
                                      Active = eform.Active
                                  };

            // filter by disease
            if (!string.IsNullOrEmpty(QueryDiseaseName))
            {
                masterEformList = masterEformList.Where(e => e.Disease.Equals(QueryDiseaseName, StringComparison.CurrentCultureIgnoreCase));
            }

            if (masterEformList.Count() > 0)
            {
                // bind list of eforms
                EformsRptr.DataSource = masterEformList;
                EformsRptr.DataBind();
                NoResultsMsg.Visible = false;
            }

            EFormCount.Text = masterEformList.Count().ToString();
        }

        /// <summary>
        /// Build a list of all eform components, filtered by disease
        /// </summary>
        private void BuildEFormComponents()
        {
            // set visibility
            EformComponentHolder.Visible = true;
            EformListPanel.Visible = false;

            // get componenets by disease
            if (!string.IsNullOrEmpty(QueryDiseaseName))
            {
                var components = from component in GetEformComponentsByDisease(QueryDiseaseName)
                                 select new
                                 {
                                     Disease = QueryDiseaseName,
                                     Component = component.Key,
                                     Path = component.Value
                                 };

                if (components.Count() > 0)
                {
                    // build list of componenets
                    EformComponentsRptr.DataSource = components;
                    EformComponentsRptr.DataBind();
                    NoComponentResultsMsg.Visible = false;

                    EFormComponentCount.Text = components.Count().ToString();
                }
            }
            // combine all disease/view components
            else
            {
                var views = CaisisConfiguration.GetViewConfigList();
                // for each view, create a list of objects represeting a component, flatten lists
                var components = (from view in views
                                  orderby view.Name ascending
                                  select from component in GetEformComponentsByDisease(view.Name)
                                         select new
                                         {
                                             Disease = view.Name,
                                             Component = component.Key,
                                             Path = component.Value
                                         }
                                 ).SelectMany(c => c);

                // build list of componenets
                EformComponentsRptr.DataSource = components;
                EformComponentsRptr.DataBind();

                EFormComponentCount.Text = components.Count().ToString();

            }


        }

        private Dictionary<string, string> GetEformComponentsByDisease(string disease)
        {
            Dictionary<string, string> componentToVirtualPath = new Dictionary<string, string>();
            string appPath = MODULES_BASE_PATH + "/" + disease + "/Eforms";
            string serverPath = Server.MapPath(appPath);

            if (Directory.Exists(serverPath))
            {
                DirectoryInfo dirInfo = new DirectoryInfo(serverPath);
                FileInfo[] eformComponents = dirInfo.GetFiles();
                foreach (FileInfo eformComponent in eformComponents)
                {
                    bool isASCX = eformComponent.Name.EndsWith(".ascx", StringComparison.CurrentCultureIgnoreCase);
                    if (isASCX)
                    {
                        string componentName = eformComponent.Name.Replace(".ascx", "");
                        string componentVirtualPath = appPath + "/" + eformComponent.Name;
                        componentToVirtualPath.Add(componentName, componentVirtualPath);
                    }
                }
            }
            return componentToVirtualPath;
        }
    }
}