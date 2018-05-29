namespace Caisis.UI.Modules.Kidney.Eforms
{
    using System;
    using System.Data;
    using System.Drawing;
    using System.Web;
    using System.Web.UI.WebControls;
    using System.Web.UI.HtmlControls;

    using Caisis.UI.Core;

    using Caisis.BOL;

    using Caisis.UI.Core.Classes;

    using Caisis.DataAccess;
    using Caisis.UI.Core.Classes.CustomControls;



    /// <summary>
    ///		Summary description for Anesthesia.
    /// </summary>
    public partial class NephrectomyAndAncillaryProcs : BaseEFormControl
	{


        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            disableEformHiddenControls = true;
        }




        override protected void Page_Load(object sender, System.EventArgs e)
        {

            base.Page_Load(sender, e);


            SetProcedureCheckbox(OpName_2, OpSurgeon_2, OpSurgeonType_2, OpAssistant_2, OpAssistantType_2);
            SetProcedureCheckbox(OpName_3, OpSurgeon_3, OpSurgeonType_3, OpAssistant_3, OpAssistantType_3);
            SetProcedureCheckbox(OpName_4, OpSurgeon_4, OpSurgeonType_4, OpAssistant_4, OpAssistantType_4);
            SetProcedureCheckbox(OpName_5, OpSurgeon_5, OpSurgeonType_5, OpAssistant_5, OpAssistantType_5);
            SetProcedureCheckbox(OpName_6, OpSurgeon_6, OpSurgeonType_6, OpAssistant_6, OpAssistantType_6);
            SetProcedureCheckbox(OpName_7, OpSurgeon_7, OpSurgeonType_7, OpAssistant_7, OpAssistantType_7);

            BuildPhysicianJSRepeater("Fellow", FellowArray);
            BuildPhysicianJSRepeater("Attending", AttendingArray);
            BuildJSArray();


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
                SetHiddenDateFieldPair(ProcDateText_9, ProcDate_9, SurgeryDate);
                SetHiddenDateFieldPair(ProcDateText_10, ProcDate_10, SurgeryDate);



            }


        }


        protected void BuildJSArray()
        {
            ProcedureSurgeonsJSArray.Text = "procedureSurgeonsArray[0] = ['', '" + OpSurgeon.ClientID + "', '" + OpSurgeonType.ClientID + "', '" + OpAssistant.ClientID + "', '" + OpAssistantType.ClientID + "'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[1] = ['" + OpName_8.ClientID + "', '" + OpSurgeon_8.ClientID + "', '" + OpSurgeonType_8.ClientID + "', '" + OpAssistant_8.ClientID + "', '" + OpAssistantType_8.ClientID + "'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[2] = ['" + OpName_9.ClientID + "', '" + OpSurgeon_9.ClientID + "', '" + OpSurgeonType_9.ClientID + "', '" + OpAssistant_9.ClientID + "', '" + OpAssistantType_9.ClientID + "'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[3] = ['" + OpName_10.ClientID + "', '" + OpSurgeon_10.ClientID + "', '" + OpSurgeonType_10.ClientID + "', '" + OpAssistant_10.ClientID + "', '" + OpAssistantType_10.ClientID + "'];";
        }


        protected void BuildPhysicianJSRepeater(string PhysicianType, Repeater PhysicianRepeater)
        {

            string LkpString = "OpSurgeon,PhysicianType," + PhysicianType;


            LookupCodeDa lDa = new LookupCodeDa();
            DataTable lDt = lDa.GetLookupCodes(LkpString);
            if (lDt.Rows.Count > 0)
            {
                PhysicianRepeater.DataSource = lDt.DefaultView;
                PhysicianRepeater.DataBind();
            }
        }

        protected void SetProcedureCheckbox(EformCheckBox ProcedureCheckBox, EformComboBox ProcedureSurgeon, EformSelect ProcedureSurgeonType, EformComboBox ProcedureAssistant, EformSelect ProcedureAssistantType)
        {
            string CheckboxOnclickString = "copyProcedureInputValues(this, '" + OpSurgeon.ClientID + "', '" + ProcedureSurgeon.ClientID + "'); ";
            CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpSurgeonType.ClientID + "', '" + ProcedureSurgeonType.ClientID + "'); ";
            CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpAssistant.ClientID + "', '" + ProcedureAssistant.ClientID + "'); ";
            CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpAssistantType.ClientID + "', '" + ProcedureAssistantType.ClientID + "'); ";

            ProcedureCheckBox.Attributes.Add("onclick", CheckboxOnclickString);

        }


        protected void SetProcedureCombobox(EformComboBox ProcedureComboBox, EformComboBox ProcedureSurgeon, EformSelect ProcedureSurgeonType, EformComboBox ProcedureAssistant, EformSelect ProcedureAssistantType)
        {
            string CheckboxOnclickString = "copyProcedureInputValues(this, '" + OpSurgeon.ClientID + "', '" + ProcedureSurgeon.ClientID + "'); ";
            CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpSurgeonType.ClientID + "', '" + ProcedureSurgeonType.ClientID + "'); ";
            CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpAssistant.ClientID + "', '" + ProcedureAssistant.ClientID + "'); ";
            CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpAssistantType.ClientID + "', '" + ProcedureAssistantType.ClientID + "'); ";

            ProcedureComboBox.OnClientEvent("onfocus", "if(this.value != this.defaultValue) { " + CheckboxOnclickString + " }");
            //ProcedureComboBox.Attributes.Add("onchange", CheckboxOnclickString);
        }





	}
}
