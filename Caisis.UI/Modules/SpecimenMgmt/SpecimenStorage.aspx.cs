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
    /// Specimen Storage displays and allows updates to existing specimen.
    /// </summary>
    public partial class SpecimenStorage : SpecimenMgmtBasePage
    {
        private int _storageId = 0;
        private int _siteId;
        
        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            _storageId = Convert.ToInt32(Request.QueryString["storageId"]);
            _siteId = Convert.ToInt32(Request.QueryString["siteId"]);

            if (!Page.IsPostBack)
            {
                LoadStorageInfo();
            }
        }

        private void LoadStorageInfo()
        {
            Caisis.BOL.SpecimenStorage storage = new Caisis.BOL.SpecimenStorage();
            storage.Get(this._storageId);
            CICHelper.SetFieldValues(this.inputControlsRow.Controls, storage);

            SpecimenSite site = new SpecimenSite();
            //site.Get(Int32.Parse(storage[Caisis.BOL.SpecimenStorage.SiteId].ToString()));
            site.Get(_siteId);

            this.PageTitle.Text = site[SpecimenSite.SiteName].ToString() + " > " + storage[Caisis.BOL.SpecimenStorage.StorageName].ToString();
        }

        protected void Save_Click(object sender, CommandEventArgs e)
        {
            Caisis.BOL.SpecimenStorage storage = new Caisis.BOL.SpecimenStorage();
            storage.Get(this._storageId);
            bool isNewRecord = this._siteId == 0 ? false : true; 

            CICHelper.SetBOValues(Page.FindControl("inputControlsRow").Controls, storage, 0);

            // set parent id for new record
            if (isNewRecord)
            {
                storage[Caisis.BOL.SpecimenStorage.SiteId] = _siteId;
            }
            storage.Save();

            // Closes the modal window, and signal main page to either update the text when updating a record
            // to or resubmit the form to reflect the new record
            //ClientScript.RegisterClientScriptBlock(Page.GetType(), "x1", "<script language=\"javascript\">if(top.updatePage) { top.updatePage('" + Name.Value + "'," + (this._storageId == 0 ? "true" : "false") + "); }hideModal();</script>");

            CloseThisPage(false);
        }

        protected void Delete_Click(object sender, CommandEventArgs e)
        {
			var c = new Dictionary<string, object>() { { BOL.SpecimenContainer.StorageId, _storageId } };
			//Caisis.BOL.SpecimenStorage storage = new Caisis.BOL.SpecimenStorage();
			//SpecimenContainer container = new SpecimenContainer();
			//container.GetByParent(_storageId);
            //if (container.RecordCount == 0)
			if (!BusinessObject.Exists<BOL.SpecimenContainer>(c))
            {
				Caisis.BOL.SpecimenStorage storage = new Caisis.BOL.SpecimenStorage();
                storage.Delete(this._storageId);
            }
            else
            {
                Response.Write("<script>alert('This Storage has Container(s) and therefore can not be deleted!');</script>");
            }

            CloseThisPage(true);
        }

        private void CloseThisPage(bool recordDeleted)
        {
            // Closes the modal window, and signal main page to either update the text when updating a record
            // to or resubmit the form to reflect the new record
            Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "x1", "if(top.updatePage) { top.updatePage('" + Name.Value + "'," + (this._storageId == 0 || recordDeleted ? "true" : "false") + "); } top.hideModal();", true);
        }
    }

}
