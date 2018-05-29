namespace Caisis.UI.Modules.Bladder.Eforms
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
    using Caisis.UI.Core.Classes.CustomControls;
    /// <summary>
    ///		Summary description for .
    /// </summary>
    public partial class EndoORProcedures : BaseEFormControl
	{
/*
		protected EformSelect OpType, OpSurgeonType, OpAssistantType, NeuralStimulationPerformed, NeuralStimulationSurgeonType, NeuralStimulationAssistantType;
		protected EformTextBox OpNotes, NeuralStimulationNotes;
		protected EformComboBox OpSurgeon, OpAssistant, NeuralStimulationSurgeon, NeuralStimulationAssistant;


		protected EformCheckBox OpName_1, OpName_2, OpName_3, OpName_4;
		protected EformComboBox OpName_5, OpName_6, OpName_7;

		protected System.Web.UI.HtmlControls.HtmlInputCheckBox NeuralStimCheckbox;
		protected Literal CheckboxChecked;
		protected EformComboBox OpSurgeon_1, OpSurgeon_2, OpSurgeon_3, OpSurgeon_4, OpSurgeon_5, OpSurgeon_6, OpSurgeon_7;
		protected EformSelect OpSurgeonType_1, OpSurgeonType_2, OpSurgeonType_3, OpSurgeonType_4, OpSurgeonType_5, OpSurgeonType_6, OpSurgeonType_7;
		protected EformComboBox OpAssistant_1, OpAssistant_2, OpAssistant_3, OpAssistant_4, OpAssistant_5, OpAssistant_6, OpAssistant_7;
		protected EformSelect OpAssistantType_1, OpAssistantType_2, OpAssistantType_3, OpAssistantType_4, OpAssistantType_5, OpAssistantType_6, OpAssistantType_7;
		protected EformSelect OpSide_1, OpSide_2, OpSide_3, OpSide_4;
*/


		//protected EformTextBox PathResult_1, PathResult_2, PathResult_3, PathResult_4;

		override protected void Page_Load(object sender, System.EventArgs e)
		{	


			base.Page_Load(sender, e);
			


//			SetNeuralStimCheckbox();
//			SetProcedureCheckbox(OpName_1, OpSurgeon_1, OpSurgeonType_1, OpAssistant_1, OpAssistantType_1);
			SetProcedureCheckbox(OpName_2, OpSurgeon_2, OpSurgeonType_2, OpAssistant_2, OpAssistantType_2);
			SetProcedureCheckbox(OpName_3, OpSurgeon_3, OpSurgeonType_3, OpAssistant_3, OpAssistantType_3);
			SetProcedureCheckbox(OpName_4, OpSurgeon_4, OpSurgeonType_4, OpAssistant_4, OpAssistantType_4);
		}


		protected void SetProcedureCheckbox(EformCheckBox ProcedureCheckBox, EformComboBox ProcedureSurgeon, EformSelect ProcedureSurgeonType, EformComboBox ProcedureAssistant, EformSelect ProcedureAssistantType)
		{
			string CheckboxOnclickString = "copyProcedureInputValues(this, '" + OpSurgeon_1.ClientID + "', '" + ProcedureSurgeon.ClientID + "'); ";
			CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpSurgeonType_1.ClientID + "', '" + ProcedureSurgeonType.ClientID + "'); ";
			CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpAssistant_1.ClientID + "', '" + ProcedureAssistant.ClientID + "'); ";
			CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpAssistantType_1.ClientID + "', '" + ProcedureAssistantType.ClientID + "'); ";

			ProcedureCheckBox.Attributes.Add("onclick", CheckboxOnclickString);

		}


		protected void SetProcedureCombobox(EformComboBox ProcedureComboBox, EformComboBox ProcedureSurgeon, EformSelect ProcedureSurgeonType, EformComboBox ProcedureAssistant, EformSelect ProcedureAssistantType)
		{
			string CheckboxOnclickString = "copyProcedureInputValues(this, '" + OpSurgeon_1.ClientID + "', '" + ProcedureSurgeon.ClientID + "'); ";
			CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpSurgeonType_1.ClientID + "', '" + ProcedureSurgeonType.ClientID + "'); ";
			CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpAssistant_1.ClientID + "', '" + ProcedureAssistant.ClientID + "'); ";
			CheckboxOnclickString += "copyProcedureInputValues(this, '" + OpAssistantType_1.ClientID + "', '" + ProcedureAssistantType.ClientID + "'); ";

			ProcedureComboBox.OnClientEvent("onchange", CheckboxOnclickString);
//            ProcedureComboBox.Attributes.Add("onchange", CheckboxOnclickString);
		}






	}
}
