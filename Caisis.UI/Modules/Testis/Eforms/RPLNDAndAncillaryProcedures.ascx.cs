namespace Caisis.UI.Modules.Testis.Eforms
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
    public partial class RPLNDAndAncillaryProcedures : BaseEFormControl
	{

        protected override void Page_Load(object sender, EventArgs e)
        {

            base.Page_Load(sender, e);

//            autoSetDates();
        }
/*
        protected void autoSetDates()
        {
            string SurgeryDate = "";
            if (Session[SessionKey.CurrentClinicDate] != null) SurgeryDate = Session[SessionKey.CurrentClinicDate].ToString();
            if (SurgeryDate.Length > 0)
            {
                SetHiddenDateFieldPair(ProcDateText_1, ProcDate_1, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_2, ProcDate_2, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_3, ProcDate_3, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_4, ProcDate_4, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_5, ProcDate_5, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_6, ProcDate_6, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_7, ProcDate_7, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_8, ProcDate_8, SurgeryDate);
            }

        }
*/

	}
}
