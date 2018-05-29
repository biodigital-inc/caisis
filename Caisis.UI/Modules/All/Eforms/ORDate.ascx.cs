namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core;
	
	using Caisis.BOL;

	using Caisis.UI.Core.Classes;


	/// <summary>
	///		Summary description for ORDate.
	/// </summary>
	public partial class ORDate : BaseEFormControl
	{
		//protected EformTextBox ORDateText; 
		//protected EformHidden ORDateField;
		//protected HtmlImage ORDateTextCal;

		protected override void Page_Load(object sender, System.EventArgs e)
		{
		
			// calendar function is now a property of the field
			//PageUtil.AddCalendarFunction(ORDateTextCal, ORDateText);
			//ORDateText.Attributes.Add("onBlur", "fuzzyDate(" + ORDateText.ClientID.ToString() + ", " + ORDateField.ClientID.ToString() + ");");

		
			// postback handled in base
			base.Page_Load(sender, e);
		
			// default OR date to today, must come after call to base page_load
			//if(ORDateText.Value.Equals(""))
			//{
			//	ORDateText.Value = DateTime.Now.ToShortDateString(); 
			//	ORDateField.Value = DateTime.Now.ToString();
				
			//}


			//string SurgeryDate = "";
			//if (Session[SessionKey.CurrentClinicDate] != null) SurgeryDate = Session[SessionKey.CurrentClinicDate].ToString();
			//if (SurgeryDate.Length > 0)
			//{
			//    if (string.IsNullOrEmpty(SurgDateText.Value))
			//    {
			//        SurgDateText.Value = SurgeryDate;
			//    }
			//}

			if (Session[SessionKey.CurrentClinicDate] != null)
			{
				string s = Session[SessionKey.CurrentClinicDate].ToString();

				if ((!string.IsNullOrEmpty(s)) && string.IsNullOrEmpty(SurgDateText.Value))
				{
					SurgDateText.Value = s;
                    SurgDate.Value = DateTime.Parse(s).ToShortDateString();
				}
			}
		}
	}
}
