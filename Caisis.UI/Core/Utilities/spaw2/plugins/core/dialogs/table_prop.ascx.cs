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

public partial class spaw2_plugins_core_dialogs_table_prop : Solmetra.Spaw2.DialogControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Language.Module = "core";
        this.Language.Block = "table_prop";

        if (!Page.ClientScript.IsClientScriptIncludeRegistered("table_prop.js"))
            Page.ClientScript.RegisterClientScriptInclude("table_prop.js", Solmetra.Spaw2.Configuration.PluginDirectory + "core/dialogs/table_prop.js");

        if (!Page.ClientScript.IsClientScriptBlockRegistered("error_msgs"))
        {
            StringBuilder js_sb = new StringBuilder();
            js_sb.Append("var spawErrorMessages = new Array();");
            js_sb.Append("spawErrorMessages[\"error_rows_nan\"] = \"" + this.Language.GetMessage("error_rows_nan") + "\";");
            js_sb.Append("spawErrorMessages[\"error_columns_nan\"] = \"" + this.Language.GetMessage("error_columns_nan") + "\";");
            js_sb.Append("spawErrorMessages[\"error_width_nan\"] = \"" + this.Language.GetMessage("error_width_nan") + "\";");
            js_sb.Append("spawErrorMessages[\"error_height_nan\"] = \"" + this.Language.GetMessage("error_height_nan") + "\";");
            js_sb.Append("spawErrorMessages[\"error_border_nan\"] = \"" + this.Language.GetMessage("error_border_nan") + "\";");
            js_sb.Append("spawErrorMessages[\"error_cellpadding_nan\"] = \"" + this.Language.GetMessage("error_cellpadding_nan") + "\";");
            js_sb.Append("spawErrorMessages[\"error_cellspacing_nan\"] = \"" + this.Language.GetMessage("error_cellspacing_nan") + "\";");

            Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "error_msgs", js_sb.ToString(), true);
        }

        foreach (XmlNode cssclass in this.Configuration["table_styles"].XmlNode.ChildNodes)
            tcssclass.Items.Add(new ListItem(cssclass.Attributes["value"].Value, cssclass.Attributes["name"].Value));

    }
}
