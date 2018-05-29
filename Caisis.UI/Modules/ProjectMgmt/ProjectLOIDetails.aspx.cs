using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Caisis.BOL;

namespace Caisis.UI.Modules.ProjectMgmt
{
    public partial class ProjectLOIDetails : ProjectMgmtBasePage
    {
        protected const int MAX_FIELD_LENGTH = 8000;
        protected int projectId = -1;
        protected string strLOIField = "";
        private ProjectMgmtAddFormBaseControl addFormControl = null;

        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);
            this.EnableViewState = true;
            if (!string.IsNullOrEmpty(ProjectId))
            {
                projectId = Int32.Parse(ProjectId);
				//ProjectLetterOfIntent biz = new ProjectLetterOfIntent();
				//biz.GetByParent(projectId);
				//if (biz.RecordCount <= 0)
				//    return;

				var lois = BusinessObject.GetByParent<ProjectLetterOfIntent>(projectId);

				if (lois.Count() == 0)
					return;

				ProjectLetterOfIntent biz = lois.First();

                if (!string.IsNullOrEmpty(Request.QueryString["field"]))
                {
                    //LOIField.Field = Request.QueryString["field"];
                    strLOIField = Request.QueryString["field"];

                    if (!IsPostBack)
                    {
                        LOIField.Text = biz[strLOIField].ToString();
                    }
                }

                string strControlName = Request.QueryString["ControlName"];
                if (!String.IsNullOrEmpty(strControlName))
                {
                    addFormControl = (ProjectMgmtAddFormBaseControl)LoadControl(this.ResolveUrl("Controls//" + strControlName));

                    DynamicControlHolder.Controls.Add(addFormControl);

                    int loiId = Int32.Parse(biz[ProjectLetterOfIntent.ProjectLetterOfIntentId].ToString());

                    if (!IsPostBack)
                        addFormControl.Populate(loiId);
                }
            }

        }
        protected void BtnSave_Click(object sender, ImageClickEventArgs e)
        {
            if (LOIField.Text.Length > MAX_FIELD_LENGTH)
            {
                labelErrMsg.Visible = true;
                labelErrMsg.Text = "The field length is limited to " + MAX_FIELD_LENGTH + ". Current field length is " + LOIField.Text.Length.ToString();
                return;
            }
            else
            {
                labelErrMsg.Visible = false;
            }

            //ProjectLetterOfIntent biz = new ProjectLetterOfIntent();

            if (projectId == -1 && !string.IsNullOrEmpty(strLOIField))
                return;

            //biz.GetByParent(projectId);

			ProjectLetterOfIntent biz = BusinessObject.GetByParent<ProjectLetterOfIntent>(projectId).First();

            biz[strLOIField] = LOIField.Text;

            biz.Save();

            if (addFormControl != null)
            {
                int loiId = int.Parse(biz[ProjectLetterOfIntent.ProjectLetterOfIntentId].ToString());
                addFormControl.Save(loiId);
            }

            RefreshMainList();
        }

        /// <summary>
        /// Signals main list view page to reload using query string paramaters
        /// </summary>
        /// <param name="isDelete"></param>
        private void RefreshMainList()
        {
            // base query string should contain projectId
            string qs = "?projectId=" + ProjectId;

            // call script to update main list view page with query params
            base.RegisterUpdatePageScript(qs, true);
        }
    }
}
