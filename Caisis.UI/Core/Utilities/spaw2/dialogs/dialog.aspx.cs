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

namespace Solmetra.Spaw2
{
    public partial class spaw2_dialogs_dialog : System.Web.UI.Page
    {
        protected Configuration config;
        protected Theme theme;
        protected Language lang;
        protected string header_template;
        protected string footer_template;

        protected void Page_Load(object sender, EventArgs e)
        {
            // load configuration
            this.config = Configuration.GetConfiguration();

            // load language
            if (!String.IsNullOrEmpty(Request.QueryString["lang"]))
            {
                this.lang = Language.GetLanguage(Request.QueryString["lang"]);
                dialogBody.Attributes["dir"] = this.lang.Direction;
            }
            dialogBody.Attributes["onload"] = "SpawDialog.dialogInit();"; 

            // load theme
            if (!String.IsNullOrEmpty(Request.QueryString["theme"]))
            {
                this.theme = Solmetra.Spaw2.Theme.GetTheme(Request.QueryString["theme"]);
            }

            // set output charset
            if (!String.IsNullOrEmpty(Request.QueryString["charset"]))
                Response.ContentEncoding = System.Text.Encoding.GetEncoding(Request.QueryString["charset"]);



            if (this.config != null && this.theme != null && this.lang != null)
            {
                // load control
                string module = Request.QueryString["module"];
                string dialog = Request.QueryString["dialog"];
                if (!String.IsNullOrEmpty(module) && module.IndexOfAny(new char[2] { '/', '\\' }) == -1
                    && !String.IsNullOrEmpty(dialog) && dialog.IndexOfAny(new char[2] { '/', '\\' }) == -1)
                {
                    Page.Title = "SPAW Editor v.2: " + this.lang.GetMessage(module, dialog, "title");
                    DialogControl dialog_control = (DialogControl)LoadControl(Configuration.PluginDirectory + module + "/dialogs/" + dialog + ".ascx");
                    dialog_control.Configuration = this.config;
                    dialog_control.Theme = this.theme;
                    dialog_control.Language = this.lang;

                    header_template = this.theme.TemplateDialogHeader.Replace("{SPAW DIALOG TITLE}", this.lang.GetMessage(module, dialog, "title")).Replace("{SPAW DIR}", Configuration.SpawDirectory);
                    footer_template = this.theme.TemplateDialogFooter.Replace("{SPAW DIR}", Configuration.SpawDirectory);

                    DialogHeader.Controls.Add(new LiteralControl(header_template));
                    DialogFooter.Controls.Add(new LiteralControl(footer_template));
                    
                    DialogContent.Controls.Add(dialog_control);
                }
            }

        }
    }
}
