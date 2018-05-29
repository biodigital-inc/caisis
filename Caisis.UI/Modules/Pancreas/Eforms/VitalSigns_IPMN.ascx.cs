namespace Caisis.UI.Modules.Pancreas.Eforms
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
	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
    ///		Summary description for VitalSigns_IPMN.
	/// </summary>
    public partial class VitalSigns_IPMN : BaseEFormControl
	{


		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

			// calculation in utilities.js 

			// calls to client scripts to calculate Body Mass Index
            string strJS = "calculateBSAandBMI(" + BSA.ClientID + "," + BMI.ClientID + "," + Height.ClientID + ", " + Weight.ClientID + ");";

            Height.Attributes.Add("onblur", strJS);
            Weight.Attributes.Add("onblur", strJS);

		}




	}
}
