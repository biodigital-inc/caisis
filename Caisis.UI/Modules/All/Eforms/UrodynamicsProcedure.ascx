<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.UrodynamicsProcedure" CodeFile="UrodynamicsProcedure.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css">
#UrodynamicsProcedureTable
{
    table-layout: fixed;
}
td.labelTd
{
    font-weight: bold;
    font-size: 13px;
}
#ComplexUroflometryContainer
{
	border: solid 1px #cccccc;
	background-color: #f8f8f8;
}
</style>

<a name="UrodynamicsProcedure" id="UrodynamicsProcedure" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Procedure" /><br/>
<table id="UrodynamicsProcedureTable" border="0" cellspacing="0" cellpadding="8" width="650"  class="eformLargePopulatedTable">
  <tr>
    <td class="labelTd" style="width: 310px;">Multichannel Urodynamic Study Position</td>
    <td>
        <euc:EformHidden id="SurveyItem_2" runat="server" RecordId="2" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Procedure: Study Position"/>
        <euc:EformExtendedRadioButtonList id="SurveyItemResult_2" runat="server" RecordId="2" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_2" >
					<asp:ListItem >Upright</asp:ListItem>
					<asp:ListItem >Supine</asp:ListItem>
		</euc:EformExtendedRadioButtonList>
    </td>
  </tr>
  <tr>
    <td class="labelTd">Noninvasive uroflow was performed initially?</td>
    <td>
        <euc:EformHidden id="SurveyItem_3" runat="server" RecordId="3" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Procedure: Noninvasive uroflow"/>
        <euc:EformExtendedRadioButtonList LookupCode="YesNoUnknown" id="SurveyItemResult_3" runat="server" RecordId="3" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_3" />
    </td>
  </tr>
  <tr>
    <td class="labelTd" colspan="2"><euc:EformCheckbox TABLE="NoTable" FIELD="ComplexUroflometryPerformed" Runat="server" ID="ComplexUroflometryPerformed" Value="Yes" onclick="showHideUroflometry();" /> Complex Uroflometry was performed today</td>
  </tr>
  <tr id="ComplexUroflometryTableRow" style="display: none;">
    <td colspan="2" style="padding: 0px 0px 20px 50px;">
    <euc:EformHidden id="SurveyItem_4" runat="server" RecordId="4" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Procedure: Qmax"/>
    <euc:EformHidden id="SurveyItem_5" runat="server" RecordId="5" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Procedure: Voided Volume"/>
    <euc:EformHidden id="SurveyItem_6" runat="server" RecordId="6" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Procedure: Pattern"/>
    <euc:EformHidden id="SurveyItem_7" runat="server" RecordId="7" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Procedure: Catheter Size"/>
		<table id="ComplexUroflometryContainer" cellspacing="0" cellpadding="8">
		<tr>
			<td class="labelTd">Qmax (ml/sec)
			</td>
			<td>
				 
				 <euc:EformTextBox CssClass="InputText" style="width: 60px;" RecordId="4" ParentRecordId="1"  Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_4" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_4" />
			</td>
		</tr>
		<tr>
			<td class="labelTd">Voided Volume (ml) 
			</td>
			<td>
				 
				 <euc:EformTextBox CssClass="InputText" style="width: 60px;" RecordId="5" ParentRecordId="1"  Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_5" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_5" />
			</td>
		</tr>
		<tr>
			<td class="labelTd">Pattern 
			</td>
			<td>
				 
        		 <euc:EformExtendedRadioButtonList id="SurveyItemResult_6" runat="server" RecordId="6" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_6" >
					 <asp:ListItem >Normal</asp:ListItem>
					 <asp:ListItem >Plateau</asp:ListItem>
					 <asp:ListItem >Interrupted</asp:ListItem>
				 </euc:EformExtendedRadioButtonList>
			</td>
		</tr>
		</table>
	</td>
  </tr>
    <tr>
    <td class="labelTd">Dual Lumen Catheter Size (French)</td>
    <td><euc:EformExtendedRadioButtonList id="SurveyItemResult_7" runat="server" RecordId="7" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_7" >
					 <asp:ListItem >#7</asp:ListItem>
					 <asp:ListItem >#9</asp:ListItem>
				 </euc:EformExtendedRadioButtonList>
	</td>
  </tr>
    <tr>
    <td class="labelTd">Measurement of post void residual was performed by Ultrasound.</td>
    <td>
        <euc:EformHidden id="SurveyItem_8" runat="server" RecordId="8" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Procedure: Measurement by Ultrasound"/>
        <euc:EformCheckbox TABLE="SurveyItems" RecordId="8" ParentRecordId="1"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_8" Value="Yes" EnableHiddenOnUIEvent="SurveyItem_8"/> Yes
    
		<span style="margin-left: 26px;">
        <euc:EformHidden id="SurveyItem_9" runat="server" RecordId="9" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Procedure: Post Void Residual"/>
        <euc:EformTextBox CssClass="InputText" RecordId="9" ParentRecordId="1"  style="width: 60px;" Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_9" runat="server" ShowNumberPad="true" EnableHiddenOnUIEvent="SurveyItem_9" /> mililiters
		</span>
	</td>
  </tr>
	<tr>
			<td class="labelTd">Catheter filling Rate 
			</td>
			<td>
				 <euc:EformHidden id="SurveyItem_10" runat="server" RecordId="10" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Procedure: Catheter filling Rate"/>
        		 <euc:EformExtendedRadioButtonList id="SurveyItemResult_10" runat="server" RecordId="10" ParentRecordId="1" Table="SurveyItems" Field="SurveyItemResult" RepeatLayout="Table" RepeatDirection="Horizontal" EnableHiddenOnUIEvent="SurveyItem_10" >
					 <asp:ListItem >Slow</asp:ListItem>
					 <asp:ListItem >Medium</asp:ListItem>
					 <asp:ListItem >Fast</asp:ListItem>
				 </euc:EformExtendedRadioButtonList>
			</td>
		</tr>
	<tr>
    <td class="labelTd" colspan="2"><euc:EformHidden id="SurveyItem_11" runat="server" RecordId="11" ParentRecordId="1" Table="SurveyItems" Field="SurveyItem" Value="Procedure: Abdominal Pressure Catheter"/>
        <euc:EformCheckbox TABLE="SurveyItems" RecordId="11" ParentRecordId="1"  FIELD="SurveyItemResult" Runat="server" ID="SurveyItemResult_11" Value="Yes" EnableHiddenOnUIEvent="SurveyItem_11"/>
	Abdominal Pressure Catheter</td>
  </tr>
</table><br/><br/>
<script type="text/javascript">
function showHideUroflometry()
{
	var ComplexUroflometryTableRow = $('ComplexUroflometryTableRow');
	if($('<% =ComplexUroflometryPerformed.ClientID %>').checked)
	{
		ComplexUroflometryTableRow.style.display = 'block';
	}
	else
	{
		ComplexUroflometryTableRow.style.display = 'none';
		
		var UroflometryInputs = ComplexUroflometryTableRow.getElementsByTagName('input');
		for (var i = 0; i < UroflometryInputs.length; i++)
		{   
			if (UroflometryInputs[i].type == 'radio' || UroflometryInputs[i].type == 'checkbox')
			{
				UroflometryInputs[i].checked = false;
			}
			else
			{
				UroflometryInputs[i].value = '';
			}
		}
	}
}
showHideUroflometry();
</script>