<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PCCTCChemoTherapy" CodeFile="PCCTCChemoTherapy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.MedicalTherapyHtmlTable = "MedicalTherapyHtmlTable";
</script>
<style type="text/css">
#MedicalTherapyHtmlTable td
{
    white-space: nowrap;
}
</style>

<a name="PCCTCChemoTherapy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Chemotherapy"></asp:Label><br/>
<table id="AddMedTxTable" border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td id="AddMedTxYesNoContainer">
	
	No prior chemotherapies have been recorded for this patient.<br /><br />
	
	<strong>Has the subject had prior chemotherapy?</strong><euc:EformRadioButtonList Table="NoTable" Field="ChemoYesNo" id="MedTxYesNo" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
</table>





<span id="MedTxDetails" style="display: none;" >
<table width="700" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="MedicalTherapyHtmlTable" style="background-color: #ffffff;" onclick="setChemoMedTxTypeFields();" >
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;white-space:nowrap;">Start Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Stop Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Agent</td>
    <td style="font-size: 10px;" class="controlBoxDataGridHeaderFirstCol">Total<br />Cycles</td>
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
    <td height="28"><euc:EformTextBox RecordId="31"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_31" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="31"  ID="MedTxDateText_31" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"  /><euc:EformHidden RecordId="31" Runat="server" ID="MedTxDate_31" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="31"  ID="MedTxStopDateText_31" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="31" Runat="server" ID="MedTxStopDate_31" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="31" Table="MedicalTherapy" Runat="server" id="MedTxAgent_31"  /></td>
    <td><euc:EformTextBox RecordId="31" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_31"/></td>
    <td><euc:EformTextBox RecordId="31" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_31"/>&nbsp;</td><td><euc:EformSelect RecordId="31" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_31" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="31" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_31"  /></td>
    <td><euc:EformComboBox    style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="31" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_31"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="32"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_32" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="32"  ID="MedTxDateText_32" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    /><euc:EformHidden RecordId="32" Runat="server" ID="MedTxDate_32" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="32"  ID="MedTxStopDateText_32" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="32" Runat="server" ID="MedTxStopDate_32" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="32" Table="MedicalTherapy" Runat="server" id="MedTxAgent_32"  /></td>
    <td><euc:EformTextBox RecordId="32" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_32"/></td>
    <td><euc:EformTextBox RecordId="32" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_32"/>&nbsp;</td><td><euc:EformSelect RecordId="32" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_32" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="32" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_32"  /></td>
    <td><euc:EformComboBox    style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="32" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_32"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="33"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_33" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="33"  ID="MedTxDateText_33" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    /><euc:EformHidden RecordId="33" Runat="server" ID="MedTxDate_33" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="33"  ID="MedTxStopDateText_33" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="33" Runat="server" ID="MedTxStopDate_33" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="33" Table="MedicalTherapy" Runat="server" id="MedTxAgent_33"  /></td>
    <td><euc:EformTextBox RecordId="33" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_33"/></td>
    <td><euc:EformTextBox RecordId="33" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_33"/>&nbsp;</td><td><euc:EformSelect RecordId="33" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_33" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="33" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_33"  /></td>
    <td><euc:EformComboBox    style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="33" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_33"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="34"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_34" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="34"  ID="MedTxDateText_34" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    /><euc:EformHidden RecordId="34" Runat="server" ID="MedTxDate_34" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="34"  ID="MedTxStopDateText_34" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="34" Runat="server" ID="MedTxStopDate_34" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="34" Table="MedicalTherapy" Runat="server" id="MedTxAgent_34"  /></td>
    <td><euc:EformTextBox RecordId="34" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_34"/></td>
    <td><euc:EformTextBox RecordId="34" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_34"/>&nbsp;</td><td><euc:EformSelect RecordId="34" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_34" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="34" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_34"  /></td>
    <td><euc:EformComboBox    style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="34" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_34"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="35"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_35" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="35"  ID="MedTxDateText_35" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    /><euc:EformHidden RecordId="35" Runat="server" ID="MedTxDate_35" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="35"  ID="MedTxStopDateText_35" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="35" Runat="server" ID="MedTxStopDate_35" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="35" Table="MedicalTherapy" Runat="server" id="MedTxAgent_35"  /></td>
    <td><euc:EformTextBox RecordId="35" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_35"/></td>
    <td><euc:EformTextBox RecordId="35" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_35"/>&nbsp;</td><td><euc:EformSelect RecordId="35" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_35" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="35" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_35"  /></td>
    <td><euc:EformComboBox    style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="35" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_35"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="36"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_36" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="36"  ID="MedTxDateText_36" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    /><euc:EformHidden RecordId="36" Runat="server" ID="MedTxDate_36" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="36"  ID="MedTxStopDateText_36" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="36" Runat="server" ID="MedTxStopDate_36" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="36" Table="MedicalTherapy" Runat="server" id="MedTxAgent_36"  /></td>
    <td><euc:EformTextBox RecordId="36" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_36"/></td>
    <td><euc:EformTextBox RecordId="36" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_36"/>&nbsp;</td><td><euc:EformSelect RecordId="36" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_36" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="36" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_36"  /></td>
    <td><euc:EformComboBox style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="36" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_36"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="37"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_37" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="37"  ID="MedTxDateText_37" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    /><euc:EformHidden RecordId="37" Runat="server" ID="MedTxDate_37" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="37"  ID="MedTxStopDateText_37" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="37" Runat="server" ID="MedTxStopDate_37" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="37" Table="MedicalTherapy" Runat="server" id="MedTxAgent_37"  /></td>
    <td><euc:EformTextBox RecordId="37" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_37"/></td>
    <td><euc:EformTextBox RecordId="37" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_37"/>&nbsp;</td><td><euc:EformSelect RecordId="37" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_37" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="37" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_37"  /></td>
    <td><euc:EformComboBox    style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="37" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_37"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="38"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_38" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="38"  ID="MedTxDateText_38" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    /><euc:EformHidden RecordId="38" Runat="server" ID="MedTxDate_38" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="38"  ID="MedTxStopDateText_38" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="38" Runat="server" ID="MedTxStopDate_38" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="38" Table="MedicalTherapy" Runat="server" id="MedTxAgent_38"  /></td>
    <td><euc:EformTextBox RecordId="38" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_38"/></td>
    <td><euc:EformTextBox RecordId="38" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_38"/>&nbsp;</td><td><euc:EformSelect RecordId="38" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_38" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="38" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_38"  /></td>
    <td><euc:EformComboBox    style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="38" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_38"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="39"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_39" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="39"  ID="MedTxDateText_39" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    /><euc:EformHidden RecordId="39" Runat="server" ID="MedTxDate_39" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="39"  ID="MedTxStopDateText_39" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="39" Runat="server" ID="MedTxStopDate_39" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="39" Table="MedicalTherapy" Runat="server" id="MedTxAgent_39"  /></td>
    <td><euc:EformTextBox RecordId="39" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_39"/></td>
    <td><euc:EformTextBox RecordId="39" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_39"/>&nbsp;</td><td><euc:EformSelect RecordId="39" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_39" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="39" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_39"  /></td>
    <td><euc:EformComboBox    style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="39" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_39"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<tr style="display: none;">
    <td height="28"><euc:EformTextBox RecordId="40"   TABLE="MedicalTherapy" FIELD="MedTxType" Runat="server" ID="MedTxType_40" style="display: none;"/><euc:EformTextBox Runat="server" RecordId="40"  ID="MedTxDateText_40" TABLE="MedicalTherapy" FIELD="MedTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    /><euc:EformHidden RecordId="40" Runat="server" ID="MedTxDate_40" Table="MedicalTherapy" Field="MedTxDate" /></td> 
    <td><euc:EformTextBox Runat="server" RecordId="40"  ID="MedTxStopDateText_40" TABLE="MedicalTherapy" FIELD="MedTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setChemoMedTxTypeFields();"    />
    <euc:EformHidden RecordId="40" Runat="server" ID="MedTxStopDate_40" Table="MedicalTherapy" Field="MedTxStopDate" /></td>
    <td><euc:EFormComboBox DropDownWidth="400"  LookupCode="MedTxAgent" style="width:140px;" Field="MedTxAgent" RecordId="40" Table="MedicalTherapy" Runat="server" id="MedTxAgent_40"  /></td>
    <td><euc:EformTextBox RecordId="40" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxCycle" Runat="server" ID="MedTxCycle_40"/></td>
    <td><euc:EformTextBox RecordId="40" ShowCalendar="False" CalcDate="False" style="width:40px;" TABLE="MedicalTherapy" FIELD="MedTxDose" Runat="server" ID="MedTxDose_40"/>&nbsp;</td><td><euc:EformSelect RecordId="40" LookupCode="MedUnits" TABLE="MedicalTherapy" FIELD="MedTxUnits" Runat="server" ID="MedTxUnits_40" style="width: 55px;"/></td>
    <td><euc:EFormComboBox DropDownWidth="220"  LookupCode="MedSchedule"  style="width:65px;" Field="MedTxSchedule" RecordId="40" Table="MedicalTherapy" Runat="server" id="MedTxSchedule_40"  /></td>
    <td><euc:EformComboBox    style="width:55px;" Field="MedTxNotes" LookupCode="TxDiscReason" RecordId="40" Table="MedicalTherapy" Runat="server" ID="MedTxNotes_40"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
</tr>
<!-- Blank Rows End -->
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'MedicalTherapyHtmlTable');" />
</span>
<div id="MedTxAbsentEvent" style="display: none;">
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_1"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_1"
                Runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="TableName" ID="TableName_1"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldName" ID="FieldName_1"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_1"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_1"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="1" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_1"
                runat="server"  style="width:1px;display:none;"/>
</div>
<br/><br/>
<script type="text/javascript">
function attachShowHideMedTxScriptsAndSetInitialDisplay()
{
	var AddMedTxYesNoContainer = $('AddMedTxYesNoContainer');
	var MedTxYesNoRadios = AddMedTxYesNoContainer.getElementsByTagName('input');
	var showMedTxOnload = false;
	var showMedTxMsg = false;
	var MedTxDetails = document.getElementById('MedTxDetails');
	var AddMedTxTable  = $('AddMedTxTable');
	
	
	if (<% =PriorMedTxExist.ToString().ToLower() %>)
	{
	    showMedTxOnload = true;
	    showMedTxMsg = false;
	}
	else
	{
	    showMedTxMsg = true;
	    for (var i=0;i<MedTxYesNoRadios.length;i++)
	    {
		    if (MedTxYesNoRadios[i].type == 'radio')
		    {
			    MedTxYesNoRadios[i].onclick = function() {showHideMedTx(this)};
			    if (MedTxYesNoRadios[i].checked && MedTxYesNoRadios[i].value.toString().toUpperCase() == 'YES') showMedTxOnload = true;
		    }
	    }
	}
	if (showMedTxOnload) MedTxDetails.style.display = 'block';
	if (showMedTxMsg){AddMedTxTable.style.display = 'block';}
	else {AddMedTxTable.style.display = 'none';}
	
}
attachShowHideMedTxScriptsAndSetInitialDisplay();

function showHideMedTx(theRadio)
{
	var MedTxDetails = document.getElementById('MedTxDetails');
	var MedTxAbsentEvent = document.getElementById('MedTxAbsentEvent');
	
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		MedTxDetails.style.display = 'block';
		clearAllElementsContainedInNode(MedTxAbsentEvent);
	}
	else
	{
		MedTxDetails.style.display = 'none';
		clearAllElementsContainedInNode(MedTxDetails);
		$('<% =TableName_1.ClientID %>').value = 'MedicalTherapy';
		$('<% =FieldName_1.ClientID %>').value = 'MedTxType';
		$('<% =FieldValue_1.ClientID %>').value = 'CHEMO';
	}

}

function setChemoMedTxTypeFields()
{
    var map = <%= GetEnableHiddenScript(System.Linq.Enumerable.Range(31,10)) %>;
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
        target.value = hasValue? 'CHEMO' : '';
    }
}

</script>