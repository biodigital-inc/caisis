<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.DiagnosticsNeuro" CodeFile="DiagnosticsNeuro.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.NeuroDxTable = "NeuroDxTable";
    tableArray.NeuroActionsTbl = "NeuroActionsTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="DiagnosticsNeuro" /><span class="controlBoxTitle">Diagnostics</span> <br/>

<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevNeuroDxTable">
                <tr id="NoNeuroDxMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="9" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Diagnostics were recorded for this patient.
                    </td>
                </tr>
            </table>
            
            <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 150px; width:810; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="800" cellpadding="1" cellspacing="0" class="ClinicalEformTable" id="NeuroDxRptTable">  
              <asp:Repeater ID="NeuroDxRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                <HeaderTemplate>
                  <tr runat="server" id="PrevNeuroDxRptHdr">
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Primary<br />Disease</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Targeted<br />Site</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Result</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data<br />Qlty</td>
		            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                  </tr>
                </HeaderTemplate>
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Diagnostics', <%# Eval("DiagnosticId") %>, 'DxPending,DxDateText,DxDate,DxType,DxDisease,DxResult,DxNotes,DxQuality', 'Diagnostics');"> 
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxPending").ToString() == "1" ? "Yes" : "No" %></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxDateText")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxType")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxDisease")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxSite")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxResult")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxNotes")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("DxQuality")%></td>
			            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
              </table></div><br /><br />
              
<table width="650" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="NeuroDxTable">
  <tr runat="server" id="NeuroDxHdr">
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Type</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Primary<br />Disease</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Targeted<br />Site</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Result</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data<br />Qlty</td>
		<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr>
	 <td align="center"><euc:EformCheckBox RecordId="1" TABLE="Diagnostics" FIELD="DxPending" Runat="server" 
	    ID="DxPending_1" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_1"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="1" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_1" LookupCode="DxType"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_1" 
                LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_1" 
                LookupCode="DxTarget" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="1" width="100px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_1" 
        LookupCode="DxResult,Disease,Neuro" DropDownWidth="200px"/></td>
	<td align="center"><euc:EformTextBox RecordId="1" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_1" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="1" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_1" 
	    LookupCode="DataQuality" /></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="2" TABLE="Diagnostics" FIELD="DxPending" Runat="server" 
	    ID="DxPending_2" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_2"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="2" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_2" LookupCode="DxType"/></td>
    <td align="center"><euc:EformComboBox RecordId="2" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_2" 
                LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="2" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_2" 
                LookupCode="DxTarget" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="2" width="100px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_2" 
        LookupCode="DxResult,Disease,Neuro" DropDownWidth="200px"/></td>
	<td align="center"><euc:EformTextBox RecordId="2" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_2" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="2" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_2" 
	    LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="3" TABLE="Diagnostics" FIELD="DxPending" Runat="server" 
	    ID="DxPending_3" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_3"/>
		    <euc:EformHidden RecordId="3" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_3"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="3" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_3" LookupCode="DxType"/></td>
    <td align="center"><euc:EformComboBox RecordId="3" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_3" 
                LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="3" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_3" 
                LookupCode="DxTarget" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="3" width="100px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_3" 
        LookupCode="DxResult,Disease,Neuro" DropDownWidth="200px"/></td>
	<td align="center"><euc:EformTextBox RecordId="3" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_3" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="3" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_3" 
	    LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="4" TABLE="Diagnostics" FIELD="DxPending" Runat="server" 
	    ID="DxPending_4" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_4"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="4" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_4" LookupCode="DxType"/></td>
    <td align="center"><euc:EformComboBox RecordId="4" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_4" 
                LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="4" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_4" 
                LookupCode="DxTarget" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="4" width="100px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_4" 
        LookupCode="DxResult,Disease,Neuro" DropDownWidth="200px"/></td>
	<td align="center"><euc:EformTextBox RecordId="4" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_4" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="4" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_4" 
	    LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
	 <td align="center"><euc:EformCheckBox RecordId="5" TABLE="Diagnostics" FIELD="DxPending" Runat="server" 
	    ID="DxPending_5" Value="1" /></td>
	 <td align="left"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="Diagnostics" FIELD="DxDateText" 
	    Runat="server" ID="DxDateText_5"/>
		    <euc:EformHidden RecordId="5" TABLE="Diagnostics" FIELD="DxDate" Runat="server" ID="DxDate_5"/>
    </td>
    <td align="center"><euc:EformDropDownList RecordId="5" TABLE="Diagnostics" FIELD="DxType" Runat="server" ID="DxType_5" LookupCode="DxType"/></td>
    <td align="center"><euc:EformComboBox RecordId="5" TABLE="Diagnostics" FIELD="DxDisease" Runat="server" ID="DxDisease_5" 
                LookupCode="Disease,Disease,Neuro" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="5" TABLE="Diagnostics" FIELD="DxSite" Runat="server" ID="DxSite_5" 
                LookupCode="DxTarget" style="width:70px;"/></td>
    <td align="center"><euc:EformComboBox RecordId="5" width="100px" TABLE="Diagnostics" FIELD="DxResult" Runat="server" ID="DxResult_5" 
        LookupCode="DxResult,Disease,Neuro" DropDownWidth="200px"/></td>
	<td align="center"><euc:EformTextBox RecordId="5" width="70px" TABLE="Diagnostics" FIELD="DxNotes" Runat="server" ID="DxNotes_5" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
	<td align="center"><euc:EformDropDownList RecordId="5" TABLE="Diagnostics" FIELD="DxQuality" Runat="server" ID="DxQuality_5" 
	    LookupCode="DataQuality" /></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'NeuroDxTable');" /><br />
</td></tr></table><br /><br />


<span class="controlBoxTitle">Actions</span> <br/>
<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevNeuroActionsTable">
                <tr id="NoNeuroActionsMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" 
                    style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Actions were recorded for this patient.
                    </td>
                </tr>
            </table>
            
            <div id="ActionsPDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 150px; width:560; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="550" cellpadding="1" cellspacing="0" class="ClinicalEformTable" id="NeuroActionsRptTable"> 
                  <asp:Repeater ID="NeuroActionsRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                    <HeaderTemplate>
                        <tr runat="server" id="PrevNeuroActionsRptHdr">
	                        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
	                        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
	                        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Action Item</td>
	                        <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
	                        <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
                        </tr>
                    </HeaderTemplate>
	                <ItemTemplate> 
		                <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Actions', <%# Eval("ActionId") %>, 'ActionPending,ActionDateText,ActionDate,ActionItem,ActionNotes', 'Actions');"> 
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ActionPending").ToString() == "1" ? "Yes" : "No"%></td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ActionDateText")%></td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ActionItem")%></td>
			                <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("ActionNotes")%></td>
			                <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		                </tr>      
	                </ItemTemplate>
                  </asp:Repeater>
                  </table></div><br /><br />

<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="NeuroActionsTbl">
  <tr runat="server" id="NeuroActionsHdr">
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Pending</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Action Item</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
	<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr>
    <td><euc:EformCheckBox RecordId="1" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_1" Value="1" /></td>
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="1" ID="ActionDateText_1" TABLE="Actions" FIELD="ActionDateText" ShowCalendar="True" 
            CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="1" Table="Actions" Field="ActionDate" Runat="server" ID="ActionDate_1" />
    </td>
    <td align="center"><euc:EformComboBox RecordId="1" width="150px" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_1" 
        LookupCode="ActionItem"/></td>
    <td align="center"><euc:EformTextBox RecordId="1" width="100px" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_1" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformCheckBox RecordId="2" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_2" Value="1" /></td>
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="2" ID="ActionDateText_2" TABLE="Actions" FIELD="ActionDateText" ShowCalendar="True" 
            CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="2" Table="Actions" Field="ActionDate" Runat="server" ID="ActionDate_2" />
    </td>
    <td align="center"><euc:EformComboBox RecordId="2" width="150px" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_2" 
        LookupCode="ActionItem"/></td>
    <td align="center"><euc:EformTextBox RecordId="2" width="100px" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_2" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformCheckBox RecordId="3" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_3" Value="1" /></td>
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="3" ID="ActionDateText_3" TABLE="Actions" FIELD="ActionDateText" ShowCalendar="True" 
            CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="3" Table="Actions" Field="ActionDate" Runat="server" ID="ActionDate_3" />
    </td>
    <td align="center"><euc:EformComboBox RecordId="3" width="150px" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_3" 
        LookupCode="ActionItem"/></td>
    <td align="center"><euc:EformTextBox RecordId="3" width="100px" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_3" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'NeuroActionsTbl');" /><br />
</td></tr></table><br /><br />