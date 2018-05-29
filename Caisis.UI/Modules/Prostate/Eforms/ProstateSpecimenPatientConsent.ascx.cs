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
    ///		Summary description for ProstateSpecimenPatientConsent.
    /// </summary
    public partial class ProstateSpecimenPatientConsent : BaseEFormControl
	{
		override protected void Page_Load(object sender, System.EventArgs e)
		{
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            EFormsDa eDa = new EFormsDa();
            DataSet eDs = eDa.GetEformsRecord(this._eformId);
            DataView eDv = new DataView(eDs.Tables[0]);

            if (eDv.Count > 0)
                EformName.Text = eDv[0][EForm.EFormName].ToString(); 
            
		}
	}
}
