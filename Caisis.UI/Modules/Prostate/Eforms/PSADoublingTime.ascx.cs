namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	using Caisis.DataAccess;

	/// <summary>
	///		Summary description for ChiefComplaint.
	/// </summary>
    public partial class PSADoublingTime : BaseEFormControl
	{

		protected override void Page_Load(object sender, EventArgs e)
		{
			//if (!Page.IsPostBack)
			//{
			//	this.LoadPhysicianList();
			//}

			base.Page_Load (sender, e);

            BuildPSA_DT();
			
		}

        protected void BuildPSA_DT()
        {
                NomogramDa nda = new NomogramDa();
                try
                {
                    float psaDoublingTime = nda.GetPSADoublingTime(this._patientId);

                    if (psaDoublingTime != float.PositiveInfinity)
                    {
                        psaDT.Text = string.Format("{0:F2} months (calculated based on the last 3 valid PSA values).", psaDoublingTime);
                    }
                }
                catch { psaDT.Text = "n/a"; }
        }
	}
}
