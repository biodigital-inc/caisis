<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PCCTCImmunoTherapy" CodeFile="PCCTCImmunoTherapy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.ImmunoTherapyHtmlTable = "ImmunoTherapyHtmlTable";
</script>
<style type="text/css">
#ImmunoTherapyHtmlTable td
{
    white-space: nowrap;
}
</style>

<a name="PCCTCImmunoTherapy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Immunotherapy"></asp:Label><br/>
<table id="AddImmunoTxTable" border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td id="AddImmunoTxYesNoContainer">
	
	No prior immunotherapy has been recorded for this patient.<br /><br />
	
	<strong>Has the subject had prior immunotherapy?</strong><euc:EformRadioButtonList Table="NoTable" Field="ImmunoYesNo" id="ImmunoYesNo" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
</table>





<span id="ImmunoTxDetails" style="display: none;" >
<table width="700" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="ImmunoTherapyHtmlTable" style="background-color: #ffffff;" onclick="setImmunoMedTxTypeFields();">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">Start Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Stop Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Agent</td>
    <td style="white-space:nowrap; font-size: 10px;" class="controlBoxDataGridHeaderFirstCol">Total<br />Cycles</td>
    <td class="controlBoxDataGridHeaderFirstCol">Dose</td>
    <td class="controlBoxDataGridHeaderFirstCol">Units&nbsp;&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">Schedule</td>
    <td class="controlBoxDataGridHeaderFirstCol">Disc. Reason</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxType,MedTxAgent,MedTxCycle,MedTxDose,MedTxUnits,MedTxSchedule,MedTxStopDateText,MedTxStopDate', 'MedicalTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText") %></td>
			<td  class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText") %>&nbsp;</td>
			<td  class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxAgent") %></td>
			<td  class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxCycle") %></td>
			<td  class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDose")%>&nbsp;</td><td><%# DataBinder.Eval(Container.DataItem, "MedTxUnits")%>&nbsp;</td>
			<td  class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxSchedule") %>&nbsp;</td>
			<td  class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxNotes") %>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
<!-- Blank Rows -->
 <tr>
    <td height="28"><euc:EformTextBox RecordId="21" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_21" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="21"  ID="MedTxDateText_21" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    /><euc:EformHidden RecordId="21" Runat="server" ID="MedTxDate_21" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td ><euc:EformTextBox Runat="server" RecordId="21"  ID="MedTxStopDateText_21" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="21" Runat="server" ID="MedTxStopDate_21" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="21" Table="MedicalTherapy" Runat="server" id="MedTxAgent_21"  /></td>
    <td><euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_21"/></td>
    <td><euc:EformTextBox RecordId="21" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_21"/>&nbsp;</td><td><euc:EformSelect RecordId="21" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_21" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="21" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_21"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="21" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_21"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="22" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_22" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="22"  ID="MedTxDateText_22" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    /><euc:EformHidden RecordId="22" Runat="server" ID="MedTxDate_22" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td ><euc:EformTextBox Runat="server" RecordId="22"  ID="MedTxStopDateText_22" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="22" Runat="server" ID="MedTxStopDate_22" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="22" Table="MedicalTherapy" Runat="server" id="MedTxAgent_22"  /></td>
    <td><euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_22"/></td>
    <td><euc:EformTextBox RecordId="22" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_22"/>&nbsp;</td><td><euc:EformSelect RecordId="22" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_22" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="22" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_22"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="22" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_22"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="23" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_23" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="23"  ID="MedTxDateText_23" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    /><euc:EformHidden RecordId="23" Runat="server" ID="MedTxDate_23" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td ><euc:EformTextBox Runat="server" RecordId="23"  ID="MedTxStopDateText_23" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="23" Runat="server" ID="MedTxStopDate_23" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="23" Table="MedicalTherapy" Runat="server" id="MedTxAgent_23"  /></td>
    <td><euc:EformTextBox RecordId="23" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_23"/></td>
    <td><euc:EformTextBox RecordId="23" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_23"/>&nbsp;</td><td><euc:EformSelect RecordId="23" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_23" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="23" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_23"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="23" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_23"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="24" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_24" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="24"  ID="MedTxDateText_24" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    /><euc:EformHidden RecordId="24" Runat="server" ID="MedTxDate_24" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td ><euc:EformTextBox Runat="server" RecordId="24"  ID="MedTxStopDateText_24" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="24" Runat="server" ID="MedTxStopDate_24" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="24" Table="MedicalTherapy" Runat="server" id="MedTxAgent_24"  /></td>
    <td><euc:EformTextBox RecordId="24" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_24"/></td>
    <td><euc:EformTextBox RecordId="24" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_24"/>&nbsp;</td><td><euc:EformSelect RecordId="24" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_24" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="24" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_24"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="24" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_24"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="25" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_25" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="25"  ID="MedTxDateText_25" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    /><euc:EformHidden RecordId="25" Runat="server" ID="MedTxDate_25" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td ><euc:EformTextBox Runat="server" RecordId="25"  ID="MedTxStopDateText_25" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="25" Runat="server" ID="MedTxStopDate_25" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="25" Table="MedicalTherapy" Runat="server" id="MedTxAgent_25"  /></td>
    <td><euc:EformTextBox RecordId="25" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_25"/></td>
    <td><euc:EformTextBox RecordId="25" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_25"/>&nbsp;</td><td><euc:EformSelect RecordId="25" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_25" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="25" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_25"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="25" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_25"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="26" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_26" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="26"  ID="MedTxDateText_26" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    /><euc:EformHidden RecordId="26" Runat="server" ID="MedTxDate_26" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td ><euc:EformTextBox Runat="server" RecordId="26"  ID="MedTxStopDateText_26" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="26" Runat="server" ID="MedTxStopDate_26" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="26" Table="MedicalTherapy" Runat="server" id="MedTxAgent_26"  /></td>
    <td><euc:EformTextBox RecordId="26" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_26"/></td>
    <td><euc:EformTextBox RecordId="26" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_26"/>&nbsp;</td><td><euc:EformSelect RecordId="26" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_26" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="26" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_26"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="26" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_26"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="27" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_27" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="27"  ID="MedTxDateText_27" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    /><euc:EformHidden RecordId="27" Runat="server" ID="MedTxDate_27" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td ><euc:EformTextBox Runat="server" RecordId="27"  ID="MedTxStopDateText_27" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="27" Runat="server" ID="MedTxStopDate_27" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="27" Table="MedicalTherapy" Runat="server" id="MedTxAgent_27"  /></td>
    <td><euc:EformTextBox RecordId="27" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_27"/></td>
    <td><euc:EformTextBox RecordId="27" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_27"/>&nbsp;</td><td><euc:EformSelect RecordId="27" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_27" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="27" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_27"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="27" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_27"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="28" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_28" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="28"  ID="MedTxDateText_28" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    /><euc:EformHidden RecordId="28" Runat="server" ID="MedTxDate_28" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td ><euc:EformTextBox Runat="server" RecordId="28"  ID="MedTxStopDateText_28" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="28" Runat="server" ID="MedTxStopDate_28" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="28" Table="MedicalTherapy" Runat="server" id="MedTxAgent_28"  /></td>
    <td><euc:EformTextBox RecordId="28" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_28"/></td>
    <td><euc:EformTextBox RecordId="28" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_28"/>&nbsp;</td><td><euc:EformSelect RecordId="28" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_28" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="28" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_28"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="28" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_28"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="29" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_29" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="29"  ID="MedTxDateText_29" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    /><euc:EformHidden RecordId="29" Runat="server" ID="MedTxDate_29" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td ><euc:EformTextBox Runat="server" RecordId="29"  ID="MedTxStopDateText_29" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="29" Runat="server" ID="MedTxStopDate_29" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="29" Table="MedicalTherapy" Runat="server" id="MedTxAgent_29"  /></td>
    <td><euc:EformTextBox RecordId="29" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_29"/></td>
    <td><euc:EformTextBox RecordId="29" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_29"/>&nbsp;</td><td><euc:EformSelect RecordId="29" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_29" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="29" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_29"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="29" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_29"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="30" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_30" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="30"  ID="MedTxDateText_30" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    /><euc:EformHidden RecordId="30" Runat="server" ID="MedTxDate_30" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td ><euc:EformTextBox Runat="server" RecordId="30"  ID="MedTxStopDateText_30" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setImmunoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="30" Runat="server" ID="MedTxStopDate_30" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="30" Table="MedicalTherapy" Runat="server" id="MedTxAgent_30"  /></td>
    <td><euc:EformTextBox RecordId="30" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_30"/></td>
    <td><euc:EformTextBox RecordId="30" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_30"/>&nbsp;</td><td><euc:EformSelect RecordId="30" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_30" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="30" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_30"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="30" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_30"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<!-- Blank Rows End -->
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ImmunoTherapyHtmlTable');" />
</span>
<div id="ImmunoAbsentEvent" style="display: none;">
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_3"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentDate" ID="AbsentDate_3"
                Runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="TableName" ID="TableName_3"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldName" ID="FieldName_3"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_3"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_3"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="3" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_3"
                runat="server"  style="display:none;" />
</div>
<br/><br/>
<script type="text/javascript">
function attachShowHideImmunoTxScriptsAndSetInitialDisplay()
{
	var AddImmunoTxYesNoContainer = $('AddImmunoTxYesNoContainer');
	var ImmunoYesNoRadios = AddImmunoTxYesNoContainer.getElementsByTagName('input');
	var showImmunoTxOnload = false;
	var showImmunoTxMsg = false;
	var ImmunoTxDetails = document.getElementById('ImmunoTxDetails');
	var AddImmunoTxTable  = $('AddImmunoTxTable');
	
	
	if (<% =PriorImmunoTxExist.ToString().ToLower() %>)
	{
	    showImmunoTxOnload = true;
	    showImmunoTxMsg = false;
	}
	else
	{
	    showImmunoTxMsg = true;
	    for (var i=0;i<ImmunoYesNoRadios.length;i++)
	    {
		    if (ImmunoYesNoRadios[i].type == 'radio')
		    {
			    ImmunoYesNoRadios[i].onclick = function() {showHideImmunoTx(this)};
			    if (ImmunoYesNoRadios[i].checked && ImmunoYesNoRadios[i].value.toString().toUpperCase() == 'YES') showImmunoTxOnload = true;
		    }
	    }
	}
	if (showImmunoTxOnload) ImmunoTxDetails.style.display = 'block';
	if (showImmunoTxMsg){AddImmunoTxTable.style.display = 'block';}
	else {AddImmunoTxTable.style.display = 'none';}
	
}
attachShowHideImmunoTxScriptsAndSetInitialDisplay();

function showHideImmunoTx(theRadio)
{
	var ImmunoTxDetails = document.getElementById('ImmunoTxDetails');
	var ImmunoAbsentEvent = document.getElementById('ImmunoAbsentEvent');
	
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		ImmunoTxDetails.style.display = 'block';
		clearAllElementsContainedInNode(ImmunoAbsentEvent);
	}
	else
	{
		ImmunoTxDetails.style.display = 'none';
		clearAllElementsContainedInNode(ImmunoTxDetails);
		$('<% =TableName_3.ClientID %>').value = 'MedicalTherapy';
		$('<% =FieldName_3.ClientID %>').value = 'MedTxType';
		$('<% =FieldValue_3.ClientID %>').value = 'IMMUNO';
	}

}

function setImmunoMedTxTypeFields()
{
    var map = <%= GetEnableHiddenScript(System.Linq.Enumerable.Range(21,10)) %>;
    for(var index in map) {
        var item = map[index];
        var sources = item.sources;
        var targetId = item.target;
        var target = $(targetId);
        // validate non-empty
        var hasValue = false;
        for(var i=0;i<sources.length;i++) {
            var sourceId = sources[i];
            var source = $(sourceId);
            if(source.value != '') {
                hasValue = true;
                break;
            }
        }
        // set target value
        target.value = hasValue? 'IMMUNO' : '';
    } 
}

</script>