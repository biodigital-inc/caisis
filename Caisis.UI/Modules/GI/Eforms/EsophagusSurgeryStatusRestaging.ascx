<%@ Control Language="c#" Inherits="Caisis.UI.Modules.GI.Eforms.EsophagusSurgeryStatusRestaging" CodeFile="EsophagusSurgeryStatusRestaging.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<script type="text/javascript" language="javascript">
    tableArray.RestagingStatusHtmlTable = "RestagingStatusHtmlTable";
</script>

<a name="EsophagusSurgeryStatusRestaging" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Restaging"></asp:Label><br/>


<table border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" id="RestagingStatusHtmlTable" >
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp; Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Notes</td>    
    <td class="controlBoxDataGridHeaderFirstCol" ></td>
  </tr>
 
  <asp:Repeater ID="RestagingHx" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# DataBinder.Eval(Container.DataItem, "StatusId") %>, 'StatusDateText,StatusDate,Status,StatusNotes','Status');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusDateText")%></td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Status")%>&nbsp;</td>
			<td align="center" class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "StatusNotes")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
    
  <tr>
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="1" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_1" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="1" Table="Status" Field="StatusDate" ID="StatusDate_1" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="1" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_1" Runat="server" />	      
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="300px" RecordId="1" Table="Status" FIELD="Status" ID="Status_1" Runat="server" LookupCode="StatusRestaging,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformTextBox Width="200px"  RecordId="1" Table="Status" FIELD="StatusNotes" ID="StatusNotes_1" Runat="server" ShowTextEditor="true"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_1" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="2" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_2" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="2" Table="Status" Field="StatusDate" ID="StatusDate_2" Runat="server" />

        <euc:EformTextBox Width="1px" style="display: none; " RecordId="2" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_2" Runat="server" />	              
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="300px"  DropDownWidth="400px" RecordId="2" Table="Status" FIELD="Status" ID="Status_2" Runat="server" LookupCode="StatusRestaging,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformTextBox Width="200px"  RecordId="2" Table="Status" FIELD="StatusNotes" ID="StatusNotes_2" Runat="server" ShowTextEditor="true"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_2" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="3" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_3" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="3" Table="Status" Field="StatusDate" ID="StatusDate_3" Runat="server" />

        <euc:EformTextBox Width="1px" style="display: none; " RecordId="3" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_3" Runat="server" />	              
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="300px"  DropDownWidth="400px" RecordId="3" Table="Status" FIELD="Status" ID="Status_3" Runat="server" LookupCode="StatusRestaging,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformTextBox Width="200px"  RecordId="3" Table="Status" FIELD="StatusNotes" ID="StatusNotes_3" Runat="server" ShowTextEditor="true"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_3" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="4" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_4" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="4" Table="Status" Field="StatusDate" ID="StatusDate_4" Runat="server" />

        <euc:EformTextBox Width="1px" style="display: none; " RecordId="4" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_4" Runat="server" />	              
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="300px"  DropDownWidth="400px" RecordId="4" Table="Status" FIELD="Status" ID="Status_4" Runat="server" LookupCode="StatusRestaging,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformTextBox Width="200px"  RecordId="4" Table="Status" FIELD="StatusNotes" ID="StatusNotes_4" Runat="server" ShowTextEditor="true"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_4" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="5" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_5" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="5" Table="Status" Field="StatusDate" ID="StatusDate_5" Runat="server" />

        <euc:EformTextBox Width="1px" style="display: none; " RecordId="5" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_5" Runat="server" />	              
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="300px"  DropDownWidth="400px" RecordId="5" Table="Status" FIELD="Status" ID="Status_5" Runat="server" LookupCode="StatusRestaging,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformTextBox Width="200px"  RecordId="5" Table="Status" FIELD="StatusNotes" ID="StatusNotes_5" Runat="server" ShowTextEditor="true"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_5" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="6" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_6" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="6" Table="Status" Field="StatusDate" ID="StatusDate_6" Runat="server" />

        <euc:EformTextBox Width="1px" style="display: none; " RecordId="6" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_6" Runat="server" />	              
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="300px"  DropDownWidth="400px" RecordId="6" Table="Status" FIELD="Status" ID="Status_6" Runat="server" LookupCode="StatusRestaging,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformTextBox Width="200px"  RecordId="6" Table="Status" FIELD="StatusNotes" ID="StatusNotes_6" Runat="server" ShowTextEditor="true"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_6" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="7" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_7" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="7" Table="Status" Field="StatusDate" ID="StatusDate_7" Runat="server" />

        <euc:EformTextBox Width="1px" style="display: none; " RecordId="7" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_7" Runat="server" />	              
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="300px"  DropDownWidth="400px" RecordId="7" Table="Status" FIELD="Status" ID="Status_7" Runat="server" LookupCode="StatusRestaging,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformTextBox Width="200px"  RecordId="7" Table="Status" FIELD="StatusNotes" ID="StatusNotes_7" Runat="server" ShowTextEditor="true"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_7" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="8" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_8" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="8" Table="Status" Field="StatusDate" ID="StatusDate_8" Runat="server" />

        <euc:EformTextBox Width="1px" style="display: none; " RecordId="8" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_8" Runat="server" />	              
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="300px"  DropDownWidth="400px" RecordId="8" Table="Status" FIELD="Status" ID="Status_8" Runat="server" LookupCode="StatusRestaging,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformTextBox Width="200px"  RecordId="8" Table="Status" FIELD="StatusNotes" ID="StatusNotes_8" Runat="server" ShowTextEditor="true"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_8" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="9" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_9" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="9" Table="Status" Field="StatusDate" ID="StatusDate_9" Runat="server" />

        <euc:EformTextBox Width="1px" style="display: none; " RecordId="9" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_9" Runat="server" />	              
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="300px"  DropDownWidth="400px" RecordId="9" Table="Status" FIELD="Status" ID="Status_9" Runat="server" LookupCode="StatusRestaging,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformTextBox Width="200px"  RecordId="9" Table="Status" FIELD="StatusNotes" ID="StatusNotes_9" Runat="server" ShowTextEditor="true"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_9" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="10" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_10" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="10" Table="Status" Field="StatusDate" ID="StatusDate_10" Runat="server" />

        <euc:EformTextBox Width="1px" style="display: none; " RecordId="10" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_10" Runat="server" />	              
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="300px"  DropDownWidth="400px" RecordId="10" Table="Status" FIELD="Status" ID="Status_10" Runat="server" LookupCode="StatusRestaging,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformTextBox Width="200px"  RecordId="10" Table="Status" FIELD="StatusNotes" ID="StatusNotes_10" Runat="server" ShowTextEditor="true"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_10" Runat="server" /></td>		    
  </tr>

</table>
<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'RestagingStatusHtmlTable');"><img alt="" src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"/></a>

<br/>
<br/>
<br/>

<script type="text/javascript">
    /* <![CDATA[ */

    //Adds blur event to combo
    addAbsentEvent($('<%= StatusDateText_1.ClientID %>'), $('<%= StatusDate_1.ClientID %>'), $('<%= StatusDisease_1.ClientID %>'), $('<%= Status_1.ClientID %>'), $('<%= StatusNotes_1.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_2.ClientID %>'), $('<%= StatusDate_2.ClientID %>'), $('<%= StatusDisease_2.ClientID %>'), $('<%= Status_2.ClientID %>'), $('<%= StatusNotes_2.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_3.ClientID %>'), $('<%= StatusDate_3.ClientID %>'), $('<%= StatusDisease_3.ClientID %>'), $('<%= Status_3.ClientID %>'), $('<%= StatusNotes_3.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_4.ClientID %>'), $('<%= StatusDate_4.ClientID %>'), $('<%= StatusDisease_4.ClientID %>'), $('<%= Status_4.ClientID %>'), $('<%= StatusNotes_4.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_5.ClientID %>'), $('<%= StatusDate_5.ClientID %>'), $('<%= StatusDisease_5.ClientID %>'), $('<%= Status_5.ClientID %>'), $('<%= StatusNotes_5.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_6.ClientID %>'), $('<%= StatusDate_6.ClientID %>'), $('<%= StatusDisease_6.ClientID %>'), $('<%= Status_6.ClientID %>'), $('<%= StatusNotes_6.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_7.ClientID %>'), $('<%= StatusDate_7.ClientID %>'), $('<%= StatusDisease_7.ClientID %>'), $('<%= Status_7.ClientID %>'), $('<%= StatusNotes_7.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_8.ClientID %>'), $('<%= StatusDate_8.ClientID %>'), $('<%= StatusDisease_8.ClientID %>'), $('<%= Status_8.ClientID %>'), $('<%= StatusNotes_8.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_9.ClientID %>'), $('<%= StatusDate_9.ClientID %>'), $('<%= StatusDisease_9.ClientID %>'), $('<%= Status_9.ClientID %>'), $('<%= StatusNotes_9.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_10.ClientID %>'), $('<%= StatusDate_10.ClientID %>'), $('<%= StatusDisease_10.ClientID %>'), $('<%= Status_10.ClientID %>'), $('<%= StatusNotes_10.ClientID %>'));

    function addAbsentEvent(statusDateText,statusDate,statusDisease,status,statusNotes) {
        $(statusDateText).addEvent('blur', curry(SetHiddenFields, statusDateText, statusDate, statusDisease, status, statusNotes));
        $(status).addEvent('blur', curry(SetHiddenFields, statusDateText, statusDate, statusDisease, status, statusNotes));
        $(statusNotes).addEvent('blur', curry(SetHiddenFields, statusDateText, statusDate, statusDisease, status, statusNotes));
    }

    /* ]]> */

    function SetHiddenFields(statusDateText, statusDate, statusDisease, status, statusNotes) {

        if (statusDateText.value != '' || status.value != '' || statusNotes.value != '') {

            statusDisease.value = 'Pancreas Cancer';
        }
        else {

            statusDisease.value = '';
        }
    }


</script>