using System;
using System.Collections.Generic;
using System.Data;
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
    public partial class EditAttributes : AdminBasePage
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                BuildLookupAttributes();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateClick(object sender, EventArgs e)
        {
            // save and rebind
            Save();
            BuildLookupAttributes();
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "lookupAttributesUpdated", "lookupAttributesUpdated();", true);
        }

        protected void RebingAfterDelete(object sender, GridViewDeletedEventArgs e)
        {
            BuildLookupAttributes();
        }

        /// <summary>
        /// Builds a list of Lookup Attributes
        /// </summary>
        private void BuildLookupAttributes()
        {
            DataView lkpAttributes = BOL.BusinessObject.GetAllAsDataView<BOL.LookupAttribute>();
            AttributesGrid.DataSource = lkpAttributes;
            AttributesGrid.DataBind();
        }

        /// <summary>
        /// Save's dirty rows (new and existing)
        /// </summary>
        private void Save()
        {
            foreach (GridViewRow row in AttributesGrid.DirtyGridRows)
            {
                BOL.LookupAttribute biz = new LookupAttribute();
                object attributeId = AttributesGrid.DataKeys[row.RowIndex][BOL.LookupAttribute.AttributeId];
                if (attributeId != null && !string.IsNullOrEmpty(attributeId.ToString()))
                {
                    biz.Get(int.Parse(attributeId.ToString()));
                }
                var attributeNameField = row.FindControl("AttributeName") as ICaisisInputControl;
                if (!string.IsNullOrEmpty(attributeNameField.Value))
                {
                    biz[BOL.LookupAttribute.AttributeName] = attributeNameField.Value;
                    biz.Save();
                }
            }
        }
    }
}