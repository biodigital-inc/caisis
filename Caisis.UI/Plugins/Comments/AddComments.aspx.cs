using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Caisis.UI;
using Caisis.BOL;
using Caisis.PluginFramework;
using Caisis.UI.Core.Classes;
using Caisis.Security;

namespace Caisis.UI.Core.Plugins
{

    public partial class AddComments : BasePage
    {
        override protected void Page_Load(object sender, EventArgs e)
        {
            int _patientId = int.Parse(Session[SessionKey.PatientId].ToString());

            if (PermissionManager.HasPermission(PermissionManager.EditNarrative) == false)
            {
                // always display other comments, but only allow users to add if their group permission
                
                submit.Enabled = false;
                NewComment.Attributes.Add("ReadOnly", "True");
                NewComment.Attributes.Add("onClick", "alert('Sorry. Your user group has not been granted permission to add comments.')");
            }

            if (Page.IsPostBack && NewComment.Value != "")
            {
                    // TODO: Should we add the permission?     
                    Security.SecurityController sc = new Caisis.Security.SecurityController();
       
                    Narrative narrative = new Narrative();
                    //narrative.NewRow();

                    narrative[Narrative.PatientId] = _patientId;
                    narrative[Narrative.Narrative_Field] = NewComment.Value.Trim();
                    narrative[Narrative.EnteredTime] = DateTime.Now.ToString();
                    narrative[Narrative.EnteredBy] = sc.GetUserName();
                    narrative[Narrative.NarratedBy] = sc.GetUserName();

                    narrative.Save();

                    NewComment.Value = "";
                    commentDiv.Visible = true;
                    NarrativeTitle.Visible = true;
                    NewComment.Style["height"] = "40px";

            }

			//Narrative ptNarratives = new Narrative();
			//ptNarratives.GetByParent(_patientId);
			//ptNarratives.DataSourceView.Sort = "EnteredTime DESC";
			DataView narratives = BusinessObject.GetByParentAsDataView<Narrative>(_patientId);
			narratives.Sort = "EnteredTime DESC";
            //if (ptNarratives.RecordCount > 0)
			if (narratives.Count > 0)
            {
                //RptComments.DataSource = ptNarratives.DataSourceView;
				RptComments.DataSource = narratives;
                RptComments.DataBind();
            }
            else
            {
                commentDiv.Visible = false;
                NarrativeTitle.Visible = false;
                NewComment.Style["height"] = "100px";
            }
             

        }
    }
}
