namespace Caisis.UI.Modules.Thoracic.Eforms
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
    ///		Summary description for Thoracic OR Details
    /// </summary>
    public partial class ORThoracic : BaseEFormControl
    {
        protected override void Page_Load(object sender, EventArgs e)
        {
            base.Page_Load(sender, e);

            //if (Session[SessionKey.CurrentClinicDate] != null)
            //{
            //    string s = Session[SessionKey.CurrentClinicDate].ToString();

            //    if ((!string.IsNullOrEmpty(s)) && string.IsNullOrEmpty(OpDateText_1.Value))
            //    {
            //        OpDateText_1.Value = s;
            //        OpDate_1.Value = DateTime.Parse(s).ToShortDateString();
            //    }
            //}

            //string Surgeon = "";
            //if (Session[SessionKey.CurrentListType] != null && Session[SessionKey.CurrentListType].ToString().ToUpper().Equals("CLINIC") && Session[SessionKey.CurrentListCrit].ToString().Length > 0)
            //{
            //    Surgeon = Session[SessionKey.CurrentListCrit].ToString();
            //}
            //if (Surgeon.Length > 0 && string.IsNullOrEmpty(OpCaseSurgeon_1.Value))
            //{
            //    if (Surgeon.IndexOf(",") > -1)
            //    {
            //        Surgeon = Surgeon.Remove(Surgeon.IndexOf(","));
            //    }
            //    OpCaseSurgeon_1.Value = Surgeon;
            //}

            //updates Proc and path dates upon OR date
            if (!string.IsNullOrEmpty(OpDateText_1.Value))
            {
                ProcDateText_2.Value = OpDateText_1.Value;
                ProcDate_2.Value = OpDate_1.Value;

                PathDateText_2.Value = OpDateText_1.Value;
                PathDate_2.Value = OpDate_1.Value;
            }

            //updateNodeFindingSideSite(LeftLevel1NS, PathFindSide_1, PathFindSite_1, "Left", "Level 1");
            updateNodeFindingSideSite(LeftLevel2NS, PathFindSide_3, PathFindSite_3, "Left", "Level 2");
            //updateNodeFindingSideSite(LeftLevel3NS, PathFindSide_5, PathFindSite_5, "Left", "Level 3");
            updateNodeFindingSideSite(LeftLevel4NS, PathFindSide_7, PathFindSite_7, "Left", "Level 4");
            //updateNodeFindingSideSite(LeftLevel5NS, PathFindSide_9, PathFindSite_9, "Left", "Level 5");
            //updateNodeFindingSideSite(LeftLevel6NS, PathFindSide_11, PathFindSite_11, "Left", "Level 6");
            //updateNodeFindingSideSite(LeftLevel7NS, PathFindSide_13, PathFindSite_13, "Left", "Level 7");
            updateNodeFindingSideSite(LeftLevel8NS, PathFindSide_15, PathFindSite_15, "Left", "Level 8");
            updateNodeFindingSideSite(LeftLevel9NS, PathFindSide_17, PathFindSite_17, "Left", "Level 9");
            updateNodeFindingSideSite(LeftLevel10NS, PathFindSide_19, PathFindSite_19, "Left", "Level 10");
            updateNodeFindingSideSite(LeftLevel11NS, PathFindSide_21, PathFindSite_21, "Left", "Level 11");
            updateNodeFindingSideSite(LeftLevel12NS, PathFindSide_23, PathFindSite_23, "Left", "Level 12");
            updateNodeFindingSideSite(LeftLevel13NS, PathFindSide_25, PathFindSite_25, "Left", "Level 13");
            updateNodeFindingSideSite(LeftLevel14NS, PathFindSide_27, PathFindSite_27, "Left", "Level 14");

            //updateNodeFindingSideSite(RightLevel1NS, PathFindSide_2, PathFindSite_2, "Right", "Level 1");
            updateNodeFindingSideSite(RightLevel2NS, PathFindSide_4, PathFindSite_4, "Right", "Level 2");
            //updateNodeFindingSideSite(RightLevel3NS, PathFindSide_6, PathFindSite_6, "Right", "Level 3");
            updateNodeFindingSideSite(RightLevel4NS, PathFindSide_8, PathFindSite_8, "Right", "Level 4");
            //updateNodeFindingSideSite(RightLevel5NS, PathFindSide_10, PathFindSite_10, "Right", "Level 5");
            //updateNodeFindingSideSite(RightLevel6NS, PathFindSide_12, PathFindSite_12, "Right", "Level 6");
            //updateNodeFindingSideSite(RightLevel7NS, PathFindSide_14, PathFindSite_14, "Right", "Level 7");
            updateNodeFindingSideSite(RightLevel8NS, PathFindSide_16, PathFindSite_16, "Right", "Level 8");
            updateNodeFindingSideSite(RightLevel9NS, PathFindSide_18, PathFindSite_18, "Right", "Level 9");
            updateNodeFindingSideSite(RightLevel10NS, PathFindSide_20, PathFindSite_20, "Right", "Level 10");
            updateNodeFindingSideSite(RightLevel11NS, PathFindSide_22, PathFindSite_22, "Right", "Level 11");
            updateNodeFindingSideSite(RightLevel12NS, PathFindSide_24, PathFindSite_24, "Right", "Level 12");
            updateNodeFindingSideSite(RightLevel13NS, PathFindSide_26, PathFindSite_26, "Right", "Level 13");
            updateNodeFindingSideSite(RightLevel14NS, PathFindSide_28, PathFindSite_28, "Right", "Level 14");

            updateNodeFindingSideSite(MidlineLevel1NS, PathFindSide_29, PathFindSite_29, "Midline", "Level 1");
            //updateNodeFindingSideSite(MidlineLevel2NS, PathFindSide_30, PathFindSite_30, "Midline", "Level 2");
            updateNodeFindingSideSite(MidlineLevel3NS, PathFindSide_31, PathFindSite_31, "Midline", "Level 3");
            //updateNodeFindingSideSite(MidlineLevel4NS, PathFindSide_32, PathFindSite_32, "Midline", "Level 4");
            updateNodeFindingSideSite(MidlineLevel5NS, PathFindSide_33, PathFindSite_33, "Midline", "Level 5");
            updateNodeFindingSideSite(MidlineLevel6NS, PathFindSide_34, PathFindSite_34, "Midline", "Level 6");
            updateNodeFindingSideSite(MidlineLevel7NS, PathFindSide_35, PathFindSite_35, "Midline", "Level 7");
            //updateNodeFindingSideSite(MidlineLevel8NS, PathFindSide_36, PathFindSite_36, "Midline", "Level 8");
            //updateNodeFindingSideSite(MidlineLevel9NS, PathFindSide_37, PathFindSite_37, "Midline", "Level 9");
            //updateNodeFindingSideSite(MidlineLevel10NS, PathFindSide_38, PathFindSite_38, "Midline", "Level 10");
            //updateNodeFindingSideSite(MidlineLevel11NS, PathFindSide_39, PathFindSite_39, "Midline", "Level 11");
            //updateNodeFindingSideSite(MidlineLevel12NS, PathFindSide_40, PathFindSite_40, "Midline", "Level 12");
            //updateNodeFindingSideSite(MidlineLevel13NS, PathFindSide_41, PathFindSite_41, "Midline", "Level 13");
            //updateNodeFindingSideSite(MidlineLevel14NS, PathFindSide_42, PathFindSite_42, "Midline", "Level 14");


            GetProtocols();
        }

        //Updates Node finding values
        protected void updateNodeFindingSideSite(EformRadioButton notSampledRadio, EformTextBox findingSide, EformTextBox findingSite, string findingSideVal, string findingSiteVal)
        {
            if (notSampledRadio.Checked == true)
            {
                findingSide.Text = findingSideVal;
                findingSite.Text = findingSiteVal;
            }
        }

        protected void GetProtocols()
        {
            PatientProtocolDa ptProtocol = new PatientProtocolDa();

            DataSet ds = ptProtocol.GetPatientProtocolsByStatus(_patientId, "06-107", "92-055", "Consented");
            if (ds.Tables[0].Rows.Count > 0)
            {
                ProtocolStatusMsgTr.Visible = true;
                ProtocolRpt.DataSource = ds.Tables[0].DefaultView;
                ProtocolRpt.DataBind();                
            }
            else
            {
                NoProtocolMsgTr.Visible = true;
                ProtocolStatusMsgTr.Visible = false;
                ProtocolStatusRptTr.Visible = false;
            }
        }
    }
}