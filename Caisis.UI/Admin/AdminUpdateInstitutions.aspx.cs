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

namespace Caisis.UI.Admin
{
    public partial class AdminUpdateInstitutions : AdminBasePage
    {
        private ArrayList dirtyRows = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowAddInstitution(object sender, CommandEventArgs e)
        {
            SetAddInstitutionMode();
        }

        protected void MarkDirty(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((Control)sender).NamingContainer;
            int index = row.RowIndex;
            dirtyRows.Add(index);
        }

        protected void SaveInstitutionsGrid(object sender, CommandEventArgs e)
        {
            foreach (int dirtyRow in dirtyRows)
            {
                GridViewRow row = InstitutionGrid.Rows[dirtyRow];
                TextBox instCon = (TextBox)row.FindControl("InstitutionName");
                int priKey = int.Parse(((HiddenField)row.FindControl("InstitutionId")).Value);
                string newVal = instCon.Text;
                if (!string.IsNullOrEmpty(newVal))
                {
                    Institution biz = new Institution();
                    biz.Get(priKey);
                    biz[Institution.Institution_Field] = newVal;
                    biz[Institution.UpdatedTime] = DateTime.Now.ToString();
                    biz.Save();
                }
            }
            dirtyRows.Clear();
            AddPanel.Visible = false;
        }

        protected void AddInstitution(object sender, CommandEventArgs e)
        {
            string instName = InstitutionName.Text;
            if (!string.IsNullOrEmpty(instName))
            {
                InstitutionDa da = new InstitutionDa();
                DataTable dt = da.GetInstitutions();
                bool isDuplicate = false;
                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        if (row[Institution.Institution_Field].ToString() == instName)
                        {
                            isDuplicate = true;
                        }
                    }

                }
                if (!isDuplicate)
                {
                    Institution biz = new Institution();
                    biz[Institution.Institution_Field] = instName;
                    biz.Save();
                }

            }
            SetEditInstitutionsMode();
            InstitutionGrid.DataBind();
        }

        protected void CancelAddInstitution(object sender, CommandEventArgs e)
        {
            SetEditInstitutionsMode();
        }

        private void SetAddInstitutionMode()
        {
            AddPanel.Visible = true;
            AddInstitutionsBtn.Enabled = false;
            AddInstitutionsBtn.ImageUrl = "~/Images/DataEntryButtons/Button_New_Off.gif";
            SaveInstitutionsBtn.Enabled = false;
            SaveInstitutionsBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Save_Off.gif";
            EditInstitutionsBtn.Enabled = false;
            EditInstitutionsBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Edit_Off.gif";
            CancelInstitutionsBtn.Enabled = false;
            CancelInstitutionsBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Cancel_Off.gif";

            InstitutionName.Text = "";
            InstitutionGrid.DataBind();
        }

        private void SetEditInstitutionsMode()
        {
            AddPanel.Visible = false;
            AddInstitutionsBtn.Enabled = true;
            AddInstitutionsBtn.ImageUrl = "~/Images/DataEntryButtons/Button_New_On.gif";
            SaveInstitutionsBtn.Enabled = true;
            SaveInstitutionsBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Save_On.gif";
            EditInstitutionsBtn.Enabled = true;
            EditInstitutionsBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Edit_On.gif";
            CancelInstitutionsBtn.Enabled = true;
            CancelInstitutionsBtn.ImageUrl = "~/Images/DataEntryButtons/Button_Cancel_On.gif";

            InstitutionName.Text = "";
        }

        protected void DeleteInstitution(object sender, CommandEventArgs e)
        {
            int key = int.Parse(e.CommandArgument.ToString());
            Institution biz = new Institution();
            biz.Delete(key);
            InstitutionGrid.DataBind();
        }
    }
}
