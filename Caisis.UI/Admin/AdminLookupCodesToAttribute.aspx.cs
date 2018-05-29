using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    /// <summary>
    /// An interface for associating lookup codes with an attribute
    /// </summary>
    public partial class AdminLookupCodesToAttribute : AdminBasePage
    {
        /// <summary>
        /// tracks if form has been modified during save
        /// </summary>
        private bool formDirty = false;

        /// <summary>
        /// tracks rows which have been modified during post-backs
        /// </summary>
        private List<int> dirtyRows = new List<int>();

        /// <summary>
        /// Gets whether user is editing LookupAttributes(true) or associating them to Lookup Codes(default/false)
        /// </summary>
        private bool ShowEditPanel
        {
            get
            {
                string queryEdit = Request.QueryString["edit"];
                return !string.IsNullOrEmpty(queryEdit) && queryEdit.ToLower().Equals(bool.TrueString.ToString().ToLower());
            }
        }

        private string selectedAttributeValue = "";
        protected string SelectedAttributeValue
        {
            get
            {
                return selectedAttributeValue;
            }
        }

        private DataView lookupAttributesDataView;
        /// <summary>
        /// Gets a list/view of all LookupAttributes Records
        /// </summary>
        private DataView LookupAttributesDataView
        {
            get
            {
                if (lookupAttributesDataView == null)
                {
					//LookupAttribute lkpAttributeBiz = new LookupAttribute();
					//lkpAttributeBiz.GetAll();
					//lookupAttributesDataView = lkpAttributeBiz.DataSourceView;
					lookupAttributesDataView = BusinessObject.GetAllAsDataView<LookupAttribute>();
                }
                return lookupAttributesDataView;
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Determine if editing attributes or associating attributes to Lookup Codes
                if (ShowEditPanel)
                {
                    EditAttributePanel.Visible = true;
                    AssociateAttributesPanel.Visible = false;
                    BuildEditAttributes();
                }
                else
                {
                    EditAttributePanel.Visible = false;
                    AssociateAttributesPanel.Visible = true;
                    BuildDropDownLists();
                }
            }
        }

        #region EDIT/ADD/DELETE assocation between LookupCodeAttributes and Lookup Codes

        /// <summary>
        /// 
        /// </summary>
        private void BuildDropDownLists()
        {
            LookupCodeDa da = new LookupCodeDa();
            DataTable lookupCodeList = da.GetLookupFieldNames().Tables[0];
            LookupCodesList.DataSource = lookupCodeList;
            LookupCodesList.DataBind();

            // Bind dropdown list
            LookupAttributesList.DataSource = LookupAttributesDataView;
            LookupAttributesList.DataBind();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BindLookupAttributeValues(object sender, EventArgs e)
        {
            string lkFieldName = LookupCodesList.Value;
            string lkpAttributeId = LookupAttributesList.Value;

            // determine if using textbox(default) to build value or dropdown list
            string lkpAttributeValue = string.Empty;
            if (!string.IsNullOrEmpty(LookupAttributeValue.Value))
            {
                lkpAttributeValue = LookupAttributeValue.Value;
            }
            else if (!string.IsNullOrEmpty(ExistingAttributeValues.Value))
            {
                lkpAttributeValue = ExistingAttributeValues.Value;
            }

            if (!string.IsNullOrEmpty(lkFieldName) && !string.IsNullOrEmpty(lkpAttributeId) && !string.IsNullOrEmpty(lkpAttributeValue))
            {
                selectedAttributeValue = lkpAttributeValue;

                LookupCodeDa da = new LookupCodeDa();
                DataView dv = da.GetLookupCodeAttributesByLkpFieldAndAttribute(lkFieldName, int.Parse(lkpAttributeId), lkpAttributeValue).DefaultView;
                LookupAttributesGrid.DataSource = dv;
                LookupAttributesGrid.DataBind();
                GridPanel.Visible = true;
                UpdateBtn.Visible = true;
            }
            else
            {
                GridPanel.Visible = false;
                UpdateBtn.Visible = false;
            }
            dirtyRows = new List<int>();
        }

        /// <summary>
        /// Determine if a LookupCode has the LookupValue assigned to it.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetCheckState(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string lkpCodeAttributeId = DataBinder.Eval(e.Row.DataItem, LookupCodeAttribute.LookupCodeAttributeId).ToString();
                CheckBox useLookupValue = e.Row.FindControl("UseValueCheckBox") as CheckBox;
                // If record has a LookupCodeAttribute assigned for "LookupValue" then check box
                if (!string.IsNullOrEmpty(lkpCodeAttributeId))
                {
                    useLookupValue.Checked = true;
                    e.Row.Style[HtmlTextWriterStyle.BackgroundColor] = "#cc6666";
                }
                else
                {
                    useLookupValue.Checked = false;
                }
                useLookupValue.Attributes["onclick"] = "setCheckState(" + e.Row.RowIndex + ");";
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetComboDistinct(object sender, EventArgs e)
        {
            string lkpAttributeId = LookupAttributesList.Value;
            if (!string.IsNullOrEmpty(lkpAttributeId))
            {
                LookupAttributeValue.LookupDistinct = "LookupCodeAttributes;AttributeValue;AttributeValue;(AttributeId = " + lkpAttributeId + ");AttributeValue";
            }
        }

        /// <summary>
        /// Marks form as dirty, i.e. binding grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MarkFormDirty(object sender, EventArgs e)
        {
            formDirty = true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void MarkRowDirty(object sender, EventArgs e)
        {
            int dirtyRow = ((sender as CheckBox).NamingContainer as GridViewRow).RowIndex;
            dirtyRows.Add(dirtyRow);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateLookupCodeAttributes(object sender, EventArgs e)
        {
            string lkpAttributeId = LookupAttributesList.Value;
            string lkpAttributeValue = LookupAttributeValue.Value;
            // Only run update if values haven't changed, otherwise, need to rebind
            if (!formDirty)
            {
                // foreah row where checkbox has changed state, insert or delete
                foreach (int dirtyRow in dirtyRows)
                {
                    // keys are maintained in grid's data keys array
                    string lkpCodeId = LookupAttributesGrid.DataKeys[dirtyRow].Values[LookupCodeAttribute.LookupCodeId].ToString();
                    string lkpCodeAttributeId = LookupAttributesGrid.DataKeys[dirtyRow].Values[LookupCodeAttribute.LookupCodeAttributeId].ToString();
                    LookupCodeAttribute biz = new LookupCodeAttribute();
                    // if lkpCodeAttributeId exists, delete
                    if (!string.IsNullOrEmpty(lkpCodeAttributeId))
                    {
                        biz.Delete(int.Parse(lkpCodeAttributeId));
                    }
                    // otherwise insert
                    else
                    {
                        // set foreign keys
                        biz[LookupCodeAttribute.AttributeId] = lkpAttributeId;
                        biz[LookupCodeAttribute.LookupCodeId] = lkpCodeId;
                        biz[LookupCodeAttribute.AttributeSuppress] = 0;
                        biz[LookupCodeAttribute.AttributeValue] = lkpAttributeValue;
                        biz.Save();
                    }
                }
            }
            // rebind grid
            BindLookupAttributeValues(sender, e);
            BindExistingAttributeValues(sender, e);
        }

        /// <summary>
        /// 
        /// </summary>
        protected void BindExistingAttributeValues(object sender, EventArgs e)
        {
            string lkpAttributeId = LookupAttributesList.Value;
            string lkpFieldName = LookupCodesList.Value;
            if (!string.IsNullOrEmpty(lkpAttributeId) && !string.IsNullOrEmpty(lkpFieldName))
            {
                LookupCodeDa da = new LookupCodeDa();
                DataTable dt = da.GetDistinctLookupCodeAttributes(lkpFieldName, int.Parse(lkpAttributeId));
                ExistingAttributeValues.DataSource = dt;
                ExistingAttributeValues.DataBind();
            }
            if (sender == LookupAttributesList || sender == LookupCodesList)
            {
                // clear grid
                GridPanel.Visible = false;
                UpdateBtn.Visible = false;
            }

            // reset combo
            LookupAttributeValue.Value = string.Empty;
        }

        #endregion

        #region EDIT/ADD/DELETE LookupAttributes

        /// <summary>
        /// 
        /// </summary>
        private void BuildEditAttributes()
        {
            EditLookupAttributesRptr.DataSource = LookupAttributesDataView;
            EditLookupAttributesRptr.DataBind();
        }

        /// <summary>
        /// Updates an existing LookupAttribute record, or inserts new record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateAttribute(object sender, EventArgs e)
        {
            CaisisTextBox attributeNameField = sender as CaisisTextBox;
            CaisisHidden attributeIdField = attributeNameField.NamingContainer.FindControl("AttributeId") as CaisisHidden;
            if (!string.IsNullOrEmpty(attributeNameField.Value))
            {
                // don't inesrt empty attribut names
                LookupAttribute biz = new LookupAttribute();
                // determine if updating or inserting
                if (attributeIdField != null && !string.IsNullOrEmpty(attributeIdField.Value))
                {
                    biz.Get(int.Parse(attributeIdField.Value));
                }
                biz[LookupAttribute.AttributeName] = attributeNameField.Value;
                biz.Save();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateLookupAttributes(object sender, EventArgs e)
        {
            BuildEditAttributes();
        }

        /// <summary>
        /// Deletes a LookupAttribute record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void DeleteLookupAttribute(object sender, CommandEventArgs e)
        {
            int attributeId = int.Parse(e.CommandArgument.ToString());
            LookupAttribute biz = new LookupAttribute();
            biz.Delete(attributeId);
            BuildEditAttributes();
        }

        #endregion
    }
}
