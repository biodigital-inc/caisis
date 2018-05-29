namespace Caisis.UI.Modules.HeadNeck.Eforms
{
	using System;
	using System.Data;
	using System.Data.SqlClient;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;

	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;
	using Caisis.DataAccess;

	/// <summary>
	///		Summary description for ChiefComplaint.
	/// </summary>
    public partial class HeadNeckReconstruction : BaseEFormControl
	{

        override protected void Page_Load(object sender, EventArgs e)
        {
            GlobalInstitution.Text = CaisisConfiguration.GetWebConfigValue("institutionShortName");
            
            base.Page_Load(sender, e);
            base.SetTitle(ComponentTitle);

            //string SurgeryDate = "";
            //if (Session[SessionKey.CurrentClinicDate] != null) SurgeryDate = Session[SessionKey.CurrentClinicDate].ToString();
            //if (SurgeryDate.Length > 0)
            //{
            //    SetHiddenDateFieldPair(ProcDateText, ProcDate, SurgeryDate);
            //}
        }

	}
}
