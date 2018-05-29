namespace Caisis.UI.Core.Header
{
    using System;
    using System.Collections;
    using System.ComponentModel;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.SessionState;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;
    using System.Xml;

    using Caisis.Security;
    using Caisis.UI.Core.Classes;

    /// <summary>
    ///		Summary description for commonTasks.
    /// </summary>
    public partial class CommonTasks : BaseControl
    {
        protected override void Page_Load(object sender, System.EventArgs e)
        {
            
        }

        /// <summary>
        /// During binding, set text and link for common tasks if permission exists
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetTaskLink(object sender, RepeaterItemEventArgs e)
        {
            string page = DataBinder.Eval(e.Item.DataItem, "page").ToString();
            string displayName = DataBinder.Eval(e.Item.DataItem, "displayName").ToString();
            string permission = DataBinder.Eval(e.Item.DataItem, "permission").ToString();
            HtmlAnchor taskLink = e.Item.FindControl("taskLink") as HtmlAnchor;

            bool enabled = false;
            object o = XPathBinder.Eval(e.Item.DataItem, "@enabled");
            if (o != null) enabled = bool.Parse(o.ToString());


            if (enabled && PermissionManager.HasPermission(permission))
            {
                taskLink.Visible = true;
                string onClickEvent = "return showCommonTaskLink('" + PageUtil.EscapeSingleQuotes(page) + "', '" + PageUtil.EscapeSingleQuotes(displayName) + "');";
                taskLink.Attributes.Add("onclick", onClickEvent);
            }
            else
            {
                taskLink.Visible = false;
            }
        }
    }
}
