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
    public partial class ORDateAndCaseSurgeon : BaseEFormControl
	{

		protected override void Page_Load(object sender, System.EventArgs e)
		{
	
			base.Page_Load(sender, e);
		

			if (Session[SessionKey.CurrentClinicDate] != null)
			{
				string s = Session[SessionKey.CurrentClinicDate].ToString();

				if ((!string.IsNullOrEmpty(s)) && string.IsNullOrEmpty(SurgDateText.Value))
				{
					SurgDateText.Value = s;
					SurgDate.Value = DateTime.Parse(s).ToShortDateString();
				}
			}


            string Surgeon = "";
            if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") && Session[SessionKey.CurrentListCrit].ToString().Length > 0)
            {
                Surgeon = Session[SessionKey.CurrentListCrit].ToString();
            }
            if (Surgeon.Length > 0 && string.IsNullOrEmpty(CaseSurgeonField.Value))
            {
                if (Surgeon.IndexOf(",") > -1)
                {
                    Surgeon = Surgeon.Remove(Surgeon.IndexOf(","));
                }
                CaseSurgeonField.Value = Surgeon;
            }




		}
	}
}
