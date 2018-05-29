using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Linq;

using Caisis.BOL;
using Caisis.UI.Core.Classes;
using Caisis.Controller;
using Caisis.DataAccess;

namespace Caisis.UI.Admin
{
	/// <summary>
	/// Summary description for AdminLookupCodesRefresh.
	/// </summary>
	public partial class AdminLookupCodesDataIntegrity : AdminBasePage
	{
        private Hashtable hstFieldDataType = new Hashtable();
        private Hashtable hstFieldIsNullable = new Hashtable();
        
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			base.Page_Load(sender, e);
			if (!Page.IsPostBack)
			{
			    loadTableDefs();
			}
			txtNewValue.Enabled = false;
			btnRecode.Attributes.Add("onclick","return confirm(lblRecodeInfo.innerHTML);");
		}

        /// <summary>
        /// Builds the field metatada for the specified disease
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BuildFieldMetadata(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var diseaseMetadata = DataBinder.Eval(e.Item.DataItem, "Metadata");
                var metaGrid = e.Item.FindControl("FieldMetadataGrid") as GridView;
                metaGrid.DataSource = diseaseMetadata;
                metaGrid.DataBind();
            }
        }

		private void loadTableDefs()
		{
            MetadataNewDa MNDa = new MetadataNewDa();
            DataTable tableDefsDt = MNDa.GetMetaTables();
                
            ddlTableDefs.DataSource = tableDefsDt;
            ddlTableDefs.DataTextField = "TableName";

            ddlTableDefs.DataValueField = "TableId";
            
            ddlTableDefs.DataBind();	
            ddlTableDefs.Items.Insert(0,"  ");
            ddlTableDefs.SelectedIndex = 0;
            emptyFieldNames();		
		}
		
        private void loadFieldNames(int tableId)
        {
            LookupCodeDataIntegrityDa diDa = new LookupCodeDataIntegrityDa();
            DataTable FieldNamesDt = diDa.GetColumnNames(tableId);
            ddlFieldNames.DataSource = FieldNamesDt;
            ddlFieldNames.DataTextField = "FieldName";
            ddlFieldNames.DataValueField = "FieldId";
            ddlFieldNames.DataBind();
            ddlFieldNames.Items.Insert(0, "  ");
            ddlFieldNames.SelectedIndex = 0;
            clearFieldValues();

            //For data type check on server and client
            string cn;
            string dt;
            string isn;
            string concat = "";
            hstFieldDataType.Clear();
            hstFieldIsNullable.Clear();
            ltrDataTypes.Text = "<script>var columns=new Array(";

            for (int i = 0; i < FieldNamesDt.Rows.Count; i++)
            {
                cn = FieldNamesDt.Rows[i]["FieldName"].ToString();
                dt = FieldNamesDt.Rows[i]["FieldDataType"].ToString();
                //is nullable? does it have an equivalent in the metadatatable schema?
                //should FieldRequired or FieldMin/FieldMax or other be considered for input validation?
                //OLD version, using SQL schema datatable:
                //isn = FieldNamesDt.Rows[i]["IS_NULLABLE"].ToString();
                isn = "False";
                if (!hstFieldDataType.ContainsKey(cn))
                {
                    hstFieldDataType.Add(cn, dt);
                    hstFieldIsNullable.Add(cn, isn);
                    ltrDataTypes.Text = ltrDataTypes.Text + concat + " new Array('" + cn + "','" + dt + "', '" + isn + "')";
                    concat = ",";
                }
            }
            ltrDataTypes.Text = ltrDataTypes.Text + ")</script>";

        }
        private void emptyFieldNames()
        {
            ddlFieldNames.Items.Clear();
            ddlFieldNames.Items.Insert(0,"--Select table first--");
            ddlFieldNames.SelectedIndex = 0;
            hstFieldDataType.Clear();
            hstFieldIsNullable.Clear();
            clearFieldValues();		
        }
        private void loadFieldValues()
        {
            string fieldName;
            string tableName;
            int fieldId;
            fieldName = ddlFieldNames.SelectedItem.Text;
            tableName = ddlTableDefs.SelectedItem.Text;
            fieldId = int.Parse(ddlFieldNames.SelectedValue);
            
            if (getSelectedFieldId() > -1)
            {
                char nbsp2 = '\u00A0' ; // no-break space
                string pad = new string( nbsp2, 10 ) ;
                ddlFieldValues.Items.Clear();
                LookupCodeDataIntegrityDa diDa = new LookupCodeDataIntegrityDa();
                DataTable FieldValuesDt = diDa.GetFieldValues(fieldId,tableName, fieldName);
                //simple two-column solution. Put Count first with 'enough' padding
                for(int i = 0;i < FieldValuesDt.Rows.Count;i++)
                {
                    string count = FieldValuesDt.Rows[i]["Count"].ToString();
                    string text = count + pad;
                    text = text.Substring(0,10);
                    string strValue = FieldValuesDt.Rows[i]["theValue"].ToString();
                    ListItem li = new ListItem(text + strValue,strValue);
                    ddlFieldValues.Items.Add(li);
                }
                ddlFieldValues.Attributes.Add("onChange","javascript:valueChanged();");
                btnRecode.Enabled = false;

                /*
                MetadataNewDa MNDa = new MetadataNewDa();
                
                DataTable dtFieldInfo = MNDa.GetAMetaField(fieldId);//diDa.GetFieldMetaDataRecord(fieldId);
                dgFieldInfo.DataSource = dtFieldInfo;
                dgFieldInfo.DataBind();
                DataTable dtFieldAttributes = MNDa.GetAttributeValuesForAMetaField(fieldId);
                dgFieldAttributes.DataSource = dtFieldAttributes;
                dgFieldAttributes.DataBind();
                 */

                lblShowFieldInfo.Text = "Show details";

                // build field info
                DataView fieldInfoDataSource = BOL.BusinessObject.GetByFieldsAsDataView<MetadataField>(new Dictionary<string, object> { { MetadataField.FieldId, fieldId } });
                FieldInfoGrid.DataSource = fieldInfoDataSource;
                FieldInfoGrid.DataBind();

                // build field metadata (by disease + default)
                string defaultDisease = PatientDataEntryController.DEFAULT_METADATA_KEY;
                var diseases = BusinessObject.GetAll<Disease>().Select(d => d[Disease.DiseaseName].ToString()).Concat(new string[] { defaultDisease });
                var fieldMetadataByDisease = from disease in diseases
                                             let isDefault = disease == defaultDisease
                                             let item = new
                                             {
                                                 Disease = disease,
                                                 // select disease specific metadata only
                                                 Metadata = PatientDataEntryController.GetTableFieldDiseaseMetadata(tableName, fieldName, disease).Where(m => isDefault || m.Value.Key == false).ToDictionary(m => m.Key, m => m.Value.Value)
                                             }
                                             where item.Metadata.Count() > 0
                                             orderby isDefault ? 0 : 1 ascending, disease ascending
                                             select item;
                DiseaseMetadataGrid.DataSource = fieldMetadataByDisease;
                DiseaseMetadataGrid.DataBind();
             }
        }
        private void clearFieldValues()
        {
            ddlFieldValues.Items.Clear();
            ddlFieldValues.Items.Insert(0,"--Select field first--");
            ddlFieldValues.SelectedIndex = 0;
            btnRecode.Enabled = false;
            txtNewValue.Text = "";
            lblRecodeInfo.Text = "";
            lblShowFieldInfo.Text = "";
        }
        protected void ddlTableDefs_onselectedindexchanged(object sender, EventArgs e)
		{
        
            bool ok = true;
            int tableId = -1;
            if (getSelectedTableId() > -1)
            {
                tableId = getSelectedTableId();
            }
            else
            {
                ok = false;
            }

            if (ok) {
                loadFieldNames(tableId); }
            else { 
                emptyFieldNames(); }
            txtNewValue.Text = "";
            lblRecodeInfo.Text = "";
  		}
  		
        protected void ddlFieldNames_onselectedindexchanged(object sender, EventArgs e)
        {
            if(getSelectedFieldId() > -1)
            {
                loadFieldValues();
                lblShowFieldInfo.Visible = true;
            }
            else
            {
                clearFieldValues();
            }
            txtNewValue.Text = "";
            txtNewValue.Enabled = false;
            lblRecodeInfo.Text = "";
         }
         
        protected void btnRecode_onClick(object sender, EventArgs e)
        {
            //check datatype
            //Warn if alreade used code
            //Warn if null value
            string fieldName;
            string tableName;
            string fieldValue;
            int fieldId = getSelectedFieldId();
            fieldValue = ddlFieldValues.SelectedValue;
            fieldName = ddlFieldNames.SelectedItem.Text;
            tableName = ddlTableDefs.SelectedItem.Text;
            LookupCodeDataIntegrityDa diDa = new LookupCodeDataIntegrityDa();
            diDa.recode(tableName, fieldName, fieldValue, txtNewValue.Text,fieldId);
            lblRecodeInfo.Text = lblRecodeInfoHidden.Value.Replace("will be","was");
            loadFieldValues();
        }
        private int getSelectedTableId()
        {
            string sTableId = ddlTableDefs.SelectedValue;
            int rtrn;
            if (PageUtil.IsInteger(sTableId))
            {
                rtrn = int.Parse(sTableId);
            }
            else
            {
                rtrn = -1;
            }
            return rtrn;
        }
        private int getSelectedFieldId()
        {
            string sFieldId = ddlFieldNames.SelectedValue;
            int rtrn;
            if (PageUtil.IsInteger(sFieldId))
            {
                rtrn = int.Parse(sFieldId);
            }
            else
            {
                rtrn = -1;
            }
            return rtrn;
        }
        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
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
