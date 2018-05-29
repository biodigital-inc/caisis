<%@ Control Language="c#" Inherits="Caisis.UI.Modules.HeadNeck.Eforms.VitalStatus" CodeFile="VitalStatus.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script language="javascript" type="text/javascript">
    function dischargeCheck(cbox, dateTextId, dateId)
    {
	    if (cbox.checked)
	    {
		    document.getElementById(dateTextId).value = $('<%=StatusDateText_15.ClientID %>').value;
		    document.getElementById(dateId).value = $('<%=StatusDate_15.ClientID %>').value;
	    }
	    else
	    {
	        document.getElementById(dateTextId).value = '';
	        document.getElementById(dateId).value = '';
	    }
    } 
    
    // Additional data required functions
    function additionalDataCheck(cbox, dateTextFieldId, datetxt,dateId,date, action, value1, value2)
    {
	    if (cbox.checked == true)
	    {
	        clearElementsInParentRow(document.getElementById('AdditionalEntryRow'));
		    document.getElementById(dateTextFieldId).value = datetxt;
		    document.getElementById(dateId).value = date;
		    document.getElementById(action).value = value1;
		    document.getElementById('<%=ActionPending.ClientID %>').checked=true;
	    }
	    else
	    {
	        clearElementsInParentRow(document.getElementById('AdditionalEntryRow'));
	        document.getElementById(dateTextFieldId).value = datetxt;
	        document.getElementById(dateId).value = date;
		    document.getElementById(action).value = value2;		    
	    }
    } 
    
    function updateActionDt()
    {
        $('<%=ActionDate.ClientID %>').value=$('<%=ActionDateText.ClientID %>').value;
    }
</script>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="VitalStatus" /><span class="controlBoxTitle">Last Follow-Up Status</span>
<table width="650" cellpadding="5" cellspacing="0" class="ClinicalEformTable">
    <tr>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; ">FU Type</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center; ">Date</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;color: #8d2a2c;">Status</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
        <%--<td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Data Source</td>--%>
  </tr>
  <tr valign="top" >
    <td height="28" align="left">
        <asp:Label ID="FUType1" runat="server" Text="Last seen by Thyroidologist"></asp:Label>
    </td>
    <td height="28" align="left">
        <euc:EformTextBox Runat="server" RecordId="15"  ID="StatusDateText_15" TABLE="Status" FIELD="StatusDateText" style="width:90px;"  
            ShowCalendar="True" CalcDate="True" class="InputText" />
        <euc:EformHidden RecordId="15" Runat="server" ID="StatusDate_15" Table="Status" Field="StatusDate" /></td> 
    <td height="28" align="center">
        <euc:EformDropDownList style="width:125px;" Field="Status" RecordId="15" Table="Status" Runat="server" id="Status_15" 
            EnableHiddenOnUIEvent="StatusDisease_15,StatusQuality_15">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Text="Alive" Value="Alive"></asp:ListItem>
            <asp:ListItem Text="Alive with Disease" Value="Alive with Disease"></asp:ListItem>
            <asp:ListItem Text="No Evidence of Disease" Value="No Evidence of Disease"></asp:ListItem>
        </euc:EformDropDownList>
        <euc:EformHidden Runat="server" RecordId="15"  ID="StatusDisease_15" TABLE="Status" FIELD="StatusDisease" Value="Thyroid Cancer" />
        <euc:EformHidden Runat="server" RecordId="15"  ID="StatusQuality_15" TABLE="Status" FIELD="StatusQuality" Value="STD" />
        
     <%--updates NeckRecurrence Location and Side into StatusNotes from previous page--%>
        <euc:EformTextBox Table="NoTable" Field="NeckRecurSite" Runat="server" id="StatusNotes_7" Width="1px" style="display:none;"/>
        <euc:EformTextBox TABLE="NoTable" FIELD="NeckRecurSide" Runat="server" ID="NeckRecurSide_1" Width="1px" style="display:none;"/>
        <euc:EformTextBox Runat="server" RecordId="7"  ID="NeckRecurLocSide" TABLE="Status" FIELD="StatusNotes" Width="1px" style="display:none;"/>
    <%--End--%>
    </td>
    <td height="28" align="center">
        <euc:EformTextBox Runat="server" RecordId="15"  ID="StatusNotes_15" TABLE="Status" FIELD="StatusNotes" Width="150px" ShowTextEditor="true" />
    </td>
    <%--<td height="28" align="center">
        <euc:EformDropDownList Runat="server" RecordId="15"  ID="StatusDataSource_15" TABLE="Status" FIELD="StatusDataSource" 
            LookupCode="DataSource" Width="125px" />
    </td>--%>
  </tr>
  
  <tr valign="top">
    <td height="28" align="left">
        <asp:Label ID="FUType2" runat="server" Text="Last seen by other Physician"></asp:Label>
    </td>
    <td height="28" align="left">
        <euc:EformTextBox Runat="server" RecordId="17"  ID="StatusDateText_17" TABLE="Status" FIELD="StatusDateText" style="width:90px;"  
            ShowCalendar="True" CalcDate="True" class="InputText" />
        <euc:EformHidden RecordId="17" Runat="server" ID="StatusDate_17" Table="Status" Field="StatusDate" />
    </td> 
    <td height="28" align="center">
        <euc:EformDropDownList style="width:125px;" Field="Status" RecordId="17" Table="Status" Runat="server" id="Status_17" 
            EnableHiddenOnUIEvent="StatusDisease_17,StatusQuality_17,StatusNotes_17">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Text="Alive" Value="Alive"></asp:ListItem>
            <asp:ListItem Text="Alive with Disease" Value="Alive with Disease"></asp:ListItem>
            <asp:ListItem Text="No Evidence of Disease" Value="No Evidence of Disease"></asp:ListItem>
        </euc:EformDropDownList>
        <euc:EformHidden Runat="server" RecordId="17" ID="StatusDisease_17" TABLE="Status" FIELD="StatusDisease" Value="Thyroid Cancer" />
        <euc:EformHidden Runat="server" RecordId="17" ID="StatusQuality_17" TABLE="Status" FIELD="StatusQuality" Value="OUT" />
    </td>
    <td height="28" align="center">
        <euc:EformTextBox Runat="server" RecordId="17" ID="StatusNotes_17" TABLE="Status" FIELD="StatusNotes" style="width:150px;" 
            ShowTextEditor="true"/>
    </td>
  </tr>
  
  <tr valign="top">
    <td height="28" align="left">
        <asp:Label ID="FUType3" runat="server" Text="Last Patient Letter"></asp:Label>
    </td>
    <td height="28" align="left">
        <euc:EformTextBox Runat="server" RecordId="18"  ID="StatusDateText_18" TABLE="Status" FIELD="StatusDateText" style="width:90px;"  
            ShowCalendar="True" CalcDate="True" class="InputText" />
        <euc:EformHidden RecordId="18" Runat="server" ID="StatusDate_18" Table="Status" Field="StatusDate" />
    </td> 
    <td height="28" align="center">
        <euc:EformDropDownList style="width:125px;" Field="Status" RecordId="18" Table="Status" Runat="server" id="Status_18" 
            EnableHiddenOnUIEvent="StatusDisease_18,StatusQuality_18,StatusNotes_18">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem Text="Alive" Value="Alive"></asp:ListItem>
            <asp:ListItem Text="Alive with Disease" Value="Alive with Disease"></asp:ListItem>
            <asp:ListItem Text="No Evidence of Disease" Value="No Evidence of Disease"></asp:ListItem>
        </euc:EformDropDownList>
        <euc:EformHidden Runat="server" RecordId="18"  ID="StatusDisease_18" TABLE="Status" FIELD="StatusDisease" Value="Thyroid Cancer" />
        <euc:EformHidden Runat="server" RecordId="18"  ID="StatusQuality_18" TABLE="Status" FIELD="StatusQuality" Value="OUT" />
    </td>
    <td height="28" align="center">
        <euc:EformTextBox Runat="server" RecordId="18" ID="StatusNotes_18" TABLE="Status" FIELD="StatusNotes" style="width:150px;" 
            ShowTextEditor="true"/>
    </td>
  </tr>
  
   <tr>
    <td colspan="1" style=" white-space:nowrap"><span class="controlBoxTitle">Discharged from Practice?</span>
        <euc:EformCheckBox RecordId="2" TABLE="Actions" FIELD="ActionItem" Runat="server" ID="DischargedfromPractice" 
            Value="Discharged from Practice" />
    </td>
    <td colspan="3">
        <euc:EformTextBox Runat="server" RecordId="2" ID="ActionDateText_2" TABLE="Actions" FIELD="ActionDateText" 
            Width="90px" ShowCalendar="True" CalcDate="True" class="InputText"/>
        <euc:EformHidden Runat="server" RecordId="2" ID="ActionDate_2" Table="Actions" Field="ActionDate"></euc:EformHidden>
    </td>
  </tr>
</table><br />
<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="DeadHtmlTable">
    <span class="controlBoxTitle">Vital Status</span>
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Status at Death</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;" colspan="2">Cause of Death</td>
  </tr>
  
  <asp:Repeater ID="DeathStatusRpt" runat="server"  OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"   onclick="LoadDataEntryForm('Patients', <%# DataBinder.Eval(Container.DataItem, "PatientId") %>, 'PtDeathDateText,PtDeathDate,PtDeathType,PtDeathCause','DeadHtmlTable');">
		   <td class="ClinicalEformPopulatedColumn" style="text-align: left;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathDateText")%></td>
		   <td class="ClinicalEformPopulatedColumn" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathType")%></td>
		   <td class="ClinicalEformPopulatedColumn" style="text-align: center;">&nbsp;<%# DataBinder.Eval(Container.DataItem, "PtDeathCause")%></td>
			<td class="ClinicalEformPopulatedColumn"><img alt="" align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked."/>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
  <tr id="DeadHtmlRow" runat="server" visible="false">
    <td height="28"><euc:EformTextBox Runat="server" RecordId="1" ID="PtDeathDateText" TABLE="Patients" FIELD="PtDeathDateText" style="width:100px;"  ShowCalendar="True" CalcDate="True" class="InputText" /><euc:EformHidden Runat="server" RecordId="1" ID="PtDeathDate" Table="Patients" Field="PtDeathDate" /></td> 
    <td align="center"><euc:EformDropDownList style="width:150;" RecordId="1" Field="PtDeathType" Table="Patients" Runat="server" id="PtDeathType" >
    <asp:ListItem></asp:ListItem>
    <asp:ListItem Text="with Thyroid Cancer" Value="with Thyroid Cancer"></asp:ListItem>
    <asp:ListItem Text="without Thyroid Cancer" Value="without Thyroid Cancer"></asp:ListItem>
    <asp:ListItem Text="Unknown" Value="Unknown"></asp:ListItem>
    </euc:EformDropDownList></td>
    <td align="center">
        <euc:EformTextBox style="width:150;" RecordId="1" Field="PtDeathCause" Table="Patients" Runat="server" id="PtDeathCause"/></td>
  </tr>
</table><br /><br />

<%--Additional data required or not--%>
<table>
    <tr>
        <td><span class="controlBoxTitle">Additional Entry Needed ?</span></td>
        <td height="28">
            <euc:EformCheckBox TABLE="NoTable" FIELD="AdditionalEntryNeeded" Runat="server" ID="AdditionalEntryNeeded" Value="True"/></td>
    </tr>
</table>

<table width="550" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="AdditionalEntryTable">
<tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Action</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: center;">Notes</td>
</tr>
<tr id="AdditionalEntryRow"> 
    <td><euc:EformTextBox Runat="server" RecordId="1" ID="ActionDateText" TABLE="Actions" FIELD="ActionDateText" ShowCalendar="True" CalcDate="True" class="InputText" AppendToOnChange="updateActionDt();" Width="70px" />
    <euc:EformTextBox Runat="server" RecordId="1" ID="ActionDate" Table="Actions" Field="ActionDate" Width="1px" style="display:none;" />
    </td>
    <td align="center"><euc:EformTextBox style="width:150px;" Runat="server" RecordId="1" ID="ActionItem" TABLE="Actions" FIELD="ActionItem" /></td>
    <td align="center"><euc:EformTextBox RecordId="1" style="width:150px;" TABLE="Actions" FIELD="ActionNotes" Runat="server" ID="ActionNotes" />
    <euc:EformCheckBox RecordId="1" TABLE="Actions" FIELD="ActionPending" Runat="server" ID="ActionPending" Value="1" style="visibility:hidden;"/></td>
</tr>
</table>