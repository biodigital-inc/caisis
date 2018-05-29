namespace Caisis.UI.Modules.Bone.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core;
	
	using Caisis.BOL;

	using Caisis.UI.Core.Classes;

	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;



	/// <summary>
    ///		Summary description for ProblemsAndPlansOsteo.
	/// </summary>
    public partial class ProblemsAndPlansOsteo : BaseEFormControl
	{




		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);	
			
			setPatientDisplayName();
            
			BuildPastProblemsPlans(this._patientId);
			setPastProblemsVisibility();

			BuildCommonProblems();
			BuildCommonPlans();
		}


		protected void setPastProblemsVisibility()
		{
			if (ProblemName_1.Text.Length > 0 || ProblemName_2.Text.Length > 0 || ProblemName_3.Text.Length > 0 || ProblemName_4.Text.Length > 0 || ProblemName_5.Text.Length > 0 || ProblemName_6.Text.Length > 0)
			{
				ShowPastProblemsOnLoad(false);
			}
		}


		protected void BuildPastProblemsPlans(int PatientID)
		{
			if (Session[SessionKey.CurrentListCrit] != null && Session[SessionKey.CurrentListCrit].ToString().Length > 0)
			{

				PatientDa pDa = new PatientDa();
				DataSet pDs = pDa.FormGetLastPatientProblemPlans(PatientID, Session[SessionKey.CurrentListCrit].ToString());
				if (pDs.Tables.Count > 0 && pDs.Tables[0].Rows.Count > 0)
				{
					NoPastProblemsMsgRow.Visible = false;
					ShowPastProblemsOnLoad(true);

					string currentProblemId = "";
					int currentProblemNumber = 0;
					int currentPlanNumber = 0;
					int currentProblemDataRowIndex = 0;

					pDs.Tables[0].Columns.Add("ProblemNumber");
					pDs.Tables[0].Columns.Add("PlanNumber");
					pDs.Tables[0].Columns.Add("ProblemDisplayRowSpan");
	

					for(int i = 0; i < pDs.Tables[0].Rows.Count; i++)
					{
						if (pDs.Tables[0].Rows[i]["PatientProblemId"].ToString().Equals(currentProblemId))
						{
							currentPlanNumber += 1;
							pDs.Tables[0].Rows[i]["ProblemName"] = "&nbsp;";
							pDs.Tables[0].Rows[currentProblemDataRowIndex]["ProblemDisplayRowSpan"] = (i-currentProblemDataRowIndex+1);
							pDs.Tables[0].Rows[i]["ProblemDisplayRowSpan"] = 0;
						}
						else
						{
							currentProblemNumber += 1;
							currentPlanNumber = 1;
							currentProblemDataRowIndex = i;
							pDs.Tables[0].Rows[i]["ProblemDisplayRowSpan"] = 1;
						}
						pDs.Tables[0].Rows[i]["ProblemNumber"] = currentProblemNumber.ToString();
						pDs.Tables[0].Rows[i]["PlanNumber"] = currentPlanNumber.ToString();
						currentProblemId = pDs.Tables[0].Rows[i]["PatientProblemId"].ToString();
					}


					PastProblemsRpt.DataSource = pDs.Tables[0].DefaultView;
					PastProblemsRpt.DataBind();
					ShowPastProblemsOnLoad(true);
				}
				else
				{
					ShowPastProblemsOnLoad(false);
				}
			}
		}

		protected void setPatientDisplayName()
		{
			PatientNameDisplay.Text = Session[SessionKey.PtFirstName].ToString() + " " + Session[SessionKey.PtLastName].ToString();
		}


		protected void ShowPastProblemsOnLoad(bool ShouldItShow)
		{
			hidePastProblemsScript.Visible = !ShouldItShow;  // ie. script makes past problems hidden
		}

		protected void ProblemPlansItemDataBound(Object Sender, RepeaterItemEventArgs e) 
		{

			HtmlTableCell ProblemNumberTd, ProblemCheckboxTd, ProblemNameTd;
			ProblemNumberTd = (HtmlTableCell) e.Item.FindControl("ProblemNumberTd");
			ProblemCheckboxTd = (HtmlTableCell) e.Item.FindControl("ProblemCheckboxTd");
			ProblemNameTd = (HtmlTableCell) e.Item.FindControl("ProblemNameTd");

			if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) 
			{
				int problemRowspan = Convert.ToInt32(((DataRowView) e.Item.DataItem )["ProblemDisplayRowSpan"]);

				if ( problemRowspan > 1 )
				{
					ProblemNumberTd.RowSpan = problemRowspan;
					ProblemCheckboxTd.RowSpan = problemRowspan;
					ProblemNameTd.RowSpan = problemRowspan;
				}
				else if (problemRowspan.Equals(0))
				{
					ProblemNumberTd.Visible = false;
					ProblemCheckboxTd.Visible = false;
					ProblemNameTd.Visible = false;
				}
			}
		}

		protected void BuildCommonProblems()
		{
			LookupCodeDa lDa = new LookupCodeDa();
            DataTable lDt = lDa.GetLookupCodes("Problem,Disease,Osteoporosis");

			if (lDt.Rows.Count > 0)
			{
				CommonProblems.DataSource = lDt.DefaultView;
				CommonProblems.DataBind();
			}
		}

		protected void BuildCommonPlans()
		{
			LookupCodeDa lDa = new LookupCodeDa();
            DataTable lDt = lDa.GetLookupCodes("ProblemPlan,Disease,Osteoporosis");

			if (lDt.Rows.Count > 0)
			{
				CommonPlans.DataSource = lDt.DefaultView;
				CommonPlans.DataBind();
			}
		}


	}
}
