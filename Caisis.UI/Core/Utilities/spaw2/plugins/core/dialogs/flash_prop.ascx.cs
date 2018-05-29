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

public partial class spaw2_plugins_core_dialogs_flash_prop : Solmetra.Spaw2.DialogControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Language.Module = "core";
        this.Language.Block = "flash_prop";

        if (!Page.ClientScript.IsClientScriptIncludeRegistered("flash_prop.js"))
            Page.ClientScript.RegisterClientScriptInclude("flash_prop.js", Solmetra.Spaw2.Configuration.PluginDirectory + "core/dialogs/flash_prop.js");

        if (!Page.ClientScript.IsClientScriptBlockRegistered("error_msgs"))
        {
            StringBuilder js_sb = new StringBuilder();
            js_sb.Append("var spawErrorMessages = new Array();");
            js_sb.Append("spawErrorMessages[\"error_width_nan\"] = \"" + this.Language.GetMessage("error_width_nan") + "\";");
            js_sb.Append("spawErrorMessages[\"error_height_nan\"] = \"" + this.Language.GetMessage("error_height_nan") + "\";");

            Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "error_msgs", js_sb.ToString(), true);
        }
    }
}
