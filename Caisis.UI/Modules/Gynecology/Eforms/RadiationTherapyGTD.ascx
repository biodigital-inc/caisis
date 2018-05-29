<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.RadiationTherapyGTD" CodeFile="RadiationTherapyGTD.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script type="text/javascript" language="javascript">
	tableArray.RadiationTherapyHtmlTable = "RadiationTherapyHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="RadiationTherapyGTD" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Radiation Therapy"></asp:Label><br/>

<span class="ClinicalEformPopulatedColumn"></span>
<table width="700" cellpadding="1" cellspacing="0" class="ClinicalEformTable" id="RadiationTherapyHtmlTable" style="background-color: #ffffff;">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Stop Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">Target</td>
    <td class="controlBoxDataGridHeaderFirstCol">Indication</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;"># Fractions</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">Total Dose</td>
    <td class="controlBoxDataGridHeaderFirstCol">Units</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="font-size: 10px;">Institution</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="XRT" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('RadiationTherapy', <%# DataBinder.Eval(Container.DataItem, "RadiationTherapyId") %>, 'RadTxDateText,RadTxDate,RadTxStopDateText,RadTxStopDate,RadTxType,RadTxTarget,RadTxIntent,RadTxNumFractions,RadTxTotalDose,RadTxUnits', 'RadiationTherapy');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxStopDateText") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "RadTxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTarget") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxNumFractions") %>&nbsp;</td>
		  <td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxNumFractions") %>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxTotalDose") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxUnits") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "RadTxInstitution") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr >
    <td height="28"><euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxDateText_1" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   /><euc:EformHidden RecordId="1" Runat="server" ID="RadTxDate_1" Table="RadiationTherapy" Field="RadTxDate" /></td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="1"  ID="RadTxStopDateText_1" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="1" Runat="server" ID="RadTxStopDate_1" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="1" LookupCode="RadTxType" style="width:130px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_1"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:110px;" Field="RadTxTarget" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxTarget_1"  /></td>
    <td><euc:EformComboBox  LookupCode="Indication" style="width:110px;" DropDownWidth="250" Field="RadTxIndication" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxIndication_1"  /></td>
    <td><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_1"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_1"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="1" ID="RadTxUnits_1"/></td>
    <td><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="RadTxInstitution" RecordId="1" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_1"  /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxDateText_2" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="2" Runat="server" ID="RadTxDate_2" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="2"  ID="RadTxStopDateText_2" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="2" Runat="server" ID="RadTxStopDate_2" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="2" LookupCode="RadTxType" style="width:130px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_2"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:110px;" Field="RadTxTarget" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxTarget_2"  /></td>
    <td><euc:EformComboBox  LookupCode="Indication" style="width:110px;" DropDownWidth="250" Field="RadTxIndication" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxIndication_2"  /></td>
    <td><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_2"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_2"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="2" ID="RadTxUnits_2"/></td>
    <td><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="RadTxInstitution" RecordId="2" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_2"  /></td>
    <td><euc:EformDeleteIcon ID="temp" runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxDateText_3" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="3" Runat="server" ID="RadTxDate_3" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="3"  ID="RadTxStopDateText_3" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="3" Runat="server" ID="RadTxStopDate_3" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="3" LookupCode="RadTxType" style="width:130px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_3"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:110px;" Field="RadTxTarget" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxTarget_3"  /></td>
    <td><euc:EformComboBox  LookupCode="Indication" style="width:110px;" DropDownWidth="250" Field="RadTxIndication" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxIndication_3"  /></td>
    <td><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_3"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_3"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="3" ID="RadTxUnits_3"/></td>
    <td><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="RadTxInstitution" RecordId="3" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_3"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="4"  ID="RadTxDateText_4" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="4" Runat="server" ID="RadTxDate_4" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="4"  ID="RadTxStopDateText_4" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="4" Runat="server" ID="RadTxStopDate_4" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="4" LookupCode="RadTxType" style="width:130px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_4"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:110px;" Field="RadTxTarget" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxTarget_4"  /></td>
    <td><euc:EformComboBox  LookupCode="Indication" style="width:110px;" DropDownWidth="250" Field="RadTxIndication" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxIndication_4"  /></td>
    <td><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_4"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_4"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="4" ID="RadTxUnits_4"/></td>
    <td><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="RadTxInstitution" RecordId="4" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_4"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="5"  ID="RadTxDateText_5" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="5" Runat="server" ID="RadTxDate_5" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="5"  ID="RadTxStopDateText_5" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="5" Runat="server" ID="RadTxStopDate_5" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="5" LookupCode="RadTxType" style="width:130px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_5"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:110px;" Field="RadTxTarget" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxTarget_5"  /></td>
    <td><euc:EformComboBox  LookupCode="Indication" style="width:110px;" DropDownWidth="250" Field="RadTxIndication" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxIndication_5"  /></td>
    <td><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_5"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_5"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="5" ID="RadTxUnits_5"/></td>
    <td><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="RadTxInstitution" RecordId="5" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_5"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="6"  ID="RadTxDateText_6" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="6" Runat="server" ID="RadTxDate_6" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="6"  ID="RadTxStopDateText_6" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="6" Runat="server" ID="RadTxStopDate_6" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="6" LookupCode="RadTxType" style="width:130px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_6"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:110px;" Field="RadTxTarget" RecordId="6" Table="RadiationTherapy" Runat="server" id="RadTxTarget_6"  /></td>
    <td><euc:EformComboBox  LookupCode="Indication" style="width:110px;" DropDownWidth="250" Field="RadTxIndication" RecordId="6" Table="RadiationTherapy" Runat="server" id="RadTxIndication_6"  /></td>
    <td><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_6"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="6" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_6"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="6" ID="RadTxUnits_6"/></td>
    <td><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="RadTxInstitution" RecordId="6" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_6"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="7"  ID="RadTxDateText_7" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="7" Runat="server" ID="RadTxDate_7" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="7"  ID="RadTxStopDateText_7" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="7" Runat="server" ID="RadTxStopDate_7" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="7" LookupCode="RadTxType" style="width:130px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_7"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:110px;" Field="RadTxTarget" RecordId="7" Table="RadiationTherapy" Runat="server" id="RadTxTarget_7"  /></td>
    <td><euc:EformComboBox  LookupCode="Indication" style="width:110px;" DropDownWidth="250" Field="RadTxIndication" RecordId="7" Table="RadiationTherapy" Runat="server" id="RadTxIndication_7"  /></td>
    <td><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_7"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="7" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_7"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="7" ID="RadTxUnits_7"/></td>
    <td><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="RadTxInstitution" RecordId="7" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_7"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="8"  ID="RadTxDateText_8" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="8" Runat="server" ID="RadTxDate_8" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="8"  ID="RadTxStopDateText_8" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="8" Runat="server" ID="RadTxStopDate_8" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="8" LookupCode="RadTxType" style="width:130px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_8"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:110px;" Field="RadTxTarget" RecordId="8" Table="RadiationTherapy" Runat="server" id="RadTxTarget_8"  /></td>
    <td><euc:EformComboBox  LookupCode="Indication" style="width:110px;" DropDownWidth="250" Field="RadTxIndication" RecordId="8" Table="RadiationTherapy" Runat="server" id="RadTxIndication_8"  /></td>
    <td><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_8"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="8" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_8"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="8" ID="RadTxUnits_8"/></td>
    <td><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="RadTxInstitution" RecordId="8" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_8"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="9"  ID="RadTxDateText_9" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="9" Runat="server" ID="RadTxDate_9" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="9"  ID="RadTxStopDateText_9" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="9" Runat="server" ID="RadTxStopDate_9" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="9" LookupCode="RadTxType" style="width:130px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_9"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:110px;" Field="RadTxTarget" RecordId="9" Table="RadiationTherapy" Runat="server" id="RadTxTarget_9"  /></td>
    <td><euc:EformComboBox  LookupCode="Indication" style="width:110px;" DropDownWidth="250" Field="RadTxIndication" RecordId="9" Table="RadiationTherapy" Runat="server" id="RadTxIndication_9"  /></td>
    <td><euc:EformTextBox RecordId="9" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_9"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="9" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_9"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="9" ID="RadTxUnits_9"/></td>
    <td><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="RadTxInstitution" RecordId="9" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_9"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="10"  ID="RadTxDateText_10" TABLE="RadiationTherapy" FIELD="RadTxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="10" Runat="server" ID="RadTxDate_10" Table="RadiationTherapy" Field="RadTxDate" />    </td> 
    <td align="center"><euc:EformTextBox Runat="server" RecordId="10"  ID="RadTxStopDateText_10" TABLE="RadiationTherapy" FIELD="RadTxStopDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
        <euc:EformHidden RecordId="10" Runat="server" ID="RadTxStopDate_10" Table="RadiationTherapy" Field="RadTxStopDate" /></td>
    <td><euc:EformSelect RecordId="10" LookupCode="RadTxType" style="width:130px;" DropDownWidth="400"  TABLE="RadiationTherapy" FIELD="RadTxType" Runat="server" ID="RadTxType_10"/></td>
    <td><euc:EformComboBox  LookupCode="RadTxTarget" style="width:110px;" Field="RadTxTarget" RecordId="10" Table="RadiationTherapy" Runat="server" id="RadTxTarget_10"  /></td>
    <td><euc:EformComboBox  LookupCode="Indication" style="width:110px;" DropDownWidth="250" Field="RadTxIndication" RecordId="10" Table="RadiationTherapy" Runat="server" id="RadTxIndication_10"  /></td>
    <td><euc:EformTextBox RecordId="10" ShowCalendar="False" CalcDate="False" style="width:50px;" TABLE="RadiationTherapy" FIELD="RadTxNumFractions" Runat="server" ID="RadTxNumFractions_10"/>&nbsp;</td>
    <td><euc:EformTextBox    style="width:55px;" Field="RadTxTotalDose" RecordId="10" Table="RadiationTherapy" Runat="server" id="RadTxTotalDose_10"  /></td><td><euc:EformSelect LookupCode="RadTxUnits" style="width:60px;" DropDownWidth="60"  DropDownHeight="auto" TABLE="RadiationTherapy" FIELD="RadTxUnits" Runat="server" RecordId="10" ID="RadTxUnits_10"/></td>
    <td><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="RadTxInstitution" RecordId="10" Table="RadiationTherapy" Runat="server" id="RadTxInstitution_10"  /></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'RadiationTherapyHtmlTable');" />
<br/><br/><br />

