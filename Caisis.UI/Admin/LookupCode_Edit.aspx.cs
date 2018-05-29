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
    public partial class LookupCode_Edit : AdminBasePage
    {
        private DataTable _lkpCodesTable;
        private Dictionary<int, int> _diseaseAttributeLookup;
        protected string _diseaseName;
        private int? _lkpDiseaseAttributeId;

        /// <summary>
        /// Returns the LkpFieldName passed via query string
        /// </summary>
        protected string QueryLkpField
        {
            get
            {
                return Request.QueryString["lkpField"];
            }
        }

        public LookupCode_Edit()
            : base()
        {
            this.Init += (a, b) => InitParamaters();
            this.PreRender += (a, b) =>
            {
                SetVisibleColumns();
                RegisterSearchCodes();
            };
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            // during data-binding of main lookup codes interface, set assocaited checkboxes
            LookupCodeGrid.DataBound += BuildLookupCodeByAttribute;
            LookupCodeGrid.DataBound += BuildFilterByParent;
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            InitParamaters();
            SetFilterPanel();
            if (!Page.IsPostBack)
            {
                BuildLookupFieldNames();
                CurrentLkpFieldName.Value = QueryLkpField;
                if (!string.IsNullOrEmpty(QueryLkpField))
                {
                    BuildLookupCodeList(QueryLkpField);
                }
                BuildLookupAttributes();
            }
            // supress display of main data entry when no item selected
            EditFormBox.Visible = !string.IsNullOrEmpty(QueryLkpField);
        }

        /// <summary>
        /// Sets required key fields and helper data sources
        /// </summary>
        private void InitParamaters()
        {
            _diseaseName = !string.IsNullOrEmpty(QueryDiseaseName) ? QueryDiseaseName : string.Empty;
            _diseaseAttributeLookup = new Dictionary<int, int>();
            _lkpDiseaseAttributeId = null;

            // set data sources
            LookupCodeDa da = new LookupCodeDa();
            if (QueryDiseaseId.HasValue)
            {
                var lkpAttributes = BOL.BusinessObject.GetByFields<LookupAttribute>(new Dictionary<string, object> { { LookupAttribute.AttributeName, "Disease" } });
                if (lkpAttributes.Count() > 0)
                {
                    _lkpDiseaseAttributeId = (int)lkpAttributes.First()[LookupAttribute.AttributeId];
                    // get lookup codes for current disease
                    var diseaseLkpCode = BOL.BusinessObject.GetByFields<LookupCodeAttribute>(new Dictionary<string, object> 
                    { 
                        { LookupCodeAttribute.AttributeId, _lkpDiseaseAttributeId.Value },
                        { LookupCodeAttribute.AttributeValue, QueryDiseaseName }
                    });
                    // create lookup to get lookup attribute id by lookup code id
                    _diseaseAttributeLookup = diseaseLkpCode.ToDictionary(b => (int)b[LookupCodeAttribute.LookupCodeId], b => (int)b[LookupCodeAttribute.LookupCodeAttributeId]);
                }
            }
            // set main lookup data source
            _lkpCodesTable = da.GetLookupFieldNames().Tables[0];
        }

        #region UI - main lookup interface

        /// <summary>
        /// Builds a list of distint LkpFieldNames
        /// </summary>
        private void BuildLookupFieldNames()
        {
            LkpFieldsRptr.DataSource = _lkpCodesTable;
            LkpFieldsRptr.DataBind();

            FilterByParentLkpFieldNames.DataSource = _lkpCodesTable;
            FilterByParentLkpFieldNames.DataBind();
        }

        /// <summary>
        /// Builds a grid populated with the current LkpFieldName
        /// </summary>
        /// <param name="lkpField"></param>
        private bool BuildLookupCodeList(string lkpField)
        {
            InitParamaters();

            LookupCodeDa da = new LookupCodeDa();
            var lkpCodes = LookupCode.GetByFieldsAsDataView<LookupCode>(new Dictionary<string, object>
            {
                { LookupCode.LkpFieldName, lkpField }
            });
            // sort by, then alpha numeric
            DataColumn sortCol = new DataColumn("_Sort", typeof(int), "ISNULL(LkpOrder," + int.MaxValue + ")");
            DataColumn sortCol2 = new DataColumn("_Sort2", typeof(int), "ISNULL(LookupCodeId," + int.MaxValue + ") - ISNULL(LookupCodeId," + int.MaxValue + " - 1)");
            lkpCodes.Table.Columns.Add(sortCol);
            lkpCodes.Table.Columns.Add(sortCol2);
            lkpCodes.Sort = "_Sort ASC, _Sort2 ASC, " + LookupCode.LkpCode + " ASC";
            // build main lookup code list

            LookupCodeGrid.DataSource = lkpCodes;
            LookupCodeGrid.DataBind();

            DataSet ds = da.GetLookupCodeStats(lkpField, _diseaseName);
            DataTable lookupByMetadata = ds.Tables[0];
            int lookupCodeCount = (int)ds.Tables[1].Rows[0][0];
            int lookupDiseaseCount = (int)ds.Tables[2].Rows[0][0];
            BuildLkpStats(lookupByMetadata, lookupDiseaseCount, lookupCodeCount);

            return lookupCodeCount > 0;
        }


        private void BuildLkpStats(DataTable lookupByMetadata, int lookupDiseaseCount, int lookupCodeCount)
        {
            // only show this stat if a disease is selected
            if (!String.IsNullOrEmpty(this.QueryDiseaseName))
            {
                LkpStats.Text = string.Format("{0} of {1} " + this.QueryLkpField + " values have been associated with " + this.QueryDiseaseName + " disease", lookupDiseaseCount, lookupCodeCount);
                // hide the header box since it is used for the attributes dropdown           
                HeaderArea.Visible = false;
            }


            // showing a table of fields on mouseover has been disabled in ui code
            var tableFields = from row in lookupByMetadata.AsEnumerable()
                              let table = row["TableName"].ToString()
                              let field = row["FieldName"].ToString()
                              orderby table ascending, field ascending
                              select new
                              {
                                  Table = table,
                                  Field = field
                              };
            TableStatsRprt.DataSource = tableFields;
            TableStatsRprt.DataBind();

            // take the first 3 fields, show more on mouse over expand...
            if (tableFields.Count() > 0)
            {
                TableFieldsLookupLabel.Text = string.Join(", ", tableFields.Take(3).Select(f => f.Field).ToArray());
                if (tableFields.Count() > 3) { TableFieldsLookupLabel.Text += "..."; }
            }
            else
            {
                TableFieldsLookupLabel.Text = "no";
                //TableFieldsLookupLabel.Attributes.Remove("onmouseover");
            }

        }

        /// <summary>
        /// Registers the client array of LkpFieldNames for filtering client side.
        /// </summary>
        private void RegisterSearchCodes()
        {
            if (_lkpCodesTable != null)
            {
                string lkpFieldNames = PageUtil.DataTableToJSArray(_lkpCodesTable, new string[] { LookupCode.LkpFieldName }, false);
                Page.ClientScript.RegisterArrayDeclaration("LkpFieldNames", lkpFieldNames);
            }
        }

        #endregion

        #region UI - filter panels

        /// <summary>
        /// Sets the visibility of the filter panel
        /// </summary>
        private void SetFilterPanel()
        {
            // only show panel when NOT working in disease mode
            bool showFilter = !QueryDiseaseId.HasValue;
            FilterByPanel.Visible = showFilter;
        }

        protected void AdjustFilterBy(object sender, EventArgs e)
        {
            if (FilterBy.Value == "")
            {
                FilterByAttributeColumn1.Visible = false;
                FilterByAttributeColumn2.Visible = false;
                FilterByAttributeColumn3.Visible = false;
                FilterByParentColumn1.Visible = false;
                FilterByParentColumn2.Visible = false;
            }
            else if (FilterBy.Value == "Attribute")
            {
                FilterByAttributeColumn1.Visible = true;
                FilterByAttributeColumn2.Visible = true;
                FilterByAttributeColumn3.Visible = true;
                FilterByParentColumn1.Visible = false;
                FilterByParentColumn2.Visible = false;
            }
            else
            {
                FilterByAttributeColumn1.Visible = false;
                FilterByAttributeColumn2.Visible = false;
                FilterByAttributeColumn3.Visible = false;
                FilterByParentColumn1.Visible = true;
                FilterByParentColumn2.Visible = true;
            }
        }

        private void BuildLookupAttributes()
        {
            // clear attribute values
            //FilterByAttributeValues.Items.Clear();
            ClearAttributeValues();

            var lkpAttributes = BusinessObject.GetAllAsDataView<LookupAttribute>();
            lkpAttributes.RowFilter = LookupAttribute.AttributeName + " NOT IN ('Disease')";
            FilterByAttributeNames.DataSource = lkpAttributes;
            FilterByAttributeNames.DataBind();
        }

        private void ClearAttributeValues()
        {
            FilterByAttributeValues.BuildComboData(new DataTable(), string.Empty, string.Empty);
            FilterByAttributeValues.Value = string.Empty;
        }

        protected void BuildLookupAttributeValues(object sender, EventArgs e)
        {
            // clear attribute values
            //FilterByAttributeValues.Items.Clear();
            ClearAttributeValues();

            string lkpAttributeId = FilterByAttributeNames.Value;
            if (!string.IsNullOrEmpty(lkpAttributeId))
            {
                // get a list of current values associated with this attribute
                //var lkpAttributeValues = BusinessObject.GetByFieldsAsDataView<LookupCodeAttribute>(new Dictionary<string,object>
                //{
                //    { LookupCodeAttribute.AttributeId, lkpAttributeId }
                //});
                string lookupDistinct = "LookupCodeAttributes;AttributeValue;AttributeValue;(AttributeId = " + lkpAttributeId + ");AttributeValue";
                FilterByAttributeValues.LookupDistinct = lookupDistinct;
                //CICHelper.HandleLookupDistinctAttribute(FilterByAttributeValues, lookupDistinct, this.Page.Session);

                //LookupCodeDa da = new LookupCodeDa();
                //var lkpAttributeValues = da.GetLookupCodeAttributesByLkpFieldAndAttribute(CurrentLkpFieldName.Value, int.Parse(lkpAttributeId));
                // build list of attribute values
                //FilterByAttributeValues.DataSource = lkpAttributeValues;
                //    FilterByAttributeValues.DataBind();
            }
        }

        protected void BuildLookupCodeByAttribute(object sender, EventArgs e)
        {
            string lkpAttributeId = FilterByAttributeNames.Value;
            string lkpAttributeValue = FilterByAttributeValues.Value;
            if (!string.IsNullOrEmpty(lkpAttributeValue))
            {
                LookupCodeDa da = new LookupCodeDa();
                var codeByAttribute = da.GetLookupCodeAttributesByLkpFieldAndAttribute(CurrentLkpFieldName.Value, int.Parse(lkpAttributeId), lkpAttributeValue);
                SetLookupCodeGridFilter(codeByAttribute, "ApplyToAttribute", LookupCodeAttribute.LookupCodeAttributeId);
            }
        }

        protected void BuildFilterByParentLkpCodes(object sender, EventArgs e)
        {
            FilterByParentLkpCodes.Items.Clear();

            string lkpField = FilterByParentLkpFieldNames.Value;
            if (!string.IsNullOrEmpty(lkpField))
            {
                LookupCodeDa da = new LookupCodeDa();
                var lkpCodes = da.GetLookupsByFieldName(lkpField).Tables[0].DefaultView;
                FilterByParentLkpCodes.DataSource = lkpCodes;
                FilterByParentLkpCodes.DataBind();
            }
        }

        protected void BuildFilterByParent(object sender, EventArgs e)
        {
            string filterLkpCodeId = FilterByParentLkpCodes.Value;
            if (!string.IsNullOrEmpty(filterLkpCodeId))
            {
                LookupCodeDa da = new LookupCodeDa();
                var currentChildCodes = da.GetChildCodesByLookupIdAndChildLookupName(int.Parse(filterLkpCodeId), CurrentLkpFieldName.Value);
                SetLookupCodeGridFilter(currentChildCodes, "ApplyToParent", LookupParentChildCode.ParentChildCodeId);
            }
        }

        private void SetLookupCodeGridFilter(DataTable filterTable, string filterPrefix, string priKeyField)
        {
            DataView view = filterTable.DefaultView;
            foreach (GridViewRow row in LookupCodeGrid.Rows)
            {
                CheckBox filterCheckBox = row.FindControl(filterPrefix) as CheckBox;
                HiddenField filterPriKeyField = row.FindControl(filterPrefix + "Id") as HiddenField;
                string lkpCodeIdValue = LookupCodeGrid.DataKeys[row.RowIndex][LookupCode.LookupCodeId].ToString();
                // reset filters
                filterCheckBox.Checked = false;
                filterPriKeyField.Value = string.Empty;

                // validate real row (i.e., has pri key)
                if (!string.IsNullOrEmpty(lkpCodeIdValue))
                {
                    int lkpCodeId = int.Parse(lkpCodeIdValue);
                    view.RowFilter = LookupCodeAttribute.LookupCodeId + " = " + lkpCodeId;
                    if (view.Count > 0)
                    {
                        string filterPriKey = view[0][priKeyField].ToString();
                        // check box and set pri key with valid value
                        filterCheckBox.Checked = !string.IsNullOrEmpty(filterPriKey);
                        filterPriKeyField.Value = filterPriKey;
                    }
                }
            }
        }

        #endregion

        #region click events

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveClick(object sender, EventArgs e)
        {
            // save/update
            Save();
            // re-bind to reflect changes
            BuildLookupCodeList(CurrentLkpFieldName.Value);
        }

        #endregion

        #region GRID events

        /// <summary>
        /// During binding, set associated lookup disease attribute (if applicable)
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetDiseaseAttribute(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // account for blank row keys
                int? lkpCodeId = null;
                object lkpCodeIdValue = DataBinder.Eval(e.Row.DataItem, LookupCode.LookupCodeId);
                if (!string.IsNullOrEmpty(lkpCodeIdValue.ToString()))
                {
                    lkpCodeId = (int)lkpCodeIdValue;
                }

                // set disease attribute
                CheckBox diseaseAttribute = e.Row.FindControl("DiseaseAttribute") as CheckBox;
                HiddenField diseaseAttributeId = e.Row.FindControl("DiseaseAttributeId") as HiddenField;
                // check if current code has disease attribute
                if (lkpCodeId.HasValue && _diseaseAttributeLookup.ContainsKey(lkpCodeId.Value))
                {
                    int lkpCodeAttributeId = _diseaseAttributeLookup[lkpCodeId.Value];
                    diseaseAttributeId.Value = lkpCodeAttributeId.ToString();
                    diseaseAttribute.Checked = true;
                }
            }
        }

        /// <summary>
        /// Refresh list of lookup codes after deletion.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void RebindOnDelete(object sender, GridViewDeletedEventArgs e)
        {
            bool hasValues = BuildLookupCodeList(CurrentLkpFieldName.Value);
            // when deleting and no values exists, redirect to main interface
            if (!hasValues)
            {
                Response.Redirect("LookupCode_Edit.aspx?diseaseId=" + QueryDiseaseId);
            }
        }

        /// <summary>
        /// Supress/Show relevant columns
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void SetVisibleColumns()
        {
            // only show apply to disease when filtering by disase
            var diseaseAttributeColumn = LookupCodeGrid.Columns[0];
            var filterByAttributeColumn = LookupCodeGrid.Columns[1];
            var filterByParentLookupColumn = LookupCodeGrid.Columns[2];
            var lkpOrderColumn = LookupCodeGrid.Columns[3];
            if (QueryDiseaseId.HasValue)
            {
                diseaseAttributeColumn.Visible = true;
                filterByAttributeColumn.Visible = false;
                filterByParentLookupColumn.Visible = false;
                lkpOrderColumn.Visible = false;
            }
            else
            {
                diseaseAttributeColumn.Visible = false;
                lkpOrderColumn.Visible = true;
                bool filyerByAttribute = FilterBy.Value == "Attribute" && !string.IsNullOrEmpty(FilterByAttributeValues.Value);
                bool filterByParent = FilterBy.Value != "Attribute" && !string.IsNullOrEmpty(FilterByParentLkpCodes.Value);
                if (filyerByAttribute)
                {
                    filterByAttributeColumn.Visible = true;
                    filterByParentLookupColumn.Visible = false;
                }
                else if (filterByParent)
                {
                    filterByAttributeColumn.Visible = false;
                    filterByParentLookupColumn.Visible = true;
                }
                else
                {
                    filterByAttributeColumn.Visible = false;
                    filterByParentLookupColumn.Visible = false;
                }
            }
        }

        #endregion

        #region CRUD

        /// <summary>
        /// Save's all "dirty" rows as well as update/delete association to current disease
        /// </summary>
        private void Save()
        {
            // validation
            List<string> existingCodes = new List<string>();
            List<string> duplicateCodes = new List<string>();
            // check each row, need to check for associate with disease
            foreach (GridViewRow row in LookupCodeGrid.Rows)
            {
                int? lkpCodeId = null;
                object rowLkpCodeId = LookupCodeGrid.DataKeys[row.RowIndex][LookupCode.LookupCodeId];
                if (!string.IsNullOrEmpty(rowLkpCodeId.ToString()))
                {
                    lkpCodeId = (int)rowLkpCodeId;
                }
                bool isDirtyRow = LookupCodeGrid.DirtyGridRows.Contains(row);
                ICaisisInputControl lkpCodeField = row.FindControl("LkpCode") as ICaisisInputControl;
                // validate empty values, duplicates, etc...
                if (!string.IsNullOrEmpty(lkpCodeField.Value))
                {
                    if (!lkpCodeId.HasValue && existingCodes.Contains(lkpCodeField.Value, StringComparer.OrdinalIgnoreCase))
                    {
                        // mark as duplicate and prevent insert
                        duplicateCodes.Add(lkpCodeField.Value);
                        isDirtyRow = false;
                        lkpCodeId = null;
                    }
                    // track running list
                    else
                    {
                        existingCodes.Add(lkpCodeField.Value);
                    }
                }
                else
                {
                    isDirtyRow = false;
                    lkpCodeId = null;
                }

                // if dirty, update/insert
                if (isDirtyRow)
                {
                    // update/insert
                    LookupCode lkpCode = new LookupCode();
                    if (lkpCodeId.HasValue)
                    {
                        lkpCode.Get(lkpCodeId.Value);
                    }
                    else
                    {
                        lkpCode[LookupCode.LkpFieldName] = CurrentLkpFieldName.Value;
                    }
                    CICHelper.SetBOValues(row.Controls, lkpCode, -1);
                    lkpCode.Save();
                    // update pri key
                    lkpCodeId = (int)lkpCode[LookupCode.LookupCodeId];
                }
                // continue if valid
                if (lkpCodeId.HasValue)
                {
                    // APPLY TO DISEASE
                    CheckBox diseaseAttribute = row.FindControl("DiseaseAttribute") as CheckBox;
                    HiddenField diseaseAttributeId = row.FindControl("DiseaseAttributeId") as HiddenField;
                    if (diseaseAttribute.Checked)
                    {
                        // only insert if key not set, as already assigned
                        if (string.IsNullOrEmpty(diseaseAttributeId.Value))
                        {
                            LookupCodeAttribute lkpCodeAttribute = new LookupCodeAttribute();
                            // set required
                            lkpCodeAttribute[LookupCodeAttribute.LookupCodeId] = lkpCodeId;
                            lkpCodeAttribute[LookupCodeAttribute.AttributeId] = _lkpDiseaseAttributeId;
                            lkpCodeAttribute[LookupCodeAttribute.AttributeValue] = _diseaseName;
                            lkpCodeAttribute[LookupCodeAttribute.AttributeSuppress] = 0;
                            lkpCodeAttribute.Save();
                            // update hidden field
                            diseaseAttributeId.Value = lkpCodeAttribute[LookupCodeAttribute.LookupCodeAttributeId].ToString();
                        }
                    }
                    // if unchecking and pri key set, delete
                    else
                    {
                        if (!string.IsNullOrEmpty(diseaseAttributeId.Value))
                        {
                            int lkpCodeAttributeId = int.Parse(diseaseAttributeId.Value);
                            LookupCodeAttribute lkpCodeAttribute = new LookupCodeAttribute();
                            lkpCodeAttribute.Delete(lkpCodeAttributeId);
                            // udpate hidden field
                            diseaseAttributeId.Value = string.Empty;
                        }
                    }
                    // APPLY FILTERS: only when NOT in disease mode
                    if (!QueryDiseaseId.HasValue)
                    {
                        // APPLY TO ATTRIBUTE
                        CheckBox applyToAttribute = row.FindControl("ApplyToAttribute") as CheckBox;
                        HiddenField applyToAttributeId = row.FindControl("ApplyToAttributeId") as HiddenField;
                        if (applyToAttribute.Checked)
                        {
                            // no udpates, just inserts
                            if (string.IsNullOrEmpty(applyToAttributeId.Value))
                            {
                                LookupCodeAttribute lkpCodeAttribute = new LookupCodeAttribute();
                                lkpCodeAttribute[LookupCodeAttribute.LookupCodeId] = lkpCodeId.Value;
                                lkpCodeAttribute[LookupCodeAttribute.AttributeId] = int.Parse(FilterByAttributeNames.Value);
                                lkpCodeAttribute[LookupCodeAttribute.AttributeValue] = FilterByAttributeValues.Value;
                                lkpCodeAttribute[LookupCodeAttribute.AttributeSuppress] = 0;
                                lkpCodeAttribute.Save();
                                applyToAttributeId.Value = lkpCodeAttribute[lkpCodeAttribute.PrimaryKeyName].ToString();
                            }
                        }
                        // if unchecking, delete only if key exists
                        else if (!string.IsNullOrEmpty(applyToAttributeId.Value))
                        {
                            LookupCodeAttribute lkpCodeAttribute = new LookupCodeAttribute();
                            lkpCodeAttribute.Delete(int.Parse(applyToAttributeId.Value));
                            applyToAttributeId.Value = string.Empty;
                        }

                        // APPLY TO PARENT
                        CheckBox applyToParent = row.FindControl("ApplyToParent") as CheckBox;
                        HiddenField applyToParentId = row.FindControl("ApplyToParentId") as HiddenField;
                        if (applyToParent.Checked)
                        {
                            // no udpates, just inserts
                            if (string.IsNullOrEmpty(applyToParentId.Value))
                            {
                                LookupParentChildCode parentChildCode = new LookupParentChildCode();
                                parentChildCode[LookupParentChildCode.ParentCodeId] = int.Parse(FilterByParentLkpCodes.Value);
                                parentChildCode[LookupParentChildCode.ChildCodeId] = lkpCodeId.Value;
                                parentChildCode.Save();
                                applyToParentId.Value = parentChildCode[parentChildCode.PrimaryKeyName].ToString();
                            }
                        }
                        // if unchecking, delete only if key exists
                        else if (!string.IsNullOrEmpty(applyToParentId.Value))
                        {
                            LookupParentChildCode parentChildCode = new LookupParentChildCode();
                            parentChildCode.Delete(int.Parse(applyToParentId.Value));
                            applyToParentId.Value = string.Empty;
                        }                                             

                    }
                }
            }
            // Save new CSV values
            var bulkLkpCodesRows = (from rowCodes in BulkLkpCodes.Text.Split(System.Environment.NewLine.ToCharArray(), StringSplitOptions.RemoveEmptyEntries)
                                    let lkpCode = from code in rowCodes.Split(",".ToCharArray(), StringSplitOptions.RemoveEmptyEntries)
                                                  select code.Trim()
                                    select lkpCode).SelectMany(s => s);
            foreach (string code in bulkLkpCodesRows)
            {
                LookupCode lkpCode = new LookupCode();
                // set required fields
                lkpCode[LookupCode.LkpFieldName] = CurrentLkpFieldName.Value;
                lkpCode[LookupCode.LkpSuppress] = 0;
                // set code
                lkpCode[LookupCode.LkpCode] = code;
                // insert
                lkpCode.Save();
            }
            // reset bulk codes
            BulkLkpCodes.Text = string.Empty;

            // refresh cache for item
            CacheManager.ResetLookupCodeCache();

            // register warning for missing codes
            if (duplicateCodes.Count() > 0)
            {
                // create safe js array
                string[] duplicateCodesArray = duplicateCodes.Select(c => PageUtil.EscapeSingleQuotes(c)).ToArray();
                string clientArray = "['" + string.Join("', '", duplicateCodesArray) + "']";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "duplicateCodesMessage", "warnDuplicateCodes(" + clientArray + ");", true);
            }
        }

        private static void UpdateLookupAttributeValue(Control container, string prefix, string table)
        {
        }

        /// <summary>
        /// Deletes the specified lookup code.
        /// </summary>
        /// <param name="lkpCodeId"></param>
        private void Delete(int lkpCodeId)
        {
            LookupCode lkpCode = new LookupCode();
            lkpCode.Delete(lkpCodeId);
        }

        #endregion

    }
}