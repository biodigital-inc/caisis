namespace Caisis.UI.Modules.Prostate.Eforms
{
	using System;
	using System.Data;
	using System.Drawing;
	using System.Text;
	using System.Web;
	using System.Web.UI.WebControls;
	using System.Web.UI.HtmlControls;
	
	using Caisis.BOL;
	using Caisis.UI.Core.Classes;
	using Caisis.UI.Core.Classes.CustomControls;

	/// <summary>
	///		Summary description for ProstatectomyAndAncillaryProcs.
	/// </summary>
	public partial class Prostatectomy : BaseEFormControl
	{

		protected EformSelect  OpSurgeonType, OpAssistantType, NeuralStimulationPerformed, NeuralStimulationSurgeonType, NeuralStimulationAssistantType;
		protected EformComboBox  OpAssistant,  NeuralStimulationAssistant;
        //2.0 		protected Literal CheckboxChecked;

		// these were added to support enabling/disabling of additional procedure rows
		protected EformSelect OpSurgeonType_1, OpSurgeonType_2, OpSurgeonType_3, OpSurgeonType_4;
		protected EformSelect OpAssistantType_1, OpAssistantType_2, OpAssistantType_3, OpAssistantType_4;
		protected EformComboBox OpAssistant_1, OpAssistant_2, OpAssistant_3, OpAssistant_4;
		//protected EformTextBox PathResult_1, PathResult_2, PathResult_3, PathResult_4;

		override protected void Page_Load(object sender, System.EventArgs e)
		{	
			//Page.RegisterClientScriptBlock("CaseSurgeon", PageUtil.FillComboDropDown(OpSurgeon.RefBy, "OpSurgeon"));
			//Page.RegisterClientScriptBlock("OpName", PageUtil.FillComboDropDown(OpName_1.RefBy, "ProcName"));
			//PageUtil.FillLkpDropDown(OpType, "OpTypeProstatectomy", ViewState);

			
			
			/* iterate over values using required id
			if(Page.IsPostBack)
			{
				foreach (System.Web.UI.Control con in this.Controls)
				{
					if(con is IEformInputField)
					{
						IEformInputField temp = (IEformInputField)con;
						//int i = (int)temp.RecordId;
						bool _isBlank = true;
						string val = PageUtil.GetInputControlValue(temp);

							if(!val.Equals(""))
							{
								_isBlank = false;			
							}
					}
				}
			}*/
			
			
		
			

			base.Page_Load(sender, e);
			
			// add all sorts of cute javascript
			//AddOnBlurEvent(OpName_1, 1);
			//AddOnBlurEvent(OpName_2, 2);
			//AddOnBlurEvent(OpName_3, 3);
			//AddOnBlurEvent(OpName_4, 4);

			// enable rows if OpName data exists
			//EnableIfData(OpName_1, OpSurgeon_1, OpSurgeonType_1, OpAssistant_1, OpAssistantType_1, OpSide_1);
			//EnableIfData(OpName_2, OpSurgeon_2, OpSurgeonType_2, OpAssistant_2, OpAssistantType_2, OpSide_2);
			//EnableIfData(OpName_3, OpSurgeon_3, OpSurgeonType_3, OpAssistant_3, OpAssistantType_3, OpSide_3);
			//EnableIfData(OpName_4, OpSurgeon_4, OpSurgeonType_4, OpAssistant_4, OpAssistantType_4, OpSide_4);

			SetCheckbox();
		}


		protected void SetCheckbox()
		{
			string CheckboxOnclickString = "copyEFormInputValues('" + OpSurgeon.ClientID + "', '" + NeuralStimulationSurgeon.ClientID + "'); ";
			CheckboxOnclickString += "switchCheck();";

			NeuralStimCheckbox.Attributes.Add("onclick", CheckboxOnclickString);


			// brandon: EformControls are now (mostly) WebControls
			// if (NeuralStimulationSurgeon.Value.Length > 0 || NeuralStimulationSurgeonType.Value.Length > 0 || NeuralStimulationAssistant.Value.Length > 0 || NeuralStimulationAssistantType.Value.Length > 0)
			if (NeuralStimulationSurgeon.Value.Length > 0 )
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
