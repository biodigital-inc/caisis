<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.DiagnosticsPedsNeuro" CodeFile="DiagnosticsPedsNeuro.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.PedsNeuroDxTable = "PedsNeuroDxTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="DiagnosticsPedsNeuro" /><span class="controlBoxTitle">Diagnostics</span> <br/>

<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <span class="controlBoxTitle" style="font-size: 12px;">Previous Diagnostics</span><br/>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevPedsNeuroDxTable">
                <tr id="NoPedsNeuroDxMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Diagnostics were recorded for this patient.
                    </td>
                </tr>
                
                <tr runat="server" id="PrevPedsNeuroDxRptHdr">
		            <td  class="controlBoxDataGridTitleColumn">Date</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Side</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Result</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>		            
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
		            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              
              <asp:Repeater ID="PedsNeuroDxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Diagnostics', <%# Eval("DiagnosticId") %>, 'DxDateText,DxDate,DxType,DxSide,DxTarget,DxResult,DxPhysician,DxDisease,DxInstitution,DxNotes,DxQuality', 'Diagnostics');"> 
			            <td class="ClinicalEformPopulatedColumn">&nbsp;<%# Eval("DxDateText")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxType")%></td>			            
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxSide")%></td>			            
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxTarget")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxResult")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxPhysician")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxDisease")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxInstitution").ToString() == "Memorial Sloan Kettering Cancer Center" ? "MSKCC" : Eval("DxInstitution").ToString()%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxNotes")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxQuality")%></td>
			            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
              </table><br /><br />
              
<span class="controlBoxTitle" style="font-size: 12px;">Add new Diagnostics</span><br/>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroDxTable">
  <tr runat="server" id="NeuroDxHdr">
		<td  class="controlBoxDataGridTitleColumn">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Side</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Result</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Physician</td>		            
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Institution</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
		<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="Diagnostics" 
	    FIELD="DxDateText" Runat="server" ID="DxDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_1"/>
    </td>
    <td align="center"><euc:EformSelect RecordId="1" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1" 
        LookupCode="DxType" style="width:80px;" DropDownWidth="200px"/></td>    
    <td align="center"><euc:EformSelect RecordId="1" TABLE="Diagnostics" FIELD="DxSide" Runat="server" ID="DxSide_1" 
        LookupCode="FindSide" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" width="80px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_1" 
        LookupCode="DxTarget" DropDownWidth="300px"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" width="80px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_1" 
        LookupCode="DxResult" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" width="80px" TABLE="Diagnostics" FIELD="DxPhysician" Runat="server" 
        ID="DxPhysician_1" LookupCode="DxPhysician" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" width="80px" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_1" 
        LookupCode="Disease" DropDownWidth="300px"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" width="80px" TABLE="Diagnostics" FIELD="DxInstitution" Runat="server" 
        ID="DxInstitution_1" LookupCode="Institution" DropDownWidth="300px"/></td>
	<td align="center"><euc:EformTextBox RecordId="1" width="80px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_1" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="1" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_1" 
	    LookupCode="DataQuality" Width="60px" /></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="Diagnostics" 
	    FIELD="DxDateText" Runat="server" ID="DxDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_2"/>
    </td>
    <td align="center"><euc:EformSelect RecordId="2" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_2" 
        LookupCode="DxType" style="width:80px;" DropDownWidth="200px"/></td>    
    <td align="center"><euc:EformSelect RecordId="2" TABLE="Diagnostics" FIELD="DxSide" Runat="server" ID="DxSide_2" 
        LookupCode="FindSide" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="2" width="80px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_2" 
        LookupCode="DxTarget" DropDownWidth="300px"/></td>
    <td align="center"><euc:EformComboBox RecordId="2" width="80px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_2" 
        LookupCode="DxResult" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="2" width="80px" TABLE="Diagnostics" FIELD="DxPhysician" Runat="server" 
        ID="DxPhysician_2" LookupCode="DxPhysician" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="2" width="80px" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_2" 
        LookupCode="Disease" DropDownWidth="300px"/></td>
    <td align="center"><euc:EformComboBox RecordId="2" width="80px" TABLE="Diagnostics" FIELD="DxInstitution" Runat="server" 
        ID="DxInstitution_2" LookupCode="Institution" DropDownWidth="300px"/></td>
	<td align="center"><euc:EformTextBox RecordId="2" width="80px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_2" 
	    ShowTextEditor="true" MaxLength="2000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="2" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_2" 
	    LookupCode="DataQuality" Width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="Diagnostics" 
	    FIELD="DxDateText" Runat="server" ID="DxDateText_3"/>
		    <euc:EformHidden RecordId="3" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_3"/>
    </td>
    <td align="center"><euc:EformSelect RecordId="3" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_3" 
        LookupCode="DxType" style="width:80px;" DropDownWidth="200px"/></td>    
    <td align="center"><euc:EformSelect RecordId="3" TABLE="Diagnostics" FIELD="DxSide" Runat="server" ID="DxSide_3" 
        LookupCode="FindSide" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="3" width="80px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_3" 
        LookupCode="DxTarget" DropDownWidth="300px"/></td>
    <td align="center"><euc:EformComboBox RecordId="3" width="80px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_3" 
        LookupCode="DxResult" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="3" width="80px" TABLE="Diagnostics" FIELD="DxPhysician" Runat="server" 
        ID="DxPhysician_3" LookupCode="DxPhysician" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="3" width="80px" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_3" 
        LookupCode="Disease" DropDownWidth="300px"/></td>
    <td align="center"><euc:EformComboBox RecordId="3" width="80px" TABLE="Diagnostics" FIELD="DxInstitution" Runat="server" 
        ID="DxInstitution_3" LookupCode="Institution" DropDownWidth="300px"/></td>
	<td align="center"><euc:EformTextBox RecordId="3" width="80px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_3" 
	    ShowTextEditor="true" MaxLength="3000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="3" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_3" 
	    LookupCode="DataQuality" Width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="Diagnostics" 
	    FIELD="DxDateText" Runat="server" ID="DxDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_4"/>
    </td>
    <td align="center"><euc:EformSelect RecordId="4" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4" 
        LookupCode="DxType" style="width:80px;" DropDownWidth="200px"/></td>    
    <td align="center"><euc:EformSelect RecordId="4" TABLE="Diagnostics" FIELD="DxSide" Runat="server" ID="DxSide_4" 
        LookupCode="FindSide" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="4" width="80px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_4" 
        LookupCode="DxTarget" DropDownWidth="300px"/></td>
    <td align="center"><euc:EformComboBox RecordId="4" width="80px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_4" 
        LookupCode="DxResult" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="4" width="80px" TABLE="Diagnostics" FIELD="DxPhysician" Runat="server" 
        ID="DxPhysician_4" LookupCode="DxPhysician" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="4" width="80px" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_4" 
        LookupCode="Disease" DropDownWidth="300px"/></td>
    <td align="center"><euc:EformComboBox RecordId="4" width="80px" TABLE="Diagnostics" FIELD="DxInstitution" Runat="server" 
        ID="DxInstitution_4" LookupCode="Institution" DropDownWidth="300px"/></td>
	<td align="center"><euc:EformTextBox RecordId="4" width="80px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_4" 
	    ShowTextEditor="true" MaxLength="4000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="4" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_4" 
	    LookupCode="DataQuality" Width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="Diagnostics" 
	    FIELD="DxDateText" Runat="server" ID="DxDateText_5"/>
		    <euc:EformHidden RecordId="5" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_5"/>
    </td>
    <td align="center"><euc:EformSelect RecordId="5" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5" 
        LookupCode="DxType" style="width:80px;" DropDownWidth="200px"/></td>    
    <td align="center"><euc:EformSelect RecordId="5" TABLE="Diagnostics" FIELD="DxSide" Runat="server" ID="DxSide_5" 
        LookupCode="FindSide" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="5" width="80px" TABLE="Diagnostics" FIELD="DxTarget" Runat="server" ID="DxTarget_5" 
        LookupCode="DxTarget" DropDownWidth="300px"/></td>
    <td align="center"><euc:EformComboBox RecordId="5" width="80px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_5" 
        LookupCode="DxResult" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="5" width="80px" TABLE="Diagnostics" FIELD="DxPhysician" Runat="server" 
        ID="DxPhysician_5" LookupCode="DxPhysician" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="5" width="80px" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_5" 
        LookupCode="Disease" DropDownWidth="300px"/></td>
    <td align="center"><euc:EformComboBox RecordId="5" width="80px" TABLE="Diagnostics" FIELD="DxInstitution" Runat="server" 
        ID="DxInstitution_5" LookupCode="Institution" DropDownWidth="300px"/></td>
	<td align="center"><euc:EformTextBox RecordId="5" width="80px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_5" 
	    ShowTextEditor="true" MaxLength="5000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="5" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_5" 
	    LookupCode="DataQuality" Width="60px" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PedsNeuroDxTable');" /><br />
</td></tr></table><br /><br />