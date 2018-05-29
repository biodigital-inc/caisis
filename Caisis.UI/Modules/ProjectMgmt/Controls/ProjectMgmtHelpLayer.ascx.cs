using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.BOL;
using Caisis.DataAccess;
using Caisis.UI.Core.Classes;
using Caisis.UI.Core.Classes.CustomControls;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectMgmtHelpLayer : System.Web.UI.UserControl
    {
        private string sectionName;
        private string sectionTitle;

        private DataTable metaTable;


        public string SectionName
        {
            get
            {
                return sectionName;
            }
            set
            {
                sectionName = value;
            }
        }

        public string SectionTitle
        {
            get
            {
                return sectionTitle;
            }
            set
            {
                sectionTitle = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindSection();
            }
        }

        /// <summary>
        /// Binds helper layer to current section with name and title specified 
        /// by SectionName and SectionTitle
        /// </summary>
        protected void BindSection()
        {
            BindSection(sectionName, sectionTitle);
        }

        /// <summary>
        /// Binds the helper layer to a section 'secName' with title 'secTitle'
        /// </summary>
        /// <param name="secName"></param>
        /// <param name="secTitle"></param>
        protected void BindSection(string secName, string secTitle)
        {
            // Verify section name is given
            if (!string.IsNullOrEmpty(secName))
            {

                MetadataDa mdDa = new MetadataDa();

                // Set global meta field attribute values for use in binding repeater values
                metaTable = mdDa.GetFieldMetadataByTableName("Project");

                // Bind to meta field list
                DataTable metaFieldList = mdDa.GetFieldsByTableName("Project");
                HelpDescriptionRptr.DataSource = metaFieldList;
                HelpDescriptionRptr.DataBind();

                LayerSectionTitle.InnerText = secTitle;
                LayerSectionTitle.Attributes["title"] = secTitle;
            }
        }

        /// <summary>
        /// Sets friendly field label and field description for field.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SetFieldTitleAndDescription(object sender, RepeaterItemEventArgs e)
        {
            string fieldName = DataBinder.Eval(e.Item.DataItem, "FieldName").ToString();
            string fieldLabelValue = CICHelper.GetFieldAttributeValue(metaTable, fieldName, "FieldLabel");
            string fieldDescriptionValue = CICHelper.GetFieldAttributeValue(metaTable, fieldName, "FieldDescription");

            Literal fieldTitle = e.Item.FindControl("FieldTitle") as Literal;
            Label fieldDescription = e.Item.FindControl("FieldDescription") as Label;

            fieldTitle.Text = fieldLabelValue;
            fieldDescription.Text = fieldDescriptionValue;

        }
    }
}
