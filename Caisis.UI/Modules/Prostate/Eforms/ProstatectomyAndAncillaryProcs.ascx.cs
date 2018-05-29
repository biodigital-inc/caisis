namespace Caisis.UI.Modules.Prostate.Eforms
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
    public partial class ProstatectomyAndAncillaryProcs : BaseEFormControl
	{
/*
		protected EformSelect OpType, OpSurgeonType, OpAssistantType, NeuralStimulationPerformed, NeuralStimulationSurgeonType, NeuralStimulationAssistantType;
		protected EformTextBox OpNotes, NeuralStimulationNotes;
		protected EformComboBox OpSurgeon, OpAssistant, NeuralStimulationSurgeon, NeuralStimulationAssistant;


		protected EformCheckBox OpName_1, OpName_2, OpName_3;
		protected EformComboBox OpName_4, OpName_5, OpName_6, OpName_7, OpName_8;

		protected System.Web.UI.HtmlControls.HtmlInputCheckBox NeuralStimCheckbox;
		protected Literal CheckboxChecked,ProcedureSurgeonsJSArray;
		protected EformComboBox OpSurgeon_1, OpSurgeon_2, OpSurgeon_3, OpSurgeon_4, OpSurgeon_5, OpSurgeon_6, OpSurgeon_7, OpSurgeon_8;
		protected EformSelect OpSurgeonType_1, OpSurgeonType_2, OpSurgeonType_3, OpSurgeonType_4, OpSurgeonType_5, OpSurgeonType_6, OpSurgeonType_7, OpSurgeonType_8;
		protected EformComboBox OpAssistant_1, OpAssistant_2, OpAssistant_3, OpAssistant_4, OpAssistant_5, OpAssistant_6, OpAssistant_7, OpAssistant_8;
		protected EformSelect OpAssistantType_1, OpAssistantType_2, OpAssistantType_3, OpAssistantType_4, OpAssistantType_5, OpAssistantType_6, OpAssistantType_7, OpAssistantType_8;
		protected EformSelect OpSide_1, OpSide_2, OpSide_3, OpSide_4;


		protected Repeater AttendingArray, FellowArray;
*/



		//protected EformTextBox PathResult_1, PathResult_2, PathResult_3, PathResult_4;

		override protected void Page_Load(object sender, System.EventArgs e)
		{	

			base.Page_Load(sender, e);
			

			SetNeuralStimCheckbox();
//			SetProcedureCheckbox(OpName_1, OpSurgeon_1, OpSurgeonType_1, OpAssistant_1, OpAssistantType_1);
//			SetProcedureCheckbox(OpName_2, OpSurgeon_2, OpSurgeonType_2, OpAssistant_2, OpAssistantType_2);
			SetProcedureCheckbox(OpName_3, OpSurgeon_3, OpSurgeonType_3, OpAssistant_3, OpAssistantType_3);
            SetProcedureCheckbox(OpName_4, OpSurgeon_4, OpSurgeonType_4, OpAssistant_4, OpAssistantType_4);
            SetProcedureCheckbox(OpName_5, OpSurgeon_5, OpSurgeonType_5, OpAssistant_5, OpAssistantType_5);

            SetProcedureCombobox(OpName_6, OpSurgeon_6, OpSurgeonType_6, OpAssistant_6, OpAssistantType_6);
			
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
			ProcedureSurgeonsJSArray.Text = "procedureSurgeonsArray[0] = ['', '" + OpSurgeon.ClientID + "', '" + OpSurgeonType.ClientID  + "', '" + OpAssistant.ClientID  + "', '" + OpAssistantType.ClientID +"'];";
//			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[1] = ['" + OpName_4.ClientID + "', '" + OpSurgeon_4.ClientID + "', '" + OpSurgeonType_4.ClientID  + "', '" + OpAssistant_4.ClientID  + "', '" + OpAssistantType_4.ClientID +"'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[1] = ['" + OpName_5.ClientID + "', '" + OpSurgeon_5.ClientID + "', '" + OpSurgeonType_5.ClientID  + "', '" + OpAssistant_5.ClientID  + "', '" + OpAssistantType_5.ClientID +"'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[2] = ['" + OpName_6.ClientID + "', '" + OpSurgeon_6.ClientID + "', '" + OpSurgeonType_6.ClientID  + "', '" + OpAssistant_6.ClientID  + "', '" + OpAssistantType_6.ClientID +"'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[3] = ['" + OpName_7.ClientID + "', '" + OpSurgeon_7.ClientID + "', '" + OpSurgeonType_7.ClientID  + "', '" + OpAssistant_7.ClientID  + "', '" + OpAssistantType_7.ClientID +"'];";
			ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[4] = ['" + OpName_8.ClientID + "', '" + OpSurgeon_8.ClientID + "', '" + OpSurgeonType_8.ClientID  + "', '" + OpAssistant_8.ClientID  + "', '" + OpAssistantType_8.ClientID +"'];";
            ProcedureSurgeonsJSArray.Text += "procedureSurgeonsArray[5] = ['" + OpName_9.ClientID + "', '" + OpSurgeon_9.ClientID + "', '" + OpSurgeonType_9.ClientID  + "', '" + OpAssistant_9.ClientID  + "', '" + OpAssistantType_9.ClientID +"'];";
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


		protected void SetNeuralStimCheckbox()
		{
			string CheckboxOnclickString = "copyEFormInputValues('" + OpSurgeon.ClientID + "', '" + NeuralStimulationSurgeon.ClientID + "'); ";
			CheckboxOnclickString += "copyEFormInputValues('" + OpSurgeonType.ClientID + "', '" + NeuralStimulationSurgeonType.ClientID + "'); ";
			CheckboxOnclickString += "copyEFormInputValues('" + OpAssistant.ClientID + "', '" + NeuralStimulationAssistant.ClientID + "'); ";
			CheckboxOnclickString += "copyEFormInputValues('" + OpAssistantType.ClientID + "', '" + NeuralStimulationAssistantType.ClientID + "'); ";
			CheckboxOnclickString += "copyEFormInputValues('" + OpNotes.ClientID + "', '" + NeuralStimulationNotes.ClientID + "'); ";
			CheckboxOnclickString += "switchCheck();";

			NeuralStimCheckbox.Attributes.Add("onclick", CheckboxOnclickString);

			// brandon: EformControls are now (mostly) WebControls
			// if (NeuralStimulationSurgeon.Value.Length > 0 || NeuralStimulationSurgeonType.Value.Length > 0 || NeuralStimulationAssistant.Value.Length > 0 || NeuralStimulationAssistantType.Value.Length > 0)
			if ((NeuralStimulationSurgeon.Value != null && NeuralStimulationSurgeon.Value.Length > 0) ||
                (NeuralStimulationSurgeonType.Value != null && NeuralStimulationSurgeonType.Value.Length > 0) ||
				(NeuralStimulationAssistant.Value != null && NeuralStimulationAssistant.Value.Length > 0) ||
                (NeuralStimulationAssistantType.Value != null && NeuralStimulationAssistantType.Value.Length > 0) ||
				(NeuralStimulationNotes.Text != null && NeuralStimulationNotes.Text.Length > 0))
			{
				NeuralStimCheckbox.Checked = true;
				CheckboxChecked.Text = "true";
			}

		}

		/*
		private void AddOnBlurEvent(EformComboBox cb, int index)
		{
			// get the "base" of the client id
			string idbase = cb.ClientID.Substring(0, cb.ClientID.IndexOf("OpName"));
			StringBuilder jsarray = new StringBuilder("[");
			jsarray.Append("'" + idbase + "OpSurgeon_" + index + "',");
			jsarray.Append("'" + idbase + "OpSurgeonType_" + index + "',");
			jsarray.Append("'" + idbase + "OpAssistant_" + index + "',");
			jsarray.Append("'" + idbase + "OpAssistantType_" + index + "',");
			jsarray.Append("'" + idbase + "OpSide_" + index + "']");
			//jsarray.Append("'" + idbase + "PathResult_" + index + "']");

			cb.OnClientEvent("onblur", "checkEnableRow(this, " + jsarray.ToString() + ")");
		}

		private void EnableIfData(EformComboBox opname, EformComboBox opsurgeon, EformSelect opsurgtype, 
			EformComboBox opassistant, EformSelect opassistanttype, EformSelect opside)
		{
			if (opname.Value != null && !"".Equals(opname.Value))
			{
				opsurgeon.Disabled = false;
				opsurgtype.Disabled = false;
				opassistant.Disabled = false;
				opassistanttype.Disabled = false;
				opside.Disabled = false;
				//pathresult.Disabled = false;
			}
		}
		*/


	}
}
