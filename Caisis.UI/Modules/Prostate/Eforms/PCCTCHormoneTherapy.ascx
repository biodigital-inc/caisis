<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PCCTCHormoneTherapy" CodeFile="PCCTCHormoneTherapy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.HormoneTherapyHtmlTable = "HormoneTherapyHtmlTable";
</script>
<style type="text/css">
#HormoneTherapyHtmlTable td
{
    white-space: nowrap;
}
</style>

<a name="PCCTCHormoneTherapy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Hormone Therapy"></asp:Label><br/>
<table id="AddHormoneTxTable" border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;" id="AddHormoneTxYesNoContainer">
	
	No prior hormone therapies have been recorded for this patient.<br /><br />
	
	<strong>Has the subject had prior hormonal therapy?</strong><euc:EformRadioButtonList Table="NoTable" Field="HormoneYesNo" id="HormoneYesNo" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
</table>





<span id="HormoneTxDetails" style="display: none;" >
<table width="700" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="HormoneTherapyHtmlTable" style="background-color: #ffffff;" onclick="setHormoneMedTxTypeFields();">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">Start Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Stop Date</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Agent</td>
    <td style="white-space:nowrap; font-size: 10px;" class="controlBoxDataGridHeaderFirstCol">Total<br />Cycles</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Dose</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Units&nbsp;&nbsp;</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Schedule</td>
    <td style="white-space:nowrap;" class="controlBoxDataGridHeaderFirstCol">Disc. Reason</td>
    <td style="white-space:nowrap;" height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="MedicalTherapies" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onclick="LoadDataEntryForm('MedicalTherapy', <%# DataBinder.Eval(Container.DataItem, "MedicalTherapyId") %>, 'MedTxDateText,MedTxDate,MedTxStopDateText,MedTxStopDate,MedTxType,MedTxAgent,MedTxCycle,MedTxDose,MedTxUnits,MedTxSchedule', 'MedicalTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxDateText")%></td>
			<td  class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxStopDateText")%>&nbsp;</td>
			<td  class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxAgent")%></td>
			<td  class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "MedTxCycle")%></td>
			<td  class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxDose")%>&nbsp;</td><td><%# DataBinder.Eval(Container.DataItem, "MedTxUnits")%>&nbsp;</td>
			<td  class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxSchedule")%>&nbsp;</td>
			<td  class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "MedTxNotes")%>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
<!-- Blank Rows -->
<tr >
    <td height="28"><euc:EformTextBox RecordId="1" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_1" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxDateText_1" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="1" Runat="server" ID="MedTxDate_1" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="1"  ID="MedTxStopDateText_1" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="1" Runat="server" ID="MedTxStopDate_1" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxAgent_1"  /></td>
    <td><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_1"/></td>
    <td><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_1"/>&nbsp;</td><td><euc:EformSelect RecordId="1" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_1" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="1" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_1"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="1" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_1"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
<tr style="display: none;" >
    <td height="28"><euc:EformTextBox RecordId="2" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_2" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxDateText_2" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="2" Runat="server" ID="MedTxDate_2" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="2"  ID="MedTxStopDateText_2" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="2" Runat="server" ID="MedTxStopDate_2" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxAgent_2"  /></td>
    <td><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_2"/></td>
    <td><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_2"/>&nbsp;</td><td><euc:EformSelect RecordId="2" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_2" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="2" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_2"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="2" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_2"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="3" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_3" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxDateText_3" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="3" Runat="server" ID="MedTxDate_3" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="3"  ID="MedTxStopDateText_3" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="3" Runat="server" ID="MedTxStopDate_3" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxAgent_3"  /></td>
    <td><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_3"/></td>
    <td><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_3"/>&nbsp;</td><td><euc:EformSelect RecordId="3" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_3" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="3" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_3"  /></td>
   <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="3" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_3"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="4" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_4" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxDateText_4" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="4" Runat="server" ID="MedTxDate_4" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="4"  ID="MedTxStopDateText_4" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="4" Runat="server" ID="MedTxStopDate_4" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxAgent_4"  /></td>
    <td><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_4"/></td>
    <td><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_4"/>&nbsp;</td><td><euc:EformSelect RecordId="4" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_4" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="4" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_4"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="4" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_4"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
 <tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="5" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_5" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxDateText_5" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="5" Runat="server" ID="MedTxDate_5" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="5"  ID="MedTxStopDateText_5" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="5" Runat="server" ID="MedTxStopDate_5" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxAgent_5"  /></td>
    <td><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_5"/></td>
    <td><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_5"/>&nbsp;</td><td><euc:EformSelect RecordId="5" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_5" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="5" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_5"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="5" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_5"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="6" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_6" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="6"  ID="MedTxDateText_6" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="6" Runat="server" ID="MedTxDate_6" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="6"  ID="MedTxStopDateText_6" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="6" Runat="server" ID="MedTxStopDate_6" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxAgent_6"  /></td>
    <td><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_6"/></td>
    <td><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_6"/>&nbsp;</td><td><euc:EformSelect RecordId="6" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_6" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="6" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_6"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="6" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_6"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="7" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_7" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="7"  ID="MedTxDateText_7" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="7" Runat="server" ID="MedTxDate_7" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="7"  ID="MedTxStopDateText_7" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="7" Runat="server" ID="MedTxStopDate_7" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxAgent_7"  /></td>
    <td><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_7"/></td>
    <td><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_7"/>&nbsp;</td><td><euc:EformSelect RecordId="7" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_7" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="7" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_7"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="7" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_7"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="8" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_8" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="8"  ID="MedTxDateText_8" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="8" Runat="server" ID="MedTxDate_8" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="8"  ID="MedTxStopDateText_8" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="8" Runat="server" ID="MedTxStopDate_8" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxAgent_8"  /></td>
    <td><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_8"/></td>
    <td><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_8"/>&nbsp;</td><td><euc:EformSelect RecordId="8" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_8" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="8" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_8"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="8" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_8"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="9" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_9" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="9"  ID="MedTxDateText_9" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="9" Runat="server" ID="MedTxDate_9" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="9"  ID="MedTxStopDateText_9" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="9" Runat="server" ID="MedTxStopDate_9" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="9" Table="MedicalTherapy" Runat="server" id="MedTxAgent_9"  /></td>
    <td><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_9"/></td>
    <td><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_9"/>&nbsp;</td><td><euc:EformSelect RecordId="9" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_9" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="9" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_9"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="9" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_9"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="10" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_10" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="10"  ID="MedTxDateText_10" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="10" Runat="server" ID="MedTxDate_10" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="10"  ID="MedTxStopDateText_10" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="10" Runat="server" ID="MedTxStopDate_10" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="10" Table="MedicalTherapy" Runat="server" id="MedTxAgent_10"  /></td>
    <td><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_10"/></td>
    <td><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_10"/>&nbsp;</td><td><euc:EformSelect RecordId="10" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_10" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="10" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_10"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="10" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_10"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
  <tr  style="display: none;" >
    <td height="28"><euc:EformTextBox RecordId="11" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_11" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="11"  ID="MedTxDateText_11" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="11" Runat="server" ID="MedTxDate_11" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="11"  ID="MedTxStopDateText_11" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="11" Runat="server" ID="MedTxStopDate_11" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="11" Table="MedicalTherapy" Runat="server" id="MedTxAgent_11"  /></td>
    <td><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_11"/></td>
    <td><euc:EformTextBox RecordId="11" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_11"/>&nbsp;</td><td><euc:EformSelect RecordId="11" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_11" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="11" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_11"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="11" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_11"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
<tr style="display: none;" >
    <td height="28"><euc:EformTextBox RecordId="12" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_12" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="12"  ID="MedTxDateText_12" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="12" Runat="server" ID="MedTxDate_12" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="12"  ID="MedTxStopDateText_12" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="12" Runat="server" ID="MedTxStopDate_12" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="12" Table="MedicalTherapy" Runat="server" id="MedTxAgent_12"  /></td>
    <td><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_12"/></td>
    <td><euc:EformTextBox RecordId="12" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_12"/>&nbsp;</td><td><euc:EformSelect RecordId="12" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_12" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="12" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_12"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="12" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_12"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="13" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_13" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="13"  ID="MedTxDateText_13" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="13" Runat="server" ID="MedTxDate_13" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="13"  ID="MedTxStopDateText_13" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="13" Runat="server" ID="MedTxStopDate_13" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="13" Table="MedicalTherapy" Runat="server" id="MedTxAgent_13"  /></td>
    <td><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_13"/></td>
    <td><euc:EformTextBox RecordId="13" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_13"/>&nbsp;</td><td><euc:EformSelect RecordId="13" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_13" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="13" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_13"  /></td>
   <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="13" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_13"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="14" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_14" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="14"  ID="MedTxDateText_14" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="14" Runat="server" ID="MedTxDate_14" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="14"  ID="MedTxStopDateText_14" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="14" Runat="server" ID="MedTxStopDate_14" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="14" Table="MedicalTherapy" Runat="server" id="MedTxAgent_14"  /></td>
    <td><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_14"/></td>
    <td><euc:EformTextBox RecordId="14" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_14"/>&nbsp;</td><td><euc:EformSelect RecordId="14" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_14" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="14" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_14"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="14" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_14"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
 <tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="15" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_15" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="15"  ID="MedTxDateText_15" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="15" Runat="server" ID="MedTxDate_15" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="15"  ID="MedTxStopDateText_15" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="15" Runat="server" ID="MedTxStopDate_15" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="15" Table="MedicalTherapy" Runat="server" id="MedTxAgent_15"  /></td>
    <td><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_15"/></td>
    <td><euc:EformTextBox RecordId="15" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_15"/>&nbsp;</td><td><euc:EformSelect RecordId="15" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_15" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="15" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_15"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="15" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_15"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="16" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_16" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="16"  ID="MedTxDateText_16" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="16" Runat="server" ID="MedTxDate_16" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="16"  ID="MedTxStopDateText_16" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="16" Runat="server" ID="MedTxStopDate_16" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="16" Table="MedicalTherapy" Runat="server" id="MedTxAgent_16"  /></td>
    <td><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_16"/></td>
    <td><euc:EformTextBox RecordId="16" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_16"/>&nbsp;</td><td><euc:EformSelect RecordId="16" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_16" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="16" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_16"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="16" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_16"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="17" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_17" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="17"  ID="MedTxDateText_17" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="17" Runat="server" ID="MedTxDate_17" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="17"  ID="MedTxStopDateText_17" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="17" Runat="server" ID="MedTxStopDate_17" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="17" Table="MedicalTherapy" Runat="server" id="MedTxAgent_17"  /></td>
    <td><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_17"/></td>
    <td><euc:EformTextBox RecordId="17" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_17"/>&nbsp;</td><td><euc:EformSelect RecordId="17" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_17" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="17" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_17"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="17" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_17"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="18" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_18" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="18"  ID="MedTxDateText_18" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="18" Runat="server" ID="MedTxDate_18" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="18"  ID="MedTxStopDateText_18" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="18" Runat="server" ID="MedTxStopDate_18" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="18" Table="MedicalTherapy" Runat="server" id="MedTxAgent_18"  /></td>
    <td><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_18"/></td>
    <td><euc:EformTextBox RecordId="18" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_18"/>&nbsp;</td><td><euc:EformSelect RecordId="18" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_18" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="18" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_18"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="18" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_18"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="19" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_19" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="19"  ID="MedTxDateText_19" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="19" Runat="server" ID="MedTxDate_19" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="19"  ID="MedTxStopDateText_19" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="19" Runat="server" ID="MedTxStopDate_19" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="19" Table="MedicalTherapy" Runat="server" id="MedTxAgent_19"  /></td>
    <td><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_19"/></td>
    <td><euc:EformTextBox RecordId="19" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_19"/>&nbsp;</td><td><euc:EformSelect RecordId="19" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_19" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="19" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_19"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="19" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_19"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="20" Table="MedicalTherapy" Field="MedTxType" Runat="server" ID="MedTxType_20" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="20"  ID="MedTxDateText_20" Table="MedicalTherapy" Field="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    /><euc:EformHidden RecordId="20" Runat="server" ID="MedTxDate_20" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="20"  ID="MedTxStopDateText_20" Table="MedicalTherapy" Field="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setHormoneMedTxTypeFields();"    />
    <euc:EformHidden RecordId="20" Runat="server" ID="MedTxStopDate_20" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="20" Table="MedicalTherapy" Runat="server" id="MedTxAgent_20"  /></td>
    <td><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxCycle" Runat="server" ID="MedTxCycle_20"/></td>
    <td><euc:EformTextBox RecordId="20" ShowCalendar="False" CalcDate="False" style="width:40px;" Table="MedicalTherapy" Field="MedTxDose" Runat="server" ID="MedTxDose_20"/>&nbsp;</td><td><euc:EformSelect RecordId="20" LookupCode="MedUnits" Table="MedicalTherapy" Field="MedTxUnits" Runat="server" ID="MedTxUnits_20" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="20" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_20"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="20" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_20"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<!-- Blank Rows End -->
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'HormoneTherapyHtmlTable');" />
</span>
<div id="HormoneAbsentEvent" style="display: none;">
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_2"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentDate" ID="AbsentDate_2"
                Runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="TableName" ID="TableName_2"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldName" ID="FieldName_2"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_2"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_2"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="2" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_2"
                runat="server"  style="display:none;" />
</div>
<br/><br/>
<script type="text/javascript">
function attachShowHideHormoneTxScriptsAndSetInitialDisplay()
{
	var AddHormoneTxYesNoContainer = $('AddHormoneTxYesNoContainer');
	var HormoneYesNoRadios = AddHormoneTxYesNoContainer.getElementsByTagName('input');
	var showHormoneTxOnload = false;
	var showHormoneTxMsg = false;
	var HormoneTxDetails = document.getElementById('HormoneTxDetails');
	var AddHormoneTxTable  = $('AddHormoneTxTable');
	
	
	if (<% =PriorHormoneTxExist.ToString().ToLower() %>)
	{
	    showHormoneTxOnload = true;
	    showHormoneTxMsg = false;
	}
	else
	{
	    showHormoneTxMsg = true;
	    for (var i=0;i<HormoneYesNoRadios.length;i++)
	    {
		    if (HormoneYesNoRadios[i].type == 'radio')
		    {
			    HormoneYesNoRadios[i].onclick = function() {showHideHormoneTx(this)};
			    if (HormoneYesNoRadios[i].checked && HormoneYesNoRadios[i].value.toString().toUpperCase() == 'YES') showHormoneTxOnload = true;
		    }
	    }
	}
	if (showHormoneTxOnload) HormoneTxDetails.style.display = 'block';
	if (showHormoneTxMsg){AddHormoneTxTable.style.display = 'block';}
	else {AddHormoneTxTable.style.display = 'none';}
	
}
attachShowHideHormoneTxScriptsAndSetInitialDisplay();

function showHideHormoneTx(theRadio)
{
	var HormoneTxDetails = document.getElementById('HormoneTxDetails');
	var HormoneAbsentEvent = document.getElementById('HormoneAbsentEvent');
	
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		HormoneTxDetails.style.display = 'block';
		clearAllElementsContainedInNode(HormoneAbsentEvent);
	}
	else
	{
		HormoneTxDetails.style.display = 'none';
		clearAllElementsContainedInNode(HormoneTxDetails);
		$('<% =TableName_2.ClientID %>').value = 'MedicalTherapy';
		$('<% =FieldName_2.ClientID %>').value = 'MedTxType';
		$('<% =FieldValue_2.ClientID %>').value = 'HORM';
	}

}

function setHormoneMedTxTypeFields()
{
    var map = <%= GetEnableHiddenScript(System.Linq.Enumerable.Range(1,20)) %>;
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
        target.value = hasValue? 'HORM' : '';
    }
}

</script>