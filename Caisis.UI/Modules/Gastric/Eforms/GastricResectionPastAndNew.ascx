<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.GastricResectionPastAndNew" CodeFile="GastricResectionPastAndNew.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
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
#resectionDetailsTable
{
    border-bottom: solid 1px #cccccc; 
    margin: 10px 0px 15px 16px;
    width: 100%;
}
#resectionGastricPathTable
{
    border-bottom: solid 1px #cccccc;
    margin-bottom: 15px;
    margin-top: 12px;
}
#resectionGastricPathTable td
{
    padding: 4px 4px 4px 16px;
}
#resectionPathNodeFindingsTable
{
    border-bottom: solid 1px #cccccc;
    margin-bottom: 15px;
    margin-top: 12px;
}
#resectionPathStagesTable
{
    border-bottom: solid 1px #cccccc;
    margin-bottom: 15px;
    margin-top: 12px;
}
#resectionPathStagesTable td
{
    padding: 4px 4px 4px 16px;
}
#resectionPathTestsTable
{
    margin-bottom: 15px;
}
#resectionPathTestsTable td
{

}

</style>


<a name="GastricResectionPastAndNew" id="GastricResectionPastAndNew" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Resection"></asp:Label>

<asp:Literal ID="SurgicalHistoryMsg" runat="server" Visible="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Listed here are this patient's past resections. Click a record to edit.</asp:Literal><br/>
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
	<td style="white-space:nowrap;padding-top: 20px; padding-bottom: 20px;" id="GastricResectionYesNoContainer">
	
	<asp:Label ID="NoResectionHistoryMsg" runat="server">No prior gastric resection procedures have been recorded for this patient.<br /><br />
	<strong>Would you like to enter a new resection procedure?</strong></asp:Label>
	<asp:Label ID="ResectionHistoryMsg" runat="server" Visible="false"><strong>Would you like to enter data <em>for an additional resection not listed above</em>?</strong></asp:Label>
	
	
	<euc:EformRadioButtonList Table="NoTable" Field="ResectionPerformed" id="ResectionPerformedPerformed" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="GastricResectionDetails" style="display: none;">
 <td style="padding: 15px 0px 0px 0px; border-top: solid 1px #cccccc;"   onclick="copyGastricResectionProcData();" >
 
 <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">OR &amp; Procedure Details</span>
 
 <table border="0" cellspacing="0" cellpadding="16" width="100%" style="border-bottom: solid 1px #cccccc; margin-bottom: 15px;" > 
     <tr >
       <td style="vertical-align: top;">
	   <div style="width: 400px; float: right;">
            <strong>Case Surgeon</strong> <euc:EformComboBox ShowLabel="false" Width="140" DropDownWidth="140" LookupDistinct="Appointments;ApptPhysician;ApptPhysician" id="OpCaseSurgeon_14" Table="OperatingRoomDetails" RecordId="14" Field="OpCaseSurgeon" runat="server" />
	        <euc:EformTextBox style="display: none;" RecordId="14" TABLE="Procedures" FIELD="ProcSurgeon" ID="ProcSurgeon_14" Runat="server"  />
	       <strong> Type</strong><euc:EformComboBox ShowLabel="false" Width="80" DropDownWidth="100" id="ProcSurgeonType_14" Table="Procedures" RecordId="14" Field="ProcSurgeonType" LookupCode="PhysicianLevel" runat="server" />		
        </div>
	   <div style="width: 225px; float: left;">
	   <strong>Surgery Date</strong>
	   <euc:EformTextBox RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpDateText" ID="OpDateText_14" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True" AppendToOnChange="copyGastricResectionProcData()" />
	        <euc:EformHidden  RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpDate" ID="OpDate_14" Runat="server" />		
	        <euc:EformTextBox style="display: none;" RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpQuality" ID="OpQuality_14" Runat="server"  />		
			<euc:EformTextBox style="display: none;" RecordId="14" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_14" Runat="server"  />
			<euc:EformTextBox style="display: none;" RecordId="14" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_14" Runat="server"  />
	        <euc:EformTextBox style="display: none;" RecordId="14" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_14" Runat="server"  />		

        </div>
	   </td>
      </tr>
      <tr><td>
      
      	   
      
           
	   <strong>Institution</strong>
	  		<euc:EFormComboBox RecordId="14" Table="Procedures" Field="ProcInstitution" id="ProcInstitution_14" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True" Uncheckable="true"  />
	        <euc:EformTextBox style="display: none;" RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpInstitution" ID="OpInstitution_14" Runat="server"  />		
 			</td>
      </tr>
      <tr><td>
      	   	   <strong>Service</strong>&nbsp;&nbsp;
                <euc:EformRadioButtonList Table="OperatingRoomDetails" Field="OpService" id="OpService_14" runat="server" 
	            RepeatLayout="Flow" ShowOther="true" RecordId="14" RepeatDirection="Horizontal" >
		            <asp:ListItem >GMT</asp:ListItem>
		            <asp:ListItem >Thoracic</asp:ListItem>
		            <asp:ListItem >Hepatopancreatobilliary</asp:ListItem>
		        </euc:EformRadioButtonList>
		        
			<euc:EformTextBox style="display: none;" RecordId="14" TABLE="Procedures" FIELD="ProcService" ID="ProcService_14" Runat="server"  />
		        
      </td></tr>
      <tr >
       <td style="vertical-align: top;">

<strong>Admit Date</strong>
	   <euc:EformTextBox RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpAdmitDateText" ID="OpAdmitDateText_14" Runat="server" Width="80px" 
            ShowCalendar="True" CalcDate="True"  />
	        <euc:EformHidden  RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpAdmitDate" ID="OpAdmitDate_14" Runat="server" />	
	        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Discharge Date</strong> 
	   <euc:EformTextBox RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpDischargeDateText" ID="OpDischargeDateText_14" Runat="server" Width="80px" 
            ShowCalendar="True" CalcDate="True"  />
	        <euc:EformHidden  RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpDischargeDate" ID="OpDischargeDate_14" Runat="server" />		

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Operating Time</strong> (min)
	   <euc:EformTextBox RecordId="14" TABLE="OperatingRoomDetails" FIELD="OpDuration" ID="OpDuration_14" Runat="server" Width="40px" ShowNumberPad="true"  />

	   	
        </td></tr>
        
         <tr>
            <td>
	           <strong>Indication</strong>
	  		        <euc:EFormSelect RecordId="14" Table="Procedures" Field="ProcIndication" id="ProcIndication_14" runat="server" LookupCode="Indication,Disease,Gastric" DropDownWidth="250" DropDownHeight="auto" Width="250"  />
 			</td>
        </tr>
        
      <tr><td>
      	   	   <strong>Procedure</strong>&nbsp;&nbsp;
                <euc:EformRadioButtonList Table="Procedures" Field="ProcName" id="ProcName_14" runat="server" 
	            RepeatLayout="Table" ShowOther="true" RecordId="14"  RepeatDirection="Vertical" RepeatColumns="2" >

					<asp:ListItem >Laparoscopic Total Gastrectomy</asp:ListItem>
					<asp:ListItem >Laparoscopic Distal Gastrectomy</asp:ListItem>
					<asp:ListItem >Laparoscopic Proximal Gastrectomy</asp:ListItem>
					<asp:ListItem >Laparoscopic Wedge Resection</asp:ListItem>
					<asp:ListItem >Other/Bypass</asp:ListItem>
					<asp:ListItem >Laparoscopic Esophagogastrectomy Proximal</asp:ListItem>
					<asp:ListItem >Laparoscopic Esophagogastrectomy Total</asp:ListItem>
					<asp:ListItem >Other Resection</asp:ListItem>
					<asp:ListItem >Other surgery/Gastric Cancer</asp:ListItem>
					<asp:ListItem >Distal Gastrectomy</asp:ListItem>
					<asp:ListItem >Proximal Gastrectomy</asp:ListItem>
					<asp:ListItem >Total Gastrectomy</asp:ListItem>
					<asp:ListItem >Esophagogastrectomy Total</asp:ListItem>
					<asp:ListItem >Esophagogastrectomy Proximal</asp:ListItem>
					<asp:ListItem >Robotic Esophagogastrectomy Proximal</asp:ListItem>
					<asp:ListItem >Robotic Esophagogastrectomy Total</asp:ListItem>
					<asp:ListItem >Bypass/Gastrojejunostomy</asp:ListItem>
					<asp:ListItem >Exploratory Laparotomy</asp:ListItem>
					<asp:ListItem >Wedge Resection</asp:ListItem>
					<asp:ListItem >Completion Gastrectomy</asp:ListItem>

<%--
		            <asp:ListItem >Distal Sub Gastrectomy</asp:ListItem>
		            <asp:ListItem >Proximal Sub Gastrectomy</asp:ListItem>
		            <asp:ListItem >Total Gastrectomy</asp:ListItem>
		            <asp:ListItem >Esophago/Proxgastrectomy</asp:ListItem>
		            <asp:ListItem >Esophago/Total Gastrectomy</asp:ListItem>
		            <asp:ListItem >Wedge Resection</asp:ListItem>
		            <asp:ListItem >Exp Lap (+/-) Bx</asp:ListItem>
		            <asp:ListItem >Laparoscopic Dist Gastrectomy</asp:ListItem>
		            <asp:ListItem >Laparoscopic Prox Gastrectomy</asp:ListItem>
		            <asp:ListItem >Laparoscopic Total Gastrectomy</asp:ListItem>
		            <asp:ListItem >Laparoscopic Wedge Resection</asp:ListItem>
		            <asp:ListItem >Laparoscopy w/ LUS</asp:ListItem>
		            <asp:ListItem >Laparoscopy w/ No LUS</asp:ListItem>
		            <asp:ListItem >Other Resection</asp:ListItem>
		            <asp:ListItem >Bypass/Gastrojejunostomy</asp:ListItem>
		            <asp:ListItem >Other Bypass</asp:ListItem>
		            <asp:ListItem >Other Surgery/Gastric Ca</asp:ListItem>
		            <asp:ListItem >EMR (Endomucosal Resection)</asp:ListItem>
--%>		            
		        </euc:EformRadioButtonList>
      </td></tr>
      
      <tr >
       <td style="vertical-align: top;">
       
       	   
	   </td>
      </tr>
	  <tr>
	  	<td id="GastricLapSiteTd">
	  	
	  	<!-- TODO: should be defaulted to "Stomach" -->
        <strong>Site</strong>
		<euc:EFormComboBox Table="Procedures" Field="ProcSite" RecordId="14" id="ProcSite_14" LookupCode="BxSite" runat="server" />
		<br /><br /><br /><strong>Subsite</strong>


		
	   <euc:EformRadioButtonList Table="Procedures" Field="ProcSubsite" id="ProcSubsite_14" runat="server" 
	    RepeatLayout="Table" RecordId="14" RepeatDirection="Horizontal">
		    <asp:ListItem >Antrum/Pylorus</asp:ListItem>
			<asp:ListItem >Body/Middle 1/3</asp:ListItem>
		    <asp:ListItem >Whole Stomach</asp:ListItem>
			<asp:ListItem >Proximal/Upper 1/3</asp:ListItem>
			<asp:ListItem >GE Junction</asp:ListItem>
	<%--    <asp:ListItem >Fundus/Upper 1/3</asp:ListItem>
			<asp:ListItem >Cardia</asp:ListItem>
			<asp:ListItem >Anastomosis</asp:ListItem>
			<asp:ListItem >Remnant</asp:ListItem>--%>
		</euc:EformRadioButtonList>
		</td>
	  </tr>

 </table>
  
  <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Gastrectomy Details</span>
  
 <table border="0" cellspacing="0" id="resectionDetailsTable"> 
    <tr >
        <td style="font-weight: bold;">Residual Tumor</td>
       <td>
            <euc:EformRadioButtonList Table="GastricProc" Field="ProcResidualTumor" id="ProcResidualTumor_14" runat="server" 
	            RepeatLayout="Table" ShowOther="true" RecordId="14"  RepeatDirection="Horizontal"  >
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
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcIntent" id="ProcIntent_14" runat="server" 
	            RepeatLayout="Table"  RecordId="14"  RepeatDirection="Horizontal" Uncheckable="true"  >
		            <asp:ListItem >Curative</asp:ListItem>
		            <asp:ListItem >Palliative</asp:ListItem>
		            <asp:ListItem >Not Resected</asp:ListItem>
		        </euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Complete Resection</td>
       <td >
       <euc:EformSelect Table="GastricProc" Field="ProcCompleteResection" id="ProcCompleteResection_14" runat="server" 
	            RecordId="14"  LookupCode="GastricResection" style="width: 60px;" DropDownHeight="auto" DropDownWidth="200" ></euc:EformSelect>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Proximal Margin Frozen</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcProximalMarginFrozen" id="ProcProximalMarginFrozen_14" runat="server" 
	            RepeatLayout="Table"  RecordId="14"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="GastricFrozenMargin" ></euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Distal Margin Frozen</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcDistalMarginFrozen" id="ProcDistalMarginFrozen_14" runat="server" 
	            RepeatLayout="Table"  RecordId="14"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="GastricFrozenMargin" ></euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Deep Frozen Margins </td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcDeepOtherMarginFrozen" id="ProcDeepOtherMarginFrozen_14" runat="server" 
	            RepeatLayout="Table"  RecordId="14"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="GastricFrozenMargin" ></euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">Addtional Margin</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcAddMargin" id="ProcAddMargin_14" runat="server" 
	            RepeatLayout="Table"  RecordId="14"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="YesNoUnknown" ></euc:EformRadioButtonList>
       </td>
     </tr>
     <tr >
        <td style="font-weight: bold;">IntraOp Ultrasound</td>
       <td >
       <euc:EformRadioButtonList Table="GastricProc" Field="ProcIntraOpUS" id="ProcIntraOpUS_14" runat="server" 
	            RepeatLayout="Table"  RecordId="14"  RepeatDirection="Horizontal" Uncheckable="true" LookupCode="YesNoUnknown" ></euc:EformRadioButtonList>
       </td>
     </tr>
</table>


 
  <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Clinical Staging (UICC 2010)</span>
  
  <euc:EformTextBox style="display: none;" RecordId="14" TABLE="GastricProc" FIELD="ProcStageSystem" ID="ProcStageSystem_14" Runat="server"  />
 <table border="0" cellspacing="0" cellpadding="16" width="100%" style="border-bottom: solid 1px #cccccc; margin-bottom: 15px;" > 
     <tr >
       <td style="vertical-align: top;">
       <strong>T Stage</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="14" Table="GastricProc" Field="ProcStageT" id="ProcStageT_14" runat="server" 
	    style="width: 40px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="StageClin_Gastric_10_T"  />
       
       <strong style="margin-left: 50px;">N Stage</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="14" Table="GastricProc" Field="ProcStageN" id="ProcStageN_14" runat="server" 
	     style="width: 40px;" DropDownWidth="350" DropDownHeight="auto" LookupCode="StageClin_Gastric_10_N"  />
       
       <strong style="margin-left: 50px;">M Stage</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="14" Table="GastricProc" Field="ProcStageM" id="ProcStageM_14" runat="server" 
	    style="width: 40px;" DropDownWidth="280" DropDownHeight="auto" LookupCode="StageClin_Gastric_10_M"  />
       
       </td>
     </tr>
</table>


  <span class="controlBoxTitle" style="margin-left: 16px; font-size: 13px;">Node Details</span>
 <table border="0" cellspacing="0" cellpadding="16" width="100%"> 
 
     <tr >
       <td style="vertical-align: top;">
       <strong>Dissection Extent</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect TABLE="NodeProc" FIELD="ProcDissectionExtent" RecordId="14" ID="ProcDissectionExtent_14"  runat="server" 
	    style="width: 90px;" DropDownWidth="90" DropDownHeight="auto" LookupCode="NodeDissectionExtent,Disease,Gastric"  />
       </td>
     </tr>
</table>

     </td>
     </tr>
     </table>
<br/><br/>


<script type="text/javascript">
function GastricResectionAttachShowHideScriptsAndSetInitialDisplay()
{
	var yesNoContainer = $('GastricResectionYesNoContainer');
	var yesNoRadios = yesNoContainer.getElementsByTagName('input');
	var showOnload = false;
	
	for (var i=0;i<yesNoRadios.length;i++)
	{
		if (yesNoRadios[i].type == 'radio')
		{
			yesNoRadios[i].onclick = function() {showHideGastricResection(this)};
			if (yesNoRadios[i].checked && yesNoRadios[i].value.toString().toUpperCase() == 'YES') showOnload = true;
		}
	}
	
	if (showOnload) GastricResectionDetails.style.display = 'block';
	
	
	
}
GastricResectionAttachShowHideScriptsAndSetInitialDisplay();

function showHideGastricResection(theRadio)
{
	var GastricResectionDetails = document.getElementById('GastricResectionDetails');
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		GastricResectionDetails.style.display = 'block';
		$('<% = OpQuality_14.ClientID %>').value = 'STD';
		$('<% = ProcQuality_14.ClientID %>').value = 'STD';
		$('<% = ProcSite_14.ClientID %>').value = 'Stomach';
		$('<% = ProcCompleteResection_14.ClientID %>').value = 'R3';
		$('<% = ProcStageSystem_14.ClientID %>').value = 'UICC_10';
		$('<% = ProcSurgeonType_14.ClientID %>').value = 'Attending';
		
		if ($('<% = ProcInstitution_14.ClientID %>').value.length < 1) $('<% = ProcInstitution_14.ClientID %>').value = 'Memorial Sloan Kettering Cancer Center';
		if ($('<% = OpInstitution_14.ClientID %>').value.length < 1) $('<% = OpInstitution_14.ClientID %>').value = 'Memorial Sloan Kettering Cancer Center';
	}
	else
	{
		GastricResectionDetails.style.display = 'none';
		clearAllElementsContainedInNode(GastricResectionDetails);
	}
}



function copyGastricResectionProcData()
{
	var OpDateTextField = $('<% = OpDateText_14.ClientID %>');
	var OpDateField = $('<% = OpDate_14.ClientID %>');
	var ProcDateTextField = $('<% = ProcDateText_14.ClientID %>');
	var ProcDateField = $('<% = ProcDate_14.ClientID %>');
	ProcDateTextField.value = OpDateTextField.value;
	ProcDateField.value = OpDateField.value;
	
	var ProcServiceField = $('<% = ProcService_14.ClientID %>');
	var OpServiceFieldContainer = $('<% = OpService_14.ClientID %>');
	var OpServiceFieldValue = getSelectedRadioButtonValGastricResection(OpServiceFieldContainer);
	ProcServiceField.value = OpServiceFieldValue;
	
    var ProcInstitutionField = $('<% = ProcInstitution_14.ClientID %>');
    var OpInstitutionField = $('<% = OpInstitution_14.ClientID %>');
	OpInstitutionField.value = ProcInstitutionField.value;
	
    var ProcSurgeonField = $('<% = ProcSurgeon_14.ClientID %>');
    var OpSurgeonField = $('<% = OpCaseSurgeon_14.ClientID %>');
	ProcSurgeonField.value = OpSurgeonField.value;
}

function getSelectedRadioButtonValGastricResection(container)
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

var PastGastricResectsCount = <% = rptSurgicalHistory.Items.Count %>;

</script>