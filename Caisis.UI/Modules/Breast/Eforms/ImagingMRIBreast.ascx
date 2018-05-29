<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Breast.Eforms.ImagingMRIBreast" CodeFile="ImagingMRIBreast.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!-- example table array populator -->
<script language="javascript" type="text/javascript">
	tableArray.otherDxFindings_1 = "otherDxFindings_1";
	
	function showHideBreastMRI(breastMRIPerformed_value,breastMRIAEDtTxtId, breastMRIAEDtTxtIdVal, breastMRIAEDtId, breastMRIAEDtIdVal, breastMRIAETableId, breastMRIAETableIdVal, breastMRIAEFieldId, breastMRIAEFieldIdVal, breastMRIAEFieldValueId, breastMRIAEFieldValueIdVal, breastMRIAEReasonId, breastMRIAEReasonIdVal, breastMRIAEQltyId, breastMRIAEQltyIdVal)
    {
      var BreastMRIDetailsRow = $('BreastMRIDetails');
      if (breastMRIPerformed_value == "Yes")
      {
        BreastMRIDetailsRow.style.display='block';
        
        //clears absent row data
        clearElementsInParentRow(document.getElementById('BreastMRIAbsentRow'));      
      } 
      else if (breastMRIPerformed_value == "No")
      {        
        BreastMRIDetailsRow.style.display='none';  
        
        //clears breastMRI rows data
        clearElementsInParentRow(document.getElementById('BreastMRIRow1'));
        clearElementsInParentRow(document.getElementById('dxFinding_1a'));
        clearElementsInParentRow(document.getElementById('dxFinding_1b'));
        clearElementsInParentRow(document.getElementById('dxFinding_1c'));
        clearElementsInParentRow(document.getElementById('dxFinding_1d'));
        clearElementsInParentRow(document.getElementById('dxFinding_1e'));
        clearElementsInParentRow(document.getElementById('dxFinding_1f'));
        clearElementsInParentRow(document.getElementById('dxFinding_1g'));
        clearElementsInParentRow(document.getElementById('dxFinding_1h'));
        clearElementsInParentRow(document.getElementById('dxFinding_1i'));
        clearElementsInParentRow(document.getElementById('dxFinding_1j'));
                        
        
        document.getElementById(breastMRIAEDtTxtId).value = breastMRIAEDtTxtIdVal;
        document.getElementById(breastMRIAEDtId).value = breastMRIAEDtIdVal;
        document.getElementById(breastMRIAETableId).value = breastMRIAETableIdVal;        
        document.getElementById(breastMRIAEFieldId).value = breastMRIAEFieldIdVal;
        document.getElementById(breastMRIAEFieldValueId).value = breastMRIAEFieldValueIdVal;
        document.getElementById(breastMRIAEReasonId).value = breastMRIAEReasonIdVal;
        document.getElementById(breastMRIAEQltyId).value = breastMRIAEQltyIdVal;
      }
    }
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="ImagingMRIBreast" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="MRI Imaging"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;"><strong>MRI Imaging Done ?</strong></td>
	<td style="text-align:left;"><euc:EformRadioButtonList Table="NoTable" Field="MRIDone" id="MRIDone" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Horizontal" >
		    <asp:ListItem>Yes</asp:ListItem>
            <asp:ListItem>No</asp:ListItem>
		</euc:EformRadioButtonList></td>
	<td style="width:40%"></td>
  </tr>
 <tr id="BreastMRIDetails" style="display: none;">
     <td style="padding: 0px;" colspan="3">
        <table width="675" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DiagnosticsHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Type</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">Results</td>
    <%-- <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; width: 50px; " >Number of Lesions</td>--%>
    <td class="controlBoxDataGridHeaderFirstCol" style="width: 150px; ">Side</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="width: 180px; ">Result</td>

    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  
  
  <asp:Repeater ID="images" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';" onclick="LoadDataEntryForm('Diagnostics', <%# DataBinder.Eval(Container.DataItem, "DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxSide,DxResult,DxQuality', 'Imaging');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxDateText") %></td>
			<td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxType")%></td>
			<td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxSide")%></td>
			<td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "DxResult") %></td>
			<%-- <td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ImgFindSiteNum")%></td>--%>
			<td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ImgFindSide")%></td>
			<td align="left" class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ImgFindResult")%></td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>  

  <tr align="left" id="BreastMRIRow1"> 
    <td height="28" class="ClinicalEformGridColumnOne" valign="top">
		<euc:EformTextBox Runat="server" RecordId="9"  ID="DxDateText_9" TABLE="Diagnostics" FIELD="DxDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" class="InputText"  />
		<euc:EformHidden RecordId="9" Runat="server" ID="DxDate_9" Table="Diagnostics" Field="DxDate"></euc:EformHidden>	
		
		<euc:EformTextBox Width="1px" style="display: none;" RecordId="9" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_9"/></td>

    <td align="center" style="white-space: nowrap;" valign="top">
    		<euc:EformTextBox Width="1px" style="display: none;" RecordId="9" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_9" />MRI </td>
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformComboBox DropDownWidth="auto" style="width:60px;" RecordId="9" Table="Diagnostics" Field="DxSide" LookupCode="OpSide" Runat="server" id="DxSide_9"  /></td>
		
    <td align="left" style="white-space: nowrap;" valign="top">
		<euc:EformDropDownList DropDownWidth="auto"  style="width:120;"  RecordId="9" Table="Diagnostics" Field="DxResult" Runat="server" id="DxResult_9" ShowEmptyListItem="true" LookupCode="BreastMRIResult" />
        
        <euc:EformTextBox Width="1px" style="display: none;" RecordId="9" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_9"/></td>

    <td height="28" class="controlBoxDataGridValueColumn" colspan="2" valign="top">
        <table id="otherDxFindings_1" >
            <%--<tr>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; ">Number of Lesions</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; ">Side</td>
                <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; ">Result</td>
            </tr>--%>
            <tr id="dxFinding_1a">
<%--<td height="28" width="40%" valign="top"   ><euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum" ID="ImgFindSiteNum_1a"  RecordID="1" ParentRecordId="9"  Runat="server" /></td>--%>
                <td height="28" width="49%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformComboBox DropDownWidth="auto"  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSide" ID="ImgFindSide_1a" RecordID="1" ParentRecordId="9" LookupCode="FindSide"  Runat="server"  /><euc:EformTextBox Width="1px" style="display: none;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1a" RecordID="1" ParentRecordId="9" Runat="server"  /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" ><euc:EformComboBox DropDownWidth="250px"  style="width:100px;" TABLE="DxImageFindings"  FIELD="ImgFindResult" ID="ImgFindResult_1a" RecordID="1" ParentRecordId="9" LookupCode="DxResult,Disease,Breast"  Runat="server"  /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_1a" runat="server"/></td>
            </tr>
            <tr id="dxFinding_1b" style="display: none;">
<%--<td height="28" width="40%" valign="top"   ><euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1b"  RecordId="2" ParentRecordId="9"  Runat="server" /></td>--%>
                <td height="28" width="49%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformComboBox DropDownWidth="auto"  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSide" ID="ImgFindSide_1b" RecordId="2" ParentRecordId="9" LookupCode="FindSide"  Runat="server"  />
                                                            <euc:EformTextBox Width="1px" style="display: none;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1b" RecordId="2" ParentRecordId="9" Runat="server"  /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformComboBox DropDownWidth="250px"  style="width:100px;" TABLE="DxImageFindings"  FIELD="ImgFindResult" ID="ImgFindResult_1b" RecordId="2" ParentRecordId="9" LookupCode="DxResult,Disease,Breast"  Runat="server"  /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_1b" runat="server"/></td>
            </tr>
            <tr id="dxFinding_1c" style="display: none;">
<%--<td height="28" width="40%" valign="top"   ><euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1c"  RecordId="3" ParentRecordId="9"  Runat="server" /></td>--%>
                <td height="28" width="49%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformComboBox DropDownWidth="auto"  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSide" ID="ImgFindSide_1c" RecordId="3" ParentRecordId="9" LookupCode="FindSide"  Runat="server"  />
                                                            <euc:EformTextBox Width="1px" style="display: none;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1c" RecordId="3" ParentRecordId="9" Runat="server"  /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformComboBox DropDownWidth="250px"  style="width:100px;" TABLE="DxImageFindings"  FIELD="ImgFindResult" ID="ImgFindResult_1c" RecordId="3" ParentRecordId="9" LookupCode="DxResult,Disease,Breast"  Runat="server"  /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_1c" runat="server"/></td>
            </tr>
             <tr id="dxFinding_1d" style="display: none;">
<%--<td height="28" width="40%" valign="top"   ><euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1d"  RecordId="4" ParentRecordId="9"  Runat="server" /></td>--%>
                <td height="28" width="49%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformComboBox DropDownWidth="auto"  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSide" ID="ImgFindSide_1d" RecordId="4" ParentRecordId="9" LookupCode="FindSide"  Runat="server"  />
                                                            <euc:EformTextBox Width="1px" style="display: none;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1d" RecordId="4" ParentRecordId="9" Runat="server"  /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformComboBox DropDownWidth="250px"  style="width:100px;" TABLE="DxImageFindings"  FIELD="ImgFindResult" ID="ImgFindResult_1d" RecordId="4" ParentRecordId="9" LookupCode="DxResult,Disease,Breast"  Runat="server"  /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_1d" runat="server"/></td>
            </tr>
            <tr id="dxFinding_1e" style="display: none;">
<%--<td height="28" width="40%" valign="top"   ><euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1e"  RecordId="5" ParentRecordId="9"  Runat="server" /></td>--%>
                <td height="28" width="49%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformComboBox DropDownWidth="auto"  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSide" ID="ImgFindSide_1e" RecordId="5" ParentRecordId="9" LookupCode="FindSide"  Runat="server"  />
                                                            <euc:EformTextBox Width="1px" style="display: none;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1e" RecordId="5" ParentRecordId="9" Runat="server"  /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformComboBox DropDownWidth="250px"  style="width:100px;" TABLE="DxImageFindings"  FIELD="ImgFindResult" ID="ImgFindResult_1e" RecordId="5" ParentRecordId="9" LookupCode="DxResult,Disease,Breast"  Runat="server"  /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_1e" runat="server"/></td>
            </tr>
             <tr id="dxFinding_1f" style="display: none;">
<%--<td height="28" width="40%" valign="top"   ><euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1f"  RecordId="6" ParentRecordId="9"  Runat="server" /></td>--%>
                <td height="28" width="49%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformComboBox DropDownWidth="auto"  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSide" ID="ImgFindSide_1f" RecordId="6" ParentRecordId="9" LookupCode="FindSide"  Runat="server"  />
                                                            <euc:EformTextBox Width="1px" style="display: none;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1f" RecordId="6" ParentRecordId="9" Runat="server"  /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformComboBox DropDownWidth="250px"  style="width:100px;" TABLE="DxImageFindings"  FIELD="ImgFindResult" ID="ImgFindResult_1f" RecordId="6" ParentRecordId="9" LookupCode="DxResult,Disease,Breast"  Runat="server"  /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_1f" runat="server"/></td>
            </tr>
             <tr id="dxFinding_1g" style="display: none;">
<%--<td height="28" width="40%" valign="top"   ><euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1g"  RecordId="7" ParentRecordId="9"  Runat="server" /></td>--%>
                <td height="28" width="49%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformComboBox DropDownWidth="auto"  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSide" ID="ImgFindSide_1g" RecordId="7" ParentRecordId="9" LookupCode="FindSide"  Runat="server"  />
                                                            <euc:EformTextBox Width="1px" style="display: none;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1g" RecordId="7" ParentRecordId="9" Runat="server"  /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformComboBox DropDownWidth="250px"  style="width:100px;" TABLE="DxImageFindings"  FIELD="ImgFindResult" ID="ImgFindResult_1g" RecordId="7" ParentRecordId="9" LookupCode="DxResult,Disease,Breast"  Runat="server"  /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_1g" runat="server"/></td>
            </tr>
            <tr id="dxFinding_1h" style="display: none;">
<%--<td height="28" width="40%" valign="top"   ><euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1h"  RecordId="8" ParentRecordId="9"  Runat="server" /></td>--%>
                <td height="28" width="49%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformComboBox DropDownWidth="auto"  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSide" ID="ImgFindSide_1h" RecordId="8" ParentRecordId="9" LookupCode="FindSide"  Runat="server"  />
                                                            <euc:EformTextBox Width="1px" style="display: none;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1h" RecordId="8" ParentRecordId="9" Runat="server"  /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformComboBox DropDownWidth="250px"  style="width:100px;" TABLE="DxImageFindings"  FIELD="ImgFindResult" ID="ImgFindResult_1h" RecordId="8" ParentRecordId="9" LookupCode="DxResult,Disease,Breast"  Runat="server"  /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_1h" runat="server"/></td>
            </tr>
            <tr id="dxFinding_1i" style="display: none;">
<%--<td height="28" width="40%" valign="top"   ><euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1i"  RecordId="9" ParentRecordId="9"  Runat="server" /></td>--%>
                <td height="28" width="49%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformComboBox DropDownWidth="auto"  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSide" ID="ImgFindSide_1i" RecordId="9" ParentRecordId="9" LookupCode="FindSide"  Runat="server"  />
                                                            <euc:EformTextBox Width="1px" style="display: none;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1i" RecordId="9" ParentRecordId="9" Runat="server"  /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformComboBox DropDownWidth="250px"  style="width:100px;" TABLE="DxImageFindings"  FIELD="ImgFindResult" ID="ImgFindResult_1i" RecordId="9" ParentRecordId="9" LookupCode="DxResult,Disease,Breast"  Runat="server"  /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_1i" runat="server"/></td>
            </tr>
            <tr id="dxFinding_1j" style="display: none;">
<%--<td height="28" width="40%" valign="top"   ><euc:EformTextBox style="width:60px;" TABLE="DxImageFindings" FIELD="ImgFindSiteNum"      ID="ImgFindSiteNum_1j"  RecordId="10" ParentRecordId="9"  Runat="server" /></td>--%>
                <td height="28" width="49%" class="controlBoxDataGridValueColumn" style="text-align: center;" valign="top"  ><euc:EformComboBox DropDownWidth="auto"  style="width:60px;" TABLE="DxImageFindings"  FIELD="ImgFindSide" ID="ImgFindSide_1j" RecordId="10" ParentRecordId="9" LookupCode="FindSide"  Runat="server"  />
                                                            <euc:EformTextBox Width="1px" style="display: none;" TABLE="DxImageFindings"  FIELD="ImgFindSite" ID="ImgFindSite_1j" RecordId="10" ParentRecordId="9" Runat="server"  /></td>    
                <td height="28" width="20%" class="controlBoxDataGridValueColumn" valign="top" >                            <euc:EformComboBox DropDownWidth="250px"  style="width:100px;" TABLE="DxImageFindings"  FIELD="ImgFindResult" ID="ImgFindResult_1j" RecordId="10" ParentRecordId="9" LookupCode="DxResult,Disease,Breast"  Runat="server"  /></td>    
                <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon ID="EformDeleteIcon_1j" runat="server"/></td>
            </tr>
             <td height="28" width="10%" colspan="2" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'otherDxFindings_1');" /></td>
              
        </table>
    </td> 
    <td class="ControlBoxLinedRows" align="center" valign="middle" ><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
  </tr>

</table>
     </td>
 </tr>
 </table>
 <table>
    <tr id="BreastMRIAbsentRow">
        <td>
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_8"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="8" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_8"
                Runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="TableName" ID="TableName_8"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="FieldName" ID="FieldName_8"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_8"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_8"
                runat="server" style="width:1px;display:none;"/>
            <euc:EformTextBox RecordId="8" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_8"
                runat="server"  style="width:1px;display:none;"/>
        </td>
    </tr>
</table>


<script type="text/javascript">

    /* <![CDATA[ */
   
    //Adds events to controls ImgFindSiteNum_1a,ImgFindSide_1a,ImgFindSite_1a,ImgFindResult_1a
    function addEvents(dateTextID,dxTypeID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,imgFindSideID,imgFindSiteID,imgFindResultID)
    { 
        $(dateTextID).addEvent('blur',curry(SetHiddenFields,dateTextID,dxTypeID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,imgFindSideID,imgFindSiteID,imgFindResultID));
        $(dxTypeID).addEvent('blur',curry(SetHiddenFields,dateTextID,dxTypeID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,imgFindSideID,imgFindSiteID,imgFindResultID));
        $(dxSideID).addEvent('blur',curry(SetHiddenFields,dateTextID,dxTypeID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,imgFindSideID,imgFindSiteID,imgFindResultID));
        $(dxResultID).addEvent('blur',curry(SetHiddenFields,dateTextID,dxTypeID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,imgFindSideID,imgFindSiteID,imgFindResultID));

        $(imgFindSiteNumID).addEvent('blur',curry(SetHiddenFields,dateTextID,dxTypeID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,imgFindSideID,imgFindSiteID,imgFindResultID));
        $(imgFindSideID).addEvent('blur',curry(SetHiddenFields,dateTextID,dxTypeID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,imgFindSideID,imgFindSiteID,imgFindResultID));
        $(imgFindResultID).addEvent('blur',curry(SetHiddenFields,dateTextID,dxTypeID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,imgFindSideID,imgFindSiteID,imgFindResultID));


   }

    addEvents($('<%= DxDateText_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxSide_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxQuality_9.ClientID %>'),$('<%= ImgFindSide_1a.ClientID %>'),$('<%= ImgFindSite_1a.ClientID %>'),$('<%= ImgFindResult_1a.ClientID %>')); 
    addEvents($('<%= DxDateText_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxSide_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxQuality_9.ClientID %>'),$('<%= ImgFindSide_1b.ClientID %>'),$('<%= ImgFindSite_1b.ClientID %>'),$('<%= ImgFindResult_1b.ClientID %>')); 
    addEvents($('<%= DxDateText_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxSide_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxQuality_9.ClientID %>'),$('<%= ImgFindSide_1c.ClientID %>'),$('<%= ImgFindSite_1c.ClientID %>'),$('<%= ImgFindResult_1c.ClientID %>')); 
    addEvents($('<%= DxDateText_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxSide_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxQuality_9.ClientID %>'),$('<%= ImgFindSide_1d.ClientID %>'),$('<%= ImgFindSite_1d.ClientID %>'),$('<%= ImgFindResult_1d.ClientID %>')); 
    addEvents($('<%= DxDateText_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxSide_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxQuality_9.ClientID %>'),$('<%= ImgFindSide_1e.ClientID %>'),$('<%= ImgFindSite_1e.ClientID %>'),$('<%= ImgFindResult_1e.ClientID %>')); 
    addEvents($('<%= DxDateText_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxSide_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxQuality_9.ClientID %>'),$('<%= ImgFindSide_1f.ClientID %>'),$('<%= ImgFindSite_1f.ClientID %>'),$('<%= ImgFindResult_1f.ClientID %>')); 
    addEvents($('<%= DxDateText_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxSide_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxQuality_9.ClientID %>'),$('<%= ImgFindSide_1g.ClientID %>'),$('<%= ImgFindSite_1g.ClientID %>'),$('<%= ImgFindResult_1g.ClientID %>')); 
    addEvents($('<%= DxDateText_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxSide_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxQuality_9.ClientID %>'),$('<%= ImgFindSide_1h.ClientID %>'),$('<%= ImgFindSite_1h.ClientID %>'),$('<%= ImgFindResult_1h.ClientID %>')); 
    addEvents($('<%= DxDateText_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxSide_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxQuality_9.ClientID %>'),$('<%= ImgFindSide_1i.ClientID %>'),$('<%= ImgFindSite_1i.ClientID %>'),$('<%= ImgFindResult_1i.ClientID %>')); 
    addEvents($('<%= DxDateText_9.ClientID %>'),$('<%= DxType_9.ClientID %>'),$('<%= DxTarget_9.ClientID %>'),$('<%= DxSide_9.ClientID %>'),$('<%= DxResult_9.ClientID %>'),$('<%= DxQuality_9.ClientID %>'),$('<%= ImgFindSide_1j.ClientID %>'),$('<%= ImgFindSite_1j.ClientID %>'),$('<%= ImgFindResult_1j.ClientID %>')); 
 
    /* ]]> */
    
function SetHiddenFields(dateTextID,dxTypeID,dxTargetID,dxSideID,dxResultID,dxDataQualityID,imgFindSideID,imgFindSiteID,imgFindResultID)
{
    if (dateTextID.value != '' || dxSideID.value != '' || dxResultID.value != '' || imgFindSideID.value != '' || imgFindResultID.value != '')
    {
        dxTargetID.value = "Breast";
        dxTypeID.value = "MRI";
        dxDataQualityID.value = 'STD';
    }
    else
    {
        dxTargetID.value = '';
        dxTypeID.value = '';  
        dxDataQualityID.value = '';
    }
    
     if (imgFindSideID.value != '' || imgFindResultID.value != '')
    {
        imgFindSiteID.value = "Breast";
    }
    else
    {
        imgFindSiteID.value = '';
    }
}
</script>