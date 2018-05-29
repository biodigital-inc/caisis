namespace Caisis.UI.Modules.Prostate.Eforms
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
	///		Summary description for ProstateBiopsies.
	/// </summary>
	public partial class ProstateBiopsies : BaseEFormControl
	{









		protected override void Page_Load(object sender, EventArgs e)
		{
			SetBxGleasonGrades(BxGG1, BxGG2, BxGGS, BxResult);
			SetBxGleasonGrades(BxCoreGG1_1, BxCoreGG2_1, BxCoreGGS_1, BxCoreResult_1);
			SetBxGleasonGrades(BxCoreGG1_2, BxCoreGG2_2, BxCoreGGS_2, BxCoreResult_2);
			SetBxGleasonGrades(BxCoreGG1_3, BxCoreGG2_3, BxCoreGGS_3, BxCoreResult_3);
			SetBxGleasonGrades(BxCoreGG1_4, BxCoreGG2_4, BxCoreGGS_4, BxCoreResult_4);
			SetBxGleasonGrades(BxCoreGG1_5, BxCoreGG2_5, BxCoreGGS_5, BxCoreResult_5);
			SetBxGleasonGrades(BxCoreGG1_6, BxCoreGG2_6, BxCoreGGS_6, BxCoreResult_6);
			SetBxGleasonGrades(BxCoreGG1_7, BxCoreGG2_7, BxCoreGGS_7, BxCoreResult_7);
			SetBxGleasonGrades(BxCoreGG1_8, BxCoreGG2_8, BxCoreGGS_8, BxCoreResult_8);

			base.Page_Load (sender, e);
		}

		private void SetBxGleasonGrades(EformTextBox gg1, EformTextBox gg2, EformTextBox ggs, EformSelect result)
		{
			gg1.Attributes.Add("OnBlur", "validateGleason("+gg1.ClientID+"," + gg2.ClientID + ", " + ggs.ClientID + ", false); calcResult(" + ggs.ClientID + ", '" + result.ClientID + "');");
			gg2.Attributes.Add("OnBlur", "validateGleason("+gg1.ClientID+"," + gg2.ClientID + ", " + ggs.ClientID + ", false); calcResult(" + ggs.ClientID + ", '" + result.ClientID + "');");
			ggs.Attributes.Add("OnBlur", "validateGleason("+gg1.ClientID+"," + gg2.ClientID + ", " + ggs.ClientID + ", false); calcResult(" + ggs.ClientID + ", '" + result.ClientID + "');");
		}
	}

	/*public class BiopsyTextBox : EformTextBox
	{
		private bool _calcGleason;

		public bool CalcGleason
		{
			get
			{
				return _calcGleason;
			}
			set
			{
				__calcGleason = value;
			}
		} 

		protected override void OnInit(EventArgs e) 
		{
			if(CalcGleason)
			{
				SetBxGleasonGrades(....);
			}

			base.OnInit(e);
		}
	}*/
}
