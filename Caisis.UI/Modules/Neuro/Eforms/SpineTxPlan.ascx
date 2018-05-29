<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Neuro.Eforms.SpineTxPlan" CodeFile="SpineTxPlan.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    tableArray.SpineActionsTbl = "SpineActionsTbl";
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="SpineTxPlan" />
<span class="controlBoxTitle">Assessment</span><br />
<table border="0" width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
    <tr>
        <td class="controlBoxDataGridTitleColumn" style="text-align: center;">Clinic Date</td>
        <td class="controlBoxDataGridTitleColumn" style="text-align: left; padding-left:30px">Impression</td>
        <td class="controlBoxDataGridTitleColumn" style="text-align: left; padding-right:30px">Status</td>
        <td class="controlBoxDataGridTitleColumn">&nbsp;</td>
    </tr>
    <tr>
        <td align="center"><euc:EformTextBox RecordId="1" CalcDate="True" Width="80px" TABLE="Encounters" FIELD="EncDateText" 
	        Runat="server" ID="EncDateText_1" ReadOnly="true"/>
		    <euc:EformHidden RecordId="1" TABLE="Encounters" FIELD="EncDate" Runat="server" ID="EncDate_1"/></td>
		<td class="controlBoxDataGridValueColumn" colspan="3">
		    <table id="EncAssess" >
                    <tr id="EncAssess_1">
                        <td align="center"><euc:EformDropDownList RecordId="1" Width="100px" TABLE="NoTable" FIELD="EncImpression1" Runat="server" 
                            ID="EncImpression1" LookupCode="EncPresentation,Disease,Spine" RepeatDirection="Horizontal" 
                            RepeatColumns="2"/></td>
                        <td align="center"><euc:EformDropDownList RecordId="1" Width="100px" TABLE="NoTable" FIELD="EncStatus1" Runat="server" 
                            ID="EncStatus1" LookupCode="EncStatus,Disease,Spine"  RepeatDirection="Horizontal" RepeatColumns="2"/></td>
                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server" ToolTip="Clear all fields" 
                            style="cursor:pointer;"/></td>
                    </tr>  
                    <tr id="EncAssess_2" style=" display:none;">
                        <td align="center"><euc:EformDropDownList RecordId="1" Width="100px" TABLE="NoTable" FIELD="EncImpression2" Runat="server" 
                            ID="EncImpression2" LookupCode="EncPresentation,Disease,Spine" RepeatDirection="Horizontal" 
                            RepeatColumns="2"/><br />
                            <euc:EformTextBox RecordId="1" TABLE="Encounters" FIELD="EncPresentation" Runat="server" 
                            ID="EncPresentation_1" style=" display:none; width:1px;"/></td>
                        <td align="center"><euc:EformDropDownList RecordId="1" Width="100px" TABLE="NoTable" FIELD="EncStatus2" Runat="server" 
                            ID="EncStatus2" LookupCode="EncStatus,Disease,Spine"  RepeatDirection="Horizontal" RepeatColumns="2"/><br />
                            <euc:EformTextBox RecordId="1" TABLE="Encounters" FIELD="EncStatus" Runat="server" 
                            ID="EncStatus_1"  style=" display:none; width:1px;"/></td>
                        <td align="center"><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server" ToolTip="Clear all fields" 
                            style="cursor:pointer;"/></td>
                    </tr>
                    <tr >
                        <td height="28" width="10%" ><img alt="" src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'EncAssess');" /></td>
                  </tr>
            </table>  
		</td>
    </tr>
</table><br /><br />

<span class="controlBoxTitle">Treatment Plan</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="500" class="ClinicalEformTable">
    <tr >
        <td>
            <table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="PrevSpineActionsTable">
                <tr id="NoSpineActionsMsgTr" runat="server" class="ClinicalEformPopulatedRowNonClickable" style="display:none">
                    <td colspan="6" class="ClinicalEformPopulatedColumn" align="center" height="40">
                        No previous Actions were recorded for this patient.
                    </td>
                </tr>
             </table>
             
             <div id="PDFormDiv" style="overflow-y: auto; overflow-x:hidden; height: 100px; width:500; border:solid 1px #cccccc; background-color:#dddddd; display:none;" runat="server">
             <table width="500" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpineActionsRptTable">  
                  <asp:Repeater ID="SpineActionsRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
                    <HeaderTemplate>
                      <tr runat="server" id="PrevSpineActionsRptHdr">
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

<table width="500" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="SpineActionsTbl">
  <tr runat="server" id="SpineActionsHdr">
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
    <td align="center"><euc:EformSelect RecordId="1" width="150px" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_1" 
        LookupCode="ActionItem,Disease,Spine" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformTextBox RecordId="1" width="100px" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_1" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
   <tr style="display:none">
    <td><euc:EformCheckBox RecordId="2" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_2" Value="1" /></td>
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="2" ID="ActionDateText_2" TABLE="Actions" FIELD="ActionDateText" ShowCalendar="True" 
            CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="2" Table="Actions" Field="ActionDate" Runat="server" ID="ActionDate_2" />
    </td>
    <td align="center"><euc:EformSelect RecordId="2" width="150px" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_2" 
        LookupCode="ActionItem,Disease,Spine" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformTextBox RecordId="2" width="100px" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_2" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none">
    <td><euc:EformCheckBox RecordId="3" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_3" Value="1" /></td>
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="3" ID="ActionDateText_3" TABLE="Actions" FIELD="ActionDateText" ShowCalendar="True" 
            CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="3" Table="Actions" Field="ActionDate" Runat="server" ID="ActionDate_3" />
    </td>
    <td align="center"><euc:EformSelect RecordId="3" width="150px" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_3" 
        LookupCode="ActionItem,Disease,Spine" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformTextBox RecordId="3" width="100px" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_3" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none">
    <td><euc:EformCheckBox RecordId="4" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_4" Value="1" /></td>
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="4" ID="ActionDateText_4" TABLE="Actions" FIELD="ActionDateText" ShowCalendar="True" 
            CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="4" Table="Actions" Field="ActionDate" Runat="server" ID="ActionDate_4" />
    </td>
    <td align="center"><euc:EformSelect RecordId="4" width="150px" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_4" 
        LookupCode="ActionItem,Disease,Spine" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformTextBox RecordId="4" width="100px" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_4" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
  
  <tr style="display:none">
    <td><euc:EformCheckBox RecordId="5" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending_5" Value="1" /></td>
    <td align="center">
        <euc:EformTextBox Runat="server" RecordId="5" ID="ActionDateText_5" TABLE="Actions" FIELD="ActionDateText" ShowCalendar="True" 
            CalcDate="True" class="InputText" Width="80px" />
        <euc:EformHidden RecordId="5" Table="Actions" Field="ActionDate" Runat="server" ID="ActionDate_5" />
    </td>
    <td align="center"><euc:EformSelect RecordId="5" width="150px" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="ActionItem_5" 
        LookupCode="ActionItem,Disease,Spine" DropDownHeight="auto"/></td>
    <td align="center"><euc:EformTextBox RecordId="5" width="100px" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes_5" 
	    ShowTextEditor="true" MaxLength="1000"/></td>
    <td><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>
<img src="../../Images/EFormAddARow.gif" hspace="0" width="117" height="16" border="0" class="ClickableImage" align="left"  onclick="return showFirstAdditionalRow(this,'SpineActionsTbl');" /><br />
</td></tr></table><br /><br />


<!-- LKA Status -->
<span class="controlBoxTitle">Last Known Alive Status</span><br/>
<table width="650" cellpadding="3" cellspacing="0" class="ClinicalEformTable" id="SpineLastKnownAliveTable">
  <tr>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Date</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Status</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Disease</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Notes</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">Data Qlty</td>
	<td  class="controlBoxDataGridTitleColumn" style="text-align: center;">&nbsp;</td>
  </tr>
  <asp:Repeater ID="SpineLastKnownAliveRpt" runat="server" OnItemDataBound="EFormRepeaterOnDataBound"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# Eval("StatusId") %>, 'StatusDateText,StatusDate,Status,StatusDisease,StatusNotes,StatusQuality', 'Status');"> 
		    <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("StatusDateText")%></td>		    
			<td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("Status")%></td>
		    <td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("StatusDisease")%></td>
			<td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("StatusNotes")%></td>
			<td class="ClinicalEformPopulatedColumn" style="text-align:center;"><%# Eval("StatusQuality")%></td>
            <td class="ClinicalEformPopulatedColumn" style="text-align:center;">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  <tr>
	 <td><euc:EformTextBox ShowCalendar="True" CalcDate="True" style="width:80px;" RecordId="7" TABLE="Status" FIELD="StatusDateText" Runat="server" 
        ID="StatusDateText_7"/>
		    <euc:EformHidden RecordId="7" TABLE="Status" FIELD="StatusDate" Runat="server" ID="StatusDate_7"/>
	    </td>
    <td><euc:EformComboBox RecordId="7" TABLE="Status" FIELD="Status" Runat="server" ID="Status_7" LookupCode="Status" Width="100px"/></td>
    <td><euc:EformComboBox RecordId="7" TABLE="Status" FIELD="StatusDisease" Runat="server" ID="StatusDisease_7" Width="100px" LookupCode="Disease,Disease,Spine"/></td>
	<td><euc:EformTextBox RecordId="7" style="width:100px;" ShowTextEditor="true" TABLE="Status" FIELD="StatusNotes" Runat="server" ID="StatusNotes_7"/></td>
	<td><euc:EformDropDownList RecordId="7" style="width:60px;" TABLE="Status" FIELD="StatusQuality" Runat="server" ID="StatusQuality_7" LookupCode="DataQuality"/></td>
	<td><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server" ToolTip="Clear all fields" style="cursor:pointer;"/></td>
  </tr>
</table>


<script type="text/javascript">
    //Adds events for Assessment
    addAsessEvent($('<%= EncImpression1.ClientID %>'), $('<%= EncStatus1.ClientID %>'), $('<%= EncImpression2.ClientID %>'), $('<%= EncStatus2.ClientID %>'), $('<%= EncPresentation_1.ClientID %>'), $('<%= EncStatus_1.ClientID %>'));

    function addAsessEvent(EncImpression1, EncStatus1, EncImpression2, EncStatus2, EncPresentation, EncStatus) 
    {
        $(EncImpression1).addEvent('blur', curry(AssesssClicks,EncImpression1,EncStatus1,EncImpression2,EncStatus2,EncPresentation,EncStatus));
        $(EncStatus1).addEvent('blur', curry(AssesssClicks, EncImpression1, EncStatus1, EncImpression2, EncStatus2, EncPresentation, EncStatus));
        $(EncImpression2).addEvent('blur', curry(AssesssClicks,EncImpression1, EncStatus1, EncImpression2, EncStatus2, EncPresentation, EncStatus));
        $(EncStatus2).addEvent('blur', curry(AssesssClicks,EncImpression1, EncStatus1, EncImpression2, EncStatus2, EncPresentation, EncStatus));

        // check on load as well
        AssesssClicks(EncImpression1, EncStatus1, EncImpression2, EncStatus2, EncPresentation, EncStatus);
    }

    function AssesssClicks(EncImpression1, EncStatus1, EncImpression2, EncStatus2, EncPresentation, EncStatus) 
    {
        if (EncImpression1.value != '') 
        {
            EncPresentation.value = EncImpression1.value;

            if (EncImpression2.value != '') 
            {
                EncPresentation.value += "; " + EncImpression2.value;
            }
            else if (EncImpression2.value == '') 
            {
                EncPresentation.value = EncImpression1.value;
            }

        }
        else if (EncImpression1.value == '' && EncImpression2.value != '') 
        {
            EncPresentation.value = EncImpression2.value;
        }
        else if (EncImpression1.value == '' && EncImpression2.value == '') 
        {
            EncPresentation.value = '';
        }

        if (EncStatus1.value != '') {
            EncStatus.value = EncStatus1.value;

            if (EncStatus2.value != '') {
                EncStatus.value += "; " + EncStatus2.value;
            }
            else if (EncStatus2.value == '') {
                EncStatus.value = EncStatus1.value;
            }

        }
        else if (EncStatus1.value == '' && EncStatus2.value != '') {
            EncStatus.value = EncStatus2.value;
        }
        else if (EncStatus1.value == '' && EncStatus2.value == '') {
            EncStatus.value = '';
        }
    }


    //add events for last known alive status
    function addAliveEvent(StatusDate,Status,StatusDisease,StatusQuality) 
    {
        $(StatusDate).addEvent('blur', curry(AlivePopulate, StatusDate, Status, StatusDisease, StatusQuality));  
    }

    addAliveEvent($('<%= StatusDateText_7.ClientID %>'), $('<%= Status_7.ClientID %>'), $('<%= StatusDisease_7.ClientID %>'), $('<%= StatusQuality_7.ClientID %>'));

    function AlivePopulate(StatusDate, Status, StatusDisease, StatusQuality) 
    {
        if (StatusDate.value != '') 
        {
            Status.value = 'Alive';
            StatusDisease.value = 'Spine';
            StatusQuality.value = 'STD';
        }
        else 
        {
            Status.value = '';
            StatusDisease.value = '';
            StatusQuality.value = '';
        }
    }
</script>
