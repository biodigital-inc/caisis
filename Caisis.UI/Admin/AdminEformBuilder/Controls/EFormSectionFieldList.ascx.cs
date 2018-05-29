using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;
using Caisis.UI.ClientScript.JSON;

namespace Caisis.UI.Admin
{
    public partial class EFormSectionFieldList : System.Web.UI.UserControl
    {
        private bool isToolbox = false;
        private bool isGrid = false;

        /// <summary>
        /// Gets the css class definition for list of fields
        /// </summary>
        protected string ColumnCSSClassList
        {
            get
            {
                List<string> classes = new List<string>(new string[] { "DragDropList" });
                if (!isToolbox)
                {
                    classes.Add("sectionList");
                    if (isGrid)
                    {
                        classes.Add("DragDrownListRow");
                    }
                    else
                    {
                        classes.Add("DragDropListColumn");
                    }
                }
                return string.Join(" ", classes.ToArray());
            }
        }

        protected string ItemCSSClassList
        {
            get
            {
                List<string> classes = new List<string>(new string[] { "ToolboxItem" });

                if (isGrid)
                {
                    classes.Add("DragDropListItemsGrid");
                }
                else
                {
                    classes.Add("DragDropListItemsColumn");
                }

                return string.Join(" ", classes.ToArray());
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="fields"></param>
        /// <param name="isToolbox"></param>
        /// <param name="isGrid"></param>
        public void BuildSectionFields(IEnumerable<EformField> fields, bool isToolbox, bool isGrid)
        {
            this.isToolbox = isToolbox;
            this.isGrid = isGrid;

            SectionFieldsRptr.DataSource = fields;
            SectionFieldsRptr.DataBind();
        }

        /// <summary>
        /// Build a list of items
        /// </summary>
        /// <param name="fields"></param>
        public void BuildSectionFields(IEnumerable<EformField> fields)
        {
            BuildSectionFields(fields, false, false);
        }

        /// <summary>
        /// During databinding, dynamically insert ICaisisInputControls into placeholder
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildControlsAndLabel(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                EformField field = (EformField)e.Item.DataItem;
                // supress DATE FIELDS
                if (field.Field.EndsWith("Date"))
                {
                    e.Item.Visible = false;
                }
                else
                {
                    ICaisisInputControl iCIC = CICHelper.InvokeInputControl(field.ControlType);

                    if (iCIC is CaisisTextArea)
                    {
                        iCIC = new CaisisTextBox();
                        (iCIC as CaisisTextBox).ShowTextEditor = true;
                    }
                    iCIC.ShowLabel = false;
                    iCIC.Table = field.Table;
                    iCIC.Field = field.Field;
                    PlaceHolder dynamicHolder = e.Item.FindControl("DynamicControlPlaceHolder") as PlaceHolder;
                    dynamicHolder.Controls.Add(iCIC as Control);

                    if (!(iCIC is CaisisHidden))
                    {
                        CICHelper.SetStaticFieldAttributes(dynamicHolder.Controls, field.Table);
                    }

                    // FIX?? needs to be centralized
                    if (iCIC is CaisisSelect)
                    {
                        CaisisSelect cs = iCIC as CaisisSelect;
                        string lookupCode = cs.LookupCode;
                        if (!string.IsNullOrEmpty(cs.LookupDistinct) && cs.LookupDistinct.IndexOf(SessionKey.PatientId) > -1)
                        {
                            if (Session[SessionKey.PatientId] != null | Session[SessionKey.PatientId].ToString() != string.Empty)
                            {
                                CICHelper.HandleLookupDistinctAttribute(cs, cs.LookupDistinct, this.Page.Session);
                                this.EnableViewState = true;
                            }
                        }
                        else if (lookupCode != null && lookupCode.Length > 0)
                        {
                            cs.DataSource = CacheManager.GetLookupCodeList(lookupCode).DefaultView;
                            cs.DataTextField = "LkpCode";
                            cs.DataValueField = "LkpCode";
                            cs.DataBind();
                        }
                    }

                    if (Caisis.BOL.BusinessObject.HasLabel(field.Table, field.Field))
                    {
                        iCIC.FieldLabel = Caisis.BOL.BusinessObject.GetLabel(field.Table, field.Field);
                    }
                    else
                    {
                        iCIC.FieldLabel = field.Field;
                    }
                    Label fieldLabel = e.Item.FindControl("FieldLabel") as Label;
                    fieldLabel.Text = iCIC.FieldLabel;
                    if (BusinessObject.IsRequired(iCIC.Table, iCIC.Field))
                    {
                        fieldLabel.CssClass = fieldLabel.CssClass + " RequiredField";
                        fieldLabel.ToolTip = "Required Field";
                    }

                    if (iCIC is CaisisTextBox)
                    {
                        //(iCIC as CaisisTextBox).ShowCalendar = false;
                    }
                }
            }
        }
    }
}
