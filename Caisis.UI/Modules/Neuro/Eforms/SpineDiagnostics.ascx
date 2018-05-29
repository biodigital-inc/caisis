<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.SpineDiagnostics" CodeFile="SpineDiagnostics.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.SpineDxTable = "SpineDxTable";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SpineDiagnostics" /><span class="controlBoxTitle">Imaging</span> <br/>

<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevSpineDxTable">
                <tr id="NoSpineDxMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="9" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Diagnostics were recorded for this patient.
                    </td>
                </tr>
             </table>
             
             <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 150px; width:850; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="850" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpineDxRptTable"> 
              <asp:Repeater ID="SpineDxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                <HeaderTemplate>
                  <tr runat="server" id="PrevSpineDxRptHdr">
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
	                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Primary<br />Disease</td>
	                <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target<br />Disease</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Result</td>		            
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Impression</td>		            
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">ESCC</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
		            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                 </tr>
                </HeaderTemplate>
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Diagnostics', <%# Eval("DiagnosticId") %>, 'DxPending,DxDateText,DxDate,DxType,DxDisease,DxSite,DxResult,DxStatus,DxSummary,DxNotes,DxQuality', 'Diagnostics');"> 
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxPending").ToString() == "1" ? "Yes" : "No" %></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxDateText")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxType")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxDisease")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxSite")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxResult")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxStatus")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxSummary")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxNotes")%>&nbsp;</td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxQuality")%>&nbsp;</td>
			            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
              </table></div><br /><br />
              
<table width="650" cellpadding="2" cellspacing="0" class="ClinicalEformTable" id="SpineDxTable">
  <tr runat="server" id="SpineDxHdr">
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Primary<br />Disease</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Target<br />Disease</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Result</td>		            
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Impression</td>		            
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">ESCC</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
		<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr style="white-space:nowrap;">
	 <td align="center"><euc:EformCheckBox RecordId="1" TABLE="Diagnostics" FIELD="DxPending" Runat="server" 
	    ID="DxPending_1" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="1" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_1"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="1" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1" LookupCode="DxType,Disease,Spine" style="width:70px;" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_1" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_1" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>            
    <td align="center"><euc:EformDropDownList RecordId="1" style="width:80px;" TABLE="Diagnostics" FIELD="DxResult" Runat="server" 
        ID="DxResult_1" LookupCode="DxResult,Disease,Spine" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformExtendedCheckBoxList RecordId="1" TABLE="Diagnostics" FIELD="DxStatus" Runat="server" 
        ID="DxStatus_1" LookupCode="Impression,Disease,Spine" DropDown="true" RepeatDirection="horizontal" RepeatLayout="Table" 
        RepeatColumns="2"/></td>
    <td align="center"><euc:EformSelect RecordId="1" style="width:50px;" TABLE="Diagnostics" FIELD="DxSummary" Runat="server" 
        ID="DxSummary_1" LookupCode="ESCCGrade" DropDownHeight="auto"/></td>
	<td align="center"><euc:EformTextBox RecordId="1" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_1" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="1" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_1" 
	    LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="2" TABLE="Diagnostics" FIELD="DxPending" Runat="server" 
	    ID="DxPending_2" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="2" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_2"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="2" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_2" LookupCode="DxType,Disease,Spine" style="width:70px;" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="2" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_2" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="2" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_2" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformDropDownList RecordId="2" style="width:80px;" TABLE="Diagnostics" FIELD="DxResult" Runat="server" 
        ID="DxResult_2" LookupCode="DxResult,Disease,Spine" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="2" style="width:80px;" TABLE="Diagnostics" FIELD="DxStatus" Runat="server" 
        ID="DxStatus_2" LookupCode="Impression,Disease,Spine" DropDownWidth="200px"  DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="2" style="width:50px;" TABLE="Diagnostics" FIELD="DxSummary" Runat="server" 
        ID="DxSummary_2" LookupCode="ESCCGrade" DropDownHeight="auto"/></td>
	<td align="center"><euc:EformTextBox RecordId="2" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_2" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="2" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_2" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="3" TABLE="Diagnostics" FIELD="DxPending" Runat="server" 
	    ID="DxPending_3" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="3" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_3"/>
		    <euc:EformHidden RecordId="3" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_3"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="3" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_3" LookupCode="DxType,Disease,Spine" style="width:70px;" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="3" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_3" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="3" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_3" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformDropDownList RecordId="3" style="width:80px;" TABLE="Diagnostics" FIELD="DxResult" Runat="server" 
        ID="DxResult_3" LookupCode="DxResult,Disease,Spine" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="3" style="width:80px;" TABLE="Diagnostics" FIELD="DxStatus" Runat="server" 
        ID="DxStatus_3" LookupCode="Impression,Disease,Spine" DropDownWidth="200px"  DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="3" style="width:50px;" TABLE="Diagnostics" FIELD="DxSummary" Runat="server" 
        ID="DxSummary_3" LookupCode="ESCCGrade" DropDownHeight="auto"/></td>
	<td align="center"><euc:EformTextBox RecordId="3" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_3" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="3" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_3" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="4" TABLE="Diagnostics" FIELD="DxPending" Runat="server" 
	    ID="DxPending_4" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="4" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_4"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="4" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4" LookupCode="DxType,Disease,Spine" style="width:70px;" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="4" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_4" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="4" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_4" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformDropDownList RecordId="4" style="width:80px;" TABLE="Diagnostics" FIELD="DxResult" Runat="server" 
        ID="DxResult_4" LookupCode="DxResult,Disease,Spine" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="4" style="width:80px;" TABLE="Diagnostics" FIELD="DxStatus" Runat="server" 
        ID="DxStatus_4" LookupCode="Impression,Disease,Spine" DropDownWidth="200px"  DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="4" style="width:50px;" TABLE="Diagnostics" FIELD="DxSummary" Runat="server" 
        ID="DxSummary_4" LookupCode="ESCCGrade" DropDownHeight="auto"/></td>
	<td align="center"><euc:EformTextBox RecordId="4" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_4" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="4" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_4" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="5" TABLE="Diagnostics" FIELD="DxPending" Runat="server" ID="DxPending_5" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="5" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_5"/>
		    <euc:EformHidden RecordId="5" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_5"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="5" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5" LookupCode="DxType,Disease,Spine" style="width:70px;" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="5" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_5" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="5" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_5" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformDropDownList RecordId="5" style="width:80px;" TABLE="Diagnostics" FIELD="DxResult" Runat="server" 
        ID="DxResult_5" LookupCode="DxResult,Disease,Spine" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="5" style="width:80px;" TABLE="Diagnostics" FIELD="DxStatus" Runat="server" 
        ID="DxStatus_5" LookupCode="Impression,Disease,Spine" DropDownWidth="200px"  DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="5" style="width:50px;" TABLE="Diagnostics" FIELD="DxSummary" Runat="server" 
        ID="DxSummary_5" LookupCode="ESCCGrade" DropDownHeight="auto"/></td>
	<td align="center"><euc:EformTextBox RecordId="5" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_5" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="5" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_5" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>

  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="6" TABLE="Diagnostics" FIELD="DxPending" Runat="server" ID="DxPending_6" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="6" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_6"/>
		    <euc:EformHidden RecordId="6" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_6"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="6" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_6" LookupCode="DxType,Disease,Spine" style="width:70px;" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="6" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_6" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="6" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_6" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformDropDownList RecordId="6" style="width:80px;" TABLE="Diagnostics" FIELD="DxResult" Runat="server" 
        ID="DxResult_6" LookupCode="DxResult,Disease,Spine" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="6" style="width:80px;" TABLE="Diagnostics" FIELD="DxStatus" Runat="server" 
        ID="DxStatus_6" LookupCode="Impression,Disease,Spine" DropDownWidth="200px"  DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="6" style="width:50px;" TABLE="Diagnostics" FIELD="DxSummary" Runat="server" 
        ID="DxSummary_6" LookupCode="ESCCGrade" DropDownHeight="auto"/></td>
	<td align="center"><euc:EformTextBox RecordId="6" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_6" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="6" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_6" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>

  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="7" TABLE="Diagnostics" FIELD="DxPending" Runat="server" ID="DxPending_7" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="7" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_7"/>
		    <euc:EformHidden RecordId="7" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_7"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="7" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_7" LookupCode="DxType,Disease,Spine" style="width:70px;" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="7" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_7" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="7" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_7" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformDropDownList RecordId="7" style="width:80px;" TABLE="Diagnostics" FIELD="DxResult" Runat="server" 
        ID="DxResult_7" LookupCode="DxResult,Disease,Spine" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="7" style="width:80px;" TABLE="Diagnostics" FIELD="DxStatus" Runat="server" 
        ID="DxStatus_7" LookupCode="Impression,Disease,Spine" DropDownWidth="200px"  DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="7" style="width:50px;" TABLE="Diagnostics" FIELD="DxSummary" Runat="server" 
        ID="DxSummary_7" LookupCode="ESCCGrade" DropDownHeight="auto"/></td>
	<td align="center"><euc:EformTextBox RecordId="7" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_7" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="7" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_7" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>

  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="8" TABLE="Diagnostics" FIELD="DxPending" Runat="server" ID="DxPending_8" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="8" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_8"/>
		    <euc:EformHidden RecordId="8" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_8"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="8" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_8" LookupCode="DxType,Disease,Spine" style="width:70px;" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="8" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_8" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="8" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_8" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformDropDownList RecordId="8" style="width:80px;" TABLE="Diagnostics" FIELD="DxResult" Runat="server" 
        ID="DxResult_8" LookupCode="DxResult,Disease,Spine" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="8" style="width:80px;" TABLE="Diagnostics" FIELD="DxStatus" Runat="server" 
        ID="DxStatus_8" LookupCode="Impression,Disease,Spine" DropDownWidth="200px"  DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="8" style="width:50px;" TABLE="Diagnostics" FIELD="DxSummary" Runat="server" 
        ID="DxSummary_8" LookupCode="ESCCGrade" DropDownHeight="auto"/></td>
	<td align="center"><euc:EformTextBox RecordId="8" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_8" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="8" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_8" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>

  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="9" TABLE="Diagnostics" FIELD="DxPending" Runat="server" ID="DxPending_9" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="9" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_9"/>
		    <euc:EformHidden RecordId="9" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_9"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="9" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_9" LookupCode="DxType,Disease,Spine" style="width:70px;" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="9" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_9" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="9" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_9" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformDropDownList RecordId="9" style="width:80px;" TABLE="Diagnostics" FIELD="DxResult" Runat="server" 
        ID="DxResult_9" LookupCode="DxResult,Disease,Spine" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="9" style="width:80px;" TABLE="Diagnostics" FIELD="DxStatus" Runat="server" 
        ID="DxStatus_9" LookupCode="Impression,Disease,Spine" DropDownWidth="200px"  DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="9" style="width:50px;" TABLE="Diagnostics" FIELD="DxSummary" Runat="server" 
        ID="DxSummary_9" LookupCode="ESCCGrade" DropDownHeight="auto"/></td>
	<td align="center"><euc:EformTextBox RecordId="9" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_9" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="9" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_9" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>

  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="10" TABLE="Diagnostics" FIELD="DxPending" Runat="server" ID="DxPending_10" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:70px;" RecordId="10" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_10"/>
		    <euc:EformHidden RecordId="10" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_10"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="10" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_10" LookupCode="DxType,Disease,Spine" style="width:70px;" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformComboBox RecordId="10" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_10" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="10" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_10" 
                LookupCode="Disease,Disease,Spine" style="width:70px;"/></td>
    <td align="center"><euc:EformDropDownList RecordId="10" style="width:80px;" TABLE="Diagnostics" FIELD="DxResult" Runat="server" 
        ID="DxResult_10" LookupCode="DxResult,Disease,Spine" DropDownWidth="200px"/></td>
    <td align="center"><euc:EformSelect RecordId="10" style="width:80px;" TABLE="Diagnostics" FIELD="DxStatus" Runat="server" 
        ID="DxStatus_10" LookupCode="Impression,Disease,Spine" DropDownWidth="200px"  DropDownHeight="auto"/></td>
    <td align="center"><euc:EformSelect RecordId="10" style="width:50px;" TABLE="Diagnostics" FIELD="DxSummary" Runat="server" 
        ID="DxSummary_10" LookupCode="ESCCGrade" DropDownHeight="auto"/></td>
	<td align="center"><euc:EformTextBox RecordId="10" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_10" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="10" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_10" 
	    LookupCode="DataQuality"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SpineDxTable');" /><br />
</td></tr></table><br /><br />