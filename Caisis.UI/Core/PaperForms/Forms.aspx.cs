using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using System.Linq;

using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.PaperForms
{
    /// <summary>
    /// Summary description for forms.
    /// </summary>
    public partial class Forms : FramePage
    {
        private IEnumerable<PaperFormConfig> paperFormNodes;
        private IEnumerable<PaperFormConfig> PaperFormNodes
        {
            get
            {
                if (paperFormNodes == null)
                {
                    // get all paper form config nodes which are "active"
                    paperFormNodes = CaisisConfiguration.GetPaperFormConfigList().Where(config => config.Active);
                }
                return paperFormNodes;
            }
        }

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            string FormPage = Request["FormPage"];

            if (FormPage == null || FormPage.Equals(""))
            {
                FormPage = "FormsSplash";//set default 
            }


            FormsContainer.Attributes.Add("src", FormPage + ".aspx");

            base.Page_Load(sender, e);

            BuildDiseaseMenus();
        }

        /// <summary>
        /// 
        /// </summary>
        private void BuildDiseaseMenus()
        {
            PaperFormsMenu.DataSource = GetDistinctDiseaseGroups();
            PaperFormsMenu.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        private IEnumerable<string> GetDistinctDiseaseGroups()
        {
            var diseases = from config in PaperFormNodes
                           group config by config.Disease into g
                           select g.Key;
            return diseases;
        }

        /// <summary>
        /// During binding, bind sub menus to group attribute
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindSubMenu(object sender, RepeaterItemEventArgs e)
        {
            string disease = e.Item.DataItem.ToString();
            HtmlGenericControl subMenu = e.Item.FindControl("SubMenuList") as HtmlGenericControl;
            Repeater subMenuRptr = subMenu.FindControl("PaperFormsSubMenu") as Repeater;

            var childMenus = from config in PaperFormNodes
                             where config.Disease == disease
                             select config;
            // bind sub menus to nodes which mactch current top level menu disease
            subMenuRptr.DataSource = childMenus;
            subMenuRptr.DataBind();

            // After binding sub menu items, adjust width of submenu to fit items
            Repeater mainMenu = sender as Repeater;
            int minMenuWidth = 1;
            // Loop through bound sub menu items and determine longest text
            foreach (RepeaterItem subMenuItem in subMenuRptr.Items)
            {
                HyperLink subMenuLink = subMenuItem.FindControl("SubMenuLink") as HyperLink;
                string formName = subMenuLink.Text;
                int textWidth = (formName.Length / 2) + 1;
                minMenuWidth = Math.Max(textWidth, minMenuWidth);
            }
            subMenu.Style["width"] = minMenuWidth + "em";
        }

        /// <summary>
        /// Sets the form name for the submenu and formats url
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetFormNames(object sender, RepeaterItemEventArgs e)
        {
            System.Globalization.CultureInfo[] cultures = System.Globalization.CultureInfo.GetCultures(System.Globalization.CultureTypes.InstalledWin32Cultures);
            List<string> buff = new List<string>(cultures.Length);
            foreach (System.Globalization.CultureInfo culture in cultures)
            {
                buff.Add(culture.DateTimeFormat.ShortDatePattern);
            }
            string formName = (e.Item.DataItem as PaperFormConfig).FormName;
            string formPage = (e.Item.DataItem as PaperFormConfig).Page;
            HyperLink subMenuLink = e.Item.FindControl("SubMenuLink") as HyperLink;
            subMenuLink.Text = formName;
            subMenuLink.NavigateUrl = string.Format(subMenuLink.NavigateUrl, formPage);
        }
    }
}
