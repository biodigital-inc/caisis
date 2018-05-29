using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using System.Xml;

namespace Caisis.UI.Admin
{
    public partial class AdminNavigationPage : AdminBasePage
    {
        private string DefaultTitle = "";

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            string adminSection = Request.QueryString["section"];
            XmlDocument xDoc = NavDataSource.GetXmlDocument();

            // Section Node
            XmlNode sectionNode = xDoc.SelectSingleNode("//sections//section[@name='" + adminSection + "']");
            string sectionTitle = sectionNode.Attributes["pageTitle"].Value;
            string defaultPage = sectionNode.Attributes["defaultPage"].Value;
            SectionTitle.Text = sectionTitle;

            // Default Page Node
            XmlNode defaultPageNode = sectionNode.SelectSingleNode("item[@pageTitle='" + defaultPage + "']");
            string defaultPageUrl = defaultPageNode.Attributes["href"].Value;
            string defaultPageTitle = defaultPageNode.Attributes["pageTitle"].Value;
            // Set js default Title
            DefaultTitle = defaultPageTitle;

            // Set default page
            adminPage.Attributes["src"] = defaultPageUrl;

            // Set XPath to Current Section
            NavDataSource.XPath = "//sections//section[@name='" + adminSection + "']/item";
        }

        /// <summary>
        /// Set various UI elements (title,javascript,etc...) for link when bound
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HandleItemBound(object sender, RepeaterItemEventArgs e)
        {
            HyperLink itemLink = e.Item.FindControl("AdminItemLink") as HyperLink;

            // Get values from XML attributes
            string pageTitle = GetAttributValue(e.Item.DataItem, "pageTitle");
            string href = GetAttributValue(e.Item.DataItem, "href");
            string expandPage = GetAttributValue(e.Item.DataItem, "expandPage");
            string autoExpandPage = GetAttributValue(e.Item.DataItem, "autoExpandPage");

            // Build javascript click event
            string doExpandPage = string.IsNullOrEmpty(expandPage) ? bool.FalseString.ToLower() : bool.Parse(expandPage).ToString().ToLower();
            string doAutoExpandPage = string.IsNullOrEmpty(autoExpandPage) ? bool.FalseString.ToLower() : bool.Parse(autoExpandPage).ToString().ToLower();
            string onClickEvent = "setSectionTitle('" + pageTitle + "'," + doExpandPage + "," + doAutoExpandPage + ");";

            // Sets the page title on load
            if (DefaultTitle == pageTitle)
            {
                jsSectionTitle.Text = onClickEvent;
            }
            // Set hyperlink properties
            itemLink.Attributes.Add("onclick", onClickEvent);
            itemLink.Text = pageTitle;
            itemLink.NavigateUrl = href;
            itemLink.ToolTip = pageTitle;
        }

        /// <summary>
        /// Gets the value of an attribute, else empty string
        /// </summary>
        /// <param name="dataItem"></param>
        /// <param name="attName"></param>
        /// <returns></returns>
        private string GetAttributValue(object dataItem, string attName)
        {
            ArrayList attList = GetAttributes(dataItem, attName);
            if (attList.Count > 0)
            {
                XmlAttribute att = attList[0] as XmlAttribute;
                return att.Value;
            }
            else
            {
                return string.Empty;
            }
        }

        /// <summary>
        /// Checks a dataitem for a attribute, returns list found
        /// </summary>
        /// <param name="dataItem"></param>
        /// <param name="attName"></param>
        /// <returns></returns>
        private ArrayList GetAttributes(object dataItem, string attName)
        {
            string expr = "@" + attName;
            ArrayList attList = XPathBinder.Select(dataItem, expr) as ArrayList;
            return attList;
        }
    }
}
