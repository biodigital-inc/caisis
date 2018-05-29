namespace Caisis.UI.Modules.HeadNeck.Eforms
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
    ///		Summary description for OropharynxProcOperativeDetails.
	/// </summary>
    public partial class OropharynxProcOperativeDetails : BaseEFormControl
    {

        protected override void Page_Load(object sender, EventArgs e)
        {

            ListItem defaultIns = new ListItem();
            defaultIns.Value = CaisisConfiguration.GetWebConfigValue("institutionName");
            defaultIns.Text = CaisisConfiguration.GetWebConfigValue("institutionShortName");
            OpInstitutionDefaultBtn.Items.Add(defaultIns);

            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

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