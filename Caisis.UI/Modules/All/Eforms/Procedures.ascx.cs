namespace Caisis.UI.Modules.All.Eforms
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
    public partial class Procedures : BaseEFormControl
	{



        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            disableEformHiddenControls = true;
        }

		override protected void Page_Load(object sender, System.EventArgs e)
		{	

			base.Page_Load(sender, e);
			

			
			BuildPhysicianJSRepeater("Fellow", FellowArray);
			BuildPhysicianJSRepeater("Attending", AttendingArray);
			BuildJSArray();


            string SurgeryDate = "";
            if (Session[SessionKey.CurrentClinicDate] != null) SurgeryDate = Session[SessionKey.CurrentClinicDate].ToString();
            if (SurgeryDate.Length > 0)
            {
                SetHiddenDateFieldPair(ProcDateText_1, ProcDate_1, SurgeryDate);
            }

		}


		protected void BuildJSArray()
		{
			ProcedureSurgeonsJSArray.Text = "procedureSurgeonsArray[0] = ['', '" + OpSurgeon.ClientID + "', '" + OpSurgeonType.ClientID  + "', '" + OpAssistant.ClientID  + "', '" + OpAssistantType.ClientID +"'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[1] = ['" + OpName_2.ClientID + "', '" + OpSurgeon_2.ClientID + "', '" + OpSurgeonType_2.ClientID + "', '" + OpAssistant_2.ClientID + "', '" + OpAssistantType_2.ClientID + "'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[2] = ['" + OpName_3.ClientID + "', '" + OpSurgeon_3.ClientID + "', '" + OpSurgeonType_3.ClientID + "', '" + OpAssistant_3.ClientID + "', '" + OpAssistantType_3.ClientID + "'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[3] = ['" + OpName_4.ClientID + "', '" + OpSurgeon_4.ClientID + "', '" + OpSurgeonType_4.ClientID  + "', '" + OpAssistant_4.ClientID  + "', '" + OpAssistantType_4.ClientID +"'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[4] = ['" + OpName_5.ClientID + "', '" + OpSurgeon_5.ClientID + "', '" + OpSurgeonType_5.ClientID  + "', '" + OpAssistant_5.ClientID  + "', '" + OpAssistantType_5.ClientID +"'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[5] = ['" + OpName_6.ClientID + "', '" + OpSurgeon_6.ClientID + "', '" + OpSurgeonType_6.ClientID  + "', '" + OpAssistant_6.ClientID  + "', '" + OpAssistantType_6.ClientID +"'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[6] = ['" + OpName_7.ClientID + "', '" + OpSurgeon_7.ClientID + "', '" + OpSurgeonType_7.ClientID  + "', '" + OpAssistant_7.ClientID  + "', '" + OpAssistantType_7.ClientID +"'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[7] = ['" + OpName_8.ClientID + "', '" + OpSurgeon_8.ClientID + "', '" + OpSurgeonType_8.ClientID  + "', '" + OpAssistant_8.ClientID  + "', '" + OpAssistantType_8.ClientID +"'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[8] = ['" + OpName_9.ClientID + "', '" + OpSurgeon_9.ClientID + "', '" + OpSurgeonType_9.ClientID  + "', '" + OpAssistant_9.ClientID  + "', '" + OpAssistantType_9.ClientID +"'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[9] = ['" + OpName_10.ClientID + "', '" + OpSurgeon_10.ClientID + "', '" + OpSurgeonType_10.ClientID + "', '" + OpAssistant_10.ClientID + "', '" + OpAssistantType_10.ClientID + "'];";
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
