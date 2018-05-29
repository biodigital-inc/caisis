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
    ///		Summary description for RadiationTherapyWithAbsentRecord.
	/// </summary>
    public partial class RadiationTherapyWithAbsentRecord : BaseEFormControl
	{

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            BuildRadTxHistory(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);

		}

        protected virtual void BuildRadTxHistory(int PatientID, string FormName, string FormType)
        {
            RadiationTherapyDa Da = new RadiationTherapyDa();
            DataSet Ds = new DataSet();

             Ds = Da.FormGetRecords(PatientID, FormName, FormType);


            if (Ds.Tables.Count > 0 && Ds.Tables[0].Rows.Count > 0)
            {
                NoRadTxHxMsgTr.Visible = false;

                RadiationTxRptr.DataSource = Ds.Tables[0].DefaultView;
                RadiationTxRptr.DataBind();
            }
            else
                NoRadTxHxMsgTr.Visible = true;

        }


	}
}
