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
using System.Text;
using System.Xml;

public partial class spaw2_plugins_core_dialogs_table_cell_prop : Solmetra.Spaw2.DialogControl
{
    protected string theme_path = String.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Language.Module = "core";
        this.Language.Block = "table_cell_prop";
        this.theme_path = Solmetra.Spaw2.Configuration.PluginDirectory + "core/lib/theme/" + this.Theme.Name + "/";

        if (!Page.ClientScript.IsClientScriptIncludeRegistered("table_cell_prop.js"))
            Page.ClientScript.RegisterClientScriptInclude("table_cell_prop.js", Solmetra.Spaw2.Configuration.PluginDirectory + "core/dialogs/table_cell_prop.js");

        if (!Page.ClientScript.IsClientScriptBlockRegistered("error_msgs"))
        {
            StringBuilder js_sb = new StringBuilder();
            js_sb.Append("var spawErrorMessages = new Array();");
            js_sb.Append("spawErrorMessages[\"error_width_nan\"] = \"" + this.Language.GetMessage("error_width_nan") + "\";");
            js_sb.Append("spawErrorMessages[\"error_height_nan\"] = \"" + this.Language.GetMessage("error_height_nan") + "\";");

            Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "error_msgs", js_sb.ToString(), true);
        }

        foreach (XmlNode cssclass in this.Configuration["table_cell_styles"].XmlNode.ChildNodes)
            ccssclass.Items.Add(new ListItem(cssclass.Attributes["value"].Value, cssclass.Attributes["name"].Value));
    }
}
