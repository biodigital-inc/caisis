<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.FUStatusThoracic" CodeFile="FUStatusThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.FUStatusTbl = "FUStatusTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="FUStatusThoracic" />
<span class="controlBoxTitle">Complications</span> <br/>
<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="FUToxTbl">
    <tr id="NoToxMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" visible="false" > 
			<td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40"> 
			    No Complications have been recorded for this patient.</td>
    </tr>
  <tr id="FUToxicityRptHdr" runat="server">
		<td  class="controlBoxDataGridTitleColumn">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Complication</td>
  </tr>
  
  <asp:Repeater ID="FUToxicityRpt" runat="server"> 
	<ItemTemplate> 
		<tr> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "ToxDateText")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ToxName")%>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
</table><br /><br />

<span class="controlBoxTitle">Status</span> <br/>
<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="FUStatusTbl">
  <tr>
		<td  class="controlBoxDataGridTitleColumn">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
		<td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
  </tr>
  
  <asp:Repeater ID="FUStatusRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# DataBinder.Eval(Container.DataItem, "StatusId") %>, 'StatusDateText,StatusDate,Status,StatusDisease,StatusNotes', 'Status');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusDateText")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Status")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "StatusDisease")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "StatusNotes")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr>
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="6" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_6"/>
		    <euc:EformHidden RecordId="6" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_6"/>
	</td>
    <td align="center"><euc:EformDropDownList RecordId="6" TABLE="Status" FIELD="Status" Runat="server" ID="Status_6" 
        LookupCode="Status,Disease,Thoracic" /></td>
    <td align="center"><euc:EformTextBox RecordId="6" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_6" Width="100px" 
        ReadOnly="true"/></td>
    <td align="center">
        <euc:EformTextBox RecordId="6" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_6" Width="100px" ShowTextEditor="true"/>
        <euc:EformTextBox RecordId="6" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_6"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="7" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_7"/>
		    <euc:EformHidden RecordId="7" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_7"/>
	</td>
    <td align="center"><euc:EformDropDownList RecordId="7" TABLE="Status" FIELD="Status" Runat="server" ID="Status_7" 
        LookupCode="Status,Disease,Thoracic" /></td>
    <td align="center"><euc:EformTextBox RecordId="7" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_7" Width="100px" 
        ReadOnly="true"/></td>
    <td align="center">
        <euc:EformTextBox RecordId="7" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_7" Width="100px" ShowTextEditor="true"/>
        <euc:EformTextBox RecordId="7" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_7"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="8" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_8"/>
		    <euc:EformHidden RecordId="8" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_8"/>
	</td>
    <td align="center"><euc:EformDropDownList RecordId="8" TABLE="Status" FIELD="Status" Runat="server" ID="Status_8" 
        LookupCode="Status,Disease,Thoracic" /></td>
    <td align="center"><euc:EformTextBox RecordId="8" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_8" Width="100px" 
        ReadOnly="true"/></td>
    <td align="center">
        <euc:EformTextBox RecordId="8" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_8" Width="100px" ShowTextEditor="true"/>
        <euc:EformTextBox RecordId="8" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_8"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="9" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_9"/>
		    <euc:EformHidden RecordId="9" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_9"/>
	</td>
    <td align="center"><euc:EformDropDownList RecordId="9" TABLE="Status" FIELD="Status" Runat="server" ID="Status_9" 
        LookupCode="Status,Disease,Thoracic" /></td>
    <td align="center"><euc:EformTextBox RecordId="9" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_9" Width="100px" 
        ReadOnly="true"/></td>
    <td align="center">
        <euc:EformTextBox RecordId="9" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_9" Width="100px" ShowTextEditor="true"/>
        <euc:EformTextBox RecordId="9" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_9"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="10" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_10"/>
		    <euc:EformHidden RecordId="10" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_10"/>
	</td>
    <td align="center"><euc:EformDropDownList RecordId="10" TABLE="Status" FIELD="Status" Runat="server" ID="Status_10" 
        LookupCode="Status,Disease,Thoracic" /></td>
    <td align="center"><euc:EformTextBox RecordId="10" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_10" Width="100px" 
        ReadOnly="true"/></td>
    <td align="center">
        <euc:EformTextBox RecordId="10" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_10" Width="100px" ShowTextEditor="true"/>
        <euc:EformTextBox RecordId="10" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_10"/>
    </td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'FUStatusTbl');" /><br /><br /><br />

<script type="text/javascript">
    //Adds events to controls
    function addFUStatusEvents(stDate,stType,stDis,stQlty)
    { 
        $(stDate).addEvent('blur',curry(FUStatusPopulates,stDate,stType,stDis,stQlty));
        $(stType).addEvent('blur',curry(FUStatusPopulates,stDate,stType,stDis,stQlty));
    }
 
    addFUStatusEvents($('<%= StatusDateText_6.ClientID %>'),$('<%= Status_6.ClientID %>'),$('<%= StatusDisease_6.ClientID %>'),$('<%= StatusQuality_6.ClientID %>'));
    addFUStatusEvents($('<%= StatusDateText_7.ClientID %>'),$('<%= Status_7.ClientID %>'),$('<%= StatusDisease_7.ClientID %>'),$('<%= StatusQuality_7.ClientID %>'));
    addFUStatusEvents($('<%= StatusDateText_8.ClientID %>'),$('<%= Status_8.ClientID %>'),$('<%= StatusDisease_8.ClientID %>'),$('<%= StatusQuality_8.ClientID %>'));
    addFUStatusEvents($('<%= StatusDateText_9.ClientID %>'),$('<%= Status_9.ClientID %>'),$('<%= StatusDisease_9.ClientID %>'),$('<%= StatusQuality_9.ClientID %>'));
    addFUStatusEvents($('<%= StatusDateText_10.ClientID %>'),$('<%= Status_10.ClientID %>'),$('<%= StatusDisease_10.ClientID %>'),$('<%= StatusQuality_10.ClientID %>'));


    function FUStatusPopulates(stDate,stType,stDis,stQlty)
    {
       if (stDate.value != '' || stType.value != '')
        {
           stDis.value = 'Lung Cancer'; 
           stQlty.value = 'STD';
        }
        else
        {
            stDis.value = '';
            stQlty.value = '';
        }
    }
</script>