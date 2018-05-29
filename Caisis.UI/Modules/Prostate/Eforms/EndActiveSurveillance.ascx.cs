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
    //2.0 	using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;


	/// <summary>
    ///		Summary description for EndActiveSurveillance.
	/// </summary>
    public partial class EndActiveSurveillance : BaseEFormControl
	{

        override protected void Page_Load(object sender, System.EventArgs e)
        {
            base.Page_Load(sender, e);
            ShowActiveSurveillance();
        }

        /// <summary>
        /// Displays the patients last status
        /// </summary>
        protected void ShowActiveSurveillance()
        {
            bool ActiveSurveillanceStarted = false;
            string ActiveSurveillanceStartedDate = "";
            bool ActiveSurveillanceEnded = false;
            string ActiveSurveillanceEndedDate = "";

            StatusDa sDa = new StatusDa();
            DataSet sDs = sDa.GetStatus(this._patientId, "Prostate Cancer");

            if (sDs.Tables.Count > 0 && sDs.Tables[0].Rows.Count > 0)
            {
                DataTable sDt = sDs.Tables[0];
                DataView ActiveSurveillanceRecords = new DataView(sDt);
                ActiveSurveillanceRecords.RowFilter = BOL.Status.Status_Field + " IN ('Active Surveillance', 'Watchful Waiting')";

                if (ActiveSurveillanceRecords.Count > 0)
                {
                    ActiveSurveillanceStarted = true;
                    ActiveSurveillanceStartedDate = ActiveSurveillanceRecords[0][BOL.Status.StatusDateText].ToString();

                    DataView EndActiveSurveillanceRecords = new DataView(sDt);
                    EndActiveSurveillanceRecords.RowFilter = BOL.Status.Status_Field + " = 'End Active Surveillance'";

                    if (EndActiveSurveillanceRecords.Count > 0)
                    {
                        ActiveSurveillanceEnded = true;
                        ActiveSurveillanceEndedDate = EndActiveSurveillanceRecords[0][BOL.Status.StatusDateText].ToString();
                    }

                }
            }

            if (ActiveSurveillanceStarted && !ActiveSurveillanceEnded)
            {
                EndActiveSurveilancePanel.Visible = true;
            }

        }
	}
}
