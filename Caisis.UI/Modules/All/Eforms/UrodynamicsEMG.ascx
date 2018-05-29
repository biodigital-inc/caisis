<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.UrodynamicsEMG" CodeFile="UrodynamicsEMG.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">
#EMGContentRow { display: none; }
#EMGContainerTable { margin: 0px 0px 0px 0px; border-top: solid 1px #cccccc; border-left: solid 1px #cccccc; background-color: #efefef; width: auto;}
.EMGContainerTableTd { border-bottom: solid 1px #cccccc; border-right: solid 1px #cccccc; }
</style>

<script type="text/javascript">
function  showHideEMG(val)
{
	if (val == 'Yes')
	{
		$('EMGContentRow').style.display = 'block';
	}
	else
	{
		$('EMGContentRow').style.display = 'none';
		
		
		var EMGInputs = EMGContentRow.getElementsByTagName('input');
		for (var i = 0; i < EMGInputs.length; i++)
		{   
			if (EMGInputs[i].type == 'radio' || EMGInputs[i].type == 'checkbox')
			{
				EMGInputs[i].checked = false;
			}
			else
			{
				EMGInputs[i].value = '';
			}
		}
		
		
	}
}
</script>

<a name="UrodynamicsEMG" id="UrodynamicsEMG" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="EMG" /><br/>
<table id="EMGTable" border="0" cellspacing="0" cellpadding="8" width="650"  class="eformLargePopulatedTable" style="table-layout: fixed;">
  <tr>
    <td class="labelTd" style="width: 340px; ">EMG performed with patch electrodes placed in the midline at the perineum?</td>
    <td>
        <euc:EformHidden id="SurveyItem_60" runat="server" RecordId="60" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="EMG: Performed with patch electrodes"/>
        <euc:EformExtendedRadioButtonList id="SurveyItemResult_60" runat="server" RecordId="60" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_60" >
            <asp:ListItem >Yes</asp:ListItem>
            <asp:ListItem >No</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
	</td>
  </tr>
  <tr id="EMGContentRow">
  	<td colspan="2" style="padding: 16px 0px 10px 40px;">
	
		<strong>EMG Activity</strong>
		<table id="EMGContainerTable" cellspacing="0" cellpadding="3">
			<tr>
				<td class="EMGContainerTableTd" style="width: 130px; ">&nbsp;</td>
				<td class="EMGContainerTableTd">Increase</td>
				<td class="EMGContainerTableTd">Decrease</td>
			</tr>
			<tr>
				<td class="EMGContainerTableTd">Progressive Filling</td>
				<td class="EMGContainerTableTd">
					<euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_61" RecordId="61" ParentRecordId="1" GroupName="ProgressiveFilling" runat="server"
					Field1="SurveyItem" Value1="EMG: Progressive Filling">
					<euc:EformRadioButton Id="ProgressiveFillingIncrease" Value="Increase" runat="server"/>
				</td>
				<td class="EMGContainerTableTd">
					<euc:EformRadioButton Id="ProgressiveFillingDecrease" Value="Decrease" runat="server"/>
					</euc:EformRadioButtonGroup>
				</td>
			</tr>
			<tr>
				<td class="EMGContainerTableTd">Valsalva</td>
				<td class="EMGContainerTableTd">
					<euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_62" RecordId="62" ParentRecordId="1" GroupName="Valsalva" runat="server"
					Field1="SurveyItem" Value1="EMG: Valsalva">
					<euc:EformRadioButton Id="ValsalvaIncrease" Value="Increase" runat="server"/>
				</td>
				<td class="EMGContainerTableTd">
					<euc:EformRadioButton Id="ValsalvaDecrease" Value="Decrease" runat="server"/>
					</euc:EformRadioButtonGroup>
				</td>
			</tr>
			<tr>
			  <td class="EMGContainerTableTd">Cough</td>
				<td class="EMGContainerTableTd">
					<euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_63" RecordId="63" ParentRecordId="1" GroupName="Cough" runat="server"
					Field1="SurveyItem" Value1="EMG: Cough">
					<euc:EformRadioButton Id="CoughIncrease" Value="Increase" runat="server"/>
				</td>
				<td class="EMGContainerTableTd">
					<euc:EformRadioButton Id="CoughDecrease" Value="Decrease" runat="server"/>
					</euc:EformRadioButtonGroup>
				</td>
		  </tr>
			<tr>
				<td class="EMGContainerTableTd">Voiding</td>
				<td class="EMGContainerTableTd">
					<euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_64" RecordId="64" ParentRecordId="1" GroupName="Voiding" runat="server"
					Field1="SurveyItem" Value1="EMG: Voiding">
					<euc:EformRadioButton Id="VoidingIncrease" Value="Increase" runat="server"/>
				</td>
				<td class="EMGContainerTableTd">
					<euc:EformRadioButton Id="VoidingDecrease" Value="Decrease" runat="server"/>
					</euc:EformRadioButtonGroup>
				</td>
			</tr>
			<tr>
				<td class="EMGContainerTableTd">Involuntary Detrusor</td>
				<td class="EMGContainerTableTd">
					<euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_65" RecordId="65" ParentRecordId="1" GroupName="InvoluntaryDetrusor" runat="server"
					Field1="SurveyItem" Value1="EMG: Involuntary Detrusor">
					<euc:EformRadioButton Id="InvoluntaryDetrusorIncrease" Value="Increase" runat="server"/>
				</td>
				<td class="EMGContainerTableTd">
					<euc:EformRadioButton Id="InvoluntaryDetrusorDecrease" Value="Decrease" runat="server"/>
					</euc:EformRadioButtonGroup>
				</td>
			</tr>
		</table>	
	
	</td>
  </tr>
</table>
<br/><br/><br/>