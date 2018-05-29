<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ImagingWithFindings" CodeFile="ImagingWithFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript">
	tableArray.DiagnosticsFindingsHtmlTable = "DiagnosticsFindingsHtmlTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ImagingWithFindings" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Imaging"></asp:Label><br/>
<table width="700" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsFindingsHtmlTable">
  <tr> 
    <td width="12%" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Study</td>
    <td width="25%" class="controlBoxDataGridHeaderFirstCol">Results</td>
    <td width="13%" class="controlBoxDataGridHeaderFirstCol">Num of Findings</td>
    <td width="14%" class="controlBoxDataGridHeaderFirstCol">Site</td>
    <td width="14%" class="controlBoxDataGridHeaderFirstCol">Result</td>
    <td width="13%" class="controlBoxDataGridHeaderFirstCol">Height (cm)</td>
    <td width="13%" class="controlBoxDataGridHeaderFirstCol">Width (cm)</td>
    <td width="13%" class="controlBoxDataGridHeaderFirstCol">Length (cm)</td>
    <td width="18%" class="controlBoxDataGridHeaderFirstCol">Finding Notes</td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxResult,DxNotes', 'Imaging');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
		  <td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxResult") %></td>
			<td align="center" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxNotes") %></td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  
  

  <tr align="left"> 
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="1"  ID="DxDateText_1" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="1" Runat="server" ID="DxDate_1" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	</td>
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="1" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox LookupCode="DxResult" RefBy="DxResult" style="width:80;" Field="DxResult" RecordId="1" Table="Diagnostics" Runat="server" id="DxResult_1"  />
	</td>
	<td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_1" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_1a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1a"  RecordID="1" ParentRecordId="1"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1a" RecordID="1"  ParentRecordId="1" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_1a"  RecordID="1"  ParentRecordId="1" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_1a"  RecordID="1" ParentRecordId="1" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_1a"  RecordID="1" ParentRecordId="1" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_1a"  RecordID="1" ParentRecordId="1"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_1a"  RecordID="1" ParentRecordId="1"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_1b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1b"  RecordId="2" ParentRecordId="1"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1b" RecordId="2"  ParentRecordId="1" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_1b"  RecordId="2"  ParentRecordId="1" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_1b"  RecordId="2" ParentRecordId="1" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_1b"  RecordId="2" ParentRecordId="1" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_1b"  RecordId="2" ParentRecordId="1"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_1b"  RecordId="2" ParentRecordId="1"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_1c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1c"  RecordId="3" ParentRecordId="1"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1c" RecordId="3"  ParentRecordId="1" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_1c"  RecordId="3"  ParentRecordId="1" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_1c"  RecordId="3" ParentRecordId="1" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_1c"  RecordId="3" ParentRecordId="1" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_1c"  RecordId="3" ParentRecordId="1"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_1c"  RecordId="3" ParentRecordId="1"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_1');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="2"  ID="DxDateText_2" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="2" Runat="server" ID="DxDate_2" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="2" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_2"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="2" Table="Diagnostics" Runat="server" id="DxResult_2"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_2" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_2a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_2a"  RecordID="1" ParentRecordId="2"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2a" RecordID="1"  ParentRecordId="2" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_2a"  RecordID="1"  ParentRecordId="2" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_2a"  RecordID="1" ParentRecordId="2" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_2a"  RecordID="1" ParentRecordId="2" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_2a"  RecordID="1" ParentRecordId="2"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_2a"  RecordID="1" ParentRecordId="2"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
            </tr>
            <tr id="findingDiag_2b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_2b"  RecordId="2" ParentRecordId="2"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2b" RecordId="2"  ParentRecordId="2" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_2b"  RecordId="2"  ParentRecordId="2" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_2b"  RecordId="2" ParentRecordId="2" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_2b"  RecordId="2" ParentRecordId="2" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_2b"  RecordId="2" ParentRecordId="2"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_2b"  RecordId="2" ParentRecordId="2"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
            </tr>
            <tr id="findingDiag_2c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_2c"  RecordId="3" ParentRecordId="2"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_2c" RecordId="3"  ParentRecordId="2" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_2c"  RecordId="3"  ParentRecordId="2" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_2c"  RecordId="3" ParentRecordId="2" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_2c"  RecordId="3" ParentRecordId="2" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_2c"  RecordId="3" ParentRecordId="2"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_2c"  RecordId="3" ParentRecordId="2"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_2');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="3"  ID="DxDateText_3" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="3" Runat="server" ID="DxDate_3" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="3" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_3"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="3" Table="Diagnostics" Runat="server" id="DxResult_3"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_3" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_3a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_3a"  RecordID="1" ParentRecordId="3"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3a" RecordID="1"  ParentRecordId="3" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_3a"  RecordID="1"  ParentRecordId="3" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_3a"  RecordID="1" ParentRecordId="3" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_3a"  RecordID="1" ParentRecordId="3" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_3a"  RecordID="1" ParentRecordId="3"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_3a"  RecordID="1" ParentRecordId="3"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_3b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_3b"  RecordId="2" ParentRecordId="3"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3b" RecordId="2"  ParentRecordId="3" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_3b"  RecordId="2"  ParentRecordId="3" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_3b"  RecordId="2" ParentRecordId="3" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_3b"  RecordId="2" ParentRecordId="3" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_3b"  RecordId="2" ParentRecordId="3"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_3b"  RecordId="2" ParentRecordId="3"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_3c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_3c"  RecordId="3" ParentRecordId="3"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_3c" RecordId="3"  ParentRecordId="3" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_3c"  RecordId="3"  ParentRecordId="3" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_3c"  RecordId="3" ParentRecordId="3" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_3c"  RecordId="3" ParentRecordId="3" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_3c"  RecordId="3" ParentRecordId="3"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_3c"  RecordId="3" ParentRecordId="3"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_3');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>

  </tr>
  <tr style="DISPLAY: none" valign="top">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="4"  ID="DxDateText_4" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="4" Runat="server" ID="DxDate_4" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="4" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="4" Table="Diagnostics" Runat="server" id="DxResult_4"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_4" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_4a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_4a"  RecordID="1" ParentRecordId="4"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_4a" RecordID="1"  ParentRecordId="4" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_4a"  RecordID="1"  ParentRecordId="4" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_4a"  RecordID="1" ParentRecordId="4" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_4a"  RecordID="1" ParentRecordId="4" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_4a"  RecordID="1" ParentRecordId="4"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_4a"  RecordID="1" ParentRecordId="4"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon  runat="server"/></td>
            </tr>
            <tr id="findingDiag_4b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_4b"  RecordId="2" ParentRecordId="4"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_4b" RecordId="2"  ParentRecordId="4" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_4b"  RecordId="2"  ParentRecordId="4" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_4b"  RecordId="2" ParentRecordId="4" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_4b"  RecordId="2" ParentRecordId="4" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_4b"  RecordId="2" ParentRecordId="4"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_4b"  RecordId="2" ParentRecordId="4"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_4c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_4c"  RecordId="3" ParentRecordId="4"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_4c" RecordId="3"  ParentRecordId="4" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_4c"  RecordId="3"  ParentRecordId="4" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_4c"  RecordId="3" ParentRecordId="4" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_4c"  RecordId="3" ParentRecordId="4" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_4c"  RecordId="3" ParentRecordId="4"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_4c"  RecordId="3" ParentRecordId="4"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_4');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" >
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="5"  ID="DxDateText_5" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="5" Runat="server" ID="DxDate_5" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="5" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="5" Table="Diagnostics" Runat="server" id="DxResult_5"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_5" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_5a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_5a"  RecordID="1" ParentRecordId="5"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_5a" RecordID="1"  ParentRecordId="5" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_5a"  RecordID="1"  ParentRecordId="5" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_5a"  RecordID="1" ParentRecordId="5" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_5a"  RecordID="1" ParentRecordId="5" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_5a"  RecordID="1" ParentRecordId="5"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_5a"  RecordID="1" ParentRecordId="5"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_5b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_5b"  RecordId="2" ParentRecordId="5"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_5b" RecordId="2"  ParentRecordId="5" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_5b"  RecordId="2"  ParentRecordId="5" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_5b"  RecordId="2" ParentRecordId="5" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_5b"  RecordId="2" ParentRecordId="5" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_5b"  RecordId="2" ParentRecordId="5"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_5b"  RecordId="2" ParentRecordId="5"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_5c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_5c"  RecordId="3" ParentRecordId="5"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_5c" RecordId="3"  ParentRecordId="5" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_5c"  RecordId="3"  ParentRecordId="5" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_5c"  RecordId="3" ParentRecordId="5" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_5c"  RecordId="3" ParentRecordId="5" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_5c"  RecordId="3" ParentRecordId="5"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_5c"  RecordId="3" ParentRecordId="5"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_5');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="6"  ID="DxDateText_6" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="6" Runat="server" ID="DxDate_6" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="6" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_6"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="6" Table="Diagnostics" Runat="server" id="DxResult_6"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_6" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_6a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_6a"  RecordID="1" ParentRecordId="6"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6a" RecordID="1"  ParentRecordId="6" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_6a"  RecordID="1"  ParentRecordId="6" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_6a"  RecordID="1" ParentRecordId="6" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_6a"  RecordID="1" ParentRecordId="6" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_6a"  RecordID="1" ParentRecordId="6"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_6a"  RecordID="1" ParentRecordId="6"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_6b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_6b"  RecordId="2" ParentRecordId="6"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6b" RecordId="2"  ParentRecordId="6" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_6b"  RecordId="2"  ParentRecordId="6" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_6b"  RecordId="2" ParentRecordId="6" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_6b"  RecordId="2" ParentRecordId="6" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_6b"  RecordId="2" ParentRecordId="6"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_6b"  RecordId="2" ParentRecordId="6"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_6c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_6c"  RecordId="3" ParentRecordId="6"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_6c" RecordId="3"  ParentRecordId="6" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_6c"  RecordId="3"  ParentRecordId="6" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_6c"  RecordId="3" ParentRecordId="6" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_6c"  RecordId="3" ParentRecordId="6" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_6c"  RecordId="3" ParentRecordId="6"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_6c"  RecordId="3" ParentRecordId="6"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_6');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="7"  ID="DxDateText_7" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="7" Runat="server" ID="DxDate_7" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="7" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_7"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="7" Table="Diagnostics" Runat="server" id="DxResult_7"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_7" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_7a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_7a"  RecordID="1" ParentRecordId="7"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7a" RecordID="1"  ParentRecordId="7" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_7a"  RecordID="1"  ParentRecordId="7" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_7a"  RecordID="1" ParentRecordId="7" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_7a"  RecordID="1" ParentRecordId="7" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_7a"  RecordID="1" ParentRecordId="7"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_7a"  RecordID="1" ParentRecordId="7"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_7b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_7b"  RecordId="2" ParentRecordId="7"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7b" RecordId="2"  ParentRecordId="7" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_7b"  RecordId="2"  ParentRecordId="7" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_7b"  RecordId="2" ParentRecordId="7" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_7b"  RecordId="2" ParentRecordId="7" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_7b"  RecordId="2" ParentRecordId="7"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_7b"  RecordId="2" ParentRecordId="7"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_7c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_7c"  RecordId="3" ParentRecordId="7"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_7c" RecordId="3"  ParentRecordId="7" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_7c"  RecordId="3"  ParentRecordId="7" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_7c"  RecordId="3" ParentRecordId="7" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_7c"  RecordId="3" ParentRecordId="7" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_7c"  RecordId="3" ParentRecordId="7"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_7c"  RecordId="3" ParentRecordId="7"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_7');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none" valign="top">
    <td height="28" class="ClinicalEformGridColumnOne">
		<euc:EformTextBox Runat="server" RecordId="8"  ID="DxDateText_8" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="8" Runat="server" ID="DxDate_8" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="8" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_8"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="8" Table="Diagnostics" Runat="server" id="DxResult_8"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_8" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_8a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_8a"  RecordID="1" ParentRecordId="8"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8a" RecordID="1"  ParentRecordId="8" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_8a"  RecordID="1"  ParentRecordId="8" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_8a"  RecordID="1" ParentRecordId="8" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_8a"  RecordID="1" ParentRecordId="8" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_8a"  RecordID="1" ParentRecordId="8"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_8a"  RecordID="1" ParentRecordId="8"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_8b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_8b"  RecordId="2" ParentRecordId="8"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8b" RecordId="2"  ParentRecordId="8" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_8b"  RecordId="2"  ParentRecordId="8" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_8b"  RecordId="2" ParentRecordId="8" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_8b"  RecordId="2" ParentRecordId="8" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_8b"  RecordId="2" ParentRecordId="8"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_8b"  RecordId="2" ParentRecordId="8"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_8c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_8c"  RecordId="3" ParentRecordId="8"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_8c" RecordId="3"  ParentRecordId="8" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_8c"  RecordId="3"  ParentRecordId="8" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_8c"  RecordId="3" ParentRecordId="8" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_8c"  RecordId="3" ParentRecordId="8" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_8c"  RecordId="3" ParentRecordId="8"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_8c"  RecordId="3" ParentRecordId="8"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_8');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon  runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="9"  ID="DxDateText_9" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="9" Runat="server" ID="DxDate_9" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="9" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_9"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="9" Table="Diagnostics" Runat="server" id="DxResult_9"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_9" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_9a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_9a"  RecordID="1" ParentRecordId="9"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9a" RecordID="1"  ParentRecordId="9" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_9a"  RecordID="1"  ParentRecordId="9" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_9a"  RecordID="1" ParentRecordId="9" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_9a"  RecordID="1" ParentRecordId="9" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_9a"  RecordID="1" ParentRecordId="9"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_9a"  RecordID="1" ParentRecordId="9"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_9b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_9b"  RecordId="2" ParentRecordId="9"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9b" RecordId="2"  ParentRecordId="9" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_9b"  RecordId="2"  ParentRecordId="9" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_9b"  RecordId="2" ParentRecordId="9" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_9b"  RecordId="2" ParentRecordId="9" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_9b"  RecordId="2" ParentRecordId="9"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_9b"  RecordId="2" ParentRecordId="9"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_9c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_9c"  RecordId="3" ParentRecordId="9"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_9c" RecordId="3"  ParentRecordId="9" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_9c"  RecordId="3"  ParentRecordId="9" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_9c"  RecordId="3" ParentRecordId="9" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_9c"  RecordId="3" ParentRecordId="9" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_9c"  RecordId="3" ParentRecordId="9"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_9c"  RecordId="3" ParentRecordId="9"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_9');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="10"  ID="DxDateText_10" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="10" Runat="server" ID="DxDate_10" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="10" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_10"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="10" Table="Diagnostics" Runat="server" id="DxResult_10"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_10" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_10a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_10a"  RecordID="1" ParentRecordId="10"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10a" RecordID="1"  ParentRecordId="10" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_10a"  RecordID="1"  ParentRecordId="10" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_10a"  RecordID="1" ParentRecordId="10" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_10a"  RecordID="1" ParentRecordId="10" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_10a"  RecordID="1" ParentRecordId="10"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_10a"  RecordID="1" ParentRecordId="10"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_10b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_10b"  RecordId="2" ParentRecordId="10"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10b" RecordId="2"  ParentRecordId="10" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_10b"  RecordId="2"  ParentRecordId="10" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_10b"  RecordId="2" ParentRecordId="10" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_10b"  RecordId="2" ParentRecordId="10" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_10b"  RecordId="2" ParentRecordId="10"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_10b"  RecordId="2" ParentRecordId="10"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_10c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_10c"  RecordId="3" ParentRecordId="10"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_10c" RecordId="3"  ParentRecordId="10" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_10c"  RecordId="3"  ParentRecordId="10" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_10c"  RecordId="3" ParentRecordId="10" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_10c"  RecordId="3" ParentRecordId="10" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_10c"  RecordId="3" ParentRecordId="10"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_10c"  RecordId="3" ParentRecordId="10"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_10');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="11"  ID="DxDateText_11" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="11" Runat="server" ID="DxDate_11" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="11" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_11"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="11" Table="Diagnostics" Runat="server" id="DxResult_11"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_11" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_11a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_11a"  RecordID="1" ParentRecordId="11"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11a" RecordID="1"  ParentRecordId="11" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_11a"  RecordID="1"  ParentRecordId="11" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_11a"  RecordID="1" ParentRecordId="11" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_11a"  RecordID="1" ParentRecordId="11" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_11a"  RecordID="1" ParentRecordId="11"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_11a"  RecordID="1" ParentRecordId="11"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_11b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_11b"  RecordId="2" ParentRecordId="11"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11b" RecordId="2"  ParentRecordId="11" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_11b"  RecordId="2"  ParentRecordId="11" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_11b"  RecordId="2" ParentRecordId="11" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_11b"  RecordId="2" ParentRecordId="11" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_11b"  RecordId="2" ParentRecordId="11"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_11b"  RecordId="2" ParentRecordId="11"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_11c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_11c"  RecordId="3" ParentRecordId="11"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_11c" RecordId="3"  ParentRecordId="11" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_11c"  RecordId="3"  ParentRecordId="11" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_11c"  RecordId="3" ParentRecordId="11" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_11c"  RecordId="3" ParentRecordId="11" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_11c"  RecordId="3" ParentRecordId="11"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_11c"  RecordId="3" ParentRecordId="11"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_11');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="12"  ID="DxDateText_12" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="12" Runat="server" ID="DxDate_12" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="12" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_12"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="12" Table="Diagnostics" Runat="server" id="DxResult_12"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_12" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_12a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_12a"  RecordID="1" ParentRecordId="12"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12a" RecordID="1"  ParentRecordId="12" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_12a"  RecordID="1"  ParentRecordId="12" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_12a"  RecordID="1" ParentRecordId="12" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_12a"  RecordID="1" ParentRecordId="12" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_12a"  RecordID="1" ParentRecordId="12"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_12a"  RecordID="1" ParentRecordId="12"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_12b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_12b"  RecordId="2" ParentRecordId="12"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12b" RecordId="2"  ParentRecordId="12" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_12b"  RecordId="2"  ParentRecordId="12" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_12b"  RecordId="2" ParentRecordId="12" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_12b"  RecordId="2" ParentRecordId="12" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_12b"  RecordId="2" ParentRecordId="12"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_12b"  RecordId="2" ParentRecordId="12"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_12c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_12c"  RecordId="3" ParentRecordId="12"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_12c" RecordId="3"  ParentRecordId="12" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_12c"  RecordId="3"  ParentRecordId="12" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_12c"  RecordId="3" ParentRecordId="12" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_12c"  RecordId="3" ParentRecordId="12" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_12c"  RecordId="3" ParentRecordId="12"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_12c"  RecordId="3" ParentRecordId="12"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_12');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="13"  ID="DxDateText_13" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="13" Runat="server" ID="DxDate_13" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="13" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_13"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="13" Table="Diagnostics" Runat="server" id="DxResult_13"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_13" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_13a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_13a"  RecordID="1" ParentRecordId="13"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13a" RecordID="1"  ParentRecordId="13" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_13a"  RecordID="1"  ParentRecordId="13" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_13a"  RecordID="1" ParentRecordId="13" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_13a"  RecordID="1" ParentRecordId="13" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_13a"  RecordID="1" ParentRecordId="13"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_13a"  RecordID="1" ParentRecordId="13"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_13b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_13b"  RecordId="2" ParentRecordId="13"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13b" RecordId="2"  ParentRecordId="13" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_13b"  RecordId="2"  ParentRecordId="13" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_13b"  RecordId="2" ParentRecordId="13" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_13b"  RecordId="2" ParentRecordId="13" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_13b"  RecordId="2" ParentRecordId="13"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_13b"  RecordId="2" ParentRecordId="13"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_13c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_13c"  RecordId="3" ParentRecordId="13"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_13c" RecordId="3"  ParentRecordId="13" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_13c"  RecordId="3"  ParentRecordId="13" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_13c"  RecordId="3" ParentRecordId="13" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_13c"  RecordId="3" ParentRecordId="13" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_13c"  RecordId="3" ParentRecordId="13"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_13c"  RecordId="3" ParentRecordId="13"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_13');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="14"  ID="DxDateText_14" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="14" Runat="server" ID="DxDate_14" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="14" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_14"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="14" Table="Diagnostics" Runat="server" id="DxResult_14"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_14" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_14a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_14a"  RecordID="1" ParentRecordId="14"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14a" RecordID="1"  ParentRecordId="14" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_14a"  RecordID="1"  ParentRecordId="14" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_14a"  RecordID="1" ParentRecordId="14" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_14a"  RecordID="1" ParentRecordId="14" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_14a"  RecordID="1" ParentRecordId="14"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_14a"  RecordID="1" ParentRecordId="14"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_14b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_14b"  RecordId="2" ParentRecordId="14"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14b" RecordId="2"  ParentRecordId="14" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_14b"  RecordId="2"  ParentRecordId="14" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_14b"  RecordId="2" ParentRecordId="14" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_14b"  RecordId="2" ParentRecordId="14" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_14b"  RecordId="2" ParentRecordId="14"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_14b"  RecordId="2" ParentRecordId="14"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_14c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_14c"  RecordId="3" ParentRecordId="14"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_14c" RecordId="3"  ParentRecordId="14" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_14c"  RecordId="3"  ParentRecordId="14" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_14c"  RecordId="3" ParentRecordId="14" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_14c"  RecordId="3" ParentRecordId="14" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_14c"  RecordId="3" ParentRecordId="14"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_14c"  RecordId="3" ParentRecordId="14"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_14');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
    <tr style="DISPLAY: none">
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="15"  ID="DxDateText_15" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
        <euc:EformHidden RecordId="15" Runat="server" ID="DxDate_15" Table="Diagnostics" Field="DxDate"></euc:EformHidden>
    </td> 
    <td style="white-space: nowrap;" valign="top">
		<euc:EformSelect RecordId="15" LookupCode="DxType" style="width:80;" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_15"/>
	</td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox  LookupCode="DxResult" style="width:80;" Field="DxResult" RecordId="15" Table="Diagnostics" Runat="server" id="DxResult_15"  />
	</td>
    <td height="28" class="controlBoxDataGridValueColumn" colspan="8" >
        <table id="findingDiag_15" width="500" cellpadding="5" cellspacing="0"  >
            <tr id="findingDiag_15a" >
                <td height="28"  valign="top"   >                           <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_15a"  RecordID="1" ParentRecordId="15"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15a" RecordID="1"  ParentRecordId="15" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_15a"  RecordID="1"  ParentRecordId="15" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_15a"  RecordID="1" ParentRecordId="15" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_15a"  RecordID="1" ParentRecordId="15" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_15a"  RecordID="1" ParentRecordId="15"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_15a"  RecordID="1" ParentRecordId="15"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_15b" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_15b"  RecordId="2" ParentRecordId="15"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15b" RecordId="2"  ParentRecordId="15" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_15b"  RecordId="2"  ParentRecordId="15" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_15b"  RecordId="2" ParentRecordId="15" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_15b"  RecordId="2" ParentRecordId="15" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_15b"  RecordId="2" ParentRecordId="15"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top"   >  <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_15b"  RecordId="2" ParentRecordId="15"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
            <tr id="findingDiag_15c" style="DISPLAY: none">
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_15c"  RecordId="3" ParentRecordId="15"   Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_15c" RecordId="3"  ParentRecordId="15" Runat="server" TabIndex="5" LookupCode="ImgFindSite" /></td>    
                <td height="28"  valign="top" style="white-space: nowrap;"> <euc:EformSelect  style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindResult"          ID="ImgFindResult_15c"  RecordId="3"  ParentRecordId="15" Runat="server" TabIndex="6" LookupCode="DxResult" /></td>    
                 <td height="28"  valign="top">                             <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindHeight"      ID="ImgFindHeight_15c"  RecordId="3" ParentRecordId="15" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindWidth"      ID="ImgFindWidth_15c"  RecordId="3" ParentRecordId="15" Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindLength"      ID="ImgFindLength_15c"  RecordId="3" ParentRecordId="15"  Runat="server" TabIndex="4"/></td>    
                <td height="28"  valign="top">                              <euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindNotes"      ID="ImgFindNotes_15c"  RecordId="3" ParentRecordId="15"  Runat="server" TabIndex="4"/></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
            </tr>
           <tr >
                <td height="28" colspan="2" ><img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'findingDiag_15');" /></td>
              </tr>
        </table>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'DiagnosticsFindingsHtmlTable');" />
<br/><br/>
<br/>
