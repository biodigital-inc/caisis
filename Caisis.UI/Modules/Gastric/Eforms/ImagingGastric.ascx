<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.ImagingGastric" CodeFile="ImagingGastric.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript">
	tableArray.DiagnosticsHtmlTable = "DiagnosticsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ImagingGastric" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Diagnostics"></asp:Label><br/>
<table  cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsHtmlTable">
  <tr> 
    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">Target</td>
    <td class="controlBoxDataGridHeaderFirstCol">Disease</td>
    <td class="controlBoxDataGridHeaderFirstCol">Result</td>
    <td class="controlBoxDataGridHeaderFirstCol">Notes</td>
    <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol">Quality</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxResult,DxNotes,DxInstitution,DxQuality', 'ImagingGastric');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxTarget")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDisease")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxResult") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxInstitution")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxQuality")%></td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="1"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="1" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="1" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="1" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_1"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="70"  RecordId="1" LookupCode="Disease" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_1"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="1" Table="Diagnostics" Runat="server" id="DxResult_1"  /></td>
    <td align="center"><euc:EformTextBox RecordId="1" ShowCalendar="False" CalcDate="False" style="width:60px;" ShowTextEditor="true" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_1"  AppendToOnChange="setDxDefaults()"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="1" Table="Diagnostics" Runat="server" id="DxInstitution_1"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="1" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_1" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="2"  ID="DxDateText_2" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="2" Runat="server" ID="DxDate_2" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="2" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_2"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="2" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_2"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="70"  RecordId="2" LookupCode="Disease" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_2"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="2" Table="Diagnostics" Runat="server" id="DxResult_2"  /></td>
    <td align="center"><euc:EformTextBox RecordId="2" ShowCalendar="False" CalcDate="False" style="width:60px;" ShowTextEditor="true" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_2"  AppendToOnChange="setDxDefaults()"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="2" Table="Diagnostics" Runat="server" id="DxInstitution_2"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="2" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_2" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="3"  ID="DxDateText_3" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="3" Runat="server" ID="DxDate_3" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="3" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_3"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="3" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_3"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="70"  RecordId="3" LookupCode="Disease" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_3"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="3" Table="Diagnostics" Runat="server" id="DxResult_3"  /></td>
    <td align="center"><euc:EformTextBox RecordId="3" ShowCalendar="False" CalcDate="False" style="width:60px;" ShowTextEditor="true" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_3"  AppendToOnChange="setDxDefaults()"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="3" Table="Diagnostics" Runat="server" id="DxInstitution_3"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="3" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_3" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
  <tr style="display: none;" align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="4"  ID="DxDateText_4" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="4" Runat="server" ID="DxDate_4" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="4" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="4" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_4"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="70"  RecordId="4" LookupCode="Disease" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_4"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="4" Table="Diagnostics" Runat="server" id="DxResult_4"  /></td>
    <td align="center"><euc:EformTextBox RecordId="4" ShowCalendar="False" CalcDate="False" style="width:60px;" ShowTextEditor="true" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_4"  AppendToOnChange="setDxDefaults()"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="4" Table="Diagnostics" Runat="server" id="DxInstitution_4"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="4" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_4" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
  </tr>
  <tr style="display: none;" align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="5"  ID="DxDateText_5" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="5" Runat="server" ID="DxDate_5" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="5" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5"/></td>
      <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="5" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_5"/></td>
      <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="70"  RecordId="5" LookupCode="Disease" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_5"/></td>
   
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="5" Table="Diagnostics" Runat="server" id="DxResult_5"  /></td>
    <td align="center"><euc:EformTextBox RecordId="5" ShowCalendar="False" CalcDate="False" style="width:60px;" ShowTextEditor="true" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_5"  AppendToOnChange="setDxDefaults()"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="5" Table="Diagnostics" Runat="server" id="DxInstitution_5"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="5" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_5" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
  </tr>
  <tr style="display: none;" align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="6"  ID="DxDateText_6" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="6" Runat="server" ID="DxDate_6" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="6" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_6"/></td>
      <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="6" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_6"/></td>
      <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="70"  RecordId="6" LookupCode="Disease" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_6"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="6" Table="Diagnostics" Runat="server" id="DxResult_6"  /></td>
    <td align="center"><euc:EformTextBox RecordId="6" ShowCalendar="False" CalcDate="False" style="width:60px;" ShowTextEditor="true" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_6"  AppendToOnChange="setDxDefaults()"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="6" Table="Diagnostics" Runat="server" id="DxInstitution_6"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="6" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_6" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>
  <tr style="display: none;" align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="7"  ID="DxDateText_7" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="7" Runat="server" ID="DxDate_7" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="7" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_7"/></td>
      <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="7" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_7"/></td>
      <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="70"  RecordId="7" LookupCode="Disease" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_7"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="7" Table="Diagnostics" Runat="server" id="DxResult_7"  /></td>
    <td align="center"><euc:EformTextBox RecordId="7" ShowCalendar="False" CalcDate="False" style="width:60px;" ShowTextEditor="true" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_7"  AppendToOnChange="setDxDefaults()"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="7" Table="Diagnostics" Runat="server" id="DxInstitution_7"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="7" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_7" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
  </tr>
  <tr style="display: none;" align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="8"  ID="DxDateText_8" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="8" Runat="server" ID="DxDate_8" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="8" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_8"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="8" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_8"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="70"  RecordId="8" LookupCode="Disease" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_8"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="8" Table="Diagnostics" Runat="server" id="DxResult_8"  /></td>
    <td align="center"><euc:EformTextBox RecordId="8" ShowCalendar="False" CalcDate="False" style="width:60px;" ShowTextEditor="true" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_8"  AppendToOnChange="setDxDefaults()"/></td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="8" Table="Diagnostics" Runat="server" id="DxInstitution_8"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="8" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_8" style="width: 35px;"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DiagnosticsHtmlTable');" />
<br/><br/>
<br/>


<script type="text/javascript">


function setDxDefaults()
{
    defaultDxFields($('<% =DxDateText_1.ClientID %>'), $('<% =DxType_1.ClientID %>'), $('<% =DxDisease_1.ClientID %>'), $('<% =DxTarget_1.ClientID %>'), $('<% =DxResult_1.ClientID %>'), $('<% =DxNotes_1.ClientID %>'), $('<% =DxInstitution_1.ClientID %>'), $('<% =DxQuality_1.ClientID %>'))
    defaultDxFields($('<% =DxDateText_2.ClientID %>'), $('<% =DxType_2.ClientID %>'), $('<% =DxDisease_2.ClientID %>'), $('<% =DxTarget_2.ClientID %>'), $('<% =DxResult_2.ClientID %>'), $('<% =DxNotes_2.ClientID %>'), $('<% =DxInstitution_2.ClientID %>'), $('<% =DxQuality_2.ClientID %>'))
    defaultDxFields($('<% =DxDateText_3.ClientID %>'), $('<% =DxType_3.ClientID %>'), $('<% =DxDisease_3.ClientID %>'), $('<% =DxTarget_3.ClientID %>'), $('<% =DxResult_3.ClientID %>'), $('<% =DxNotes_3.ClientID %>'), $('<% =DxInstitution_3.ClientID %>'), $('<% =DxQuality_3.ClientID %>'))
    defaultDxFields($('<% =DxDateText_4.ClientID %>'), $('<% =DxType_4.ClientID %>'), $('<% =DxDisease_4.ClientID %>'), $('<% =DxTarget_4.ClientID %>'), $('<% =DxResult_4.ClientID %>'), $('<% =DxNotes_4.ClientID %>'), $('<% =DxInstitution_4.ClientID %>'), $('<% =DxQuality_4.ClientID %>'))
    defaultDxFields($('<% =DxDateText_5.ClientID %>'), $('<% =DxType_5.ClientID %>'), $('<% =DxDisease_5.ClientID %>'), $('<% =DxTarget_5.ClientID %>'), $('<% =DxResult_5.ClientID %>'), $('<% =DxNotes_5.ClientID %>'), $('<% =DxInstitution_5.ClientID %>'), $('<% =DxQuality_5.ClientID %>'))
    defaultDxFields($('<% =DxDateText_6.ClientID %>'), $('<% =DxType_6.ClientID %>'), $('<% =DxDisease_6.ClientID %>'), $('<% =DxTarget_6.ClientID %>'), $('<% =DxResult_6.ClientID %>'), $('<% =DxNotes_6.ClientID %>'), $('<% =DxInstitution_6.ClientID %>'), $('<% =DxQuality_6.ClientID %>'))
    defaultDxFields($('<% =DxDateText_7.ClientID %>'), $('<% =DxType_7.ClientID %>'), $('<% =DxDisease_7.ClientID %>'), $('<% =DxTarget_7.ClientID %>'), $('<% =DxResult_7.ClientID %>'), $('<% =DxNotes_7.ClientID %>'), $('<% =DxInstitution_7.ClientID %>'), $('<% =DxQuality_7.ClientID %>'))
    defaultDxFields($('<% =DxDateText_8.ClientID %>'), $('<% =DxType_8.ClientID %>'), $('<% =DxDisease_8.ClientID %>'), $('<% =DxTarget_8.ClientID %>'), $('<% =DxResult_8.ClientID %>'), $('<% =DxNotes_8.ClientID %>'), $('<% =DxInstitution_8.ClientID %>'), $('<% =DxQuality_8.ClientID %>'))
}


function defaultDxFields(DateTextField,TypeField,DiseaseField,TargetField,ResultField,NotesField,InstitutionField,QualityField)
{
    if (DateTextField.value != '' || TypeField.value != '' || ResultField.value != '' || NotesField.value != '')
    {
        defaultDxField(TargetField, 'Stomach');
        defaultDxField(InstitutionField, 'Memorial Sloan Kettering Cancer Center');
        defaultDxField(QualityField, 'STD');
        defaultDxField(DiseaseField, 'Gastric Cancer-Adenocarcinoma');
    }
    else
    {
//        InstitutionField.value = '';
//        QualityField.value = '';
    }
}

function defaultDxField(field, defaultVal)
{
    if (field.value.length == 0) field.value = defaultVal;
}


</script>