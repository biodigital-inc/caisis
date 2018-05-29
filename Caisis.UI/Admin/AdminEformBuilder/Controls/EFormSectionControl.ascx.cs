using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Caisis.UI.ClientScript.JSON;

using Caisis.BOL;

namespace Caisis.UI.Admin
{
    public partial class EFormSectionControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Set section title and build field list columns
        /// </summary>
        /// <param name="section"></param>
        public void BuildSection(EformSection section)
        {
            SectionTitle.Text = section.Title;
            ShowTitle.Checked = section.ShowTitle;

            // if section is grid, all fields in col 1
            if (section.IsGrid)
            {
                Col1.BuildSectionFields(section.Fields.AsEnumerable(), false, true);
            }
            // otherwise fill fields in columns
            else
            {
                // get a list of fields for columns
                IEnumerable<EformField> col1 = GetFields(section, 0);
                IEnumerable<EformField> col2 = GetFields(section, 1);

                // bind field lists
                Col1.BuildSectionFields(col1, false, section.IsGrid);
                Col2.BuildSectionFields(col2, false, section.IsGrid);
            }
        }

        /// <summary>
        /// Returns a lits of EformFields which belong to a section list, ordered by rowIndex asc
        /// </summary>
        /// <param name="section"></param>
        /// <param name="index"></param>
        /// <returns></returns>
        private IEnumerable<EformField> GetFields(EformSection section, int index)
        {
            var fields = from field in section.Fields
                         where field.ColIndex == index
                         orderby field.RowIndex ascending
                         select field;
            return fields;
        }

    }
}
