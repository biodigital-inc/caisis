using System;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Admin
{
    public partial class Disease_EditAssociation : AdminBasePage
    {
      private   Caisis.Controller.DiseaseController dc = new Caisis.Controller.DiseaseController();

        protected string QueryTable
        {
            get
            {
                return Request.QueryString["table"];
            }
        }
        protected string QueryField
        {
            get
            {
                return Request.QueryString["field"];
            }
        }

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!Page.IsPostBack)
            {
                BuildDiseaseTables();
            }
        }

        private void BuildDiseaseTables()
        {
            if (QueryDiseaseId.HasValue && !string.IsNullOrEmpty(QueryTable) && !string.IsNullOrEmpty(QueryField))
            {
                // set grid keys
                string tablePriKeyName = BOL.BusinessObject.GetPrimaryKeyName(QueryTable);
                DiseaseTableGrid.DataKeyNames = new string[] { DiseaseAttributeValue.DiseaseAttributeValueId, tablePriKeyName };
                // get normalized table
                var tableDiseaseRecords = dc.GetTableRecordsByDisease(QueryDiseaseId.Value, QueryTable).DefaultView;
                tableDiseaseRecords.Sort = QueryField + " ASC";

                // bind to main grid
                DiseaseTableGrid.DataSource = tableDiseaseRecords;
                DiseaseTableGrid.DataBind();
            }
        }

        protected void SetMainLabel(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string diseaseValueId = DataBinder.Eval(e.Row.DataItem, DiseaseAttributeValue.DiseaseAttributeValueId).ToString();
                string field = DataBinder.Eval(e.Row.DataItem, QueryField).ToString();
                // check if there is an association
                CheckBox cb = e.Row.FindControl("DiseaseCheckBox") as CheckBox;
                cb.Checked = !string.IsNullOrEmpty(diseaseValueId);
                
                // set label field
                Label label = e.Row.FindControl("MainLabel") as Label;
                label.Text = field;
            }
        }

        protected void SaveClick(object sender, EventArgs e)
        {
            Save();
            BuildDiseaseTables();
            RegisterModalClose();
        }

        /// <summary>
        /// 
        /// </summary>
        private void RegisterModalClose()
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "closeModal", "closeDataEntry();", true);
        }

        /// <summary>
        /// 
        /// </summary>
        private void Save()
        {
            // get the name of the pri key, i.e., "TableId"
            string priKeyName = BOL.BusinessObject.GetPrimaryKeyName(QueryTable);

            // get disease attribute, i.e., "TableId"
            DiseaseAttribute_Table attributeBiz = dc.GetDiseaseAttribute(priKeyName);
            // if none exists, create
            if (attributeBiz == null)
            {                
                attributeBiz = dc.CreateDiseaseAttribute(priKeyName);
            }            

            // get required foreign keys
            int diseaseId = QueryDiseaseId.Value;
            int diseaseAttributeId = (int)attributeBiz[DiseaseAttribute_Table.DiseaseAttributeId];

            foreach (GridViewRow row in DiseaseTableGrid.DirtyGridRows)
            {
                CaisisCheckBox cb = row.FindControl("DiseaseCheckBox") as CaisisCheckBox;
                int tablePriKey = (int)DiseaseTableGrid.DataKeys[row.RowIndex][priKeyName];
                object diseaseValuePriKey = DiseaseTableGrid.DataKeys[row.RowIndex][DiseaseAttributeValue.DiseaseAttributeValueId];
                // insert if no value exists
                if (cb.Checked && string.IsNullOrEmpty(diseaseValuePriKey.ToString()))
                {
                    dc.CreateDiseaseAttributeValue(diseaseId, diseaseAttributeId, tablePriKey.ToString());
                }
                // delete if there is a pri key
                else if (!cb.Checked && !string.IsNullOrEmpty(diseaseValuePriKey.ToString()))
                {
                    int priKey = int.Parse(diseaseValuePriKey.ToString());
                    DiseaseAttributeValue biz = new DiseaseAttributeValue();
                    biz.Delete(priKey);
                }
            }
        }
    }
}