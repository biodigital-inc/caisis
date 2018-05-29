namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for MedicalTherapyWithAbsentRecord2.
	/// </summary>
    public partial class MedicalTherapyWithAbsentRecord2 : BaseEFormControl
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            BuildMedTxHistory(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);

		}

        protected virtual void BuildMedTxHistory(int PatientID, string FormName, string FormType)
        {
            MedicalTherapyDa Da = new MedicalTherapyDa();
            DataSet Ds = new DataSet();

             Ds = Da.FormGetRecords(PatientID, FormName, FormType);


            if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
            {
                NoMedTxHxMsgTr.Visible = false;

                MedicalTxRptr.DataSource = Ds.Tables[0].DefaultView;
                MedicalTxRptr.DataBind();
            }
            else
                NoMedTxHxMsgTr.Visible = true;

        }


	}
}
