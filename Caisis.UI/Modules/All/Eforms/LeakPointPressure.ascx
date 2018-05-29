<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.LeakPointPressure" CodeFile="LeakPointPressure.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">
#LPPContentRow { display: none; }
#LPPContainerTable { margin: 0px 0px 0px 20px; border: solid 1px #cccccc;	background-color: #efefef; width: auto;}
.LPPContainerTableTd { border-bottom: solid 1px #cccccc; }
</style>

<script type="text/javascript">
function  showHideLeakPointPressure(val)
{
	if (val == 'Yes')
	{
		$('LPPContentRow').style.display = 'block';
	}
	else
	{
		$('LPPContentRow').style.display = 'none';
		
		
		var LPPInputs = LPPContentRow.getElementsByTagName('input');
		for (var i = 0; i < LPPInputs.length; i++)
		{   
			if (LPPInputs[i].type == 'radio' || LPPInputs[i].type == 'checkbox')
			{
				LPPInputs[i].checked = false;
			}
			else
			{
				LPPInputs[i].value = '';
			}
		}
		
		
	}
}
</script>

<a name="LeakPointPressure" id="LeakPointPressure" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Leak Point Pressure" /><span class="urodynamicsSectionComment">(Intra-abdominal Pressure Study CPT: 51797)</span><br/>
<table id="LeakPointPressureTable" border="0" cellspacing="0" cellpadding="8" width="650"  class="eformLargePopulatedTable" style="table-layout: fixed;">
  <tr>
    <td class="labelTd" style="width: 160px; ">Did the patient leak?</td>
    <td>
        <euc:EformHidden id="SurveyItem_54" runat="server" RecordId="54" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Leak Point Pressure: Did patient leak"/>
        <euc:EformExtendedRadioButtonList id="SurveyItemResult_54" runat="server" RecordId="54" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_54" >
            <asp:ListItem >Yes</asp:ListItem>
            <asp:ListItem >No</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
	</td>
  </tr>
  <tr id="LPPContentRow">
  	<td colspan="2" style="padding: 0px 0px 10px 0px;">
		<table id="LPPContainerTable" cellspacing="0" cellpadding="8">
			<tr>
				<td class="labelTd LPPContainerTableTd" style="width: 130px; ">With Catheter?</td>
				<td class="LPPContainerTableTd">
					<euc:EformHidden id="SurveyItem_55" runat="server" RecordId="55" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Leak Point Pressure: Leak With Catheter"/>
					<euc:EformExtendedRadioButtonList id="SurveyItemResult_55" runat="server" RecordId="55" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_55" >
						<asp:ListItem >Yes</asp:ListItem>
						<asp:ListItem >No</asp:ListItem>
					</euc:EformExtendedRadioButtonList>
				</td>
			</tr>
			<tr>
				<td class="labelTd LPPContainerTableTd">Valsalva Leak Point Pressure</td>
				<td class="LPPContainerTableTd">
					<euc:EformHidden id="SurveyItem_56" runat="server" RecordId="56" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Leak Point Pressure: Valsalva LPP"/>
					<euc:EformTextBox CssClass="InputText" style="width: 60px;" RecordId="56" ParentRecordId="1"  Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_56" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_56" /> cmH2O
				</td>
			</tr>
			<tr>
				<td class="labelTd LPPContainerTableTd">Bladder Volume Refilled</td>
				<td class="LPPContainerTableTd">
					<euc:EformHidden id="SurveyItem_57" runat="server" RecordId="57" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Leak Point Pressure: Bladder volume Refilled"/>
					<euc:EformExtendedRadioButtonList id="SurveyItemResult_57" runat="server" RecordId="57" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_57" >
						<asp:ListItem >150 ml</asp:ListItem>
						<asp:ListItem >200 ml</asp:ListItem>
						<asp:ListItem >300 ml</asp:ListItem>
					</euc:EformExtendedRadioButtonList>
				</td>
			</tr>
			<tr>
				<td class="labelTd LPPContainerTableTd">Valsalva Leak Point Pressure With Catheter</td>
				<td class="LPPContainerTableTd">
					<euc:EformHidden id="SurveyItem_58" runat="server" RecordId="58" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Leak Point Pressure: Valsalva LPP with Catheter"/>
					<euc:EformTextBox CssClass="InputText" style="width: 60px;" RecordId="58" ParentRecordId="1"  Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_58" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_58" /> cmH2O
				</td>
			</tr>
			<tr>
				<td class="labelTd LPPContainerTableTd">Valsalva Leak Point Pressure Without Catheter</td>
				<td class="LPPContainerTableTd">
					<euc:EformHidden id="SurveyItem_59" runat="server" RecordId="59" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Leak Point Pressure: Volume without Catheter"/>
					<euc:EformTextBox CssClass="InputText" style="width: 60px;" RecordId="59" ParentRecordId="1"  Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_59" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_59" /> cmH2O
				</td>
			</tr>
			
			
		</table>	
	
	</td>
  </tr>
</table>
<br/><br/><br/>