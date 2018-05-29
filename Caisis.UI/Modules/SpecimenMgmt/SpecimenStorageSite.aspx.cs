using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;
using Caisis.DataAccess;

namespace Caisis.UI.Modules.SpecimenMgmt
{
    /// <summary>
    /// Specimen Storage Storage displays and allows updates to existing specimen.
    /// </summary>
    public partial class SpecimenStorageSite : SpecimenMgmtBasePage
    {
        private int siteId = 0;

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            siteId = Convert.ToInt32(Request.QueryString["siteId"]);

            if (!Page.IsPostBack)
            {
                if (siteId != 0)
                {
                    LoadSiteInfo(); //loading an existing site
                }
            }
        }

        private void LoadSiteInfo()
        {
            SpecimenSite site = new SpecimenSite();
            site.Get(this.siteId);
            CICHelper.SetFieldValues(this.inputControlsRow.Controls, site);

            PageTitle.Text = site[SpecimenSite.SiteName].ToString();
        }

        protected void Save_Click(object sender, CommandEventArgs e)
        {
            SpecimenSite site = new SpecimenSite();
            site.Get(this.siteId);

            CICHelper.SetBOValues(Page.FindControl("inputControlsRow").Controls, site, 0);
            site.Save();

            // Closes the modal window, and signal main page to either update the text when updating a record
            // to or resubmit the form to reflect the new record
            CloseThisPage();
        }

        protected void Delete_Click(object sender, CommandEventArgs e)
        {
			var c = new Dictionary<string, object>() { { BOL.SpecimenStorage.SiteId, this.siteId } };
			//SpecimenSite site = new SpecimenSite();
			//Caisis.BOL.SpecimenStorage storage = new Caisis.BOL.SpecimenStorage();
			//storage.GetByParent(this.siteId);
			//if (storage.RecordCount == 0)
			if (!BusinessObject.Exists<BOL.SpecimenStorage>(c))
            {
				SpecimenSite site = new SpecimenSite();
                site.Delete(this.siteId);
            }
            else
            {
                Response.Write("<script>alert('This Site has Storage(s) and therefore can not be deleted!');</script>");
            }

            CloseThisPage();
        }

        private void CloseThisPage()
        {
            // Closes the modal window, and signal main page to either update the text when updating a record
            // to or resubmit the form to reflect the new record
            Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "refreshParent", "refreshParent();", true);
        }

    }
}
