<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSpecimenComplications" CodeFile="ProstateSpecimenComplications.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<script language="javascript">
	tableArray.ComplicationsHtmlTable = "ComplicationsHtmlTable";
</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ProstateSpecimenComplications" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Complications"></asp:Label><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ComplicationsHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Complication</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  <asp:Repeater ID="ComplicationsRptr" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Toxicities', <%# DataBinder.Eval(Container.DataItem, "ToxicityId") %>, 'ToxDateText,ToxName,ToxNotes','Toxicities');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ToxDateText")%></td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ToxName")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ToxNotes")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="1"  ID="ToxDateText_1" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="1" Runat="server" ID="ToxDate_1" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="1" Table="Toxicities" Runat="server" id="ToxName_1"  /></td>
    <td><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_1"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="2"  ID="ToxDateText_2" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="ToxDate_2" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="2" Table="Toxicities" Runat="server" id="ToxName_2"  /></td>
    <td ><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_2"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="3"  ID="ToxDateText_3" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="ToxDate_3" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="3" Table="Toxicities" Runat="server" id="ToxName_3"  /></td>
    <td ><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_3"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="4"  ID="ToxDateText_4" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="4" Runat="server" ID="ToxDate_4" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="4" Table="Toxicities" Runat="server" id="ToxName_4"  /></td>
    <td ><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_4"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne"><euc:EformTextBox Runat="server" RecordId="5"  ID="ToxDateText_5" TABLE="Toxicities" FIELD="ToxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="5" Runat="server" ID="ToxDate_5" Table="Toxicities" Field="ToxDate" />    </td> 
    <td style="white-space:nowrap;"><euc:EformComboBox DropDownWidth="auto"  LookupCode="ToxName_Complication"   RefBy="ToxName" style="width:150;" Field="ToxName" RecordId="5" Table="Toxicities" Runat="server" id="ToxName_5"  /></td>
    <td ><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:230px;" TABLE="Toxicities" FIELD="ToxNotes" Runat="server" ID="ToxNotes_5"/></td>
    <td><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1"/></td>
  </tr>
</table>

<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'ComplicationsHtmlTable');"><img src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"></a>
<br/>
<br/><br/>
