<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.ImagingGTD" CodeFile="ImagingGTD.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript">
	tableArray.DiagnosticsHtmlTable = "DiagnosticsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<style type="text/css" >
.SubDataGridHeader
{
	background-color: #efefef;
}

.SubDataGridHeader td
{
	font-size: 10px;
	color: #333333;
	font-weight: bold;
	text-align: center;
}
.ImgFindingsDataGridContainerTd
{
	 background-image: url(../../Images/EFormFindingsLabelBG.gif);
	 background-repeat: no-repeat;
	 background-position: 14px 18px;
	 padding: 8px 8px 16px 100px;
	 border-bottom: solid 1px #999999;
	
}
</style>


<a name="ImagingGastric" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Diagnostics"></asp:Label><br/>
<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsHtmlTable">
  <tr> 
    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol">Target</td>
    <td class="controlBoxDataGridHeaderFirstCol">Result</td>
    <td class="controlBoxDataGridHeaderFirstCol">Indication</td>
    <td class="controlBoxDataGridHeaderFirstCol">Baseline</td>
    <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol">Quality</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxResult,ImgBaseline,DxInstitution,DxQuality', 'ImagingGastric');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxTarget")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxResult") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxIndication") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ImgBaseline")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn" style="white-space: normal; width: 100px; max-width: 150px;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxInstitution")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxQuality")%></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="1"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="1" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()">
    <euc:EformTextBox ID="DxDisease_1" style="display: none;" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" RecordId="1"  />
    <euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="1" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="1" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_1"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="1" Table="Diagnostics" Runat="server" id="DxResult_1"  /></td>
    <td><euc:EformComboBox DropDownWidth="200" Width="70"  RecordId="1" LookupCode="Indication,Disease,GTD" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" ID="DxIndication_1"/></td>
    <td align="center">
        <euc:EformCheckBox ID="ImgBaseline_1"  TABLE="Diagnostics" FIELD="ImgBaseline" Runat="server" RecordId="1" Value="1" />    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="1" Table="Diagnostics" Runat="server" id="DxInstitution_1"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="1" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" DropDownHeight="auto" Runat="server" ID="DxQuality_1" style="width: 35px;"/></td>
    <td><img id="imagingFindingsToggle_1" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="ToggleImgFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
  
  <tr align="left" id="ImgFindingsDataGridContainerTr_1" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="8" class="ImgFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Length</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="1"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_1_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="1"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_1_1" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="1"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_1_1" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="1" ParentRecordId="1"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_1_1" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="1"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_1_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="1"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_1_2" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="1"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_1_2" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="2" ParentRecordId="1"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_1_2" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="1"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_1_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="1"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_1_3" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="1"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_1_3" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="3" ParentRecordId="1"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_1_3" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="1"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_1_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="1"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_1_4" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="1"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_1_4" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="4" ParentRecordId="1"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_1_4" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="1"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_1_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="1"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_1_5" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="1"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_1_5" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="5" ParentRecordId="1"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_1_5" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  
  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="2"  ID="DxDateText_2" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="2" Runat="server" ID="DxDate_2" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()">
    <euc:EformTextBox ID="DxDisease_2" style="display: none;" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" RecordId="2"  />
    <euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="2" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_2"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="2" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_2"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="2" Table="Diagnostics" Runat="server" id="DxResult_2"  /></td>
    <td><euc:EformComboBox DropDownWidth="200" Width="70"  RecordId="2" LookupCode="Indication,Disease,GTD" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" ID="DxIndication_2"/></td>
    
    <td align="center">
        <euc:EformCheckBox ID="ImgBaseline_2"  TABLE="Diagnostics" FIELD="ImgBaseline" Runat="server" RecordId="2" Value="1" />    </td>
        <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="2" Table="Diagnostics" Runat="server" id="DxInstitution_2"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="2" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" DropDownHeight="auto" Runat="server" ID="DxQuality_2" style="width: 35px;"/></td>
    <td><img id="imagingFindingsToggle_2" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="ToggleImgFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
    <tr align="left" id="ImgFindingsDataGridContainerTr_2" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="8" class="ImgFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Length</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="2"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_2_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="2"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_2_1" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="2"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_2_1" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="1" ParentRecordId="2"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_2_1" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="2"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_2_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="2"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_2_2" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="2"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_2_2" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="2" ParentRecordId="2"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_2_2" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="2"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_2_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="2"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_2_3" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="2"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_2_3" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="3" ParentRecordId="2"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_2_3" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="2"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_2_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="2"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_2_4" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="2"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_2_4" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="4" ParentRecordId="2"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_2_4" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="2"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_2_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="2"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_2_5" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="2"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_2_5" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="5" ParentRecordId="2"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_2_5" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="3"  ID="DxDateText_3" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="3" Runat="server" ID="DxDate_3" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()">
    <euc:EformTextBox ID="DxDisease_3" style="display: none;" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" RecordId="3"  />
    <euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="3" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_3"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="3" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_3"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="3" Table="Diagnostics" Runat="server" id="DxResult_3"  /></td>
    <td><euc:EformComboBox DropDownWidth="200" Width="70"  RecordId="3" LookupCode="Indication,Disease,GTD" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" ID="DxIndication_3"/></td>
    
    <td align="center">
        <euc:EformCheckBox ID="ImgBaseline_3"  TABLE="Diagnostics" FIELD="ImgBaseline" Runat="server" RecordId="3" Value="1" />    </td>
            <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="3" Table="Diagnostics" Runat="server" id="DxInstitution_3"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="3" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" DropDownHeight="auto" Runat="server" ID="DxQuality_3" style="width: 35px;"/></td>
    <td><img id="imagingFindingsToggle_3" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="ToggleImgFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
  </tr>
    <tr align="left" id="ImgFindingsDataGridContainerTr_3" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="8" class="ImgFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Length</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="3"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_3_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="3"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_3_1" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="3"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_3_1" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="1" ParentRecordId="3"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_3_1" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="3"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_3_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="3"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_3_2" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="3"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_3_2" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="2" ParentRecordId="3"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_3_2" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="3"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_3_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="3"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_3_3" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="3"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_3_3" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="3" ParentRecordId="3"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_3_3" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="3"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_3_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="3"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_3_4" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="3"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_3_4" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="4" ParentRecordId="3"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_3_4" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="3"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_3_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="3"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_3_5" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="3"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_3_5" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="5" ParentRecordId="3"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_3_5" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="4"  ID="DxDateText_4" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="4" Runat="server" ID="DxDate_4" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()">
    <euc:EformTextBox ID="DxDisease_4" style="display: none;" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" RecordId="4"  />
    <euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="4" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="4" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_4"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="4" Table="Diagnostics" Runat="server" id="DxResult_4"  /></td>
    <td><euc:EformComboBox DropDownWidth="200" Width="70"  RecordId="4" LookupCode="Indication,Disease,GTD" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" ID="DxIndication_4"/></td>
    
    <td align="center">
        <euc:EformCheckBox ID="ImgBaseline_4"  TABLE="Diagnostics" FIELD="ImgBaseline" Runat="server" RecordId="4" Value="1" />    </td>
            <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="4" Table="Diagnostics" Runat="server" id="DxInstitution_4"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="4" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" DropDownHeight="auto" Runat="server" ID="DxQuality_4" style="width: 35px;"/></td>
    <td><img id="imagingFindingsToggle_4" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="ToggleImgFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
  </tr>
    <tr align="left" id="ImgFindingsDataGridContainerTr_4" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="8" class="ImgFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Length</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="4"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_4_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="4"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_4_1" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="4"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_4_1" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="1" ParentRecordId="4"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_4_1" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="4"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_4_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="4"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_4_2" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="4"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_4_2" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="2" ParentRecordId="4"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_4_2" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="4"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_4_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="4"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_4_3" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="4"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_4_3" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="3" ParentRecordId="4"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_4_3" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="4"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_4_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="4"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_4_4" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="4"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_4_4" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="4" ParentRecordId="4"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_4_4" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="4"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_4_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="4"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_4_5" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="4"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_4_5" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="5" ParentRecordId="4"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_4_5" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr  style="display: none;" > 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="5"  ID="DxDateText_5" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="5" Runat="server" ID="DxDate_5" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()">
    <euc:EformTextBox ID="DxDisease_5" style="display: none;" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" RecordId="5"  />
    <euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="5" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="5" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_5"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="5" Table="Diagnostics" Runat="server" id="DxResult_5"  /></td>
    <td><euc:EformComboBox DropDownWidth="200" Width="70"  RecordId="5" LookupCode="Indication,Disease,GTD" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" ID="DxIndication_5"/></td>
    
    <td align="center">
        <euc:EformCheckBox ID="ImgBaseline_5"  TABLE="Diagnostics" FIELD="ImgBaseline" Runat="server" RecordId="5" Value="1" />    </td>
            <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="5" Table="Diagnostics" Runat="server" id="DxInstitution_5"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="5" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" DropDownHeight="auto" Runat="server" ID="DxQuality_5" style="width: 35px;"/></td>
    <td><img id="imagingFindingsToggle_5" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="ToggleImgFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>
    <tr align="left" id="ImgFindingsDataGridContainerTr_5" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="8" class="ImgFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Length</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="5"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_5_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="5"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_5_1" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="5"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_5_1" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="1" ParentRecordId="5"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_5_1" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="5"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_5_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="5"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_5_2" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="5"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_5_2" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="2" ParentRecordId="5"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_5_2" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon25" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="5"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_5_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="5"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_5_3" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="5"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_5_3" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="3" ParentRecordId="5"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_5_3" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon26" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="5"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_5_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="5"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_5_4" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="5"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_5_4" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="4" ParentRecordId="5"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_5_4" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon27" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="5"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_5_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="5"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_5_5" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="5"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_5_5" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="5" ParentRecordId="5"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_5_5" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon28" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr style="display: none;" > 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="6"  ID="DxDateText_6" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="6" Runat="server" ID="DxDate_6" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()">
    <euc:EformTextBox ID="DxDisease_6" style="display: none;" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" RecordId="6"  />
    <euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="6" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_6"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="6" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_6"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="6" Table="Diagnostics" Runat="server" id="DxResult_6"  /></td>
     <td><euc:EformComboBox DropDownWidth="200" Width="70"  RecordId="6" LookupCode="Indication,Disease,GTD" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" ID="DxIndication_6"/></td>
   
    <td align="center">
        <euc:EformCheckBox ID="ImgBaseline_6"  TABLE="Diagnostics" FIELD="ImgBaseline" Runat="server" RecordId="6" Value="1" />    </td>
        <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="6" Table="Diagnostics" Runat="server" id="DxInstitution_6"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="6" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" DropDownHeight="auto" Runat="server" ID="DxQuality_6" style="width: 35px;"/></td>
    <td><img id="imagingFindingsToggle_6" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="ToggleImgFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
  </tr>
    <tr align="left" id="ImgFindingsDataGridContainerTr_6" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="8" class="ImgFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Length</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="6"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_6_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="6"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_6_1" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="6"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_6_1" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="1" ParentRecordId="6"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_6_1" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon29" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="6"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_6_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="6"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_6_2" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="6"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_6_2" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="2" ParentRecordId="6"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_6_2" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon30" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="6"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_6_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="6"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_6_3" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="6"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_6_3" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="3" ParentRecordId="6"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_6_3" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon31" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="6"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_6_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="6"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_6_4" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="6"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_6_4" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="4" ParentRecordId="6"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_6_4" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon32" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="6"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_6_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="6"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_6_5" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="6"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_6_5" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="5" ParentRecordId="6"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_6_5" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon33" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr style="display: none;" > 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="7"  ID="DxDateText_7" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="7" Runat="server" ID="DxDate_7" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()">
    <euc:EformTextBox ID="DxDisease_7" style="display: none;" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" RecordId="7"  />
    <euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="7" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_7"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="7" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_7"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="7" Table="Diagnostics" Runat="server" id="DxResult_7"  /></td>
     <td><euc:EformComboBox DropDownWidth="200" Width="70"  RecordId="7" LookupCode="Indication,Disease,GTD" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" ID="DxIndication_7"/></td>
   
    <td align="center">
        <euc:EformCheckBox ID="ImgBaseline_7"  TABLE="Diagnostics" FIELD="ImgBaseline" Runat="server" RecordId="7" Value="1" />    </td>
        <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="7" Table="Diagnostics" Runat="server" id="DxInstitution_7"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="7" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" DropDownHeight="auto" Runat="server" ID="DxQuality_7" style="width: 35px;"/></td>
    <td><img id="imagingFindingsToggle_7" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="ToggleImgFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
  </tr>
    <tr align="left" id="ImgFindingsDataGridContainerTr_7" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="8" class="ImgFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Length</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="7"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_7_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="7"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_7_1" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="7"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_7_1" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="1" ParentRecordId="7"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_7_1" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon34" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="7"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_7_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="7"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_7_2" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="7"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_7_2" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="2" ParentRecordId="7"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_7_2" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon35" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="7"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_7_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="7"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_7_3" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="7"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_7_3" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="3" ParentRecordId="7"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_7_3" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon36" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="7"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_7_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="7"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_7_4" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="7"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_7_4" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="4" ParentRecordId="7"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_7_4" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon37" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="7"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_7_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="7"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_7_5" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="7"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_7_5" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="5" ParentRecordId="7"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_7_5" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon38" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr style="display: none;" > 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="8"  ID="DxDateText_8" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setDxDefaults()"   />
		<euc:EformHidden RecordId="8" Runat="server" ID="DxDate_8" Table="Diagnostics" Field="DxDate"></euc:EformHidden></td>
    <td style="white-space: nowrap;" onclick="setDxDefaults()">
    <euc:EformTextBox ID="DxDisease_8" style="display: none;" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" RecordId="8"  />
    <euc:EformComboBox DropDownWidth="300" Width="70"  RecordId="8" LookupCode="DxType" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_8"/></td>
    <td style="white-space: nowrap;"><euc:EformComboBox DropDownWidth="300"  Width="60"  RecordId="8" LookupCode="DxTarget" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_8"/></td>
    <td align="left" style="white-space: nowrap;" onclick="setDxDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="DxResult,Disease,Gastric" style="width:120;" Field="DxResult" RecordId="8" Table="Diagnostics" Runat="server" id="DxResult_8"  /></td>
     <td><euc:EformComboBox DropDownWidth="200" Width="70"  RecordId="8" LookupCode="Indication,Disease,GTD" TABLE="Diagnostics" FIELD="DxIndication" Runat="server" ID="DxIndication_8"/></td>
   
    <td align="center">
        <euc:EformCheckBox ID="ImgBaseline_8"  TABLE="Diagnostics" FIELD="ImgBaseline" Runat="server" RecordId="8" Value="1" />    </td>
        <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="DxInstitution" RecordId="8" Table="Diagnostics" Runat="server" id="DxInstitution_8"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="8" LookupCode="DataQuality" TABLE="Diagnostics" FIELD="DxQuality" DropDownHeight="auto" Runat="server" ID="DxQuality_8" style="width: 35px;"/></td>
    <td><img id="imagingFindingsToggle_8" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="ToggleImgFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
  </tr>
    <tr align="left" id="ImgFindingsDataGridContainerTr_8" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="8" class="ImgFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Length</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="8"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_8_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="8"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_8_1" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="8"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_8_1" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="1" ParentRecordId="8"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_8_1" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon39" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="8"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_8_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="8"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_8_2" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="8"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_8_2" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="2" ParentRecordId="8"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_8_2" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon40" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="8"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_8_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="8"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_8_3" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="8"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_8_3" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="3" ParentRecordId="8"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_8_3" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon41" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="8"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_8_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="8"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_8_4" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="8"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_8_4" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="4" ParentRecordId="8"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_8_4" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon42" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="8"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="DxImageFindings" FIELD="ImgFindSide" ID="ImgFindSide_8_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="8"  DropDownWidth="160"  TABLE="DxImageFindings" FIELD="ImgFindSite" ID="ImgFindSite_8_5" LookupCode="ImgFindSite" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="8"  DropDownWidth="200"  TABLE="DxImageFindings" FIELD="ImgFindResult" ID="ImgFindResult_8_5" LookupCode="DxResult" Runat="server" /></td>
		<td ><euc:EformTextBox RecordId="5" ParentRecordId="8"  TABLE="DxImageFindings" FIELD="ImgFindLength" ID="ImgFindLength_8_5" Runat="server" Width="80" /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon43" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalGTDImagingRow(this,'DiagnosticsHtmlTable');" /><br/><br/>
<br/>


<script type="text/javascript">


function setDxDefaults()
{
    defaultDxFields($('<% =DxDateText_1.ClientID %>'),$('<% =DxType_1.ClientID %>'),$('<% =DxTarget_1.ClientID %>'),$('<% =DxResult_1.ClientID %>'),$('<% =ImgBaseline_1.ClientID %>'),$('<% =DxInstitution_1.ClientID %>'),$('<% =DxQuality_1.ClientID %>'),$('<% =DxDisease_1.ClientID %>'))
    defaultDxFields($('<% =DxDateText_2.ClientID %>'),$('<% =DxType_2.ClientID %>'),$('<% =DxTarget_2.ClientID %>'),$('<% =DxResult_2.ClientID %>'),$('<% =ImgBaseline_2.ClientID %>'),$('<% =DxInstitution_2.ClientID %>'),$('<% =DxQuality_2.ClientID %>'),$('<% =DxDisease_2.ClientID %>'))
    defaultDxFields($('<% =DxDateText_3.ClientID %>'),$('<% =DxType_3.ClientID %>'),$('<% =DxTarget_3.ClientID %>'),$('<% =DxResult_3.ClientID %>'),$('<% =ImgBaseline_3.ClientID %>'),$('<% =DxInstitution_3.ClientID %>'),$('<% =DxQuality_3.ClientID %>'),$('<% =DxDisease_3.ClientID %>'))
    defaultDxFields($('<% =DxDateText_4.ClientID %>'),$('<% =DxType_4.ClientID %>'),$('<% =DxTarget_4.ClientID %>'),$('<% =DxResult_4.ClientID %>'),$('<% =ImgBaseline_4.ClientID %>'),$('<% =DxInstitution_4.ClientID %>'),$('<% =DxQuality_4.ClientID %>'),$('<% =DxDisease_4.ClientID %>'))
    defaultDxFields($('<% =DxDateText_5.ClientID %>'),$('<% =DxType_5.ClientID %>'),$('<% =DxTarget_5.ClientID %>'),$('<% =DxResult_5.ClientID %>'),$('<% =ImgBaseline_5.ClientID %>'),$('<% =DxInstitution_5.ClientID %>'),$('<% =DxQuality_5.ClientID %>'),$('<% =DxDisease_5.ClientID %>'))
    defaultDxFields($('<% =DxDateText_6.ClientID %>'),$('<% =DxType_6.ClientID %>'),$('<% =DxTarget_6.ClientID %>'),$('<% =DxResult_6.ClientID %>'),$('<% =ImgBaseline_6.ClientID %>'),$('<% =DxInstitution_6.ClientID %>'),$('<% =DxQuality_6.ClientID %>'),$('<% =DxDisease_6.ClientID %>'))
    defaultDxFields($('<% =DxDateText_7.ClientID %>'),$('<% =DxType_7.ClientID %>'),$('<% =DxTarget_7.ClientID %>'),$('<% =DxResult_7.ClientID %>'),$('<% =ImgBaseline_7.ClientID %>'),$('<% =DxInstitution_7.ClientID %>'),$('<% =DxQuality_7.ClientID %>'),$('<% =DxDisease_7.ClientID %>'))
    defaultDxFields($('<% =DxDateText_8.ClientID %>'),$('<% =DxType_8.ClientID %>'),$('<% =DxTarget_8.ClientID %>'),$('<% =DxResult_8.ClientID %>'),$('<% =ImgBaseline_8.ClientID %>'),$('<% =DxInstitution_8.ClientID %>'),$('<% =DxQuality_8.ClientID %>'),$('<% =DxDisease_8.ClientID %>'))
}


function defaultDxFields(DateTextField,TypeField,TargetField,ResultField,BaselineField,InstitutionField,QualityField,DiseaseField)
{
    if (DateTextField.value != '' || TypeField.value != '' || ResultField.value != '' || BaselineField.checked)
    {
//        defaultDxField(TargetField, 'Stomach');
        defaultDxField(InstitutionField, 'Memorial Sloan Kettering Cancer Center');
        defaultDxField(QualityField, 'STD');
        DiseaseField.value = 'Gestational Trophoblastic Disease';
    }
    else
    {
        DiseaseField.value = '';
//        InstitutionField.value = '';
//        QualityField.value = '';
    }
}

function defaultDxField(field, defaultVal)
{
    if (field.value.length == 0) field.value = defaultVal;
}

function ToggleImgFindingView(toggleImg)
{
    var toggleImgId = toggleImg.id;
    var toggleImgNum = toggleImgId.substr(toggleImgId.indexOf('_')+1);
    var findingsCurrentlyVisible = false;
    
    if (toggleImg.src.indexOf('Hide') > -1) findingsCurrentlyVisible = true;

    showImgFindings(!findingsCurrentlyVisible,toggleImgNum);
}

function showImgFindings(showFindings,DxRecordId)
{
    var toggleImg = $('imagingFindingsToggle_' + DxRecordId.toString());
    var findingsRow = $('ImgFindingsDataGridContainerTr_' + DxRecordId.toString());
    var DiagnosticsHtmlTable = $('DiagnosticsHtmlTable');
    var diagnosticsRow = $('DiagnosticsHtmlTable').rows[(findingsRow.rowIndex-1)];

    if (showFindings)
    {
        toggleImg.src = '../../Images/EFormHideFindings.gif';
        findingsRow.style.display = 'block';
        diagnosticsRow.style.display = 'block'; // make sure parent record is showing even if parent record is blank
    }
    else
    {
        toggleImg.src = '../../Images/EFormShowFindings.gif';
        findingsRow.style.display = 'none';
    }
}

function setInitialFindingsView()
{
    for (i=1; i<=8; i++)
    {
        var toggleImg = $('imagingFindingsToggle_' + i.toString());
        var findingsRow = $('ImgFindingsDataGridContainerTr_' + i.toString());

        var FindingsValueExists = false;
        
        var inputs = findingsRow.getElementsByTagName('input');
	    for (var j=0;j<inputs.length;j++)
	    {
		    type = inputs[j].getAttribute('type');
		    if (type == 'checkbox' || type == 'radio') {
			    if (inputs[j].checked == true) FindingsValueExists = true;
		    } else if (inputs[j].value != '')  {
			    FindingsValueExists = true; }
   	    }
   	    
   	    showImgFindings(FindingsValueExists,i)
    }
    
    
}

setInitialFindingsView();




function showFirstAdditionalGTDImagingRow(linkReference, tableId) {
	var rowShown = false;
	var hideWidget = true;
	var table = document.getElementById(tableId);
	for (i = 0; i < table.rows.length; i++) {
	    if (i%2 == 1)
	    {
		    var row = table.rows[i];
		    if (rowShown == false && row.style['display'] == 'none') {
			    row.style['display'] = '';
			    rowShown = true;
		    } else if (rowShown == true && row.style['display'] == 'none') {
			    hideWidget = false;
		    }
		}
	}
	
	if (hideWidget) {
		linkReference.style['display'] = 'none';
	}
	return false;
}



</script>