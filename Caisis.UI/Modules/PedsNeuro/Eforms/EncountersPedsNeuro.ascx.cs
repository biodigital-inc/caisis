namespace Caisis.UI.Modules.Neuro.Eforms
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.BOL;
    using Caisis.UI.Core.Classes;
    using Caisis.UI.Core.Classes.CustomControls;
    using Caisis.DataAccess;

    /// <summary>
    ///		Summary description for Peds Neuro Encounters
    /// </summary>
    public partial class EncountersPedsNeuro : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            //gets all existing encounters of the patient
            GetEncounters(this._patientId, this._eformName, "Dynamic");
        }

        protected void GetEncounters(int PatientID, string FormName, string FormType)
        {
            DataSet EncDS, EncROSDS;
            EncounterDa EncDa = new EncounterDa();
            EncDS = EncDa.FormGetRecords(PatientID, FormName, FormType);
            EncROSDS = EncDa.FormGetEncROSRecords(PatientID, FormName, FormType);

            if (EncDS.Tables.Count > 0 && EncDS.Tables[0].Rows.Count > 0)
            {
                NoPedsNeuroEncMsgTr.Style.Add("display", "none");

                EncDS.Tables[0].TableName = "Encounters";
                EncROSDS.Tables[0].TableName = "EncReviewOfSystems";

                DataSet EncROSCoreDs = new DataSet();
                EncROSCoreDs.Tables.Add(EncDS.Tables[0].Copy());
                EncROSCoreDs.Tables.Add(EncROSDS.Tables[0].Copy());

                EncROSCoreDs.Relations.Add("myrelation", EncROSCoreDs.Tables["Encounters"].Columns[Encounter.EncounterId], EncROSCoreDs.Tables["EncReviewOfSystems"].Columns[Encounter.EncounterId]);


                PedsNeuroEncountersRpt.DataSource = EncROSCoreDs.Tables["Encounters"].DefaultView;
                PedsNeuroEncountersRpt.DataBind();
            }
            else
            {
                NoPedsNeuroEncMsgTr.Style.Add("display", "block");
                PrevPedsNeuroEncRptHdr.Visible = false;
            }

        }

        override protected void EFormRepeaterOnDataBound(Object Sender, RepeaterItemEventArgs e)
        {

            base.EFormRepeaterOnDataBound(Sender, e);

            DataRowView dv = e.Item.DataItem as DataRowView;
            if (dv != null)
            {
                Repeater nestedRepeater = e.Item.FindControl("PedsNeuroROSRpt") as Repeater;
                if (nestedRepeater != null)
                {
                    nestedRepeater.DataSource = dv.CreateChildView("myrelation");
                    nestedRepeater.DataBind();
                }
            }
        }
    }
}
