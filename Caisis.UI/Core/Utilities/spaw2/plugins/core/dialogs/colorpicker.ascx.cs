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
using System.Collections.Generic;
using System.Xml;

public partial class spaw2_plugins_core_dialogs_colorpicker : Solmetra.Spaw2.DialogControl
{
    protected List<string> predef_colors;
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Language.Module = "core";
        this.Language.Block = "colorpicker";

        if (!Page.ClientScript.IsClientScriptIncludeRegistered("colorpicker.js"))
            Page.ClientScript.RegisterClientScriptInclude("colorpicker.js", Solmetra.Spaw2.Configuration.PluginDirectory + "core/dialogs/colorpicker.js");

        predef_colors = new List<string>();
        foreach (XmlNode color in this.Configuration["colorpicker_predefined_colors"].XmlNode.ChildNodes)
            predef_colors.Add(color.Attributes["value"].Value);
    }
}
