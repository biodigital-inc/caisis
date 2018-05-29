<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Thoracic.Eforms.StatusThoracic" CodeFile="StatusThoracic.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.ThoracicActionsTbl = "ThoracicActionsTbl";
    tableArray.ThoracicStatusTbl = "ThoracicStatusTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="StatusThoracic" /><span class="controlBoxTitle">Action Items</span> <br/>

<table width="400" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ThoracicActionsTbl">
  <tr>
    <td  class="controlBoxDataGridTitleColumn">Pending</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Action Item</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
	<td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
  </tr>
  
  <tr>
    <td><euc:EformCheckBox RecordId="1" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_1" Value="1" /></td>
    <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="1" TABLE="Actions" FIELD="ActionDateText" 
	    Runat="server" ID="ActionDateText_1"/>
		    <euc:EformHidden RecordId="1" TABLE="Actions" FIELD="ActionDate" Runat="server" ID="ActionDate_1"/></td>
    <td align="center"><euc:EformDropDownList RecordId="1" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_1" 
        LookupCode="ActionItem,Disease,Thoracic" /></td>
    <td align="center"><euc:EformTextBox RecordId="1" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_1" Width="125px" 
        ShowTextEditor="true"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformCheckBox RecordId="2" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_2" Value="1" /></td>
    <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="2" TABLE="Actions" FIELD="ActionDateText" 
	    Runat="server" ID="ActionDateText_2"/>
		    <euc:EformHidden RecordId="2" TABLE="Actions" FIELD="ActionDate" Runat="server" ID="ActionDate_2"/></td>
    <td align="center"><euc:EformDropDownList RecordId="2" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_2" 
        LookupCode="ActionItem,Disease,Thoracic" /></td>
    <td align="center"><euc:EformTextBox RecordId="2" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_2" Width="125px" 
        ShowTextEditor="true"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformCheckBox RecordId="3" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_3" Value="1" /></td>
    <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="3" TABLE="Actions" FIELD="ActionDateText" 
	    Runat="server" ID="ActionDateText_3"/>
		    <euc:EformHidden RecordId="3" TABLE="Actions" FIELD="ActionDate" Runat="server" ID="ActionDate_3"/></td>
    <td align="center"><euc:EformDropDownList RecordId="3" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_3" 
        LookupCode="ActionItem,Disease,Thoracic" /></td>
    <td align="center"><euc:EformTextBox RecordId="3" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_3" Width="125px" 
        ShowTextEditor="true"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformCheckBox RecordId="4" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_4" Value="1" /></td>
    <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="4" TABLE="Actions" FIELD="ActionDateText" 
	    Runat="server" ID="ActionDateText_4"/>
		    <euc:EformHidden RecordId="4" TABLE="Actions" FIELD="ActionDate" Runat="server" ID="ActionDate_4"/></td>
    <td align="center"><euc:EformDropDownList RecordId="4" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_4" 
        LookupCode="ActionItem,Disease,Thoracic" /></td>
    <td align="center"><euc:EformTextBox RecordId="4" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_4" Width="125px" 
        ShowTextEditor="true"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none;">
    <td><euc:EformCheckBox RecordId="5" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_5" Value="1" /></td>
    <td align="center"><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="5" TABLE="Actions" FIELD="ActionDateText" 
	    Runat="server" ID="ActionDateText_5"/>
		    <euc:EformHidden RecordId="5" TABLE="Actions" FIELD="ActionDate" Runat="server" ID="ActionDate_5"/></td>
    <td align="center"><euc:EformDropDownList RecordId="5" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_5" 
        LookupCode="ActionItem,Disease,Thoracic" /></td>
    <td align="center"><euc:EformTextBox RecordId="5" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_5" Width="125px" 
        ShowTextEditor="true"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ThoracicActionsTbl');" /><br /><br /><br />

<span class="controlBoxTitle">Status</span> <br/>
<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="ThoracicStatusTbl">
  <tr>
		<td  class="controlBoxDataGridTitleColumn">Date</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
		<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
		<td  class="controlBoxDataGridTitleColumn">&nbsp;</td>
  </tr>
  
  <tr>
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="11" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_11"/>
		    <euc:EformHidden RecordId="11" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_11"/>
	</td>
    <td align="center"><euc:EformDropDownList RecordId="11" TABLE="Status" FIELD="Status" Runat="server" ID="Status_11" 
        LookupCode="Status,Disease,Thoracic" /></td>
    <td align="center">
        <euc:EformTextBox RecordId="11" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_11" Width="125px" ReadOnly="true"/>
        <euc:EformTextBox RecordId="11" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" 
            ID="StatusQuality_11"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="12" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_12"/>
		    <euc:EformHidden RecordId="12" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_12"/>
	</td>
    <td align="center"><euc:EformDropDownList RecordId="12" TABLE="Status" FIELD="Status" Runat="server" ID="Status_12" 
        LookupCode="Status,Disease,Thoracic" /></td>
    <td align="center">
        <euc:EformTextBox RecordId="12" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_12" Width="125px" ReadOnly="true"/>
        <euc:EformTextBox RecordId="12" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" 
            ID="StatusQuality_12"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="13" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_13"/>
		    <euc:EformHidden RecordId="13" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_13"/>
	</td>
    <td align="center"><euc:EformDropDownList RecordId="13" TABLE="Status" FIELD="Status" Runat="server" ID="Status_13" 
        LookupCode="Status,Disease,Thoracic" /></td>
    <td align="center">
        <euc:EformTextBox RecordId="13" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_13" Width="125px" ReadOnly="true"/>
        <euc:EformTextBox RecordId="13" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" 
            ID="StatusQuality_13"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="14" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_14"/>
		    <euc:EformHidden RecordId="14" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_14"/>
	</td>
    <td align="center"><euc:EformDropDownList RecordId="14" TABLE="Status" FIELD="Status" Runat="server" ID="Status_14" 
        LookupCode="Status,Disease,Thoracic" /></td>
    <td align="center">
        <euc:EformTextBox RecordId="14" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_14" Width="125px" ReadOnly="true"/>
        <euc:EformTextBox RecordId="14" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" 
            ID="StatusQuality_14"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  <tr style="display:none;">
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="15" TABLE="Status" FIELD="StatusDateText" 
	    Runat="server" ID="StatusDateText_15"/>
		    <euc:EformHidden RecordId="15" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_15"/>
	</td>
    <td align="center"><euc:EformDropDownList RecordId="15" TABLE="Status" FIELD="Status" Runat="server" ID="Status_15" 
        LookupCode="Status,Disease,Thoracic" /></td>
    <td align="center">
        <euc:EformTextBox RecordId="15" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_15" Width="125px" ReadOnly="true"/>
        <euc:EformTextBox RecordId="15" style="width:1px;display:none" TABLE="Status" FIELD="StatusQuality" Runat="server" 
            ID="StatusQuality_15"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'ThoracicStatusTbl');" /><br /><br /><br />


<span class="controlBoxTitle">Vital Status</span>
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="VitalStatusTable">
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Death Type</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" colspan="2">Death Cause</td>
  </tr>
  
  <asp:Repeater ID="DeathStatusRpt" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtDeathDateText,PtDeathDate,PtDeathType,PtDeathCause','VitalStatusTable');">
		   <td class="ClinicalEformPopulatedColumn" style="text-align: left;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathDateText")%></td>
		   <td class="ClinicalEformPopulatedColumn" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathType")%></td>
		   <td class="ClinicalEformPopulatedColumn" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathCause")%></td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
</table>


<script type="text/javascript">
    //Adds events to controls
    function addStatusEvents(stDate,stType,stDis,stQlty)
    { 
        $(stDate).addEvent('blur',curry(StatusAutoPopulates,stDate,stType,stDis,stQlty));
        $(stType).addEvent('blur',curry(StatusAutoPopulates,stDate,stType,stDis,stQlty));
    }
 
    addStatusEvents($('<%= StatusDateText_11.ClientID %>'),$('<%= Status_11.ClientID %>'),$('<%= StatusDisease_11.ClientID %>'),$('<%= StatusQuality_11.ClientID %>'));
    addStatusEvents($('<%= StatusDateText_12.ClientID %>'),$('<%= Status_12.ClientID %>'),$('<%= StatusDisease_12.ClientID %>'),$('<%= StatusQuality_12.ClientID %>'));
    addStatusEvents($('<%= StatusDateText_13.ClientID %>'),$('<%= Status_13.ClientID %>'),$('<%= StatusDisease_13.ClientID %>'),$('<%= StatusQuality_13.ClientID %>'));
    addStatusEvents($('<%= StatusDateText_14.ClientID %>'),$('<%= Status_14.ClientID %>'),$('<%= StatusDisease_14.ClientID %>'),$('<%= StatusQuality_14.ClientID %>'));
    addStatusEvents($('<%= StatusDateText_15.ClientID %>'),$('<%= Status_15.ClientID %>'),$('<%= StatusDisease_15.ClientID %>'),$('<%= StatusQuality_15.ClientID %>'));


    function StatusAutoPopulates(stDate,stType,stDis,stQlty)
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