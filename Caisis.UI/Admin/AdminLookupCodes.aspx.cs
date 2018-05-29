using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

using Caisis.DataAccess;
using Caisis.BOL;
using Caisis.Controller;

using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    /// <summary>
    /// Summary description for AdminLookupCodes.
    /// </summary>
    public partial class AdminLookupCodes : AdminBasePage
    {
        private static readonly int BLANK_LOOKUPCODE_ROWS = 10;
        private List<int> dirtyRows = new List<int>();

        protected override void Page_Load(object sender, EventArgs e)
        {


            bool requestFromMetaDataPage = false;
            // if page is launched from meta data page populate with lookup code values based on query string
            if (Request.QueryString["lookupCodeValue"] != null)
            {
                requestFromMetaDataPage = true;
                PopulateLookupFieldDropDown();
                fieldName.SelectedValue = Request.QueryString["lookupCodeValue"].ToString();
            }

            lkpName.Disabled = true;

            if (Page.IsPostBack || requestFromMetaDataPage)
            {
                //get look up codes for posted field name
                if (fieldName.SelectedValue != null && fieldName.SelectedValue.Length > 0)
                {

                    lkpName.Value = fieldName.SelectedValue;

                    LookupCodeDa lkpDa = new LookupCodeDa();
                    DataSet lkpDs = lkpDa.GetLookupsByFieldName(fieldName.SelectedValue);

                    if (lkpDs.Tables[0].Rows.Count > 0)
                    {
                        //show repeater table
                        repeaterDiv.Visible = true;
                        //hide table
                        tableDiv.Visible = false;
                        addBtn.Visible = true;

                        if (!Page.IsPostBack)
                        {
                            BindLookupCodesGrid();
                        }
                    }


                }
                else
                {
                    repeaterDiv.Visible = false;
                    tableDiv.Visible = false;
                    addBtn.Visible = false;
                }

            }
            else
            {
                //hide 
                repeaterDiv.Visible = false;
                tableDiv.Visible = false;

                //populate the lookup field name drop down
                PopulateLookupFieldDropDown();

            }
        }

        protected void AddButtonClick(object sender, CommandEventArgs e)
        {
            this.ResetFields();

            tableDiv.Visible = true;
            //this.repeaterDiv.Visible = false;
            tblAddBtn.Visible = true;
            updateBtn.Visible = false;

            lkpFieldName.Value = fieldName.SelectedValue;
        }


        protected void AddFieldNameButtonClick(object sender, CommandEventArgs e)
        {
            this.ResetFields();

            lkpName.Disabled = false;
            tableDiv.Visible = true;
            //this.repeaterDiv.Visible = false;
            tblAddBtn.Visible = true;
            updateBtn.Visible = false;

            lkpFieldName.Value = "";
            lkpName.Value = "";
            repeaterDiv.Visible = false;

            fieldName.SelectedIndex = 0;

        }

        protected void OnLookupFieldChange(object sender, EventArgs e)
        {
            BindLookupCodesGrid();
        }

        protected void BindLookupCodesGrid()
        {
            string selectedFieldName = fieldName.SelectedValue;
            if (!string.IsNullOrEmpty(selectedFieldName))
            {
                LookupCodeDa lkpDa = new LookupCodeDa();
                DataSet lkpDs = lkpDa.GetLookupsByFieldName(selectedFieldName);
                DataView view = lkpDs.Tables[0].DefaultView;
                // Add empty rows
                for (int i = 0; i < BLANK_LOOKUPCODE_ROWS; i++)
                {
                    view.AddNew();
                }
                LookupCodeGrid.DataSource = view;
                LookupCodeGrid.DataBind();
            }
        }

        /// <summary>
        /// Attaches databind event handers to CaisisInputControl in each GridRow.
        /// Values are set based on underlying DataTable and corresponding CIC Fields.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="args"></param>
        protected void WireControlDataBoundEvents(object sender, GridViewRowEventArgs args)
        {
            List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(args.Row);
            foreach (ICaisisInputControl cic in cicList)
            {
                // Add events handler which sets values on controls based on field and table name
                // Event handler added during databinding, except for selects (dropdownlist)
                (cic as Control).DataBinding += CaisisGridView.CICDataBinderHandler;
                if (cic is TextBox)
                {
                    (cic as TextBox).TextChanged += MarkGridRowDirty;
                }
                else if (cic is CheckBox)
                {
                    (cic as CheckBox).CheckedChanged += MarkGridRowDirty;
                }
            }
        }

        protected void MarkGridRowDirty(object sender, EventArgs e)
        {
            Control con = (sender as Control);
            if (con != null && (con.NamingContainer is GridViewRow))
            {
                GridViewRow row = con.NamingContainer as GridViewRow;
                int rowIndex = row.RowIndex;
                if (!dirtyRows.Contains(rowIndex))
                {
                    dirtyRows.Add(row.RowIndex);
                }
            }

        }


        /// <summary>
        /// Save/Inserts Grid Rows (Lookup Codes) rows which have changed during postbacks.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpdateLookupCodesGrid(object sender, EventArgs e)
        {
            // Save each dirty row
            foreach (int row in dirtyRows)
            {
                LookupCodeGrid.UpdateRow(row, false);
            }
            // Clear array for next edit
            dirtyRows.Clear();
            BindLookupCodesGrid();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnLookupGridRowUpdaing(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = LookupCodeGrid.Rows[e.RowIndex];
            List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(row);
            LookupCode biz = new LookupCode();
            object priKey = LookupCodeGrid.DataKeys[e.RowIndex].Value;
            // Insert/No Key Present
            if (!priKey.ToString().Equals(string.Empty))
            {
                int lkpCodeId = (int)priKey;
                biz.Get(lkpCodeId);
            }
            if (Request.Form["lkpName"] != null)
            {
                biz[LookupCode.LkpFieldName] = Request.Form["lkpName"];
            }
            else if (!string.IsNullOrEmpty(lkpFieldName.Value))
            {
                biz[LookupCode.LkpFieldName] = lkpFieldName.Value;
            }
            else if (!string.IsNullOrEmpty(fieldName.SelectedValue))
            {
                biz[LookupCode.LkpFieldName] = fieldName.SelectedValue;
            }
            else
            {
                return;
            }
            // Manually Extract values to fix issues with LkpSupress
            foreach (ICaisisInputControl cic in cicList)
            {
                if (cic is CaisisCheckBox)
                {
                    CaisisCheckBox cb = cic as CaisisCheckBox;
                    biz[cic.Field] = cb.Checked;
                }
                else
                {
                    biz[cic.Field] = cic.Value;
                }
            }
            biz.Save();
        }

        /// <summary>
        /// Handles deleting event for record in Lookup Code Grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int keyIndex = e.RowIndex;
            string priKey = LookupCodeGrid.DataKeys[keyIndex][LookupCode.LookupCodeId].ToString();
            if (!string.IsNullOrEmpty(priKey))
            {
                int lkpCodeId = int.Parse(priKey);
                LookupCode biz = new LookupCode();
                biz.Delete(lkpCodeId);
                BindLookupCodesGrid();
            }
        }

        /// <summary>
        /// Fired before grid is rendering, to show/hide blank rows
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void HideBlankGridRows(object sender, EventArgs e)
        {
            int rowCount = LookupCodeGrid.Rows.Count;
            int realRow = rowCount - BLANK_LOOKUPCODE_ROWS;
            for (int i = 0; i < rowCount; i++)
            {
                // Hide all empty rows except first
                bool hideRow = i > realRow;
                bool isBlankRow = i >= realRow;
                GridViewRow row = LookupCodeGrid.Rows[i];
                HtmlImage img = row.FindControl("ShowNextRowButton") as HtmlImage;
                ImageButton deleteImage = row.FindControl("DeleteRow") as ImageButton;
                string nextRowScript = "showNextAddRow($('" + img.ClientID + "')," + i + ");";
                // Hide all blank rows except first
                if (hideRow)
                {
                    row.CssClass = "HiddenRow";
                }
                // Show Add Button on All Blank Rows
                if (isBlankRow)
                {
                    img.Visible = true;
                    img.Attributes.Add("onclick", nextRowScript);
                }
                else
                {
                    deleteImage.Visible = true;
                }
                // Set UI Change
                List<ICaisisInputControl> cicList = PageUtil.GetCaisisInputControlsInContainer(row);
                foreach (ICaisisInputControl cic in cicList)
                {
                    string onChange = "return onRowKeyEvent(event,'" + img.ClientID + "'," + i + ");";
                    if (cic is TextBox)
                    {
                        (cic as TextBox).Attributes.Add("onkeypress", onChange);
                    }
                    else if (cic is CheckBox)
                    {
                        (cic as CheckBox).Attributes.Add("onkeypress", onChange);
                    }
                }
            }
        }

        protected void InsertButtonClick(object sender, CommandEventArgs e)
        {

            LookupCode biz = new LookupCode();
            //biz.NewRow(); // erroneous call

            //dr["LookupCodeId"]= lkpCodeId.Value;
            if (Request.Form["lkpName"] != null)
            {
                biz["LkpFieldName"] = Request.Form["lkpName"];
            }
            else
            {
                biz["LkpFieldName"] = lkpFieldName.Value;
            }
            biz["LkpCode"] = lkpValue.Value;
            biz["LkpDescription"] = lkpDescription.Value;
            biz["LkpOrder"] = PageUtil.ObjToInt(lkpOrder.Value);
            biz["LkpSuppress"] = lkpSuppress.Checked;
            biz["UpdatedBy"] = User.Identity.Name;
            biz["UpdatedTime"] = DateTime.Now;
            biz["EnteredBy"] = User.Identity.Name;
            biz["EnteredTime"] = DateTime.Now;

            biz.Save();

            if (fieldName.SelectedIndex == 0)
            {
                Server.Transfer("AdminLookupCodes.aspx");
            }
            else
            {
                this.Page_Load(sender, e);
            }
        }

        protected void UpdateButtonClick(object sender, CommandEventArgs e)
        {
            LookupCode biz = new LookupCode();
            //biz.NewRow(); // erroneous call

            biz["LookupCodeId"] = lkpCodeId.Value;
            biz["LkpFieldName"] = lkpFieldName.Value;
            biz["LkpCode"] = lkpValue.Value;
            biz["LkpDescription"] = lkpDescription.Value;
            biz["LkpOrder"] = PageUtil.ObjToInt(lkpOrder.Value);
            biz["LkpSuppress"] = lkpSuppress.Checked;
            biz["UpdatedBy"] = User.Identity.Name;
            biz["UpdatedTime"] = DateTime.Now;
            biz["EnteredBy"] = User.Identity.Name; // these are required
            biz["EnteredTime"] = DateTime.Now; // 

            biz.Save();

            this.Page_Load(sender, e);
        }

        protected void EditButtonClick(object sender, CommandEventArgs e)
        {
            tableDiv.Visible = true;

            //sally added
            //this.repeaterDiv.Visible = false;

            tblAddBtn.Visible = false;
            updateBtn.Visible = true;

            int lkpId = int.Parse(e.CommandName);
            LookupCodeDa da = new LookupCodeDa();
            DataSet ds = da.GetLookupCodesRecord(lkpId);
            DataRow dr = ds.Tables[0].Rows[0];

            lkpOrder.Value = dr[LookupCode.LkpOrder].ToString();
            lkpCodeId.Value = dr["LookupCodeId"].ToString();
            lkpFieldName.Value = dr["LkpFieldName"].ToString();
            lkpValue.Value = dr["LkpCode"].ToString();
            lkpDescription.Value = dr["LkpDescription"].ToString();
            lkpSuppress.Checked = bool.Parse(dr["LkpSuppress"].ToString());
        }

        protected void DeleteButtonClick(object sender, CommandEventArgs e)
        {
            int lkpId = int.Parse(lkpCodeId.Value);
            LookupCode lk = new LookupCode();
            lk.Delete(lkpId);

            this.ResetFields();

            this.Page_Load(sender, e);
        }

        protected void CancelButtonClick(object sender, CommandEventArgs e)
        {
            this.ResetFields();
        }

        protected void PopulateLookupFieldDropDown()
        {
            LookupCodeDa da = new LookupCodeDa();
            DataSet ds = da.GetLookupFieldNames();

            if (ds.Tables.Count > 0)
            {

                fieldName.DataSource = ds.Tables[0].DefaultView;
                fieldName.DataTextField = "LkpFieldName";
                fieldName.DataValueField = "LkpFieldName";
                fieldName.DataBind();
            }
        }


        protected void ResetFields()
        {
            tableDiv.Visible = false;

            lkpValue.Value = "";
            lkpFieldName.Value = "";
            lkpDescription.Value = "";
            lkpCodeId.Value = "";
            lkpSuppress.Checked = false;
        }
        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion
    }
}
