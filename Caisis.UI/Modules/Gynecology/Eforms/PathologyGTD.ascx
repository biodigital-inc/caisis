<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gynecology.Eforms.PathologyGTD" CodeFile="PathologyGTD.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript">
	tableArray.PathologyHtmlTable = "PathologyHtmlTable";
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
.PathFindingsDataGridContainerTd
{
	 background-image: url(../../Images/EFormFindingsLabelBG.gif);
	 background-repeat: no-repeat;
	 background-position: 14px 18px;
	 padding: 8px 8px 16px 100px;
	 border-bottom: solid 1px #999999;
	
}
</style>


<a name="PathologyGTD" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Diagnostics"></asp:Label><br/>
<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable" id="PathologyHtmlTable">
  <tr> 
    <td  class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Result</td>
    <td class="controlBoxDataGridHeaderFirstCol">Histology</td>
    <td class="controlBoxDataGridHeaderFirstCol">Institution</td>
    <td class="controlBoxDataGridHeaderFirstCol">Data Quality</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'PathDateText,PathDate,DxType,PathResult,PathHistology,PathInstitution,PathQuality', 'ImagingGastric');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathDateText") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathResult") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathHistology")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn" style="white-space: normal; width: 100px; max-width: 150px;" >&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathInstitution")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PathQuality")%></td>
			<td class="ClinicalEformPopulatedColumn">&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="1"  ID="PathDateText_1" TABLE="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setPathDefaults()"   />
		<euc:EformHidden RecordId="1" Runat="server" ID="PathDate_1" TABLE="Pathology" Field="PathDate"></euc:EformHidden></td>
    <td align="left" style="white-space: nowrap;" onclick="setPathDefaults()">
        <euc:EformDropDownList AppendDataBoundItems="true" DropDownWidth="160" DropDownHeight="auto"  LookupCode="BxResult" style="width:120;" Field="PathResult" RecordId="1" TABLE="Pathology" Runat="server" id="PathResult_1">
            <asp:ListItem>Products of Conception</asp:ListItem>
        </euc:EformDropDownList></td>
    <td align="center">
        <euc:EformComboBox LookupCode="PathHistology,Disease,Gynecology" RecordId="1" ID="PathHistology_1" style="width:210px" DropDownWidth="240" DropDownHeight="auto" TABLE="Pathology" FIELD="PathHistology" Runat="server"/>    </td>
    <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="PathInstitution" RecordId="1" TABLE="Pathology" Runat="server" id="PathInstitution_1"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="1" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" Runat="server" ID="PathQuality_1" style="width: 35px;"/></td>
    <td><img id="pathFindingsToggle_1" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="TogglePathFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
  
  <tr align="left" id="PathFindingsDataGridContainerTr_1" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="6" class="PathFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Subsite</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="1"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_1_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="1"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_1_1" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="1"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_1_1" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="1"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_1_1" Runat="server"  /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="1"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_1_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="1"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_1_2" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="1"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_1_2" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="1"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_1_2" Runat="server"  /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="1"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_1_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="1"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_1_3" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="1"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_1_3" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="1"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_1_3" Runat="server"  /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="1"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_1_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="1"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_1_4" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="1"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_1_4" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="1"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_1_4" Runat="server"  /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="1"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_1_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="1"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_1_5" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="1"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_1_5" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="1"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_1_5" Runat="server"  /></td>
        <td><euc:EformDeleteIcon runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  
  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="2"  ID="PathDateText_2" TABLE="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setPathDefaults()"   />
		<euc:EformHidden RecordId="2" Runat="server" ID="PathDate_2" TABLE="Pathology" Field="PathDate"></euc:EformHidden></td>
    <td align="left" style="white-space: nowrap;" onclick="setPathDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="BxResult" style="width:120;" Field="PathResult" RecordId="2" TABLE="Pathology" Runat="server" id="PathResult_2"  /></td>
    <td align="center">
        <euc:EformComboBox LookupCode="PathHistology,Disease,Gynecology" RecordId="2" ID="PathHistology_2" style="width:210px" DropDownWidth="240" DropDownHeight="auto" TABLE="Pathology" FIELD="PathHistology" Runat="server"/>    </td>
        <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="PathInstitution" RecordId="2" TABLE="Pathology" Runat="server" id="PathInstitution_2"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="2" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" Runat="server" ID="PathQuality_2" style="width: 35px;"/></td>
    <td><img id="pathFindingsToggle_2" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="TogglePathFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
    <tr align="left" id="PathFindingsDataGridContainerTr_2" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="6" class="PathFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Subsite</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="2"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_2_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="2"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_2_1" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="2"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_2_1" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="2"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_2_1" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="2"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_2_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="2"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_2_2" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="2"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_2_2" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="2"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_2_2" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="2"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_2_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="2"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_2_3" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="2"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_2_3" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="2"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_2_3" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="2"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_2_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="2"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_2_4" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="2"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_2_4" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="2"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_2_4" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="2"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_2_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="2"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_2_5" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="2"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_2_5" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="2"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_2_5" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="3"  ID="PathDateText_3" TABLE="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setPathDefaults()"   />
		<euc:EformHidden RecordId="3" Runat="server" ID="PathDate_3" TABLE="Pathology" Field="PathDate"></euc:EformHidden></td>
    <td align="left" style="white-space: nowrap;" onclick="setPathDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="BxResult" style="width:120;" Field="PathResult" RecordId="3" TABLE="Pathology" Runat="server" id="PathResult_3"  /></td>
    <td align="center">
        <euc:EformComboBox LookupCode="PathHistology,Disease,Gynecology" RecordId="3" ID="PathHistology_3" style="width:210px" DropDownWidth="240" DropDownHeight="auto" TABLE="Pathology" FIELD="PathHistology" Runat="server"/>    </td>
            <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="PathInstitution" RecordId="3" TABLE="Pathology" Runat="server" id="PathInstitution_3"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="3" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" Runat="server" ID="PathQuality_3" style="width: 35px;"/></td>
    <td><img id="pathFindingsToggle_3" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="TogglePathFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
  </tr>
    <tr align="left" id="PathFindingsDataGridContainerTr_3" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="6" class="PathFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Subsite</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="3"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_3_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="3"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_3_1" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="3"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_3_1" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="3"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_3_1" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="3"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_3_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="3"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_3_2" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="3"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_3_2" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="3"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_3_2" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon15" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="3"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_3_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="3"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_3_3" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="3"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_3_3" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="3"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_3_3" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon16" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="3"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_3_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="3"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_3_4" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="3"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_3_4" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="3"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_3_4" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon17" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="3"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_3_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="3"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_3_5" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="3"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_3_5" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="3"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_3_5" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon18" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="4"  ID="PathDateText_4" TABLE="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setPathDefaults()"   />
		<euc:EformHidden RecordId="4" Runat="server" ID="PathDate_4" TABLE="Pathology" Field="PathDate"></euc:EformHidden></td>
    <td align="left" style="white-space: nowrap;" onclick="setPathDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="BxResult" style="width:120;" Field="PathResult" RecordId="4" TABLE="Pathology" Runat="server" id="PathResult_4"  /></td>
    <td align="center">
        <euc:EformComboBox LookupCode="PathHistology,Disease,Gynecology" RecordId="4" ID="PathHistology_4" style="width:210px" DropDownWidth="240" DropDownHeight="auto" TABLE="Pathology" FIELD="PathHistology" Runat="server"/>    </td>
            <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="PathInstitution" RecordId="4" TABLE="Pathology" Runat="server" id="PathInstitution_4"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="4" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" Runat="server" ID="PathQuality_4" style="width: 35px;"/></td>
    <td><img id="pathFindingsToggle_4" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="TogglePathFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
  </tr>
    <tr align="left" id="PathFindingsDataGridContainerTr_4" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="6" class="PathFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Subsite</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="4"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_4_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="4"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_4_1" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="4"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_4_1" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="4"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_4_1" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon19" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="4"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_4_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="4"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_4_2" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="4"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_4_2" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="4"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_4_2" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon20" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="4"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_4_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="4"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_4_3" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="4"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_4_3" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="4"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_4_3" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon21" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="4"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_4_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="4"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_4_4" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="4"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_4_4" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="4"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_4_4" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon22" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="4"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_4_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="4"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_4_5" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="4"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_4_5" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="4"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_4_5" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon23" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr  style="display: none;" > 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="5"  ID="PathDateText_5" TABLE="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setPathDefaults()"   />
		<euc:EformHidden RecordId="5" Runat="server" ID="PathDate_5" TABLE="Pathology" Field="PathDate"></euc:EformHidden></td>
    <td align="left" style="white-space: nowrap;" onclick="setPathDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="BxResult" style="width:120;" Field="PathResult" RecordId="5" TABLE="Pathology" Runat="server" id="PathResult_5"  /></td>
    <td align="center">
        <euc:EformComboBox LookupCode="PathHistology,Disease,Gynecology" RecordId="5" ID="PathHistology_5" style="width:210px" DropDownWidth="240" DropDownHeight="auto" TABLE="Pathology" FIELD="PathHistology" Runat="server"/>    </td>
            <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="PathInstitution" RecordId="5" TABLE="Pathology" Runat="server" id="PathInstitution_5"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="5" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" Runat="server" ID="PathQuality_5" style="width: 35px;"/></td>
    <td><img id="pathFindingsToggle_5" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="TogglePathFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>
    <tr align="left" id="PathFindingsDataGridContainerTr_5" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="6" class="PathFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Subsite</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="5"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_5_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="5"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_5_1" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="5"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_5_1" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="5"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_5_1" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon24" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="5"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_5_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="5"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_5_2" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="5"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_5_2" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="5"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_5_2" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon25" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="5"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_5_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="5"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_5_3" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="5"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_5_3" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="5"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_5_3" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon26" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="5"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_5_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="5"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_5_4" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="5"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_5_4" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="5"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_5_4" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon27" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="5"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_5_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="5"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_5_5" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="5"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_5_5" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="5"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_5_5" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon28" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr style="display: none;" > 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="6"  ID="PathDateText_6" TABLE="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setPathDefaults()"   />
		<euc:EformHidden RecordId="6" Runat="server" ID="PathDate_6" TABLE="Pathology" Field="PathDate"></euc:EformHidden></td>
    <td align="left" style="white-space: nowrap;" onclick="setPathDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="BxResult" style="width:120;" Field="PathResult" RecordId="6" TABLE="Pathology" Runat="server" id="PathResult_6"  /></td>
    <td align="center">
        <euc:EformComboBox LookupCode="PathHistology,Disease,Gynecology" RecordId="6" ID="PathHistology_6" style="width:210px" DropDownWidth="240" DropDownHeight="auto" TABLE="Pathology" FIELD="PathHistology" Runat="server"/>    </td>
        <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="PathInstitution" RecordId="6" TABLE="Pathology" Runat="server" id="PathInstitution_6"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="6" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" Runat="server" ID="PathQuality_6" style="width: 35px;"/></td>
    <td><img id="pathFindingsToggle_6" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="TogglePathFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
  </tr>
    <tr align="left" id="PathFindingsDataGridContainerTr_6" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="6" class="PathFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Subsite</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="6"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_6_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="6"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_6_1" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="6"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_6_1" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="6"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_6_1" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon29" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="6"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_6_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="6"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_6_2" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="6"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_6_2" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="6"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_6_2" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon30" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="6"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_6_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="6"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_6_3" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="6"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_6_3" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="6"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_6_3" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon31" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="6"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_6_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="6"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_6_4" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="6"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_6_4" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="6"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_6_4" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon32" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="6"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_6_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="6"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_6_5" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="6"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_6_5" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="6"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_6_5" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon33" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr style="display: none;" > 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="7"  ID="PathDateText_7" TABLE="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setPathDefaults()"   />
		<euc:EformHidden RecordId="7" Runat="server" ID="PathDate_7" TABLE="Pathology" Field="PathDate"></euc:EformHidden></td>
    <td align="left" style="white-space: nowrap;" onclick="setPathDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="BxResult" style="width:120;" Field="PathResult" RecordId="7" TABLE="Pathology" Runat="server" id="PathResult_7"  /></td>
    <td align="center">
        <euc:EformComboBox LookupCode="PathHistology,Disease,Gynecology" RecordId="7" ID="PathHistology_7" style="width:210px" DropDownWidth="240" DropDownHeight="auto" TABLE="Pathology" FIELD="PathHistology" Runat="server"/>    </td>
        <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="PathInstitution" RecordId="7" TABLE="Pathology" Runat="server" id="PathInstitution_7"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="7" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" Runat="server" ID="PathQuality_7" style="width: 35px;"/></td>
    <td><img id="pathFindingsToggle_7" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="TogglePathFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
  </tr>
    <tr align="left" id="PathFindingsDataGridContainerTr_7" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="6" class="PathFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Subsite</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="7"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_7_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="7"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_7_1" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="7"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_7_1" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="7"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_7_1" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon34" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="7"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_7_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="7"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_7_2" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="7"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_7_2" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="7"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_7_2" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon35" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="7"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_7_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="7"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_7_3" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="7"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_7_3" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="7"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_7_3" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon36" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="7"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_7_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="7"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_7_4" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="7"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_7_4" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="7"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_7_4" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon37" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="7"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_7_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="7"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_7_5" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="7"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_7_5" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="7"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_7_5" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon38" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
  <tr style="display: none;" > 
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="8"  ID="PathDateText_8" TABLE="Pathology" FIELD="PathDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" AppendToOnChange="setPathDefaults()"   />
		<euc:EformHidden RecordId="8" Runat="server" ID="PathDate_8" TABLE="Pathology" Field="PathDate"></euc:EformHidden></td>
    <td align="left" style="white-space: nowrap;" onclick="setPathDefaults()"><euc:EformComboBox DropDownWidth="160" DropDownHeight="auto"  LookupCode="BxResult" style="width:120;" Field="PathResult" RecordId="8" TABLE="Pathology" Runat="server" id="PathResult_8"  /></td>
    <td align="center">
        <euc:EformComboBox LookupCode="PathHistology,Disease,Gynecology" RecordId="8" ID="PathHistology_8" style="width:210px" DropDownWidth="240" DropDownHeight="auto" TABLE="Pathology" FIELD="PathHistology" Runat="server"/>    </td>
        <td style="white-space:nowrap;"><euc:EFormComboBox DropDownWidth="240" DropDownHeight="auto"   LookupCode="Institution,UseAsDefault,True"  style="width:80px;" Field="PathInstitution" RecordId="8" TABLE="Pathology" Runat="server" id="PathInstitution_8"  /></td>
    <td style="white-space:nowrap;"><euc:EformSelect RecordId="8" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" Runat="server" ID="PathQuality_8" style="width: 35px;"/></td>
    <td><img id="pathFindingsToggle_8" src="../../Images/EFormShowFindings.gif" width="80" height="14" border="0" class="ClickableImage" onclick="TogglePathFindingView(this);" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
  </tr>
    <tr align="left" id="PathFindingsDataGridContainerTr_8" style="display: none;"> 
    <td height="28" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #999999;">&nbsp;</td>
    <td colspan="6" class="PathFindingsDataGridContainerTd">
    
	<table  cellpadding="1" cellspacing="0" class="ClinicalEformTable">
	  <tr class="SubDataGridHeader" > 
		<td>Side</td>
		<td>Site</td>
		<td>Result</td>
		<td>Subsite</td>
		<td>&nbsp;</td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="1" ParentRecordId="8"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_8_1" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="8"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_8_1" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="1" ParentRecordId="8"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_8_1" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="1" ParentRecordId="8"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_8_1" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon39" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="2" ParentRecordId="8"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_8_2" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="8"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_8_2" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="2" ParentRecordId="8"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_8_2" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="2" ParentRecordId="8"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_8_2" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon40" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="3" ParentRecordId="8"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_8_3" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="8"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_8_3" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="3" ParentRecordId="8"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_8_3" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="3" ParentRecordId="8"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_8_3" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon41" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="4" ParentRecordId="8"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_8_4" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="8"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_8_4" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="4" ParentRecordId="8"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_8_4" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="4" ParentRecordId="8"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_8_4" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon42" runat="server"/></td>
	  </tr>
	  <tr> 
		<td ><euc:EformSelect RecordId="5" ParentRecordId="8"  style="width: 80px" DropDownHeight="auto" DropDownWidth="80" TABLE="PathologyFinding" FIELD="PathFindSide" ID="PathFindSide_8_5" LookupCode="FindSide" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="8"  DropDownWidth="160"  TABLE="PathologyFinding" FIELD="PathFindSite" ID="PathFindSite_8_5" LookupCode="DxTarget" Runat="server" /></td>
		<td ><euc:EformSelect RecordId="5" ParentRecordId="8"  DropDownWidth="200"  TABLE="PathologyFinding" FIELD="PathFindResult" ID="PathFindResult_8_5" LookupCode="Result" Runat="server" /></td>
		<td ><euc:EformComboBox RecordId="5" ParentRecordId="8"  TABLE="PathologyFinding" FIELD="PathFindSubsite" DropDownWidth="160" LookupCode="DxTarget" ID="PathFindSubsite_8_5" Runat="server"  /></td>
        <td><euc:EformDeleteIcon ID="EformDeleteIcon43" runat="server"/></td>
	  </tr>
	  </table>
	
	</td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalGTDPathRow(this,'PathologyHtmlTable');" /><br/><br/>
<br/>


<script type="text/javascript">


function setPathDefaults()
{
    defaultPathFields($('<% =PathDateText_1.ClientID %>'),$('<% =PathResult_1.ClientID %>'),$('<% =PathHistology_1.ClientID %>'),$('<% =PathInstitution_1.ClientID %>'),$('<% =PathQuality_1.ClientID %>'))
    defaultPathFields($('<% =PathDateText_2.ClientID %>'),$('<% =PathResult_2.ClientID %>'),$('<% =PathHistology_2.ClientID %>'),$('<% =PathInstitution_2.ClientID %>'),$('<% =PathQuality_2.ClientID %>'))
    defaultPathFields($('<% =PathDateText_3.ClientID %>'),$('<% =PathResult_3.ClientID %>'),$('<% =PathHistology_3.ClientID %>'),$('<% =PathInstitution_3.ClientID %>'),$('<% =PathQuality_3.ClientID %>'))
    defaultPathFields($('<% =PathDateText_4.ClientID %>'),$('<% =PathResult_4.ClientID %>'),$('<% =PathHistology_4.ClientID %>'),$('<% =PathInstitution_4.ClientID %>'),$('<% =PathQuality_4.ClientID %>'))
    defaultPathFields($('<% =PathDateText_5.ClientID %>'),$('<% =PathResult_5.ClientID %>'),$('<% =PathHistology_5.ClientID %>'),$('<% =PathInstitution_5.ClientID %>'),$('<% =PathQuality_5.ClientID %>'))
    defaultPathFields($('<% =PathDateText_6.ClientID %>'),$('<% =PathResult_6.ClientID %>'),$('<% =PathHistology_6.ClientID %>'),$('<% =PathInstitution_6.ClientID %>'),$('<% =PathQuality_6.ClientID %>'))
    defaultPathFields($('<% =PathDateText_7.ClientID %>'),$('<% =PathResult_7.ClientID %>'),$('<% =PathHistology_7.ClientID %>'),$('<% =PathInstitution_7.ClientID %>'),$('<% =PathQuality_7.ClientID %>'))
    defaultPathFields($('<% =PathDateText_8.ClientID %>'),$('<% =PathResult_8.ClientID %>'),$('<% =PathHistology_8.ClientID %>'),$('<% =PathInstitution_8.ClientID %>'),$('<% =PathQuality_8.ClientID %>'))
}


function defaultPathFields(DateTextField,ResultField,HistologyField,InstitutionField,QualityField)
{
    if (DateTextField.value != '' || ResultField.value != '' || HistologyField.value != '')
    {
        defaultPathField(InstitutionField, 'Memorial Sloan Kettering Cancer Center');
        defaultPathField(QualityField, 'STD');
    }
    else
    {
//        InstitutionField.value = '';
//        QualityField.value = '';
    }
}

function defaultPathField(field, defaultVal)
{
    if (field.value.length == 0) field.value = defaultVal;
}

function TogglePathFindingView(toggleImg)
{
    var toggleImgId = toggleImg.id;
    var toggleImgNum = toggleImgId.substr(toggleImgId.indexOf('_')+1);
    var findingsCurrentlyVisible = false;
    
    if (toggleImg.src.indexOf('Hide') > -1) findingsCurrentlyVisible = true;

    showPathFindings(!findingsCurrentlyVisible,toggleImgNum);
}

function showPathFindings(showFindings,DxRecordId)
{
    var toggleImg = $('pathFindingsToggle_' + DxRecordId.toString());
    var findingsRow = $('PathFindingsDataGridContainerTr_' + DxRecordId.toString());
    var PathologyHtmlTable = $('PathologyHtmlTable');
    var diagnosticsRow = $('PathologyHtmlTable').rows[(findingsRow.rowIndex-1)];

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

function setInitialPathFindingsView()
{
    for (i=1; i<=8; i++)
    {
        var toggleImg = $('pathFindingsToggle_' + i.toString());
        var findingsRow = $('PathFindingsDataGridContainerTr_' + i.toString());

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
   	    
   	    showPathFindings(FindingsValueExists,i)
    }
    
    
}

setInitialPathFindingsView();




function showFirstAdditionalGTDPathRow(linkReference, tableId) {
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