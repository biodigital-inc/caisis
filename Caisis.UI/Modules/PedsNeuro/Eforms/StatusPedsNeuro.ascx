<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.StatusPedsNeuro" CodeFile="StatusPedsNeuro.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
	tableArray.PedsNeuroStatusTbl = "PedsNeuroStatusTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="StatusPedsNeuro" /><span class="controlBoxTitle">Status</span> <br/>

<table border="0" cellspacing="0" cellpadding="16" width="500" class="eformXLargePopulatedTable">
    <tr >
        <td>
            <span class="controlBoxTitle" style="font-size: 12px;">Previous Statuses</span><br/>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevPedsNeuroStatusTbl">
                <tr id="NoPedsNeuroStatusMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Statuses were recorded for this patient.
                    </td>
                </tr>
                
                <tr runat="server" id="PrevPedsNeuroStRptHdr">
		            <td  class="controlBoxDataGridTitleColumn">Date</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		            <td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
		            <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
              </tr>
              <asp:Repeater ID="PedsNeuroStatusRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	            <ItemTemplate> 
		            <tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# Eval("StatusId") %>, 'StatusDateText,StatusDate,StatusDisease,Status,StatusNotes,StatusQuality', 'Status');"> 
			            <td class="ClinicalEformPopulatedColumn"><%# Eval("StatusDateText")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("Status")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("StatusDisease")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("StatusNotes")%></td>
			            <td align="center" class="ClinicalEformPopulatedColumn"><%# Eval("StatusQuality")%></td>
			            <td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/></td>
		            </tr>      
	            </ItemTemplate>
              </asp:Repeater>
              </table><br /><br />
            
            <span class="controlBoxTitle" style="font-size: 12px;">Add new Status</span><br/>
            <table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PedsNeuroStatusTbl">
  <tr runat="server" id="NeuroDiagnosisHdr">
		<td  class="controlBoxDataGridTitleColumn">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Quality</td>
		<td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  
  <tr>
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_1"/>
	</td>
    <td><euc:EformDropDownList RecordId="1" TABLE="Status" FIELD="Status" Runat="server" ID="Status_1" LookupCode="Status"/></td>
    <td><euc:EformSelect RecordId="1" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_1" style="width:70px;" 
        LookupCode="Disease"/></td>
	<td><euc:EformTextBox RecordId="1" style="width:100px;" ShowTextEditor="true" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_1"/></td>
	<td><euc:EformDropDownList RecordId="1" style="width:80px;" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_1" LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_2"/>
	</td>
    <td><euc:EformDropDownList RecordId="2" TABLE="Status" FIELD="Status" Runat="server" ID="Status_2" LookupCode="Status"/></td>
    <td><euc:EformSelect RecordId="2" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_2" style="width:70px;" 
        LookupCode="Disease"/></td>
	<td><euc:EformTextBox RecordId="2" style="width:100px;" ShowTextEditor="true" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_2"/></td>
	<td><euc:EformDropDownList RecordId="2" style="width:80px;" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_2" LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_3"/>
		    <euc:EformHidden RecordId="3" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_3"/>
	</td>
    <td><euc:EformDropDownList RecordId="3" TABLE="Status" FIELD="Status" Runat="server" ID="Status_3" LookupCode="Status"/></td>
    <td><euc:EformSelect RecordId="3" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_3" style="width:70px;" 
        LookupCode="Disease"/></td>
	<td><euc:EformTextBox RecordId="3" style="width:100px;" ShowTextEditor="true" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_3"/></td>
	<td><euc:EformDropDownList RecordId="3" style="width:80px;" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_3" LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_4"/>
	</td>
    <td><euc:EformDropDownList RecordId="4" TABLE="Status" FIELD="Status" Runat="server" ID="Status_4" LookupCode="Status"/></td>
    <td><euc:EformSelect RecordId="4" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_4" style="width:70px;" 
        LookupCode="Disease"/></td>
	<td><euc:EformTextBox RecordId="4" style="width:100px;" ShowTextEditor="true" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_4"/></td>
	<td><euc:EformDropDownList RecordId="4" style="width:80px;" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_4" LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="DISPLAY: none">
    <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_5"/>
		    <euc:EformHidden RecordId="5" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_5"/>
	</td>
    <td><euc:EformDropDownList RecordId="5" TABLE="Status" FIELD="Status" Runat="server" ID="Status_5" LookupCode="Status"/></td>
    <td><euc:EformSelect RecordId="5" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_5" style="width:70px;" 
        LookupCode="Disease"/></td>
	<td><euc:EformTextBox RecordId="5" style="width:100px;" ShowTextEditor="true" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_5"/></td>
	<td><euc:EformDropDownList RecordId="5" style="width:80px;" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_5" LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'PedsNeuroStatusTbl');" /><br />
    </td>
   </tr>
</table><br /><br />