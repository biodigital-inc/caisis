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
    public partial class AdminUpdateDiseases : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            //base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                BuildDiseases();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        private void BuildDiseases()
        {
            DataView allDisease = Disease.GetAllAsDataView<Disease>();
            //allDisease.Sort = Disease.DiseaseName + " ASC";
            DiseaseGrid.DataSource = allDisease;
            DiseaseGrid.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RebuildDiseases(object sender, GridViewDeletedEventArgs e)
        {
            BuildDiseases();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveDiseases(object sender, EventArgs e)
        {
            // manually update
            foreach (GridViewRow dirtyRow in DiseaseGrid.DirtyGridRows)
            {
                Disease biz = new Disease();
                // get pri key on existing rows
                object did = DiseaseGrid.DataKeys[dirtyRow.RowIndex][Disease.DiseaseId];
                if (did != null & did.ToString() != "")
                {
                    biz.Get((int)did);
                }
                // get user disease name
                CaisisTextBox diseaseName = dirtyRow.FindControl("DiseaseNameField") as CaisisTextBox;
                if (!string.IsNullOrEmpty(diseaseName.Value))
                {
                    biz[Disease.DiseaseName] = diseaseName.Value;
                    biz.Save();
                }
            }
            BuildDiseases();
        }
    }
}