namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	/// <summary>
	///		Summary description for DiagnosticImaging.
	/// </summary>
	public partial class DiagnosticImaging : BaseEFormControl
	{

		protected override void Page_Load(object sender, EventArgs e)
		{
			//calc prostate volume based on height, width and length
			string strJs = ImgProsVolume.ClientID+".value = calcProstateVolume("+ImgProsLength.ClientID+".value, "+ImgProsWidth.ClientID+".value, "+ImgProsHeight.ClientID+".value); " + ImgAvgDim.ClientID+".value = calcAvgDimension("+ImgProsLength.ClientID+".value, "+ImgProsWidth.ClientID+".value, "+ImgProsHeight.ClientID+".value); ";

			ImgProsLength.Attributes.Add("onBlur", strJs);
			ImgProsHeight.Attributes.Add("onBlur", strJs);
			ImgProsWidth.Attributes.Add("onBlur", strJs);
			
			base.Page_Load (sender, e);
		}

	}
}
