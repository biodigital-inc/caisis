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
    /// Specimen Storage Container displays and allows updates to existing specimen.
    /// </summary>
    public partial class SpecimenStorageContainer : SpecimenMgmtBasePage
    {
        private int _containerId = 0;
        private int _storageId;

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            _containerId = Convert.ToInt32(Request.QueryString["containerId"]);
            _storageId = Convert.ToInt32(Request.QueryString["storageId"]);

            if (!Page.IsPostBack)
            {
                if (_containerId != 0)
                {
                    LoadContainerInfo();
                }
            }
        }

        private void LoadContainerInfo()
        {
            SpecimenContainer container = new SpecimenContainer();
            container.Get(this._containerId);
            CICHelper.SetFieldValues(this.inputControlsRow.Controls, container);

            Caisis.BOL.SpecimenStorage storage = new Caisis.BOL.SpecimenStorage();
            storage.Get(Int32.Parse(container[SpecimenContainer.StorageId].ToString()));

            SpecimenSite site = new SpecimenSite();
            site.Get(Int32.Parse(storage[Caisis.BOL.SpecimenStorage.SiteId].ToString()));

            this.PageTitle.Text = site[SpecimenSite.SiteName].ToString() + " > " + storage[Caisis.BOL.SpecimenStorage.StorageName].ToString() + " > " + container[SpecimenContainer.ContainerName].ToString();
        }

        protected void Save_Click(object sender, CommandEventArgs e)
        {
            SpecimenContainer container = new SpecimenContainer();
            container.Get(this._containerId);

            bool isNewRecord = this._storageId == 0 ? false : true; 

            CICHelper.SetBOValues(Page.FindControl("inputControlsRow").Controls, container, 0);

            // set parent id for new record
            if (isNewRecord)
            {
                container[SpecimenContainer.StorageId] = _storageId;
            }
            container.Save();

            // Closes the modal window, and signal main page to either update the text when updating a record
            // to or resubmit the form to reflect the new record
            //ClientScript.RegisterClientScriptBlock(Page.GetType(), "x1", "<script language=\"javascript\">if(top.updatePage) { top.updatePage('" + Name.Value + "'," + (this._containerId == 0 ? "true" : "false") + "); }hideModal();</script>");

            CloseThisPage(false);

        }

        protected void Delete_Click(object sender, CommandEventArgs e)
        {
			//SpecimenContainer container = new SpecimenContainer();
			//SpecimenBox box = new SpecimenBox();
			//box.GetByParent(this._containerId);
			//if (box.RecordCount == 0)
			var c = new Dictionary<string, object>() { { SpecimenBox.ContainerId, this._containerId } };

			if (!BusinessObject.Exists<SpecimenBox>(c))
            {
				SpecimenContainer container = new SpecimenContainer();
                container.Delete(this._containerId);
            }
            else
            {
                Response.Write("<script>alert('This Container has Box(s) and therefore can not be deleted!');</script>");
            }

            CloseThisPage(true);
        }

        private void CloseThisPage(bool recordDeleted)
        {
            // Closes the modal window, and signal main page to either update the text when updating a record
            // to or resubmit the form to reflect the new record
            Page.ClientScript.RegisterClientScriptBlock(Page.GetType(), "x1", "if(top.updatePage) { top.updatePage('" + Name.Value + "'," + (this._containerId == 0 || recordDeleted ? "true" : "false") + "); } top.hideModal();",true);
        }
    }
}
