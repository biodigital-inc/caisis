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
using Solmetra.Spaw2;
using Solmetra.Spaw2.SpawFM;
using System.Collections.Generic;

public partial class spaw2_demo_demo2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // define some pseudo initial values (get from db, file, etc. in real life scenario)
            string dbvalue1 = "<span style=\"font-size: 30px\">Some</span> code <b>from <u>database</u></b>";
            string dbvalue2 = "<span style=\"font-size: 30px\">Kaþkoks</span> kodas <b>ið <u>duomenø bazës</u></b>";
            string dbvalue3 = "<i>Note:</i> some short note";
            string dbvalue4 = "<i>Pastaba:</i> trumpa pastaba";

            // set Text for the pages in the first editor
            spaw1.Pages[0].Text = dbvalue1;
            spaw1.Pages["spaw1_2"].Text = dbvalue2;

            // set text for two additional small editors
            spaw2.Text = dbvalue3;
            spaw3.Text = dbvalue4;
        }

        // Note: below settings are not saved in ViewState so you need to run this code on every reload

        // from the first editor you can access all upload directories defined in config file
        // but you can access only images directory from small editors

        // To achieve that we retrieve file manager configuration for the spaw2 instance (first small editor)
        SpawFMConfiguration fmcfg2 = SpawFMConfiguration.GetFileManagerConfiguration(spaw2);
        // We look for Images directory configured in default config file (this will fail if config file has been modified in this section)
        if (fmcfg2.Directories.IndexOf(Solmetra.Spaw2.Configuration.SpawDirectory + "uploads/images/") > -1)
        {
            // we get the Directory object
            Directory d = fmcfg2.Directories[fmcfg2.Directories.IndexOf(Solmetra.Spaw2.Configuration.SpawDirectory + "uploads/images/")];
            // and set Recursive setting on it
            d.Settings.Recursive = true;
            // we remove all the other directories from configuration
            fmcfg2.Directories.Clear();
            // and add only the Images directory (retrieved above)
            fmcfg2.Directories.Add(d);
            // then we apply the configuration
            fmcfg2.Apply();

            // For the spaw3 instance (second small editor) we just get the SpawFM configuration object
            SpawFMConfiguration fmcfg3 = SpawFMConfiguration.GetFileManagerConfiguration(spaw3);
            // assign directories from the spaw2 instance
            fmcfg3.Directories = fmcfg2.Directories;
            // and apply the configuration
            fmcfg3.Apply();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // set values to display what was submitted
        spaw1Text.Text = spaw1.Text;
        spaw12Text.Text = spaw1.Pages["spaw1_2"].Text;
        spaw2Text.Text = spaw2.Text;
        spaw3Text.Text = spaw3.Text;
        // show the content
        Panel1.Visible = true;
    }
}
