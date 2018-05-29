namespace Caisis.UI.Modules.Prostate.Eforms
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
    ///		Summary description for PCCTCRadiationTherapy.
	/// </summary>
    public partial class PCCTCRadiationTherapy : BaseEFormControl
	{
        protected bool PriorRadTxExist = false;

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildXRT(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
		}

        override protected void BuildXRT(int PatientID, string FormName, string FormType)
        {
            base.BuildXRT(PatientID, FormName, FormType);
            if (XRT.DataSource != null) PriorRadTxExist = true;
        }

	}
}
