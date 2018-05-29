<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.ThyroidNodeFindings" CodeFile="ThyroidNodeFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript" language="javascript">
	tableArray.ThyroidNodeFindingsHtmlTable = "ThyroidNodeFindingsHtmlTable";
	
	function NodeFindingsRadioClick(option_value,div_id, dateTextFieldId, shortdate, dateFieldId, date, tableId, value1, fieldId, value2, fieldValue, value3, reasonId, value4, qltyId, value5)
    {
      var hideDiv = document.getElementById(div_id);
      if (option_value == "Yes")
      {
        hideDiv.style.display='block';
        
        //clears absent row data
        clearElementsInParentRow(document.getElementById('ThyroidNodeFindingsAbsentRow'));      
      } 
      else if (option_value == "No")
      {        
        hideDiv.style.display='none';
        
        //clears all rows data
        clearElementsInParentRow(document.getElementById('ThyroidNodeFindingsHtmlRow'));
        
        //assign values to absent record
        document.getElementById(dateTextFieldId).value = shortdate;
        document.getElementById(dateFieldId).value = date;
        document.getElementById(tableId).value = value1;        
        document.getElementById(fieldId).value = value2;
        document.getElementById(fieldValue).value = value3;
        document.getElementById(reasonId).value = value4;
        document.getElementById(qltyId).value = value5;
      }
    }
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>
<script type="text/javascript" src="../../../ClientScripts/EFormScripts.js"></script>

<a name="ThyroidNodeFindings" />
<table>
    <tr>
        <td>
            <span class="controlBoxTitle">Node Findings ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="NodeFindings" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="10" Table="NoTable" Field="NodeFindings">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
            </euc:EformRadioButtonList></td>
    </tr>
</table>

<div id="NodeFindingsDiv" runat="server" style="display: none; position:relative;">
<table  width="650" border="0" cellpadding="6" cellspacing="0" class="ClinicalEformTable" id="ThyroidNodeFindingsHtmlTable" > 
  <tr>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Side</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Site</td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Max Dim </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Extension </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;"># Positive Nodes </td>
	    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Total # Nodes </td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Mets Focus Max Size </td>
	    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>        
  </tr>
  <tr id="ThyroidNodeFindingsHtmlRow">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="1"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_1" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="11" /></td>    
    <td align="center"><euc:EformDropDownList RecordId="1"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_1"  Runat="server" TabIndex="12" LookupCode="ThyroidPathSite" style="width:100px;" /></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="1"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_1" Runat="server" TabIndex="13" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="1"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_1" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="14" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="1"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_1" Runat="server" TabIndex="15" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="1"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_1" Runat="server" TabIndex="16" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="1"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_1" Runat="server" TabIndex="17" /> </td>
     <td><euc:EformDeleteIcon runat="server" /></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="2"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_2" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="18"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="2"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_2"  Runat="server" TabIndex="19" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="2"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_2" Runat="server" TabIndex="20" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="2"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_2" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="21"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="2"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_2" Runat="server" TabIndex="22" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="2"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_2" Runat="server" TabIndex="23" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="2"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_2" Runat="server" TabIndex="24" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="3"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_3" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="25"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="3"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_3"  Runat="server" TabIndex="26" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="3"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_3" Runat="server" TabIndex="27" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="3"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_3" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="28"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="3"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_3" Runat="server" TabIndex="29"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="3"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_3" Runat="server" TabIndex="30"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="3"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_3" Runat="server" TabIndex="31" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="4"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_4" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="32"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="4"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_4"  Runat="server" TabIndex="33" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="4"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_4" Runat="server" TabIndex="34" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="4"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_4" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="35"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="4"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_4" Runat="server" TabIndex="36"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="4"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_4" Runat="server" TabIndex="37" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="4"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_4" Runat="server" TabIndex="38" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="5"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_5" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="39"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="5"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_5"  Runat="server" TabIndex="40" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="5"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_5" Runat="server" TabIndex="41" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="5"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_5" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="42"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="5"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_5" Runat="server" TabIndex="43"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="5"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_5" Runat="server" TabIndex="44"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="5"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_5" Runat="server" TabIndex="45" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="6"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_6" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="46"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="6"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_6"  Runat="server" TabIndex="47" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="6"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_6" Runat="server" TabIndex="48" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="6"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_6" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="49"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="6"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_6" Runat="server" TabIndex="50"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="6"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_6" Runat="server" TabIndex="51"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="6"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_6" Runat="server" TabIndex="52" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="7"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_7" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="53"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="7"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_7"  Runat="server" TabIndex="54" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="7"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_7" Runat="server" TabIndex="55" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="7"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_7" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="56"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="7"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_7" Runat="server" TabIndex="57"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="7"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_7" Runat="server" TabIndex="58" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="7"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_7" Runat="server" TabIndex="59" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="8"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_8" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="60"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="8"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_8"  Runat="server" TabIndex="61" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="8"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_8" Runat="server" TabIndex="62" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="8"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_8" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="63"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="8"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_8" Runat="server" TabIndex="64" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="8"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_8" Runat="server" TabIndex="65" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="8"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_8" Runat="server" TabIndex="66" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="9"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_9" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="67"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="9"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_9"  Runat="server" TabIndex="68" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="9"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_9" Runat="server" TabIndex="69" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="9"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_9" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="70"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="9"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_9" Runat="server" TabIndex="71" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="9"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_9" Runat="server" TabIndex="72" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="9"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_9" Runat="server" TabIndex="73" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="10"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_10" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="74"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="10"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_10"  Runat="server" TabIndex="75" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="10"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_10" Runat="server" TabIndex="76" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="10"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_10" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="77"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="10"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_10" Runat="server" TabIndex="78" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="10"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_10" Runat="server" TabIndex="79" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="10"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_10" Runat="server" TabIndex="80" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="11"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_11" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="81"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="11"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_11"  Runat="server" TabIndex="82" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="11"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_11" Runat="server" TabIndex="83" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="11"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_11" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="84"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="11"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_11" Runat="server" TabIndex="85" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="11"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_11" Runat="server" TabIndex="86" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="11"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_11" Runat="server" TabIndex="87" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon11" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="12"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_12" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="88"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="12"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_12"  Runat="server" TabIndex="89" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="12"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_12" Runat="server" TabIndex="90" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="12"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_12" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="91"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="12"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_12" Runat="server" TabIndex="92" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="12"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_12" Runat="server" TabIndex="93" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="12"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_12" Runat="server" TabIndex="94" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon12" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="13"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_13" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="95"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="13"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_13"  Runat="server" TabIndex="96" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="13"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_13" Runat="server" TabIndex="97" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="13"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_13" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="98"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="13"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_13" Runat="server" TabIndex="99" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="13"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_13" Runat="server" TabIndex="100" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="13"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_13" Runat="server" TabIndex="101" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon13" runat="server"/></td>
  </tr>
  
  <tr id="ThyroidNodeFindingsHtmlRow" style="DISPLAY: none">
    <td height="28" align="center"><euc:EformDropDownList  RecordId="14"   TABLE="NodePathFinding" FIELD="PathFindSide" ID="PathFindSide_14" Runat="server" LookupCode="NodeSide,Disease,Thyroid" style="width:100px;" TabIndex="102"/></td>    
    <td align="center"><euc:EformDropDownList RecordId="14"  TABLE="NodePathFinding" FIELD="PathFindSite" ID="PathFindSite_14"  Runat="server" TabIndex="103" LookupCode="ThyroidPathSite" style="width:100px;"/></td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="14"  TABLE="NodePathFinding" FIELD="PathFindMaxDim" ID="PathFindMaxDim_14" Runat="server" TabIndex="104" /> </td>
     <td align="center"><euc:EformDropDownList RecordId="14"  TABLE="NodePathFinding" FIELD="PathFindExtension" ID="PathFindExtension_14" Runat="server" LookupCode="YesNoUnknown" style="width:100px;" TabIndex="105"/> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="14"  TABLE="NodePathFinding" FIELD="PathFindPosNodes" ID="PathFindPosNodes_14" Runat="server" TabIndex="106" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="14"  TABLE="NodePathFinding" FIELD="PathFindNumNodes" ID="PathFindNumNodes_14" Runat="server" TabIndex="107" /> </td>
     <td align="center"><euc:EformTextBox Width="75px" RecordId="14"  TABLE="NodePathFinding" FIELD="PathFindMetsFocusMaxDim" ID="PathFindMetsFocusMaxDim_14" Runat="server" TabIndex="108" /> </td>
     <td><euc:EformDeleteIcon ID="EformDeleteIcon14" runat="server"/></td>
  </tr>
  
</table>
<img alt="row" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ThyroidNodeFindingsHtmlTable');" />
</div>

<table>
    <tr id="ThyroidNodeFindingsAbsentRow">
        <td>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentDateText" ID="AbsentDateText_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" TABLE="AbsentEvents" FIELD="AbsentDate" ID="AbsentDate_4"
                Runat="server" Width="1px" Style="display: none;"/>
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="TableName" ID="TableName_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldName" ID="FieldName_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="FieldValue" ID="FieldValue_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentReason" ID="AbsentReason_4"
                runat="server" Width="1px" Style="display: none;" />
            <euc:EformTextBox RecordId="4" Table="AbsentEvents" Field="AbsentQuality" ID="AbsentQuality_4"
                runat="server" Width="1px" Style="display: none;" />
        </td>
    </tr>
</table>