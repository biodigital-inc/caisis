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
    ///		Summary description for ProstateSpecimenAccessionsPathology.
    /// </summary
    public partial class ProstateSpecimenAccessionsPathology : BaseEFormControl
	{
		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            SetAllGleasonGrades(PathFindGG1_1, PathFindGG2_1, PathFindGGS_1);
		}

        private void SetAllGleasonGrades(EformTextBox gg1, EformTextBox gg2, EformTextBox ggs)
        {
            gg1.Attributes.Add("OnBlur", "validateGleason(" + gg1.ClientID + "," + gg2.ClientID + ", " + ggs.ClientID + ", false); ");
            gg2.Attributes.Add("OnBlur", "validateGleason(" + gg1.ClientID + "," + gg2.ClientID + ", " + ggs.ClientID + ", false); ");
            ggs.Attributes.Add("OnBlur", "validateGleason(" + gg1.ClientID + "," + gg2.ClientID + ", " + ggs.ClientID + ", false); ");
        }
	}
}
