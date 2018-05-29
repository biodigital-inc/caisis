<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.GastricBiopsy" CodeFile="GastricBiopsy.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<%-- javascript moved to end of this file - jf --%>

<style type="text/css">
#GastricBiopsySubsiteTd td
{
	padding: 0px 10px 0px 0px;
}
#HistologyTd td
{
	padding: 0px 20px 0px 0px;
}	
</style>


<a name="GastricBiopsy" id="GastricBiopsy" />
<asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Biopsy Details"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="16" width="700" class="eformXLargePopulatedTable">
 <tr >
	<td style="white-space:nowrap;" id="gastricBiopsyYesNonContainer"><strong>Biopsy Performed?</strong><euc:EformRadioButtonList Table="NoTable" Field="BiopsyPerformed" id="BiopsyPerformed" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" style="margin-left: 30px;" >
		    <asp:ListItem Value="Yes" Text="Yes&nbsp;&nbsp;&nbsp;"></asp:ListItem>
            <asp:ListItem Value="No" Text="No&nbsp;&nbsp;&nbsp;"></asp:ListItem>
		</euc:EformRadioButtonList></td>
  </tr>
 <tr id="GastricBiopsyDetails" style="display: none;">
 <td style="padding: 0px;"   >
 <table border="0" cellspacing="0" cellpadding="16" width="100%" > 
     <tr >
       <td style="padding-top: 0px; vertical-align: top;">
	   
	   <strong>Diagnosis Date</strong>
	   <euc:EformTextBox RecordId="11" TABLE="Procedures" FIELD="ProcDateText" ID="ProcDateText_11" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True" />
	        <euc:EformHidden  RecordId="11" TABLE="Procedures" FIELD="ProcDate" ID="ProcDate_11" Runat="server" />		
	        <euc:EformTextBox style="display: none;" RecordId="11" TABLE="Procedures" FIELD="ProcQuality" ID="ProcQuality_11" Runat="server"  />		
	        <euc:EformTextBox style="display: none;" RecordId="11" TABLE="Procedures" FIELD="ProcName" ID="ProcName_11" Runat="server"  />	
			<euc:EformTextBox style="display: none;" RecordId="11" TABLE="Pathology" FIELD="PathSite" ID="PathSite_11" Runat="server"  />		
			<euc:EformTextBox style="display: none;" RecordId="11" TABLE="Pathology" FIELD="PathSubsite" ID="PathSubsite_11" Runat="server"  />		
			
	   </td>
      </tr>
      <tr>
	  	<td onclick="syncSiteAndSubsite()" onmouseout="syncSiteAndSubsite()">
		<strong>Site</strong>
	   <euc:EFormComboBox Table="Procedures" Field="ProcSite" RecordId="11" id="ProcSite" LookupCode="BxSite" runat="server" />
		</td>
	  </tr>
	  <tr>
	  	<td id="GastricBiopsySubsiteTd" onclick="syncSiteAndSubsite()" onmouseout="syncSiteAndSubsite()">
		<strong>Subsite</strong>
	   <euc:EformRadioButtonList Table="Procedures" Field="ProcSubsite" id="ProcSubsite" runat="server" 
	    RepeatLayout="Table" RecordId="11"  RepeatDirection="Vertical" RepeatColumns="5" >
		    <asp:ListItem >Antrum/Pylorus</asp:ListItem>
			<asp:ListItem >Body/Middle 1/3</asp:ListItem>
		    <asp:ListItem >Diffuse/Whole Stomach</asp:ListItem>
			<asp:ListItem >Proximal/Upper 1/3</asp:ListItem>
			<asp:ListItem >GE Junction</asp:ListItem>
			<asp:ListItem >Fundus/Upper 1/3</asp:ListItem>
			<asp:ListItem >Cardia</asp:ListItem>
			<asp:ListItem >Anastomosis</asp:ListItem>
			<asp:ListItem >Remnant</asp:ListItem>
		</euc:EformRadioButtonList>
		</td>
	  </tr>
	  <tr><td onclick="syncSiteAndSubsite()" onmouseout="syncSiteAndSubsite()">
	  	   <strong>Path Report Date</strong>
	  		<euc:EformTextBox RecordId="11" TABLE="Pathology" FIELD="PathDateText" ID="PathDateText_11" Runat="server" Width="100px" 
            ShowCalendar="True" CalcDate="True" />
	        <euc:EformHidden  RecordId="11" TABLE="Pathology" FIELD="PathDate" ID="PathDate_11" Runat="server" />		

	  </td></tr>
	  <tr><td>
	  	   <strong>Path SSL#</strong>
	  		<euc:EformTextBox RecordId="11" Table="Pathology" FIELD="PathNum" ID="PathNum" Runat="server" Width="100px" />
	  </td></tr>
	  <tr><td>
	  	   <strong>Specimen Type</strong>
	  		<euc:EformRadioButtonList RecordId="11" Table="Pathology" Field="PathSpecimenType" id="PathSpecimenType_11" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" LookupCode="SpecimenCollectionMethod,Disease,Gastric" Uncheckable="true" />
	  </td></tr>
	  <tr><td>
	  	   <strong>Result</strong>
	  		<euc:EformRadioButtonList RecordId="11" Table="Pathology" Field="PathResult" id="PathResult_11" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Vertical" RepeatColumns="2" LookupCode="BxResult" Uncheckable="true" />
	  </td></tr>
	  <tr><td>
	  <span onclick="setQualityBasedOnInstitution();">
	  	   <strong>Institution</strong>
	  		<euc:EFormComboBox RecordId="11" Table="Pathology" Field="PathInstitution" id="PathInstitution_11" runat="server" 
	    RepeatLayout="Flow" RepeatDirection="Horizontal" Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True"  />
		</span>
		
		<strong style="margin-left: 50px;">Data Quality</strong>&nbsp;&nbsp;
		<euc:EFormSelect RecordId="11" Table="Pathology" Field="PathQuality" id="PathQuality_11" runat="server" 
	    style="width: 80px;" DropDownWidth="230" DropDownHeight="auto" LookupCode="DataQuality"   />
		
		
		
	  </td></tr>
	  	  <tr>
	  	<td id="HistologyTd">
		<strong>Histology</strong>
	   <euc:EformRadioButtonList Table="Pathology" RecordId="11" Field="PathHistology" id="PathHistology_11" runat="server" 
	    RepeatLayout="Table" RepeatDirection="Vertical" LookupCode="PathHistology,Disease,Gastric" RepeatColumns="3" />
		</td>
	  </tr>

	  
 </table>
 </td>
 </tr>
</table>
<br/><br/>

<script type="text/javascript">
function attachShowHideScriptsAndSetInitialDisplay()
{
	var yesNoContainer = $('gastricBiopsyYesNonContainer');
	var yesNoRadios = yesNoContainer.getElementsByTagName('input');
	var showOnload = false;
	
	for (var i=0;i<yesNoRadios.length;i++)
	{
		if (yesNoRadios[i].type == 'radio')
		{
			yesNoRadios[i].onclick = function() {showHideBiopsy(this)};
			if (yesNoRadios[i].checked && yesNoRadios[i].value.toString().toUpperCase() == 'YES') showOnload = true;
		}
	}
	
	if (showOnload) GastricBiopsyDetails.style.display = 'block';
	
}
attachShowHideScriptsAndSetInitialDisplay();

function showHideBiopsy(theRadio)
{
	var GastricBiopsyDetails = document.getElementById('GastricBiopsyDetails');
	if (theRadio.value.toString().toUpperCase() == 'YES')
	{
		GastricBiopsyDetails.style.display = 'block';
		
		$('<% = ProcName_11.ClientID %>').value = 'Biopsy';
		$('<% = ProcQuality_11.ClientID %>').value = 'STD';
		$('<% = ProcSite.ClientID %>').value = 'Stomach';
		$('<% = PathSite_11.ClientID %>').value = 'Stomach';
		
		
		if ($('<% = PathInstitution_11.ClientID %>').value.length < 1)
		{
		    $('<% = PathInstitution_11.ClientID %>').value = 'Memorial Sloan Kettering Cancer Center';
		    $('<% = PathQuality_11.ClientID %>').value = 'STD';
		}
		
	}
	else
	{
		GastricBiopsyDetails.style.display = 'none';
		clearAllElementsContainedInNode(GastricBiopsyDetails);
	}

}

function setQualityBasedOnInstitution()
{
	if ($('<% = PathInstitution_11.ClientID %>').value.length > 0)
	{
	    if ($('<% = PathInstitution_11.ClientID %>').value == 'Memorial Sloan Kettering Cancer Center')
	    {
		    $('<% = ProcQuality_11.ClientID %>').value = 'STD';
		    $('<% = PathQuality_11.ClientID %>').value = 'STD';
	    }
	    else
	    {
		    $('<% = ProcQuality_11.ClientID %>').value = 'OUT';
		    $('<% = PathQuality_11.ClientID %>').value = 'OUT';
	    }
	
	}
}


function syncSiteAndSubsite()
{
    $('<% = PathSite_11.ClientID %>').value = $('<% = ProcSite.ClientID %>').value;

    var GastricBiopsySubsiteTd = $('GastricBiopsySubsiteTd');
    var subsiteRadios = GastricBiopsySubsiteTd.getElementsByTagName('input');
	
	for (var i=0;i<subsiteRadios.length;i++)
	{
		if (subsiteRadios[i].type == 'radio')
		{
			if (subsiteRadios[i].checked) $('<% = PathSubsite_11.ClientID %>').value = subsiteRadios[i].value;
		}
	}
}


</script>