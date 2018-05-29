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
	//2.0 using Caisis.UI.Modules.Prostate.PaperForms;
	using Caisis.DataAccess;
	using Caisis.UI.Core.Classes.CustomControls;

    using System.Collections;
    using System.Collections.Generic;
    using System.Linq;

	/// <summary>
    ///		Summary description for PCCTCHormoneTherapy.
	/// </summary>
    public partial class PCCTCHormoneTherapy : BaseEFormControl
	{

        protected bool PriorHormoneTxExist = false;

		override protected void Page_Load(object sender, System.EventArgs e)
		{
			base.Page_Load(sender, e);
            //BuildMedTx(this._patientId, this._eformName, "Dynamic", "");
            BuildHormoneMedTx(this._patientId, this._eformName, "Dynamic");
            base.SetTitle(ComponentTitle);
		}




        protected void BuildHormoneMedTx(int PatientID, string FormName, string FormType)
        {

            MedicalTherapyDa Da = new MedicalTherapyDa();
            DataSet Ds = new DataSet();
 
            Ds = Da.FormGetRecords(PatientID, FormName, FormType);

            DataView Dv = Ds.Tables[0].DefaultView;
            Dv.RowFilter = Caisis.BOL.MedicalTherapy.MedTxType + " IN ('HORM', 'Horm', 'horm', 'HORMONE', 'Hormone', 'hormone')";


            if (Dv.Count > 0)
            {
                MedicalTherapies.DataSource = Dv;
                MedicalTherapies.DataBind();
                PriorHormoneTxExist = true;
            }
        }

        // TODO: centralize
        protected string GetEnableHiddenScript(IEnumerable<int> suffixes)
        {
            List<string> buffer = new List<string>();
            string[] sourceIds = new string[] { "MedTxDateText", "MedTxAgent", "MedTxCycle", "MedTxDose", "MedTxUnits", "MedTxSchedule", "MedTxStopDateText" };
            string destId = "MedTxType";
            foreach (int suffix in suffixes)
            {
                var sources = from id in sourceIds
                              let input = this.FindControl(id + "_" + suffix)
                              where input != null
                              let clientId = input.ClientID
                              select clientId;
                var destination = this.FindControl(destId + "_" + suffix);
                if (destination != null && sources.Count() > 0)
                {
                    buffer.Add("{ sources: ['" + string.Join("','", sources.ToArray()) + "'], target: '" + destination.ClientID + "' }");
                }
            }

            return "[" + string.Join(",", buffer.ToArray()) + "]";
        }


	}
}
