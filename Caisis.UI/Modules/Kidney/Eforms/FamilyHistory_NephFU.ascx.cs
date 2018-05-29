namespace Caisis.UI.Modules.Kidney.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;

	/// <summary>
    ///		Summary description for FamilyHistory_NephFU.
	/// </summary>
    public partial class FamilyHistory_NephFU : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            BuildFamMemHistory(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
		}

        protected void BuildFamMemHistory(int PatientID, string FormName, string FormType)
        {
            DataSet famMemDs, famMemDiagDs;
            FamilyMemberDa famMemHxDa = new FamilyMemberDa();
            famMemDs = famMemHxDa.FormGetFamMemRecords(PatientID, FormName, FormType);
            famMemDiagDs = famMemHxDa.FormGetFamMemDiagnosisRecords(PatientID, FormName, FormType);

            if (famMemDs.Tables.Count > 0 && famMemDs.Tables[0].Rows.Count > 0)
            {
                NoFamMemHxMsgTr.Visible = false;

                famMemDs.Tables[0].TableName = "FamilyMembers";
                famMemDiagDs.Tables[0].TableName = "FamilyMembersDiagnosis";

                DataSet famMemandDiagCoreDs = new DataSet();
                famMemandDiagCoreDs.Tables.Add(famMemDs.Tables[0].Copy());
                famMemandDiagCoreDs.Tables.Add(famMemDiagDs.Tables[0].Copy());

                famMemandDiagCoreDs.Relations.Add("myrelation", famMemandDiagCoreDs.Tables["FamilyMembers"].Columns[FamilyMember.FamilyMemberId], famMemandDiagCoreDs.Tables["FamilyMembersDiagnosis"].Columns[FamilyMember.FamilyMemberId]);

                FamilyMemHx.DataSource = famMemandDiagCoreDs.Tables["FamilyMembers"].DefaultView;
                FamilyMemHx.DataBind();
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            DataRowView dv = e.Item.DataItem as DataRowView;
            if (dv != null)
            {
                Repeater nestedRepeater = e.Item.FindControl("FamilyMemHx2") as Repeater;
                if (nestedRepeater != null)
                {
                    nestedRepeater.DataSource = dv.CreateChildView("myrelation");
                    nestedRepeater.DataBind();
                }
            }
        }

	}
}
