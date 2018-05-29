<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ReviewOfSystems_NP" CodeFile="ReviewOfSystems_NP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript">
function processROSSystemLabels()
{
	var systemLabels = jQuery('span[id*="ROS_System"]');
	var num = systemLabels.size();
	
	systemLabels.each(function(index) {
		var next = systemLabels.eq(index+1);
		if (index < (num-1) && (jQuery(this).text() == jQuery(next).text())) {
			jQuery(next).css('display','none');
			jQuery(next).parent().css({'border-top': 'none'});
			jQuery(this).parent().css({'border-bottom': 'none'});
		}
	});
	
	
	systemLabels.each(function(index) {
	jQuery(this).text(function(index, text) {
		    var systemDisplayName = '';
			switch(text)
			{
			case 'Constitution':
			  systemDisplayName = 'General';
			  break;
			case 'Neurology':
			  systemDisplayName = 'Neuro';
			  break;
			case 'Cardiovascular (General)':
			  systemDisplayName = 'CV';
			  break;
			case 'Musculoskeletal':
			  systemDisplayName = 'MS';
			  break;
			case 'Pulmonary':
			  systemDisplayName = 'Resp';
			  break;
			case 'Gastrointestinal':
			  systemDisplayName = 'GI';
			  break;
			case 'Genitourinary':
			  systemDisplayName = 'GU';
			  break;
			case 'Psychiatric':
			  systemDisplayName = 'Psych';
			  break;
			case 'Hematological':
			  systemDisplayName = 'Heme';
			  break;
			case 'Endocrine':
			  systemDisplayName = 'Endo';
			  break;
			default:
			  systemDisplayName = text;
			}
			
			return systemDisplayName;
		});
	});
	
}


</script>

<style type="text/css">
tr.ROS_DefaultDataEntryRow td
{
	empty-cells:show;
}
</style>

<a name="ReviewOfSystems_NP" /><span class="controlBoxTitle">Review of Systems</span><br />

Clinician Performing Review:<euc:EformRadioButtonList RepeatLayout="Flow" CellSpacing="4" RepeatDirection="Horizontal" TABLE="NoTable" FIELD="ROS_Clinician" id="ROS_Clinician"  runat="server" >
			<asp:ListItem Value="RN">RN</asp:ListItem>
		    <asp:ListItem  Value="PA/NP">PA/NP</asp:ListItem>
			<asp:ListItem  Value="Fellow">Fellow</asp:ListItem>
			<asp:ListItem  Value="Attending">Attending</asp:ListItem>
</euc:EformRadioButtonList>

<span class="EFormPopupInstructionText">
<br/>
(Only one clinician needed; attending approval is <span style="font-weight: 900; font-size: 11px;">NOT</span> necessary for Review of Systems.)</span>
<br/>
<img src="../../Images/shim.gif" width="1" height="8" /><br/>
<table width="650" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ReviewOfSystemsHtmlTable">
  <tr>
    <td colspan="2" class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/shim.gif" width="1" height="1" /></td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 2, 8);" /></td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 3, 8);" /></td>
    <td class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/EFormCheckAll.gif" width="28" height="11" class="ClickableImage" onclick="return checkAllWidgetsInColumn('ReviewOfSystemsHtmlTable', 4, 8);" /></td>
    <td colspan="2" class="controlBoxDataGridHeaderFirstCol"><img src="../../Images/shim.gif" width="1" height="1" /></td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol">System</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;">Symptom</td>
    <td class="controlBoxDataGridHeaderFirstCol">Not<br />
      Present </td>
    <td class="controlBoxDataGridHeaderFirstCol">Present</td>
    <td class="controlBoxDataGridHeaderFirstCol">Not Done </td>
    <td class="controlBoxDataGridHeaderFirstCol">Disease<br />
      Related </td>
    <td width="40%" class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_1" runat="server" DefaultField="EncReviewOfSystems.ROS_System,1" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_1" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,1" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result1" RecordId="1" GroupName="ROS_Result_Group1" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group1_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group1_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group1_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="1" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_1"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_1"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_2" runat="server" DefaultField="EncReviewOfSystems.ROS_System,2" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_2" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,2" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result2" RecordId="2" GroupName="ROS_Result_Group2" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group2_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group2_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group2_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="2" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_2"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_2"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_3" runat="server" DefaultField="EncReviewOfSystems.ROS_System,3" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_3" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,3" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result3" RecordId="3" GroupName="ROS_Result_Group3" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group3_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group3_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group3_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="3" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_3"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_3"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_4" runat="server" DefaultField="EncReviewOfSystems.ROS_System,4" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_4" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,4" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result4" RecordId="4" GroupName="ROS_Result_Group4" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group4_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group4_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group4_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="4" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_4"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_4"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_5" runat="server" DefaultField="EncReviewOfSystems.ROS_System,5" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_5" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,5" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result5" RecordId="5" GroupName="ROS_Result_Group5" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group5_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group5_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group5_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="5" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_5"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_5"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_6" runat="server" DefaultField="EncReviewOfSystems.ROS_System,6" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_6" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,6" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result6" RecordId="6" GroupName="ROS_Result_Group6" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group6_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group6_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group6_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="6" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_6"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_6"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_7" runat="server" DefaultField="EncReviewOfSystems.ROS_System,7" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_7" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,7" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result7" RecordId="7" GroupName="ROS_Result_Group7" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group7_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group7_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group7_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="7" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_7"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_7"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_8" runat="server" DefaultField="EncReviewOfSystems.ROS_System,8" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_8" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,8" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result8" RecordId="8" GroupName="ROS_Result_Group8" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group8_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group8_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group8_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="8" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_8"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_8"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_9" runat="server" DefaultField="EncReviewOfSystems.ROS_System,9" />&nbsp;</td>
    <td height="30" valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_9" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,9" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result9" RecordId="9" GroupName="ROS_Result_Group9" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group9_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group9_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group9_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="9" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_9"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_9"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_10" runat="server" DefaultField="EncReviewOfSystems.ROS_System,10" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_10" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,10" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result10" RecordId="10" GroupName="ROS_Result_Group10" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group10_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group10_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group10_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="10" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_10"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_10"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_11" runat="server" DefaultField="EncReviewOfSystems.ROS_System,11" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_11" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,11" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result11" RecordId="11" GroupName="ROS_Result_Group11" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group11_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group11_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group11_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="11" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_11"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_11"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_12" runat="server" DefaultField="EncReviewOfSystems.ROS_System,12" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_12" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,12" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result12" RecordId="12" GroupName="ROS_Result_Group12" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group12_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group12_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group12_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="12" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_12"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_12"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_13" runat="server" DefaultField="EncReviewOfSystems.ROS_System,13" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_13" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,13" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result13" RecordId="13" GroupName="ROS_Result_Group13" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group13_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group13_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group13_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="13" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_13"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_13"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_14" runat="server" DefaultField="EncReviewOfSystems.ROS_System,14" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_14" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,14" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result14" RecordId="14" GroupName="ROS_Result_Group14" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group14_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group14_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group14_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="14" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_14"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_14"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_15" runat="server" DefaultField="EncReviewOfSystems.ROS_System,15" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_15" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,15" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result15" RecordId="15" GroupName="ROS_Result_Group15" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group15_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group15_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group15_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="15" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_15"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_15"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_16" runat="server" DefaultField="EncReviewOfSystems.ROS_System,16" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_16" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,16" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result16" RecordId="16" GroupName="ROS_Result_Group16" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group16_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group16_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group16_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="16" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_16"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="16" ShowCalendar="False"  CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_16"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_17" runat="server" DefaultField="EncReviewOfSystems.ROS_System,17" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_17" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,17" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result17" RecordId="17" GroupName="ROS_Result_Group17" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group17_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group17_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group17_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="17" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_17"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_17"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_18" runat="server" DefaultField="EncReviewOfSystems.ROS_System,18" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_18" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,18" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result18" RecordId="18" GroupName="ROS_Result_Group18" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group18_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group18_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group18_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="18" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_18"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_18"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr class="ROS_DefaultDataEntryRow">
      <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_19" runat="server" DefaultField="EncReviewOfSystems.ROS_System,19" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_19" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,19" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result19" RecordId="19" GroupName="ROS_Result_Group19" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group19_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group19_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group19_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="19" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_19"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_19"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_20" runat="server" DefaultField="EncReviewOfSystems.ROS_System,20" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_20" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,20" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result20" RecordId="20" GroupName="ROS_Result_Group20" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group20_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group20_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group20_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="20" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_20"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_20"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_21" runat="server" DefaultField="EncReviewOfSystems.ROS_System,21" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_21" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,21" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result21" RecordId="21" GroupName="ROS_Result_Group21" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group21_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group21_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group21_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="21" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_21"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_21"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_22" runat="server" DefaultField="EncReviewOfSystems.ROS_System,22" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_22" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,22" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result22" RecordId="22" GroupName="ROS_Result_Group22" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group22_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group22_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group22_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="22" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_22"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_22"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_23" runat="server" DefaultField="EncReviewOfSystems.ROS_System,23" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_23" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,23" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result23" RecordId="23" GroupName="ROS_Result_Group23" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group23_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group23_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group23_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="23" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_23"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="23" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_23"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_24" runat="server" DefaultField="EncReviewOfSystems.ROS_System,24" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_24" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,24" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result24" RecordId="24" GroupName="ROS_Result_Group24" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group24_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group24_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group24_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="24" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_24"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="24" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_24"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_25" runat="server" DefaultField="EncReviewOfSystems.ROS_System,25" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_25" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,25" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result25" RecordId="25" GroupName="ROS_Result_Group25" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group25_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group25_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group25_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="25" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_25"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="25" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_25"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_26" runat="server" DefaultField="EncReviewOfSystems.ROS_System,26" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_26" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,26" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result26" RecordId="26" GroupName="ROS_Result_Group26" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group26_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group26_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group26_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="26" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_26"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="26" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_26"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_27" runat="server" DefaultField="EncReviewOfSystems.ROS_System,27" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_27" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,27" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result27" RecordId="27" GroupName="ROS_Result_Group27" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group27_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group27_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group27_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="27" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_27"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="27" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_27"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_28" runat="server" DefaultField="EncReviewOfSystems.ROS_System,28" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_28" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,28" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result28" RecordId="28" GroupName="ROS_Result_Group28" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group28_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group28_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group28_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="28" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_28"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="28" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_28"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_29" runat="server" DefaultField="EncReviewOfSystems.ROS_System,29" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_29" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,29" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result29" RecordId="29" GroupName="ROS_Result_Group29" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group29_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group29_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group29_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="29" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_29"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="29" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_29"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_30" runat="server" DefaultField="EncReviewOfSystems.ROS_System,30" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_30" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,30" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result30" RecordId="30" GroupName="ROS_Result_Group30" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group30_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group30_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group30_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="30" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_30"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="30" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_30"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr class="ROS_DefaultDataEntryRow">
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_31" runat="server" DefaultField="EncReviewOfSystems.ROS_System,31" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_31" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,31" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result31" RecordId="31" GroupName="ROS_Result_Group31" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group31_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group31_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group31_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="31" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_31"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="31" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_31"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_System_32" runat="server" DefaultField="EncReviewOfSystems.ROS_System,32" />&nbsp;</td>
    <td valign="top" class="ControlBoxLinedRowsShaded"><euc:EformDefaultLabel ID="ROS_Symptom_32" runat="server" DefaultField="EncReviewOfSystems.ROS_Symptom,32" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result32" RecordId="32" GroupName="ROS_Result_Group32" runat="server">
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group32_Normal" Value="Normal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group32_Abnormal" Value="Abnormal" runat="server"/></td>
		<td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="Group32_NotDone" Value="Not Done" runat="server"/></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="32" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_32"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="32" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_32"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded"><strong>Other:</strong></td>
    <td valign="top" class="ControlBoxLinedRowsShaded">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
    <td class="ControlBoxLinedRows" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="33" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_33" style="width: 50px;" DropDownWidth="300" /></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="33" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_33" style="width: 130px;" DropDownWidth="290" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result33" RecordId="33" GroupName="ROS_Result_Group33" runat="server">
		<td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Group33_Normal" Value="Normal" runat="server"/></span></span></td>
		<td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Group33_Abnormal" Value="Abnormal" runat="server"/></span></span></td>
		<td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Group33_NotDone" Value="Not Done" runat="server"/></span></span></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="33" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_33"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="33" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_33"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="34" LookupCode="BodySystem" TABLE="EncReviewOfSystems" FIELD="ROS_System" Runat="server" ID="ROS_System_34" style="width: 50px;" DropDownWidth="300" /></td>
    <td style="white-space: nowrap;" valign="top" class="ControlBoxLinedRowsShaded"><euc:EFormComboBox RecordId="34" LookupCode="ROS_Symptom" TABLE="EncReviewOfSystems" FIELD="ROS_Symptom" Runat="server" ID="ROS_Symptom_34" style="width: 130px;" DropDownWidth="290" /></td>
    <euc:EformRadioButtonGroup Table="EncReviewOfSystems" Field="ROS_Result" id="ROS_Result34" RecordId="34" GroupName="ROS_Result_Group34" runat="server">
		<td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Group34_Normal" Value="Normal" runat="server"/></span></span></td>
		<td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Group34_Abnormal" Value="Abnormal" runat="server"/></span></span></td>
		<td class="ControlBoxLinedRows" align="center"><span><span><euc:EformRadioButton Id="Group34_NotDone" Value="Not Done" runat="server"/></span></span></td>
	</euc:EformRadioButtonGroup>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows"><euc:EformSelect RecordId="34" LookupCode="RelatedTo" DropDownWidth="120" DropDownHeight="auto" TABLE="EncReviewOfSystems" FIELD="ROS_RelatedTo" Runat="server" ID="ROS_RelatedTo_34"/></td>
    <td style="white-space: nowrap;" class="ControlBoxLinedRows" align="center"><euc:EformTextBox RecordId="34" ShowCalendar="False" CalcDate="False" style="width:140px;" ShowTextEditor="true" TABLE="EncReviewOfSystems" FIELD="ROS_Notes" Runat="server" ID="ROS_Notes_34"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<script type="text/javascript">processROSSystemLabels();</script>
<br/>
<br/>
<br/>
