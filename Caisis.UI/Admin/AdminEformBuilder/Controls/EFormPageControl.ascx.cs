using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Caisis.UI.ClientScript.JSON;

namespace Caisis.UI.Admin
{
    public partial class EFormPageControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Sets page title and page related fields and builds sections on page.
        /// </summary>
        /// <param name="page"></param>
        public void BuildPage(EformPage page)
        {
            PageTitle.Text = page.Title;

            SectionsRptr.DataSource = page.Sections;
            SectionsRptr.DataBind();
        }

        /// <summary>
        /// Build sections on page during databinding
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnSectionBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // a section object on eform page object
                EformSection section = (EformSection)e.Item.DataItem;
                // the contorl representing a section in current UI eform page
                EFormSectionControl sectionControl = e.Item.FindControl("section") as  EFormSectionControl;
                
                // build section
                sectionControl.BuildSection(section);
            }
        }
    }
}
