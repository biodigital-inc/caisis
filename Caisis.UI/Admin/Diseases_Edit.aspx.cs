using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Diseases_Edit : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BuildDiseaseList();
            }
        }

        private void BuildDiseaseList()
        {
            DiseaseDa da = new DiseaseDa();
            DataView view = da.GetDiseasesByAttribute("IsView").DefaultView;

            DiseasesGrid.DataSource = view;
            DiseasesGrid.DataBind();
        }

        /// <summary>
        /// Sets the IsView checkbox
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetDiseaseIsViewRow(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // determine if the current attribute value (if any) is true
                string isViewValue = DataBinder.Eval(e.Row.DataItem, DiseaseAttributeValue.DiseaseAttributeValue_Field).ToString();
                CaisisCheckBox isViewCheckBox = e.Row.FindControl("IsViewAttributeValue") as CaisisCheckBox;
                if (!string.IsNullOrEmpty(isViewValue) && isViewValue.Equals(bool.TrueString, StringComparison.CurrentCultureIgnoreCase))
                {
                    isViewCheckBox.Checked = true;
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RebindOnDelete(object sender, GridViewDeletedEventArgs e)
        {
            BuildDiseaseList();
        }

        protected void UpdateClick(object sender, EventArgs e)
        {
            foreach (GridViewRow row in DiseasesGrid.DirtyGridRows)
            {
                var lookup = CICHelper.GetCaisisInputControlDictionary(row);
                int? diseaseId = null;
                if (!string.IsNullOrEmpty(lookup[Disease.DiseaseId].Value))
                    diseaseId = int.Parse(lookup[Disease.DiseaseId].Value);
                string diseaseName = lookup[Disease.DiseaseName].Value;
                string diseaseAttributeValueId = lookup[DiseaseAttributeValue.DiseaseAttributeValueId].Value;
                string diseaseAttributeValue = (lookup[DiseaseAttributeValue.DiseaseAttributeValue_Field] as CheckBox).Checked.ToString();
                ICaisisInputControl isViewAttributeId =  lookup[DiseaseAttributeValue.DiseaseAttributeValueId];
                CaisisCheckBox isViewAttribute=  lookup[DiseaseAttributeValue.DiseaseAttributeValue_Field] as CaisisCheckBox;
                
                // insert/update disease
                Disease dBiz = new Disease();
                if (diseaseId.HasValue)
                {
                    dBiz.Get(diseaseId.Value);                    
                }
                dBiz[Disease.DiseaseName] = diseaseName;
                dBiz.Save();
                diseaseId = (int)dBiz[Disease.DiseaseId];
                
                // check if disease attribute exists, update
                if (isViewAttribute.Checked)
                {
                    if (string.IsNullOrEmpty(isViewAttributeId.Value))
                    {
                        DiseaseAttributeValue dav = new DiseaseAttributeValue();
                        dav[DiseaseAttributeValue.DiseaseId] = diseaseId;
                        dav[DiseaseAttributeValue.DiseaseAttributeId] = GetDiseaseIsViewAttribute();
                        dav[DiseaseAttributeValue.DiseaseAttributeValue_Field] = true.ToString().ToLower();
                        dav.Save();

                        isViewAttributeId.Value = dav[dav.PrimaryKeyName].ToString();
                    }
                }
                else
                {
                    // only delete if key exists
                    if (!string.IsNullOrEmpty(isViewAttributeId.Value))
                    {
                        DiseaseAttributeValue dav = new DiseaseAttributeValue();
                        dav.Delete(int.Parse(isViewAttributeId.Value));

                        isViewAttributeId.Value = string.Empty;
                    }
                }
            }

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "reloadMainAdmin", "reloadMainAdmin();", true);
        }

        /// <summary>
        /// Returns the DiseaseAttributeId for IsView
        /// </summary>
        /// <returns></returns>
        private int GetDiseaseIsViewAttribute()
        {
            var isViewAttribute = BusinessObject.GetByFields<DiseaseAttribute_Table>(
            new Dictionary<string, object>
            {
                { DiseaseAttribute_Table.DiseaseAttributeName, "IsView" }
            });
            // return disease attribute id if found
            if (isViewAttribute.Count() > 0)
            {
                return (int)isViewAttribute.First()[DiseaseAttribute_Table.DiseaseAttributeId];
            }
            // else create
            else
            {
                return CreateDiseaseIsViewAttribute();
            }
        }

        /// <summary>
        /// Creates the DiseaseAttributeId for IsView
        /// </summary>
        /// <returns>The new DiseaseAttributeId</returns>
        private int CreateDiseaseIsViewAttribute()
        {
            DiseaseAttribute_Table biz = new DiseaseAttribute_Table();
            biz[DiseaseAttribute_Table.DiseaseAttributeName] = "IsView";
            biz.Save();

            return (int)biz[biz.PrimaryKeyName];
        }
    }
}
