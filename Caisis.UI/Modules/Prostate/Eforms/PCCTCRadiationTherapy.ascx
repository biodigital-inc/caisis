<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.PCCTCRadiationTherapy" CodeFile="PCCTCRadiationTherapy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.RadiationTherapyHtmlTable = "RadiationTherapyHtmlTable";
</script>
<style type="text/css">
#RadiationTherapyHtmlTable td
{
    white-space: nowrap;
}
</style>
<a name="PCCTCRadiationTherapy" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiation Therapy"></asp:Label><br/>
<table id="AddRadTxTable" border="0" cellspacing="0" cellpadding="16" width="850" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;" id="AddRadTxYesNoContainer">
	
	No prior radiation therapy have been recorded for this patient.<br /><br />
	
	<strong>Add radiation therapy?</strong><euc:EformRadioButtonList Table="NoTable" Field="RadiationYesNo" id="RadiationYesNo" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
</table>





<span id="RadTxDetails" style="display: none;" >


<table width="850" cellpadding="1" cellspacing="0" class="ClinicalEformTable" id="RadiationTherapyHtmlTable" style="background-color: #ffffff;">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Start Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Stop Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">Target</td>
    <td class="controlBoxDataGridHeaderFirstCol">Intent</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;"># Fractions</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">Total Dose</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">Units</td>
   <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">Disc. Reason</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="XRT" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxStopDateText,RadTxStopDate,RadTxType,RadTxTarget,RadTxIntent,RadTxNumFractions,RadTxTotalDose,RadTxUnits', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxIntent") %>&nbsp;</td>
		  <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxNumFractions") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxUnits") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxNotes") %>&nbsp;</td>
            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td height="28"><euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxDateText_1" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   /><euc:EformHidden RecordId="1" Runat="server" ID="RadTxDate_1" Table="RadiationTherapy" Field="RadTxDate" /></td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxStopDateText_1" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="1" Runat="server" ID="RadTxStopDate_1" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="1" LookupCode="RadTxType" style="width:80px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_1"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxTarget_1"  /></td>
    <td><euc:EformComboBox  LookupCode="TxIntent" style="width:80px;" DropDownWidth="250" Field="RadTxIntent" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxIntent_1"  /></td>
    <td><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_1"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_1"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="1" ID="RadTxUnits_1"/></td>
    <td><euc:EformComboBox   style="width:65px;" Field="RadTxNotes" LookupCode="TxDiscReason" RecordId="1" Table="RadiationTherapy" Runat="server" ID="RadTxNotes_1"  /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxDateText_2" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="2" Runat="server" ID="RadTxDate_2" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxStopDateText_2" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="2" Runat="server" ID="RadTxStopDate_2" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="2" LookupCode="RadTxType" style="width:80px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_2"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxTarget_2"  /></td>
    <td><euc:EformComboBox  LookupCode="TxIntent" style="width:80px;" DropDownWidth="250" Field="RadTxIntent" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxIntent_2"  /></td>
    <td><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_2"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_2"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="2" ID="RadTxUnits_2"/></td>
    <td><euc:EformComboBox   style="width:65px;" Field="RadTxNotes" LookupCode="TxDiscReason" RecordId="2" Table="RadiationTherapy" Runat="server" ID="RadTxNotes_2"  /></td>
    <td><euc:EformDeleteIcon ID="temp" runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxDateText_3" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="3" Runat="server" ID="RadTxDate_3" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxStopDateText_3" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="3" Runat="server" ID="RadTxStopDate_3" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="3" LookupCode="RadTxType" style="width:80px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_3"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxTarget_3"  /></td>
    <td><euc:EformComboBox  LookupCode="TxIntent" style="width:80px;" DropDownWidth="250" Field="RadTxIntent" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxIntent_3"  /></td>
    <td><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_3"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_3"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="3" ID="RadTxUnits_3"/></td>
    <td><euc:EformComboBox   style="width:65px;" Field="RadTxNotes" LookupCode="TxDiscReason" RecordId="3" Table="RadiationTherapy" Runat="server" ID="RadTxNotes_3"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="4"  ID="RadTxDateText_4" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="4" Runat="server" ID="RadTxDate_4" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="4"  ID="RadTxStopDateText_4" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="4" Runat="server" ID="RadTxStopDate_4" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="4" LookupCode="RadTxType" style="width:80px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_4"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxTarget_4"  /></td>
    <td><euc:EformComboBox  LookupCode="TxIntent" style="width:80px;" DropDownWidth="250" Field="RadTxIntent" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxIntent_4"  /></td>
    <td><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_4"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_4"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="4" ID="RadTxUnits_4"/></td>
    <td><euc:EformComboBox   style="width:65px;" Field="RadTxNotes" LookupCode="TxDiscReason" RecordId="4" Table="RadiationTherapy" Runat="server" ID="RadTxNotes_4"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="5"  ID="RadTxDateText_5" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="5" Runat="server" ID="RadTxDate_5" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="5"  ID="RadTxStopDateText_5" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="5" Runat="server" ID="RadTxStopDate_5" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="5" LookupCode="RadTxType" style="width:80px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_5"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxTarget_5"  /></td>
    <td><euc:EformComboBox  LookupCode="TxIntent" style="width:80px;" DropDownWidth="250" Field="RadTxIntent" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxIntent_5"  /></td>
    <td><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_5"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_5"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="5" ID="RadTxUnits_5"/></td>
    <td><euc:EformComboBox   style="width:65px;" Field="RadTxNotes" LookupCode="TxDiscReason" RecordId="5" Table="RadiationTherapy" Runat="server" ID="RadTxNotes_5"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="6"  ID="RadTxDateText_6" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="6" Runat="server" ID="RadTxDate_6" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="6"  ID="RadTxStopDateText_6" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="6" Runat="server" ID="RadTxStopDate_6" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="6" LookupCode="RadTxType" style="width:80px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_6"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="6" Table="RadiationTherapy" Runat="server" id="RadTxTarget_6"  /></td>
    <td><euc:EformComboBox  LookupCode="TxIntent" style="width:80px;" DropDownWidth="250" Field="RadTxIntent" RecordId="6" Table="RadiationTherapy" Runat="server" id="RadTxIntent_6"  /></td>
    <td><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_6"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="6" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_6"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="6" ID="RadTxUnits_6"/></td>
    <td><euc:EformComboBox   style="width:65px;" Field="RadTxNotes" LookupCode="TxDiscReason" RecordId="6" Table="RadiationTherapy" Runat="server" ID="RadTxNotes_6"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="7"  ID="RadTxDateText_7" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="7" Runat="server" ID="RadTxDate_7" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="7"  ID="RadTxStopDateText_7" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="7" Runat="server" ID="RadTxStopDate_7" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="7" LookupCode="RadTxType" style="width:80px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_7"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="7" Table="RadiationTherapy" Runat="server" id="RadTxTarget_7"  /></td>
    <td><euc:EformComboBox  LookupCode="TxIntent" style="width:80px;" DropDownWidth="250" Field="RadTxIntent" RecordId="7" Table="RadiationTherapy" Runat="server" id="RadTxIntent_7"  /></td>
    <td><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_7"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="7" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_7"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="7" ID="RadTxUnits_7"/></td>
    <td><euc:EformComboBox   style="width:65px;" Field="RadTxNotes" LookupCode="TxDiscReason" RecordId="7" Table="RadiationTherapy" Runat="server" ID="RadTxNotes_7"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="8"  ID="RadTxDateText_8" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="8" Runat="server" ID="RadTxDate_8" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="8"  ID="RadTxStopDateText_8" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="8" Runat="server" ID="RadTxStopDate_8" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="8" LookupCode="RadTxType" style="width:80px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_8"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="8" Table="RadiationTherapy" Runat="server" id="RadTxTarget_8"  /></td>
    <td><euc:EformComboBox  LookupCode="TxIntent" style="width:80px;" DropDownWidth="250" Field="RadTxIntent" RecordId="8" Table="RadiationTherapy" Runat="server" id="RadTxIntent_8"  /></td>
    <td><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_8"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="8" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_8"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="8" ID="RadTxUnits_8"/></td>
    <td><euc:EformComboBox   style="width:65px;" Field="RadTxNotes" LookupCode="TxDiscReason" RecordId="8" Table="RadiationTherapy" Runat="server" ID="RadTxNotes_8"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="9"  ID="RadTxDateText_9" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="9" Runat="server" ID="RadTxDate_9" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="9"  ID="RadTxStopDateText_9" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="9" Runat="server" ID="RadTxStopDate_9" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="9" LookupCode="RadTxType" style="width:80px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_9"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="9" Table="RadiationTherapy" Runat="server" id="RadTxTarget_9"  /></td>
    <td><euc:EformComboBox  LookupCode="TxIntent" style="width:80px;" DropDownWidth="250" Field="RadTxIntent" RecordId="9" Table="RadiationTherapy" Runat="server" id="RadTxIntent_9"  /></td>
    <td><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_9"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="9" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_9"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="9" ID="RadTxUnits_9"/></td>
    <td><euc:EformComboBox   style="width:65px;" Field="RadTxNotes" LookupCode="TxDiscReason" RecordId="9" Table="RadiationTherapy" Runat="server" ID="RadTxNotes_9"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="10"  ID="RadTxDateText_10" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="10" Runat="server" ID="RadTxDate_10" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="10"  ID="RadTxStopDateText_10" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="10" Runat="server" ID="RadTxStopDate_10" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="10" LookupCode="RadTxType" style="width:80px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_10"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:80px;" Field="RadTxTarget" RecordId="10" Table="RadiationTherapy" Runat="server" id="RadTxTarget_10"  /></td>
    <td><euc:EformComboBox  LookupCode="TxIntent" style="width:80px;" DropDownWidth="250" Field="RadTxIntent" RecordId="10" Table="RadiationTherapy" Runat="server" id="RadTxIntent_10"  /></td>
    <td><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_10"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="10" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_10"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="10" ID="RadTxUnits_10"/></td>
    <td><euc:EformComboBox   style="width:65px;" Field="RadTxNotes" LookupCode="TxDiscReason" RecordId="10" Table="RadiationTherapy" Runat="server" ID="RadTxNotes_10"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'RadiationTherapyHtmlTable');" />

</span>
<div id="RadiationAbsentEvent" style="display: none;">
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_5"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="5" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_5"
                Runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="TableName" ID="TableName_5"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldName" ID="FieldName_5"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_5"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_5"
                runat="server" style="display:none;" />
            <euc:EformTextBox RecordId="5" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_5"
                runat="server"  style="display:none;" />
</div>

<br/><br/>
<script type="text/javascript">
function attachShowHideRadTxScriptsAndSetInitialDisplay()
{

    
	var AddRadTxYesNoContainer = $('AddRadTxYesNoContainer');
	var RadTxYesNoRadios = AddRadTxYesNoContainer.getElementsByTagName('input');
	var showRadTxOnload = false;
	var showRadTxMsg = false;
	var RadTxDetails = document.getElementById('RadTxDetails');
	var AddRadTxTable  = $('AddRadTxTable');
	
	
	if (<% =PriorRadTxExist.ToString().ToLower() %>)
	{
	    showRadTxOnload = true;
	    showRadTxMsg = false;
	}
	else
	{
	    showRadTxMsg = true;
	    for (var i=0;i<RadTxYesNoRadios.length;i++)
	    {
		    if (RadTxYesNoRadios[i].type == 'radio')
		    {
			    RadTxYesNoRadios[i].onclick = function() {showHideRadTx(this)};
			    if (RadTxYesNoRadios[i].checked && RadTxYesNoRadios[i].value.toString().toUpperCase() == 'YES') showRadTxOnload = true;
		    }
	    }
	}
	if (showRadTxOnload) RadTxDetails.style.display = 'block';
	if (showRadTxMsg){AddRadTxTable.style.display = 'block';}
	else {AddRadTxTable.style.display = 'none';}
	
}
attachShowHideRadTxScriptsAndSetInitialDisplay();

function showHideRadTx(theRadio)
{
	var RadTxDetails = document.getElementById('RadTxDetails');
	var RadiationAbsentEvent = document.getElementById('RadiationAbsentEvent');

	
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		RadTxDetails.style.display = 'block';
		clearAllElementsContainedInNode(RadiationAbsentEvent);
	}
	else
	{
		RadTxDetails.style.display = 'none';
		clearAllElementsContainedInNode(RadTxDetails);
		$('<% =TableName_5.ClientID %>').value = 'RadiationTherapy';
		$('<% =FieldName_5.ClientID %>').value = 'RadTxTarget';
		$('<% =FieldValue_5.ClientID %>').value = 'Prostate';
	}

}

</script>
