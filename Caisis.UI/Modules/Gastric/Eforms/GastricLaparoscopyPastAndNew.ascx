<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.GastricLaparoscopyPastAndNew" CodeFile="GastricLaparoscopyPastAndNew.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<%-- javascript moved to end of this file - jf --%>

<style type="text/css">
#GastricLapSiteTd td
{
	padding: 0px 10px 0px 0px;
}
.gastricPathTable
{
    border: solid 1px #cccccc; 
    margin: 10px 0px 15px 16px;
    background-color: #efefef;
    width: 90%;

}
.gastricPathTable td
{
    padding: 5px 5px 5px 5px;
}
a.dataEntryButtonGray:hover
{
    border: solid 1px #8d2a2c;
    color: #8d2a2c;
}
table#pastGastricProcsHtmlTable td.ClinicalEformPopulatedColumn
{
    font-size: 11px;
}
</style>


<a name="GastricLaparoscopyPastAndNew" id="GastricLaparoscopyPastAndNew" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Laparoscopy"></asp:Label>

<asp:Literal ID="SurgicalHistoryMsg" runat="server" Visible="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Listed here are this patient's past Laparoscopic procedures. Click a record to edit.</asp:Literal><br/>
<table style="width: 700px;" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="pastGastricProcsHtmlTable">
  <tr> 
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left; width: 100px;">&nbsp;Date</td>
    <td class="controlBoxDataGridHeaderFirstCol">Procedure</td>
    <td class="controlBoxDataGridHeaderFirstCol">Surgeon</td>
    <td class="controlBoxDataGridHeaderFirstCol">Indication</td>
    <td class="controlBoxDataGridHeaderFirstCol">Approach</td>
    <td class="controlBoxDataGridHeaderFirstCol">Site</td>
    <td class="controlBoxDataGridHeaderFirstCol">Subsite</td>
    <td class="controlBoxDataGridHeaderFirstCol">More</td>
  </tr>
  
  <asp:Repeater ID="rptSurgicalHistory" Runat="server"  OnItemDataBound="getLinkedData"> 
	<ItemTemplate> 
		<tr class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';"  onclick="LoadDataEntryForm('Procedures', <%# DataBinder.Eval(Container.DataItem, "ProcedureId") %>, 'OperatingRoomDetailId,ProcDateText,ProcDate,ProcName,ProcSurgeon,ProcIndication,ProcApproach,ProcSite,ProcSubsite', 'Procedures', 'GastricProc,NodeProc');"> 
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcDateText") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcName") %>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcSurgeon")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcIndication")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcApproach")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcSite")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><%# DataBinder.Eval(Container.DataItem, "ProcSubsite")%>&nbsp;</td>
			<td class="ClinicalEformPopulatedColumn"><span id="ORDetailsLink" runat="server"><a onclick="LoadDataEntryForm('OperatingRoomDetails', <%# DataBinder.Eval(Container.DataItem, "OperatingRoomDetailId") %>, 'OpDateText,OpDate,OpCaseSurgeon,OpService,OpInstitution,OpQuality,OpAdmitDateText,OpAdmitDate,OpDischargeDateText,OpDischargeDate,OpDuration', 'OperatingRoomDetails', '');stopBubble(event);" onmouseover="stopBubble(event);" class="dataEntryButtonGray" style="white-space: nowrap;" title="View/Edit OR Details">OR Details</a></span>
			
  <asp:Repeater ID="linkedPathologies" Runat="server"> 
	<ItemTemplate> 
			<span id="PathologyLink" runat="server" style="margin-top: 1px;"><a onclick="LoadDataEntryForm('Pathology', <%# DataBinder.Eval(Container.DataItem, "PathologyId") %>, 'PathDateText,PathDate,PathNum,PathSpecimenType,PathSpecimenCollection,PathSite,PathSubsite,PathSide,PathResult,PathInstitution,PathNotes,PathQuality,PathDataSource,PathHistology', 'Pathology', 'GastricPath,PathologyStageGrade,NodePathFinding,PathTest');stopBubble(event);" onmouseover="stopBubble(event);" class="dataEntryButtonGray" style="white-space: nowrap;" title="View/Edit Pahtology">Path: <%# DataBinder.Eval(Container.DataItem, "PathSpecimenType")%></a></span>
	</ItemTemplate>
  </asp:Repeater>&nbsp;</td>
		</tr>      
	</ItemTemplate>
  </asp:Repeater>
  
<%--  <tr id="NoSurgicalHistoryMsgTr" runat="server"  class="ClinicalEformPopulatedRowNonClickable" > 
			<td colspan="9" class="ClinicalEformPopulatedColumn" align="center" height="40"> No prior gastric surgical procedures have been recorded for this patient.</td>
  </tr> 

--%>  
  
</table>
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;padding-top: 20px; padding-bottom: 20px;" id="GastricLaparoscopyYesNonContainer">
	
	<asp:Label ID="NoLapHistoryMsg" runat="server">No prior gastric laparoscopy procedures have been recorded for this patient.<br /><br />
	<strong>Would you like to enter a new laparoscopic procedure?</strong></asp:Label>
	<asp:Label ID="LapHistoryMsg" runat="server" Visible="false"><strong>Would you like to enter data <em>for an additional laparoscopy not listed above</em>?</strong></asp:Label>
	
	
	
	<euc:EformRadioButtonList Table="NoTable" Field="LaparoscopyPerformed" id="LaparoscopyPerformed" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="GastricLaparoscopyDetails" style="display: none;">
 <td style="padding: 15px 0px 0px 0px; border-top: solid 1px #cccccc;"   onclick="copyGastricLaparoscopyProcData();" >
 
 <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">OR &amp; Procedure Details</span>
 
 <table border="0" cellspacing="0" cellpadding="16" width="100%" style="border-bottom: solid 1px #cccccc; margin-bottom: 15px;" > 
     <tr >
       <td style="vertical-align: top;">
	   <div style="width: 400px; float: right;">
<strong>Case Surgeon</strong> <euc:EformComboBox ShowLabel="false" Width="280" DropDownWidth="300" LookupDistinct="Appointments;ApptPhysician;ApptPhysician" id="OpCaseSurgeon_12" Table="OperatingRoomDetails" RecordId="12" Field="OpCaseSurgeon" runat="server" />
	        <euc:EformTextBox style="display: none;" RecordId="12" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_12" Runat="server"  />		
        </div>
	   <div style="width: 250px; float: left;">
	   <strong>Surgery Date</strong>
	   <euc:EformTextBox RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_12" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True" AppendToOnChange="copyGastricLaparoscopyProcData()" />
	        <euc:EformHidden  RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_12" Runat="server" />		
	        <euc:EformTextBox style="display: none;" RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpQuality" ID="OpQuality_12" Runat="server"  />		
			<euc:EformTextBox style="display: none;" RecordId="12" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_12" Runat="server"  />
			<euc:EformTextBox style="display: none;" RecordId="12" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_12" Runat="server"  />
	        <euc:EformTextBox style="display: none;" RecordId="12" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_12" Runat="server"  />		

        </div>
	   </td>
      </tr>
      <tr><td>
      
      	   
      
           
	   <strong>Institution</strong>
	  		<euc:EFormComboBox RecordId="12" Table="Procedures" Field="ProcInstitution" id="ProcInstitution_12" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True" Uncheckable="true"  />
	        <euc:EformTextBox style="display: none;" RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpInstitution" ID="OpInstitution_12" Runat="server"  />		
 			</td>
      </tr>
      <tr><td>
      	   	   <strong>Service</strong>&nbsp;&nbsp;
                <euc:EformRadioButtonList Table="OperatingRoomDetails" Field="OpService" id="OpService_12" runat="server" 
	            RepeatLayout="Flow" ShowOther="true" RecordId="12" RepeatDirection="Horizontal" >
		            <asp:ListItem >GMT</asp:ListItem>
		            <asp:ListItem >Thoracic</asp:ListItem>
		            <asp:ListItem >Hepatopancreatobilliary</asp:ListItem>
		        </euc:EformRadioButtonList>
		        
			<euc:EformTextBox style="display: none;" RecordId="12" TABLE="Procedures" FIELD="ProcService" ID="ProcService_12" Runat="server"  />
		        
      </td></tr>
      <tr >
       <td style="vertical-align: top;">

<strong>Admit Date</strong>
	   <euc:EformTextBox RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpAdmitDateText" ID="OpAdmitDateText_12" Runat="server" Width="80px" 
            ShowCalendar="True" CalcDate="True"  />
	        <euc:EformHidden  RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpAdmitDate" ID="OpAdmitDate_12" Runat="server" />	
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Discharge Date</strong> 
	   <euc:EformTextBox RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpDischargeDateText" ID="OpDischargeDateText_12" Runat="server" Width="80px" 
            ShowCalendar="True" CalcDate="True"  />
	        <euc:EformHidden  RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpDischargeDate" ID="OpDischargeDate_12" Runat="server" />		

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Operating Time</strong> (min)
	   <euc:EformTextBox RecordId="12" TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_12" Runat="server" Width="40px" ShowNumberPad="true"  />

	   	
        </td></tr>
        
          <tr>
            <td>
	           <strong>Indication</strong>
	  		        <euc:EFormSelect RecordId="12" Table="Procedures" Field="ProcIndication" id="ProcIndication_12" runat="server" LookupCode="Indication,Disease,Gastric" DropDownWidth="140" DropDownHeight="auto" style="width: 140px;"  />
 			
	           <strong style="margin-left: 50px;">Approach</strong>
	  		        <euc:EFormComboBox RecordId="12" Table="Procedures" Field="ProcApproach" id="ProcApproach_12" runat="server" LookupCode="OpApproach" DropDownWidth="250" style="width: 250px;"  />
 			</td>
        </tr>
        
      <tr><td>
      	   	   <strong>Procedure</strong>&nbsp;&nbsp;
      	   	   
      	   	   <euc:EFormComboBox RecordId="12" Table="Procedures" Field="ProcName" id="ProcName_12" runat="server" Width="300" DropDownWidth="300" LookupCode="ProcName,Disease,Gastric" />
<%--      	   	   
      	   	   
                <euc:EformRadioButtonList Table="Procedures" Field="ProcName" id="ProcName_12" runat="server" 
	            RepeatLayout="Flow" ShowOther="true" RecordId="12" RepeatDirection="Horizontal" >
		            <asp:ListItem >Laparoscopy w/ LUS</asp:ListItem>
		            <asp:ListItem >Laparoscopy w/ No LUS</asp:ListItem>
		        </euc:EformRadioButtonList>--%>
      </td></tr>
      
      <tr >
       <td style="vertical-align: top;">
       
       	   
	   </td>
      </tr>
	  <tr>
	  	<td id="GastricLapSiteTd">
		<strong >Site</strong>
		<euc:EFormComboBox Table="Procedures" Field="ProcSite" RecordId="12" id="ProcSite_12" LookupCode="BxSite" runat="server" />

		<strong style="margin-left: 50px;">Subsite</strong>
		<euc:EFormComboBox Table="Procedures" Field="ProcSubsite" RecordId="12" id="ProcSubsite_12" LookupCode="BxSubSite" runat="server">
		</euc:EFormComboBox>
		
	   <%--<euc:EformRadioButtonList Table="Procedures" Field="ProcSubsite" id="ProcSubsite_12" runat="server" 
	    RepeatLayout="Table" RecordId="12" RepeatDirection="Vertical" RepeatColumns="5" >
		    <asp:ListItem >Antrum/Pylorus</asp:ListItem>
			<asp:ListItem >Body/Middle 1/3</asp:ListItem>
		    <asp:ListItem >Whole Stomach</asp:ListItem>
			<asp:ListItem >Proximal/Upper 1/3</asp:ListItem>
			<asp:ListItem >GE Junction</asp:ListItem>
			<asp:ListItem >Fundus/Upper 1/3</asp:ListItem>
			<asp:ListItem >Cardia</asp:ListItem>
			<asp:ListItem >Anastomosis</asp:ListItem>
			<asp:ListItem >Remnant</asp:ListItem>
		</euc:EformRadioButtonList>--%>
		</td>
	  </tr>

 </table>
  
  <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Gastrectomy Details</span>
  
 <table border="0" cellspacing="0" id="resectionDetailsTable"> 
    <tr >
        <td style="font-weight: bold;">Residual Tumor</td>
       <td>
            <euc:EformRadioButtonList Table="GastricProc" Field="ProcResidualTumor" id="ProcResidualTumor_12" runat="server" 
	            RepeatLayout="Table" ShowOther="true" RecordId="12"  RepeatDirection="Horizontal"  >
		            <asp:ListItem >Stomach</asp:ListItem>
		            <asp:ListItem >Nodes</asp:ListItem>
		            <asp:ListItem >Peritoneum</asp:ListItem>
		            <asp:ListItem >None</asp:ListItem>
		        </euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Intent</td>
       <td >
		        <euc:EformSelect Table="GastricProc" Field="ProcIntent" id="ProcIntent_12" runat="server" 
	            RecordId="12"  LookupCode="ProcIntent" style="width: 90px;" DropDownHeight="auto" DropDownWidth="200" />
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Complete Resection</td>
       <td >
       <euc:EformSelect Table="GastricProc" Field="ProcCompleteResection" id="ProcCompleteResection_12" runat="server" 
	            RecordId="12"  LookupCode="GastricResection" style="width: 60px;" DropDownHeight="auto" DropDownWidth="200" ></euc:EformSelect>
       </td>
     </tr>
	 <%-- 
     <tr >
        <td style="font-weight: bold;">Proximal Margin Frozen</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcProximalMarginFrozen" id="ProcProximalMarginFrozen_12" runat="server" 
	            RepeatLayout="Table"  RecordId="12"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="GastricFrozenMargin" ></euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Distal Margin Frozen</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcDistalMarginFrozen" id="ProcDistalMarginFrozen_12" runat="server" 
	            RepeatLayout="Table"  RecordId="12"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="GastricFrozenMargin" ></euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Deep Frozen Margins </td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcDeepOtherMarginFrozen" id="ProcDeepOtherMarginFrozen_12" runat="server" 
	            RepeatLayout="Table"  RecordId="12"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="GastricFrozenMargin" ></euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Addtional Margin</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcAddMargin" id="ProcAddMargin_12" runat="server" 
	            RepeatLayout="Table"  RecordId="12"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="YesNoUnknown" ></euc:EformRadioButtonList>
       </td>
     </tr>--%>
     <tr >
        <td style="font-weight: bold;">IntraOp Ultrasound</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcIntraOpUS" id="ProcIntraOpUS_12" runat="server" 
	            RepeatLayout="Table"  RecordId="12"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="YesNoUnknown" ></euc:EformRadioButtonList>
       </td>
     </tr>
</table>

 
  <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Clinical Staging (UICC 2010)</span>
  
<%--  <euc:EformTextBox style="display: none;" RecordId="12" TABLE="GastricProc" FIELD="ProcIntent" ID="ProcIntent_12" Runat="server"  />
  <euc:EformTextBox style="display: none;" RecordId="12" TABLE="GastricProc" FIELD="ProcCompleteResection" ID="ProcCompleteResection_12" Runat="server"  />
--%>  <euc:EformTextBox style="display: none;" RecordId="12" TABLE="GastricProc" FIELD="ProcStageSystem" ID="ProcStageSystem_12" Runat="server"  />
<%--  <euc:EformTextBox style="display: none;" RecordId="12" TABLE="NodeProc" FIELD="ProcDissectionExtent" ID="ProcDissectionExtent_12" Runat="server"  />
--%> <table border="0" cellspacing="0" cellpadding="16" width="100%" > 
     <%-- <tr >
       <td style="vertical-align: top;">
       <strong>Staging System</strong>&nbsp;&nbsp;
       	 <euc:EFormComboBox RecordId="12" Table="GastricProc" Field="ProcStageSystem" id="ProcStageSystem_12" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" Width="90" DropDownWidth="260" DropDownHeight="auto" LookupCode="StagingSystem"  />
       </td>
     </tr>--%>
     <tr >
       <td style="vertical-align: top;">
       <strong>T Stage</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="12" Table="GastricProc" Field="ProcStageT" id="ProcStageT_12" runat="server" 
	    style="width: 40px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="StageClin_Gastric_10_T"  />
       
       <strong style="margin-left: 50px;">N Stage</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="12" Table="GastricProc" Field="ProcStageN" id="ProcStageN_12" runat="server" 
	     style="width: 40px;" DropDownWidth="350" DropDownHeight="auto" LookupCode="StageClin_Gastric_10_N"  />
       
       <strong style="margin-left: 50px;">M Stage</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="12" Table="GastricProc" Field="ProcStageM" id="ProcStageM_12" runat="server" 
	    style="width: 40px;" DropDownWidth="280" DropDownHeight="auto" LookupCode="StageClin_Gastric_10_M"  />
       
       </td>
     </tr>
</table>
 </td>
 </tr>
</table>
<br/><br/>

<script type="text/javascript">
function GastricLaparoscopyAttachShowHideScriptsAndSetInitialDisplay()
{
	var yesNoContainer = $('GastricLaparoscopyYesNonContainer');
	var yesNoRadios = yesNoContainer.getElementsByTagName('input');
	var showOnload = false;
	
	for (var i=0;i<yesNoRadios.length;i++)
	{
		if (yesNoRadios[i].type == 'radio')
		{
			yesNoRadios[i].onclick = function() {showHideGastricLaparoscopy(this)};
			if (yesNoRadios[i].checked && yesNoRadios[i].value.toString().toUpperCase() == 'YES') showOnload = true;
		}
	}
	
	if (showOnload) GastricLaparoscopyDetails.style.display = 'block';
	
}
GastricLaparoscopyAttachShowHideScriptsAndSetInitialDisplay();

function showHideGastricLaparoscopy(theRadio)
{
	var GastricLaparoscopyDetails = document.getElementById('GastricLaparoscopyDetails');
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		GastricLaparoscopyDetails.style.display = 'block';
		$('<% = OpQuality_12.ClientID %>').value = 'STD';
		$('<% = ProcQuality_12.ClientID %>').value = 'STD';
		$('<% = ProcSite_12.ClientID %>').value = 'Stomach';
		$('<% = ProcIntent_12.ClientID %>').value = 'Diagnostic';
		$('<% = ProcCompleteResection_12.ClientID %>').value = 'R3';
		$('<% = ProcStageSystem_12.ClientID %>').value = 'UICC_10';
//		$('ProcDissectionExtent_12.ClientID ').value = 'N/A';
		$('<% = ProcIndication_12.ClientID %>').value = 'Diagnostic';
		$('<% = ProcApproach_12.ClientID %>').value = 'Laparoscopic';
		$('<% = ProcName_12.ClientID %>').value = 'Diagnostic Laparoscopy';
		
		
		
		if ($('<% = ProcInstitution_12.ClientID %>').value.length < 1) $('<% = ProcInstitution_12.ClientID %>').value = 'Memorial Sloan Kettering Cancer Center';
		if ($('<% = OpInstitution_12.ClientID %>').value.length < 1) $('<% = OpInstitution_12.ClientID %>').value = 'Memorial Sloan Kettering Cancer Center';
	}
	else
	{
		GastricLaparoscopyDetails.style.display = 'none';
		clearAllElementsContainedInNode(GastricLaparoscopyDetails);
	}

}

function copyGastricLaparoscopyProcData()
{
	var OpDateTextField = $('<% = OpDateText_12.ClientID %>');
	var OpDateField = $('<% = OpDate_12.ClientID %>');
	var ProcDateTextField = $('<% = ProcDateText_12.ClientID %>');
	var ProcDateField = $('<% = ProcDate_12.ClientID %>');
	ProcDateTextField.value = OpDateTextField.value;
	ProcDateField.value = OpDateField.value;
	
	var ProcServiceField = $('<% = ProcService_12.ClientID %>');
	var OpServiceFieldContainer = $('<% = OpService_12.ClientID %>');
	var OpServiceFieldValue = getSelectedRadioButtonValGastricLap(OpServiceFieldContainer);
	ProcServiceField.value = OpServiceFieldValue;
	
    var ProcInstitutionField = $('<% = ProcInstitution_12.ClientID %>');
    var OpInstitutionField = $('<% = OpInstitution_12.ClientID %>');
	OpInstitutionField.value = ProcInstitutionField.value;
	
    var ProcSurgeonField = $('<% = ProcSurgeon_12.ClientID %>');
    var OpSurgeonField = $('<% = OpCaseSurgeon_12.ClientID %>');
	ProcSurgeonField.value = OpSurgeonField.value;
}

function getSelectedRadioButtonValGastricLap(container)
{
	var selectedVal = '';
	var containerInputs = container.getElementsByTagName('input');
	
	for (var j=0;j<containerInputs.length;j++)
	{
		if (containerInputs[j].type == 'radio' && containerInputs[j].checked == true)
		{
			if (containerInputs[j].value.length > 0)
			{ 
				selectedVal =  containerInputs[j].value;
				break;
			}
		}
		else if (containerInputs[j].type == 'text' && containerInputs[j].value.length > 0)
		{
			selectedVal =  containerInputs[j].value;
		}
	}
	
	return selectedVal;

}
var PastGastricProcsCount = <% = rptSurgicalHistory.Items.Count %>;

</script>