using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Caisis.UI.Modules.ProjectMgmt;

using Caisis.UI.Core.Classes.CustomControls;
using Caisis.BOL;
using System.Collections.Generic;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public abstract class ProjectMgmtAddFormBasePage : ProjectMgmtBasePage
    {
        protected List<string> diseaseStates = new List<string>();

        public ProjectMgmtAddFormBasePage()
        {
        }
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            if (!string.IsNullOrEmpty(ProjectId))
            {
                BindLabelsToBiz(int.Parse(ProjectId));

                SetTitle(int.Parse(ProjectId));
            }
        }

        /// <summary>
        /// Set Field Label values based on LOI table
        /// </summary>
        /// <param name="projectId"></param>
        protected void BindLabelsToBiz(int projectId)
        {
			IEnumerable<ProjectLetterOfIntent> bizos = BusinessObject.GetByParent<ProjectLetterOfIntent>(projectId);
			//ProjectLetterOfIntent biz = new ProjectLetterOfIntent();
			//biz.GetByParent(projectId);
            //if (biz.RecordCount > 0)
			if (bizos.Count() > 0)
            {
				ProjectLetterOfIntent biz = bizos.First();

                foreach (string colName in biz.FieldNames)
                {
                    Label lab = this.FindControl(colName) as Label;
                    if (lab != null)
                    {
                        Type colType = biz[colName].GetType();
                        if (colType.FullName.Equals("System.Byte"))
                        {
                            lab.Text = (biz[colName].ToString() == "1" ? "Yes" : "No");
                        }
                        else if (colType.FullName.Equals("System.DateTime"))
                        {
                            DateTime dateValue;
                            if (DateTime.TryParse(biz[colName].ToString(), out dateValue))
                                lab.Text = dateValue.ToShortDateString();
                            else
                                lab.Text = "";
                        }
                        else
                            lab.Text = biz[colName].ToString();
                    }

                    if (colName == ProjectLetterOfIntent.PopulationDiseaseState)
                    {
                        PopulateDiseaseState(biz[ProjectLetterOfIntent.PopulationDiseaseState].ToString());
                    }
                }
            }
        }

        protected abstract void PopulateDiseaseState(string strDiseaseState);

        private void SetTitle(int projectId)
        {
            Project projectBiz = new Project();
            projectBiz.Get(projectId);

            Control titleControl = this.FindControl("ProjectTitle");

            //if (projectBiz.RecordCount == 0)
			if (projectBiz.IsEmpty)
                return;

            if (titleControl != null
                && (titleControl is Label))
            {
                Label titleLabel = titleControl as Label;

                titleLabel.Text = projectBiz[BOL.Project.Title].ToString();

            }
        }
    }
}