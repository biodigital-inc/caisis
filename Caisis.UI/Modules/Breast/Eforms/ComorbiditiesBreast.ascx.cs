namespace Caisis.UI.Modules.Breast.Eforms
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

	/// <summary>
    ///		Summary description for ComorbiditiesBreast.
	/// </summary>
    public partial class ComorbiditiesBreast : BaseEFormControl
	{

        protected bool PriorComorbiditiesExist = false;


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
			BuildComorbidities(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
           
		}


        override protected void BuildComorbidities(int PatientID, string FormName, string FormType)
        {
            base.BuildComorbidities(PatientID, FormName, FormType);
            if (comorbidities.Items.Count > 0) PriorComorbiditiesExist = true;
        }

		


	}
}
