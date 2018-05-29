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
    public partial class OtherTestisProcedures : BaseEFormControl
	{

        protected override void Page_Load(object sender, EventArgs e)
        {

            base.Page_Load(sender, e);

            string SurgeryDate = "";
            if (Session[SessionKey.CurrentClinicDate] != null) SurgeryDate = Session[SessionKey.CurrentClinicDate].ToString();
            if (SurgeryDate.Length > 0)
            {
                SetHiddenDateFieldPair(ProcDateText_9, ProcDate_9, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_10, ProcDate_10, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_11, ProcDate_11, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_12, ProcDate_12, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_13, ProcDate_13, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_14, ProcDate_14, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_15, ProcDate_15, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_16, ProcDate_16, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_17, ProcDate_17, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_18, ProcDate_18, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_19, ProcDate_19, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_20, ProcDate_20, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_21, ProcDate_21, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_22, ProcDate_22, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_23, ProcDate_23, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_24, ProcDate_24, SurgeryDate);

            }
        }


	}
}
