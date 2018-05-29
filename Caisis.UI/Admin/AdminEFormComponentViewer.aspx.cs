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
using System.IO;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Admin
{
    public partial class AdminEFormComponentViewer : AdminBasePage
    {

        private static readonly string MODULES_BASE_PATH = "~/Modules";

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
        }


        protected void GetEformComponents(object sender, EventArgs e)
        {
            DropDownList diseases = sender as DropDownList;
            ListItem selected = diseases.SelectedItem;

            DiseaseComponents.Items.Clear();
            if (!string.IsNullOrEmpty(selected.Value))
            {
                DiseaseComponents.Items.Add(new ListItem(string.Empty, string.Empty));
                string disease = selected.Value;
                Dictionary<string, string> components = GetEformComponentsByDisease(disease);
                foreach (string info in components.Keys)
                {
                    string path = Server.UrlEncode(components[info]);
                    ListItem item = new ListItem(info, path);
                    DiseaseComponents.Items.Add(item);
                }
            }
        }

        protected void SetTargetPage(object sender, EventArgs e)
        {
            DropDownList componentList = sender as DropDownList;
            ListItem selectedItem = componentList.SelectedItem;
            if (!string.IsNullOrEmpty(selectedItem.Value))
            {
                string componentPath = Server.UrlEncode(selectedItem.Value);
                ComponentFrame.Attributes["src"] = "AdminEformComponentHolder.aspx?componentPath=" + componentPath;
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
                        string componentName = eformComponent.Name.TrimEnd(".ascx".ToCharArray());
                        string componentVirtualPath = appPath + "/" + eformComponent.Name;
                        componentToVirtualPath.Add(componentName, componentVirtualPath);
                    }
                }
            }
            return componentToVirtualPath;
        }


    }
}
