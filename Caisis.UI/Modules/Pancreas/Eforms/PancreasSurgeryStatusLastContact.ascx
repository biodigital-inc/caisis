<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasSurgeryStatusLastContact" CodeFile="PancreasSurgeryStatusLastContact.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" language="javascript">
    tableArray.LastContactStatusHtmlTable = "LastContactStatusHtmlTable";
</script>


<a name="PancreasSurgeryStatusLastContact" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Contact Status"></asp:Label><br/>

<table border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" id="LastContactStatusHtmlTable" >
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >&nbsp; Date</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status based on</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Ongoing Treatment</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Notes</td>    
    <td class="controlBoxDataGridHeaderFirstCol" ></td>
  </tr>
 
  <asp:Repeater ID="LastContactHx" runat="server" OnItemDataBound="EFormRepeaterOnDataBound" > 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onMouseOver="this.className='ClinicalEformHighlightedRow';" onMouseOut="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Status', <%# DataBinder.Eval(Container.DataItem, "StatusId") %>, 'StatusDateText,StatusDate,Status,StatusNotes','Status');"> 
			<td class="ClinicalEformPopulatedColumn">&nbsp;<%# DataBinder.Eval(Container.DataItem, "StatusDateText")%></td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "Status")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><asp:Literal ID="StatusBasedOnHx" runat="server" />&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><asp:Literal ID="OngoingTreatmentHx" runat="server" />&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><asp:Literal ID="UserNotesHx" runat="server" />&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><img align="right" src="../../../Images/EformPopulatedRowLOCK.gif" width="9" height="11" id="LockImage" runat="server" title="This record has been locked.">&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
    
  <tr>
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="11" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_11" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="11" Table="Status" Field="StatusDate" ID="StatusDate_11" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="11" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_11" Runat="server" />	      
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="175px" RecordId="11" Table="Status" FIELD="Status" ID="Status_11" Runat="server" LookupCode="StatusLastContact,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_StatusBasedOn_11" ID="LastContact_StatusBasedOn_11" Runat="server" LookupCode="StatusLastContactBasedOn,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_OngoingTreatment_11" ID="LastContact_OngoingTreatment_11" Runat="server" LookupCode="StatusLastContactOngoingTreatment,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
	      <euc:EformTextBox Width="125px" Table="NoTable" FIELD="LastContact_UserNotes_11" ID="LastContact_UserNotes_11" Runat="server" ShowTextEditor="true"/>
		  <euc:EformTextBox Width="1px" style="display: none " RecordId="11" Table="Status" FIELD="StatusNotes" ID="StatusNotes_11" Runat="server" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_11" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="12" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_12" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="12" Table="Status" Field="StatusDate" ID="StatusDate_12" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="12" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_12" Runat="server" />	      
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="175px" RecordId="12" Table="Status" FIELD="Status" ID="Status_12" Runat="server" LookupCode="StatusLastContact,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_StatusBasedOn_12" ID="LastContact_StatusBasedOn_12" Runat="server" LookupCode="StatusLastContactBasedOn,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_OngoingTreatment_12" ID="LastContact_OngoingTreatment_12" Runat="server" LookupCode="StatusLastContactOngoingTreatment,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
	      <euc:EformTextBox Width="125px" Table="NoTable" FIELD="LastContact_UserNotes_12" ID="LastContact_UserNotes_12" Runat="server" ShowTextEditor="true"/>
		  <euc:EformTextBox Width="1px" style="display: none " RecordId="12" Table="Status" FIELD="StatusNotes" ID="StatusNotes_12" Runat="server" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_12" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="13" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_13" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="13" Table="Status" Field="StatusDate" ID="StatusDate_13" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="13" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_13" Runat="server" />	      
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="175px" RecordId="13" Table="Status" FIELD="Status" ID="Status_13" Runat="server" LookupCode="StatusLastContact,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_StatusBasedOn_13" ID="LastContact_StatusBasedOn_13" Runat="server" LookupCode="StatusLastContactBasedOn,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_OngoingTreatment_13" ID="LastContact_OngoingTreatment_13" Runat="server" LookupCode="StatusLastContactOngoingTreatment,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
	      <euc:EformTextBox Width="125px" Table="NoTable" FIELD="LastContact_UserNotes_13" ID="LastContact_UserNotes_13" Runat="server" ShowTextEditor="true"/>
		  <euc:EformTextBox Width="1px" style="display: none " RecordId="13" Table="Status" FIELD="StatusNotes" ID="StatusNotes_13" Runat="server" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_13" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="14" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_14" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="14" Table="Status" Field="StatusDate" ID="StatusDate_14" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="14" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_14" Runat="server" />	      
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="175px" RecordId="14" Table="Status" FIELD="Status" ID="Status_14" Runat="server" LookupCode="StatusLastContact,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_StatusBasedOn_14" ID="LastContact_StatusBasedOn_14" Runat="server" LookupCode="StatusLastContactBasedOn,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_OngoingTreatment_14" ID="LastContact_OngoingTreatment_14" Runat="server" LookupCode="StatusLastContactOngoingTreatment,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
	      <euc:EformTextBox Width="125px" Table="NoTable" FIELD="LastContact_UserNotes_14" ID="LastContact_UserNotes_14" Runat="server" ShowTextEditor="true"/>
		  <euc:EformTextBox Width="1px" style="display: none " RecordId="14" Table="Status" FIELD="StatusNotes" ID="StatusNotes_14" Runat="server" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_14" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="15" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_15" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="15" Table="Status" Field="StatusDate" ID="StatusDate_15" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="15" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_15" Runat="server" />	      
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="175px" RecordId="15" Table="Status" FIELD="Status" ID="Status_15" Runat="server" LookupCode="StatusLastContact,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_StatusBasedOn_15" ID="LastContact_StatusBasedOn_15" Runat="server" LookupCode="StatusLastContactBasedOn,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_OngoingTreatment_15" ID="LastContact_OngoingTreatment_15" Runat="server" LookupCode="StatusLastContactOngoingTreatment,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
	      <euc:EformTextBox Width="125px" Table="NoTable" FIELD="LastContact_UserNotes_15" ID="LastContact_UserNotes_15" Runat="server" ShowTextEditor="true"/>
		  <euc:EformTextBox Width="1px" style="display: none " RecordId="15" Table="Status" FIELD="StatusNotes" ID="StatusNotes_15" Runat="server" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_15" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="16" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_16" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="16" Table="Status" Field="StatusDate" ID="StatusDate_16" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="16" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_16" Runat="server" />	      
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="175px" RecordId="16" Table="Status" FIELD="Status" ID="Status_16" Runat="server" LookupCode="StatusLastContact,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_StatusBasedOn_16" ID="LastContact_StatusBasedOn_16" Runat="server" LookupCode="StatusLastContactBasedOn,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_OngoingTreatment_16" ID="LastContact_OngoingTreatment_16" Runat="server" LookupCode="StatusLastContactOngoingTreatment,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
	      <euc:EformTextBox Width="125px" Table="NoTable" FIELD="LastContact_UserNotes_16" ID="LastContact_UserNotes_16" Runat="server" ShowTextEditor="true"/>
		  <euc:EformTextBox Width="1px" style="display: none " RecordId="16" Table="Status" FIELD="StatusNotes" ID="StatusNotes_16" Runat="server" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_16" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="17" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_17" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="17" Table="Status" Field="StatusDate" ID="StatusDate_17" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="17" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_17" Runat="server" />	      
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="175px" RecordId="17" Table="Status" FIELD="Status" ID="Status_17" Runat="server" LookupCode="StatusLastContact,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_StatusBasedOn_17" ID="LastContact_StatusBasedOn_17" Runat="server" LookupCode="StatusLastContactBasedOn,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_OngoingTreatment_17" ID="LastContact_OngoingTreatment_17" Runat="server" LookupCode="StatusLastContactOngoingTreatment,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
	      <euc:EformTextBox Width="125px" Table="NoTable" FIELD="LastContact_UserNotes_17" ID="LastContact_UserNotes_17" Runat="server" ShowTextEditor="true"/>
		  <euc:EformTextBox Width="1px" style="display: none " RecordId="17" Table="Status" FIELD="StatusNotes" ID="StatusNotes_17" Runat="server" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_17" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="18" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_18" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="18" Table="Status" Field="StatusDate" ID="StatusDate_18" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="18" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_18" Runat="server" />	      
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="175px" RecordId="18" Table="Status" FIELD="Status" ID="Status_18" Runat="server" LookupCode="StatusLastContact,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_StatusBasedOn_18" ID="LastContact_StatusBasedOn_18" Runat="server" LookupCode="StatusLastContactBasedOn,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_OngoingTreatment_18" ID="LastContact_OngoingTreatment_18" Runat="server" LookupCode="StatusLastContactOngoingTreatment,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
	      <euc:EformTextBox Width="125px" Table="NoTable" FIELD="LastContact_UserNotes_18" ID="LastContact_UserNotes_18" Runat="server" ShowTextEditor="true"/>
		  <euc:EformTextBox Width="1px" style="display: none " RecordId="18" Table="Status" FIELD="StatusNotes" ID="StatusNotes_18" Runat="server" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_18" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="19" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_19" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="19" Table="Status" Field="StatusDate" ID="StatusDate_19" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="19" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_19" Runat="server" />	      
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="175px" RecordId="19" Table="Status" FIELD="Status" ID="Status_19" Runat="server" LookupCode="StatusLastContact,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_StatusBasedOn_19" ID="LastContact_StatusBasedOn_19" Runat="server" LookupCode="StatusLastContactBasedOn,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_OngoingTreatment_19" ID="LastContact_OngoingTreatment_19" Runat="server" LookupCode="StatusLastContactOngoingTreatment,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
	      <euc:EformTextBox Width="125px" Table="NoTable" FIELD="LastContact_UserNotes_19" ID="LastContact_UserNotes_19" Runat="server" ShowTextEditor="true"/>
		  <euc:EformTextBox Width="1px" style="display: none " RecordId="19" Table="Status" FIELD="StatusNotes" ID="StatusNotes_19" Runat="server" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_19" Runat="server" /></td>		    
  </tr>
  <tr style="display: none; ">
    <td class="ClinicalEformPopulatedColumn" >
        <euc:EformTextBox Width="100px" RecordId="20" TABLE="Status" FIELD="StatusDateText" ID="StatusDateText_20" Runat="server" ShowCalendar="true" CalcDate="true"  />	
        <euc:EformHidden  RecordId="20" Table="Status" Field="StatusDate" ID="StatusDate_20" Runat="server" />
        
        <euc:EformTextBox Width="1px" style="display: none; " RecordId="20" TABLE="Status" FIELD="StatusDisease" ID="StatusDisease_20" Runat="server" />	      
        </td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDropDownList Width="175px" RecordId="20" Table="Status" FIELD="Status" ID="Status_20" Runat="server" LookupCode="StatusLastContact,Disease,@DiseaseView"/></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_StatusBasedOn_20" ID="LastContact_StatusBasedOn_20" Runat="server" LookupCode="StatusLastContactBasedOn,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformCheckBoxList ShowOther="true" DropDown="true" DropDownTextWidth="125px" RepeatDirection="Vertical" RepeatLayout="Table" 
		                         Width="300px" Table="NoTable" FIELD="LastContact_OngoingTreatment_20" ID="LastContact_OngoingTreatment_20" Runat="server" LookupCode="StatusLastContactOngoingTreatment,Disease,@DiseaseView" /></td>
	<td class="ClinicalEformPopulatedColumn" >
	      <euc:EformTextBox Width="125px" Table="NoTable" FIELD="LastContact_UserNotes_20" ID="LastContact_UserNotes_20" Runat="server" ShowTextEditor="true"/>
		  <euc:EformTextBox Width="1px" style="display: none " RecordId="20" Table="Status" FIELD="StatusNotes" ID="StatusNotes_20" Runat="server" /></td>
	<td class="ClinicalEformPopulatedColumn" >
		  <euc:EformDeleteIcon ID="EformDeleteIcon_20" Runat="server" /></td>		    
  </tr>


</table>
<a href="javascript:;" onclick="return showFirstAdditionalRow(this,'LastContactStatusHtmlTable');"><img alt="" src="../../Images/EFormAddARow.gif" width="117" height="16" border="0"/></a>

<br/>
<br/>
<br/>

<script type="text/javascript">
    /* <![CDATA[ */

    //Adds blur event to combo
    addAbsentEvent($('<%= StatusDateText_11.ClientID %>'), $('<%= StatusDate_11.ClientID %>'), $('<%= StatusDisease_11.ClientID %>'), $('<%= Status_11.ClientID %>'), $('<%= StatusNotes_11.ClientID %>'), $('<%= LastContact_StatusBasedOn_11.ClientID %>'), $('<%= LastContact_OngoingTreatment_11.ClientID %>'), $('<%= LastContact_UserNotes_11.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_12.ClientID %>'), $('<%= StatusDate_12.ClientID %>'), $('<%= StatusDisease_12.ClientID %>'), $('<%= Status_12.ClientID %>'), $('<%= StatusNotes_12.ClientID %>'), $('<%= LastContact_StatusBasedOn_12.ClientID %>'), $('<%= LastContact_OngoingTreatment_12.ClientID %>'), $('<%= LastContact_UserNotes_12.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_13.ClientID %>'), $('<%= StatusDate_13.ClientID %>'), $('<%= StatusDisease_13.ClientID %>'), $('<%= Status_13.ClientID %>'), $('<%= StatusNotes_13.ClientID %>'), $('<%= LastContact_StatusBasedOn_13.ClientID %>'), $('<%= LastContact_OngoingTreatment_13.ClientID %>'), $('<%= LastContact_UserNotes_13.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_14.ClientID %>'), $('<%= StatusDate_14.ClientID %>'), $('<%= StatusDisease_14.ClientID %>'), $('<%= Status_14.ClientID %>'), $('<%= StatusNotes_14.ClientID %>'), $('<%= LastContact_StatusBasedOn_14.ClientID %>'), $('<%= LastContact_OngoingTreatment_14.ClientID %>'), $('<%= LastContact_UserNotes_14.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_15.ClientID %>'), $('<%= StatusDate_15.ClientID %>'), $('<%= StatusDisease_15.ClientID %>'), $('<%= Status_15.ClientID %>'), $('<%= StatusNotes_15.ClientID %>'), $('<%= LastContact_StatusBasedOn_15.ClientID %>'), $('<%= LastContact_OngoingTreatment_15.ClientID %>'), $('<%= LastContact_UserNotes_15.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_16.ClientID %>'), $('<%= StatusDate_16.ClientID %>'), $('<%= StatusDisease_16.ClientID %>'), $('<%= Status_16.ClientID %>'), $('<%= StatusNotes_16.ClientID %>'), $('<%= LastContact_StatusBasedOn_16.ClientID %>'), $('<%= LastContact_OngoingTreatment_16.ClientID %>'), $('<%= LastContact_UserNotes_16.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_17.ClientID %>'), $('<%= StatusDate_17.ClientID %>'), $('<%= StatusDisease_17.ClientID %>'), $('<%= Status_17.ClientID %>'), $('<%= StatusNotes_17.ClientID %>'), $('<%= LastContact_StatusBasedOn_17.ClientID %>'), $('<%= LastContact_OngoingTreatment_17.ClientID %>'), $('<%= LastContact_UserNotes_17.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_18.ClientID %>'), $('<%= StatusDate_18.ClientID %>'), $('<%= StatusDisease_18.ClientID %>'), $('<%= Status_18.ClientID %>'), $('<%= StatusNotes_18.ClientID %>'), $('<%= LastContact_StatusBasedOn_18.ClientID %>'), $('<%= LastContact_OngoingTreatment_18.ClientID %>'), $('<%= LastContact_UserNotes_18.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_19.ClientID %>'), $('<%= StatusDate_19.ClientID %>'), $('<%= StatusDisease_19.ClientID %>'), $('<%= Status_19.ClientID %>'), $('<%= StatusNotes_19.ClientID %>'), $('<%= LastContact_StatusBasedOn_19.ClientID %>'), $('<%= LastContact_OngoingTreatment_19.ClientID %>'), $('<%= LastContact_UserNotes_19.ClientID %>'));
    addAbsentEvent($('<%= StatusDateText_20.ClientID %>'), $('<%= StatusDate_20.ClientID %>'), $('<%= StatusDisease_20.ClientID %>'), $('<%= Status_20.ClientID %>'), $('<%= StatusNotes_20.ClientID %>'), $('<%= LastContact_StatusBasedOn_20.ClientID %>'), $('<%= LastContact_OngoingTreatment_20.ClientID %>'), $('<%= LastContact_UserNotes_20.ClientID %>'));

    function addAbsentEvent(statusDateText, statusDate, statusDisease, status, statusNotes, statusBasedOn, ongoingTreatment, userNotes) {
        $(statusDateText).addEvent('blur', curry(SetHiddenFields, statusDateText, statusDate, statusDisease, status, statusNotes, statusBasedOn, ongoingTreatment, userNotes));
        $(status).addEvent('blur', curry(SetHiddenFields, statusDateText, statusDate, statusDisease, status, statusNotes, statusBasedOn, ongoingTreatment, userNotes));

        var cbl = statusBasedOn.getElementsByTagName('input');
        for (var j = 0; j < cbl.length; j++) {
            var cblRef = cbl[j];
            if (cblRef.type == 'checkbox')
                $(cblRef).addEvent('click', curry(SetHiddenFields, statusDateText, statusDate, statusDisease, status, statusNotes, statusBasedOn, ongoingTreatment, userNotes));
            else if (cblRef.type == 'text')
                $(cblRef).addEvent('blur', curry(SetHiddenFields, statusDateText, statusDate, statusDisease, status, statusNotes, statusBasedOn, ongoingTreatment, userNotes));
        }

        var cbl2 = ongoingTreatment.getElementsByTagName('input');
        for (var j = 0; j < cbl2.length; j++) {
            var cblRef2 = cbl2[j];
            if (cblRef2.type == 'checkbox')
                $(cblRef2).addEvent('click', curry(SetHiddenFields, statusDateText, statusDate, statusDisease, status, statusNotes, statusBasedOn, ongoingTreatment, userNotes));
            else if (cblRef2.type == 'text')
                $(cblRef2).addEvent('blur', curry(SetHiddenFields, statusDateText, statusDate, statusDisease, status, statusNotes, statusBasedOn, ongoingTreatment, userNotes));
        }     

        $(userNotes).addEvent('blur', curry(SetHiddenFields, statusDateText, statusDate, statusDisease, status, statusNotes, statusBasedOn, ongoingTreatment, userNotes));
    }

    /* ]]> */

    function SetHiddenFields(statusDateText, statusDate, statusDisease, status, statusNotes, statusBasedOn, ongoingTreatment, userNotes) {

        statusNotes.value = '';

        var statusBasedOnValues = RetrieveCheckBoxListSelectedValues(statusBasedOn, "TABLE");
        if (statusBasedOnValues != '')
            statusNotes.value = statusNotes.value + "Status based on: " + statusBasedOnValues + " ||| ";

        var ongoingTreatmentValues = RetrieveCheckBoxListSelectedValues(ongoingTreatment, "TABLE");
        if (ongoingTreatmentValues != '')
            statusNotes.value = statusNotes.value + "Ongoing Treatment: " + ongoingTreatmentValues + " ||| ";
            
        if (userNotes.value != '')
            statusNotes.value = statusNotes.value + "Other Notes: " + userNotes.value + " ||| ";

        
        if (statusDateText.value != '' || status.value != '' || statusNotes.value != '') {

            statusDisease.value = 'Pancreas Cancer';
        }
        else {

            statusDisease.value = '';
        }
        
        
    }


</script>