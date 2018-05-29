using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Caisis.Security;

using Caisis.Controller;
using Caisis.UI.Core.Classes;

namespace Caisis.UI.Core.Eforms
{
	/// <summary>
	/// Summary description for EFormNarrativeText.
	/// </summary>
	public partial class EFormPrintableText : EFormBasePage
	{

		protected override void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);

			EFormController ctr = new EFormController();
			
			int eformId = Convert.ToInt32(Request.QueryString["eformId"]);

			// get record using eform id because both approved and reviewed eforms may be displayed
			DataSet eds = ctr.GetRecord(eformId);

			//DataSet eds = ctr.GetOpenRecordByName(base.EFormPatientId, base.EFormName);
			
			if(eds.Tables[0].Rows.Count > 0)
			{
				//int eformId = Convert.ToInt32(eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormId]);

				// display html from database,status must be "Previewed"
				if(eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormReport].ToString().Length > 0)
				{
					theNarrative.InnerHtml = eds.Tables[0].Rows[0][Caisis.BOL.EForm.EFormReport].ToString();	
				}
				else
				{

                    Exception ex = new Exception("No narrative present when attempting to view an approved EForm.");
                    ExceptionHandler.Publish(ex);


					// TODO: add our "You have not created a narrative, would you like to do so?" html
					string html =
						// enter free-from html below:
						@"
						<html>
							<body>
								<div style=""margin-top: 50px; padding-left: 20px;"">
								<span>
									You have not created a narrative. If you would like to do so, please
									click the Review Data button above.
								</span>
								</div>
							</body>
						</html>
						";
					theNarrative.InnerHtml = String.Format(html,this.EFormId);
				}
			}
		}

        // secure module
        override protected void OnInit(EventArgs e)
        {

            // user must have edit eform rights to get to it (currently no view eform permission)
            if (Request.Path.IndexOf("EFormList") > -1 && !PermissionManager.HasPermission("EditEForm"))
            {
                Response.Redirect("EFormList.aspx?msg=InvalidEditPermission", true);
            }

        }

	}
}
