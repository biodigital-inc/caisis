<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.GastricLaparoscopyPath" CodeFile="GastricLaparoscopyPath.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
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
</style>


<a name="GastricLaparoscopyPath" id="GastricLaparoscopyPath" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Pathology (Laparoscopy)"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;" id="GastricLaparoscopyPathYesNonContainer"><strong>Would you like to enter Pathology data for a Laparoscopic procedure?</strong><euc:EformRadioButtonList Table="NoTable" Field="LaparoscopyPathEntered" id="LaparoscopyPathEntered" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="GastricLaparoscopyPathDetails" style="display: none;">
 <td style="padding: 15px 0px 0px 0px; border-top: solid 1px #cccccc;"   >
 

<div id="LapPathologyTitleAndForeignKeys" style="text-align: right; width: 650px; margin-bottom: 20px;">
<span class="controlBoxTitle" style="float: left;margin-left: 16px; font-size: 13px;">Pathology Details</span>
<span style="font-size: 11px;"> For previously entered procedure (if applicable):
<euc:EformDropDownList TABLE="NoTable" FIELD="LaparoscopyPathPastProcedureId" Runat="server" ID="ProcedureId_1" 
                                LookupDistinct="Procedures;ProcedureId;COALESCE(ProcDateText,'') + ' : ' + COALESCE(ProcName,'');PatientId = @PatientId;ProcedureId DESC" Width="240px" /> </span><br />
  <span style="font-size: 11px;"> For previously entered surgery (if applicable):
<euc:EformDropDownList  TABLE="NoTable" FIELD="LaparoscopyPathPastORDetailId" Runat="server" ID="OperatingRoomDetailId_1" 
                                LookupDistinct="OperatingRoomDetails;OperatingRoomDetailId;COALESCE(OpDateText,'') + ' : ' + COALESCE(OpCaseSurgeon,'');PatientId = @PatientId;OperatingRoomDetailId DESC" Width="240px" /></span>
</div>  
 <table border="0" cellspacing="0" class="gastricPathTable"> 
      <tr><td><span class="controlBoxTitle" style="font-size: 12px;">Cytology</span>
      		<euc:EformTextBox style="display: none;" ParentRecordId="12" RecordId="1" TABLE="Pathology"  FIELD="PathSpecimenType" ID="PathSpecimenType_1" Runat="server"  /> 
      		<euc:EformTextBox style="display: none;" ParentRecordId="12" RecordId="1" TABLE="Pathology"  FIELD="PathHistology" ID="PathHistology_1" Runat="server"  />


      </td></tr>
      <tr >
       <td style="vertical-align: top;">
       <strong>Path Report Date</strong>&nbsp;&nbsp;
       	 <euc:EformTextBox ParentRecordId="12" RecordId="1" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_1" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True"  />
	        <euc:EformHidden  ParentRecordId="12" RecordId="1" TABLE="Pathology" FIELD="PathDate" ID="PathDate_1" Runat="server" />	
	        
	            <strong style="margin-left: 50px;">Path Accession #</strong>&nbsp;&nbsp;
	           <euc:EformTextBox ParentRecordId="12" RecordId="1" TABLE="Pathology" FIELD="PathNum" ID="PathNum_1" Runat="server" Width="80px" ShowNumberPad="true"   />

       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;" >
       <strong>Result</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect ParentRecordId="12" RecordId="1" Table="Pathology" Field="PathResult" id="PathResult_1" runat="server"
	    style="width: 100px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="BxResult,Disease,Gastric"  />
	        
	            <strong style="margin-left: 50px;">Institution</strong>&nbsp;&nbsp;
	  		<euc:EFormComboBox ParentRecordId="12" RecordId="1" Table="Pathology" Field="PathInstitution" id="PathInstitution_1" runat="server" 
	    Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True" />
       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;" >
            <strong >Site</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSite" ParentRecordId="12" RecordId="1" id="PathSite_1" LookupCode="BxSite" runat="server" />
		    <strong style="margin-left: 35px;">Subsite</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSubsite" ParentRecordId="12" RecordId="1" id="PathSubsite_1" LookupCode="BxSubSite" runat="server" />
            <strong style="margin-left: 35px;">Data Quality</strong>&nbsp;&nbsp;
            <euc:EformSelect  ParentRecordId="12" RecordId="1" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" DropDownWidth="240" Runat="server" ID="PathQuality_1" style="width: 35px;"/>
       </td>
     </tr>
<%--     <tr >
       <td style="vertical-align: top;">
	            <strong >2010 Peritoneal Cytology Staging</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect RecordId="12" Table="PathologyStageGrade" Field="PathStageT" id="PathStageT_12" runat="server" 
	    style="width: 40px;" DropDownWidth="450" DropDownHeight="auto" LookupCode="StagePath_Gastric_10_T"  />
       </td>
     </tr>
--%></table>
 
 <table border="0" cellspacing="0" class="gastricPathTable"> 
      <tr><td><span class="controlBoxTitle" style="font-size: 12px;">Biopsy</span>

      </td></tr>
      <tr >
       <td style="vertical-align: top;">
       <strong>Path Report Date</strong>&nbsp;&nbsp;
       	 <euc:EformTextBox ParentRecordId="12" RecordId="2" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_2" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True"  />
	        <euc:EformHidden  ParentRecordId="12" RecordId="2" TABLE="Pathology" FIELD="PathDate" ID="PathDate_2" Runat="server" />	
	        
	            <strong style="margin-left: 50px;">Path Accession #</strong>&nbsp;&nbsp;
	           <euc:EformTextBox ParentRecordId="12" RecordId="2" TABLE="Pathology" FIELD="PathNum" ID="PathNum_2" Runat="server" Width="80px" ShowNumberPad="true"   />

       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;">
       <strong>Result</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect ParentRecordId="12" RecordId="2" Table="Pathology" Field="PathResult" id="PathResult_2" runat="server" 
	    style="width: 100px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="BxResult,Disease,Gastric"  />
	        
	            <strong style="margin-left: 50px;">Institution</strong>&nbsp;&nbsp;
	  		<euc:EFormComboBox ParentRecordId="12" RecordId="2" Table="Pathology" Field="PathInstitution" id="PathInstitution_2" runat="server" 
	    Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True" />
       </td>
     </tr><tr >
       <td style="vertical-align: top;" >
            <strong >Site</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSite" ParentRecordId="12" RecordId="2" id="PathSite_2" LookupCode="BxSite" runat="server" />
		    <strong style="margin-left: 35px;">Subsite</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSubsite" ParentRecordId="12" RecordId="2" id="PathSubsite_2" LookupCode="BxSubSite" runat="server" />
            <strong style="margin-left: 35px;">Data Quality</strong>&nbsp;&nbsp;
            <euc:EformSelect  ParentRecordId="12" RecordId="2" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" DropDownWidth="240" Runat="server" ID="PathQuality_2" style="width: 35px;"/>
       </td>
     </tr>
</table>

 <table border="0" cellspacing="0" class="gastricPathTable"> 
      <tr><td><span class="controlBoxTitle" style="font-size: 12px;">Brushing</span>


      </td></tr>
      <tr >
       <td style="vertical-align: top;">
       <strong>Path Report Date</strong>&nbsp;&nbsp;
       	 <euc:EformTextBox ParentRecordId="12" RecordId="3" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_3" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True"  />
	        <euc:EformHidden  ParentRecordId="12" RecordId="3" TABLE="Pathology" FIELD="PathDate" ID="PathDate_3" Runat="server" />	
	        
	            <strong style="margin-left: 50px;">Path Accession #</strong>&nbsp;&nbsp;
	           <euc:EformTextBox ParentRecordId="12" RecordId="3" TABLE="Pathology" FIELD="PathNum" ID="PathNum_3" Runat="server" Width="80px" ShowNumberPad="true"   />

       </td>
     </tr>
     <tr >
       <td style="vertical-align: top;">
       <strong>Result</strong>&nbsp;&nbsp;
       	 <euc:EFormSelect ParentRecordId="12" RecordId="3" Table="Pathology" Field="PathResult" id="PathResult_3" runat="server" 
	    style="width: 100px;" DropDownWidth="550" DropDownHeight="auto" LookupCode="BxResult,Disease,Gastric"  />
	        
	            <strong style="margin-left: 50px;">Institution</strong>&nbsp;&nbsp;
	  		<euc:EFormComboBox ParentRecordId="12" RecordId="3" Table="Pathology" Field="PathInstitution" id="PathInstitution_3" runat="server" 
	    Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True" />
       </td>
     </tr><tr >
       <td style="vertical-align: top;" >
            <strong >Site</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSite" ParentRecordId="12" RecordId="3" id="PathSite_3" LookupCode="BxSite" runat="server" />
		    <strong style="margin-left: 35px;">Subsite</strong>
		    <euc:EFormComboBox Table="Pathology" Field="PathSubsite" ParentRecordId="12" RecordId="3" id="PathSubsite_3" LookupCode="BxSubSite" runat="server" />
            <strong style="margin-left: 35px;">Data Quality</strong>&nbsp;&nbsp;
            <euc:EformSelect  ParentRecordId="12" RecordId="3" LookupCode="DataQuality" TABLE="Pathology" FIELD="PathQuality" DropDownHeight="auto" DropDownWidth="240" Runat="server" ID="PathQuality_3" style="width: 35px;"/>
       </td>
     </tr>
</table>
 </td>
 </tr>
</table>
<br/><br/>

<script type="text/javascript">
function GastricLaparoscopyPathAttachShowHideScriptsAndSetInitialDisplay()
{
	var yesNoContainer = $('GastricLaparoscopyPathYesNonContainer');
	var yesNoRadios = yesNoContainer.getElementsByTagName('input');
	var showOnload = false;
	
	for (var i=0;i<yesNoRadios.length;i++)
	{
		if (yesNoRadios[i].type == 'radio')
		{
			yesNoRadios[i].onclick = function() {showHideGastricLaparoscopyPath(this)};
			if (yesNoRadios[i].checked && yesNoRadios[i].value.toString().toUpperCase() == 'YES') showOnload = true;
		}
	}
	
	if (showOnload) GastricLaparoscopyPathDetails.style.display = 'block';
	
}
GastricLaparoscopyPathAttachShowHideScriptsAndSetInitialDisplay();

function showHideGastricLaparoscopyPath(theRadio)
{
	var GastricLaparoscopyPathDetails = document.getElementById('GastricLaparoscopyPathDetails');
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		GastricLaparoscopyPathDetails.style.display = 'block';
//		$('ProcDissectionExtent_12.ClientID ').value = 'N/A';
	}
	else
	{
		GastricLaparoscopyPathDetails.style.display = 'none';
		clearAllElementsContainedInNode(GastricLaparoscopyPathDetails);
	}

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



function setInitialLapPathLinkDisplay()
{
//    SetPathLinkToExistingProcedure();

    if (typeof PastGastricProcsCount != 'undefined' && PastGastricProcsCount == 0)
    {
        $('LapPathologyTitleAndForeignKeys').style.display = 'none';
    }
    
    
}
setInitialLapPathLinkDisplay();
</script>
<%--
        if ($('<% = PathResult_1.ClientID %>').value.indexOf('Positive') > -1)
        {
            $('<% = ProcStageM_12.ClientID %>').value = 'M1';
        }

 --%>