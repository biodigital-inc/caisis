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

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Admin;
using Caisis.UI.Core;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Institutions_List : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                BuildInstitutions();
            }
        }

        /// <summary>
        /// Builds a list of Institutions
        /// </summary>
        private void BuildInstitutions()
        {
            DataView institutions = BOL.Institution.GetAllAsDataView<BOL.Institution>();
            InstitutionGrid.DataSource = institutions;
            InstitutionGrid.DataBind();
        }

        protected void SaveInstitutionsGrid(object sender, CommandEventArgs e)
        {
            foreach (GridViewRow row in InstitutionGrid.DirtyGridRows)
            {
                ICaisisInputControl instCon = row.FindControl("InstitutionName") as ICaisisInputControl;
                object priKey = InstitutionGrid.DataKeys[row.RowIndex][BOL.Institution.InstitutionId];
                string institutionName = instCon.Value;
                if (!string.IsNullOrEmpty(institutionName))
                {
                    Institution biz = new Institution();
                    // update
                    if (!string.IsNullOrEmpty(priKey.ToString()))
                    {
                        biz.Get(int.Parse(priKey.ToString()));
                    }
                    biz[Institution.Institution_Field] = institutionName;
                    biz.Save();
                }
            }
            InstitutionGrid.DirtyRows.Clear();
            RegisterUpdateScript();
        }

        protected void RebindOnDelete(object sender, GridViewDeletedEventArgs e)
        {
            // rebuild list
            BuildInstitutions();
        }

        private void RegisterUpdateScript()
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "closeDataEntry", "closeDataEntry();", true);
        }
    }
}
