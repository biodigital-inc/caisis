namespace Caisis.UI.Modules.Colorectal.Eforms
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
    ///		Summary description for AppendixProcedure.
    /// </summary>
    public partial class AppendixProcedure : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {

            base.Page_Load(sender, e);

            string SurgeryDate = "";
            if (Session[SessionKey.CurrentClinicDate] != null) SurgeryDate = Session[SessionKey.CurrentClinicDate].ToString();

            //Show/Hides Resection performed Yes/No section
            foreach (ListItem Debulkingli in DebulkingRadio.Items)
            {
                string updateDebulkingStr = "DebulkingYesNo('" + Debulkingli.Value + "');";
                Debulkingli.Attributes.Add("onclick", updateDebulkingStr);
                if (Debulkingli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "updateDebulkingStrjScript", updateDebulkingStr, true);
                }

            }

            //Show/Hides PSM and Resection procs tables
            foreach (ListItem Resectionli in ResectionRadio.Items)
            {
                string updateResectionStr = "ResectionYesNo('" + Resectionli.Value + "');";
                Resectionli.Attributes.Add("onclick", updateResectionStr);
                if (Resectionli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "updateResectionStrjScript", updateResectionStr, true);
                }

            }

            //updates Debulking procedure details
            foreach (ListItem procSiteLi in ProcSite_82.Items)
            {
                string updateProcDetailsStr = "updateProcDetails('" + procSiteLi.Value + "','" + ProcDateText_82.ClientID + "', '" + ProcDate_82.ClientID + "','" + ProcName_82.ClientID + "','" + SurgeryDate + "', '" + SurgeryDate + "','Debulking','" + ProcPrimary_82.ClientID + "','1','" + ProcInstitution_82.ClientID + "','Memorial Sloan Kettering Cancer Center','" + ProcQuality_82.ClientID + "','STD');";

                procSiteLi.Attributes.Add("onclick", updateProcDetailsStr);
                if (procSiteLi.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "updateProcDetailsStrjScript", updateProcDetailsStr, true);
                }
            }            

            //updates IPPort procedure on yes/no
            foreach (ListItem IPPortli in PlaceIPPort.Items)
            {
                string PlaceIPPortStr = "IPPortDoneRadio('" + IPPortli.Value + "','" + ProcDateText_83.ClientID + "', '" + SurgeryDate + "','" + ProcDate_83.ClientID + "', '" + SurgeryDate + "','" + ProcName_83.ClientID + "','Placement of IP port');";

                IPPortli.Attributes.Add("onclick", PlaceIPPortStr);
                if (IPPortli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "PlaceIPPortStrjScript", PlaceIPPortStr, true);
                }
            }

            //updates MedTex on agent(HIPEC) =  yes/no
            foreach (ListItem hipecli in HIPEC.Items)
            {
                string hipecStr = "hipecRadio('" + hipecli.Value + "','" + MedTxDateText_1.ClientID + "', '" + SurgeryDate + "','" + MedTxDate_1.ClientID + "', '" + SurgeryDate + "','" + MedTxType_1.ClientID + "','CHEMO','" + MedTxQuality_1.ClientID + "','STD','" + AbsentDateText_1.ClientID + "','" + AbsentDate_1.ClientID + "','" + TableName_1.ClientID + "','" + FieldName_1.ClientID + "','" + FieldValue_1.ClientID + "','" + AbsentReason_1.ClientID + "','" + AbsentQuality_1.ClientID + "','MedicalTherapy','MedTxType','HIPEC','Not Performed','STD');";

                hipecli.Attributes.Add("onclick", hipecStr);
                if (hipecli.Selected)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "hipecStrjScript", hipecStr, true);
                }
            }
        }
    }
}