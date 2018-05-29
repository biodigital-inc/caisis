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

public partial class spaw2_plugins_core_dialogs_hyperlink : Solmetra.Spaw2.DialogControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Language.Module = "core";
        this.Language.Block = "hyperlink";

        foreach (XmlNode target in this.Configuration["a_targets"].XmlNode.ChildNodes)
            ctarget.Items.Add(new ListItem(this.Language.GetMessage("hyperlink_targets", target.Attributes["name"].Value), target.Attributes["name"].Value));

        if (this.Configuration["quick_links"] != null && this.Configuration["quick_links"].XmlNode.HasChildNodes)
        {
            quick_link_row.Visible = true;
            foreach (XmlNode quicklink in this.Configuration["quick_links"].XmlNode.ChildNodes)
                cquicklinks.Items.Add(new ListItem(quicklink.Attributes["value"].Value, quicklink.Attributes["name"].Value));
        }
        else
        {
            quick_link_row.Visible = false;
        }
    }
}
