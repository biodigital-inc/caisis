namespace Caisis.UI.Modules.All.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	
	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;

    using Caisis.DataAccess;

	/// <summary>
	///		Summary description for PostOpPrediction.
	/// </summary>
	public partial class PostOpPrediction : BaseEFormControl
	{

        protected override void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);

            CheckIfOnProtocol(this._patientId, this._eformName, "Dynamic");


            string SurgDate = "";
            if (Session[SessionKey.CurrentClinicDate] != null) SurgDate = Session[SessionKey.CurrentClinicDate].ToString();
            if (SurgDate.Length > 0)
            {
                SetHiddenDateFieldPair(SurveyDateText_1, SurveyDate_1, SurgDate);
            }
        }


        protected void CheckIfOnProtocol(int PatientID, string FormName, string FormType)
        {
            PatientProtocolDa pDa = new PatientProtocolDa();
            DataSet pDs = pDa.FormGetRecords(PatientID, FormName, FormType);

            if (pDs.Tables.Count > 0 && pDs.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow row in pDs.Tables[0].Rows)
                {
                    if (row["ProtocolNum"].ToString().Equals("09-051")) Protocol_09_051.Visible = true;
                }
            }

            if (Protocol_09_051.Visible)
            {
                string SurgeryDate = "";
                if (Session[SessionKey.CurrentClinicDate] != null) SurgeryDate = Session[SessionKey.CurrentClinicDate].ToString();
                if (SurgeryDate.Length > 0)
                {
                    SetHiddenDateFieldPair(SurveyDateText_2, SurveyDate_2, SurgeryDate);
                }
            }

        }



	}
}
