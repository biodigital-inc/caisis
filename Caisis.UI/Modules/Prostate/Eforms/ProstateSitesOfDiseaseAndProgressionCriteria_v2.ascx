<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSitesOfDiseaseAndProgressionCriteria_v2" CodeFile="ProstateSitesOfDiseaseAndProgressionCriteria_v2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<script type="text/javascript">

function updateProstateSitesOfDiseaseDate()
{
	var ProstateSitesOfDiseaseDateText = document.getElementById('<% = SurveyDateText_1.ClientID %>');
	var ProstateSitesOfDiseaseDate = document.getElementById('<% = SurveyDate_1.ClientID %>');
	var EncounterDateText = document.getElementById('<% = EncDateText.ClientID %>');
	var EncounterDate = document.getElementById('<% = EncDate.ClientID %>');
	
	if (ProstateSitesOfDiseaseDateText.value.length < 1)
	{
	    ProstateSitesOfDiseaseDateText.value = EncounterDateText.value;
	    ProstateSitesOfDiseaseDate.value = EncounterDate.value;
    }
    activateProstateSitesOfDiseaseSurveyHiddenFields();

}
function activateProstateSitesOfDiseaseSurveyHiddenFields()
{
	var ProstateSitesOfDiseaseDateText = document.getElementById('<% = SurveyDateText_1.ClientID %>');
	var ProstateSitesOfDiseaseDate = document.getElementById('<% = SurveyDate_1.ClientID %>');
	var ProstateSitesOfDiseaseSurveyType = document.getElementById('<% = SurveyType_1.ClientID %>');


	var ProstateSitesOfDiseaseContainer = document.getElementById('ProstateSitesOfDiseaseContainer');
	var ProstateSitesOfDiseaseInputs = ProstateSitesOfDiseaseContainer.getElementsByTagName("input");
	var activateHiddens = false;
	
	for (var i = 0; i < ProstateSitesOfDiseaseInputs.length; i++) { 
        var Input = ProstateSitesOfDiseaseInputs[i];
        if (Input.type == 'radio' && Input.checked) { activateHiddens = true; }
    }
    
//    ProstateSitesOfDiseaseDateText.disabled = !activateHiddens;
//    ProstateSitesOfDiseaseDate.disabled = !activateHiddens;
      ProstateSitesOfDiseaseSurveyType.value = 'Prostate Sites of Disease';
}

function updateProstateProgressionCriteriaDate()
{
	var ProstateProgressionCriteriaDateText = document.getElementById('<% = SurveyDateText_2.ClientID %>');
	var ProstateProgressionCriteriaDate = document.getElementById('<% = SurveyDate_2.ClientID %>');
//	var EncounterDateText = document.getElementById('<% = EncDateText.ClientID %>');
//	var EncounterDate = document.getElementById('<% = EncDate.ClientID %>');
	var ProstateSitesOfDiseaseDateText = document.getElementById('<% = SurveyDateText_1.ClientID %>');
	var ProstateSitesOfDiseaseDate = document.getElementById('<% = SurveyDate_1.ClientID %>');
	
//	ProstateProgressionCriteriaDateText.value = EncounterDateText.value;
//	ProstateProgressionCriteriaDate.value = EncounterDate.value;
	ProstateProgressionCriteriaDateText.value = ProstateSitesOfDiseaseDateText.value;
	ProstateProgressionCriteriaDate.value = ProstateSitesOfDiseaseDate.value;
	
	activateSurveyHiddenFields();
}

function activateSurveyHiddenFields()
{
	var ProstateProgressionCriteriaDateText = document.getElementById('<% = SurveyDateText_2.ClientID %>');
	var ProstateProgressionCriteriaDate = document.getElementById('<% = SurveyDate_2.ClientID %>');
	var ProstateProgressionCriteriaSurveyType = document.getElementById('<% = SurveyType_2.ClientID %>');


	var ProstateProgressionCriteriaContainer = document.getElementById('ProstateProgressionCriteriaContainer');
	var ProstateProgressionCriteriaInputs = ProstateProgressionCriteriaContainer.getElementsByTagName("input");
	var activateHiddens = false;
	
	for (var i = 0; i < ProstateProgressionCriteriaInputs.length; i++) { 
        var Input = ProstateProgressionCriteriaInputs[i];
        if (Input.type == 'radio' && Input.checked) { activateHiddens = true; }
    }
    
    ProstateProgressionCriteriaDateText.disabled = !activateHiddens;
    ProstateProgressionCriteriaDate.disabled = !activateHiddens;
    ProstateProgressionCriteriaSurveyType.disabled = !activateHiddens;
}
//previous site of disease values
var prevValue_Bone = '';
var prevValue_LymphNodes = '';
var prevValue_Lung = '';
var prevValue_Liver = '';
var prevValue_LocalDisease = '';


var PrevSitesOfDiseaseValArray = new Array();

function PrevSitesOfDiseaseRecord(site, presentAbsent, presentCBoxId, absentCBoxId) {
    this.Site = site;
    this.PresentAbsent = presentAbsent;
    this.PresentCBoxId = presentCBoxId;
    this.AbsentCBoxId = absentCBoxId;
}

function registerSitesOfDiseaseRecords()
{
    <asp:Literal ID="PrevSitesOfDiseaseVals" runat="server" />
}
registerSitesOfDiseaseRecords();

function populatePreviousSites()
{
    numSites = PrevSitesOfDiseaseValArray.length;
    
    if (numSites > 0)
    {
        activateProstateSitesOfDiseaseSurveyHiddenFields();
	    for (var i = 0; i < numSites; i++) { 
    	    
	        var presentCBox = $(PrevSitesOfDiseaseValArray[i].PresentCBoxId);
	        var absentCBox = $(PrevSitesOfDiseaseValArray[i].AbsentCBoxId);
    	        
	        if (presentCBox.checked == false && absentCBox.checked == false)
	        {
	            if (PrevSitesOfDiseaseValArray[i].PresentAbsent == 'Present')
	            {
	                $(PrevSitesOfDiseaseValArray[i].PresentCBoxId).checked = true;
	            }
	            else if (PrevSitesOfDiseaseValArray[i].PresentAbsent == 'Absent')
	            {
	                $(PrevSitesOfDiseaseValArray[i].AbsentCBoxId).checked = true;
	            }
	        }
        }
    }
}


function clearProstateSitesOfDisease() {
	clearAllElementsContainedInNode($('ProstateSitesOfDiseaseAndProgressionCriteria_v2Table'));
	$('ProstateSitesOfDiseaseAndProgressionCriteriaSurveyContainer').style.display = 'none'; 
}
</script>


    
<a name="ProstateSitesOfDiseaseAndProgressionCriteria_v2" />
		<euc:EformTextBox id="EncDateText" Table="Encounters" Field="EncDateText" Runat="server" style="display: none;" />
		<euc:EformTextBox id="EncDate" Table="Encounters" Field="EncDate" Runat="server" style="display: none;" />
<table id="ProstateSitesOfDiseaseAndProgressionCriteria_v2Table" border="0" cellspacing="0" cellpadding="8" width="650"  class="eformLargePopulatedTable" style="table-layout: fixed;">
  <tr>
    <td id="ProstateSitesOfDiseaseAndProgressionCriteriaToggleContainer" style="font-weight: bold;">
    
    
        <img onclick="clearProstateSitesOfDisease();" src="../../Images/EFormDeleteRow.gif" style="float:right; margin-top: 2px;"  />
    
    Is there progression of disease?&nbsp;&nbsp;&nbsp;
        <euc:EformExtendedRadioButtonList ID="ProgressionOfDisease" runat="server" Table="NoTable" Field="ProgressionOfDisease" RepeatLayout="Flow" RepeatDirection="Horizontal" >
            <asp:ListItem Value="Yes" >Yes&nbsp;&nbsp;</asp:ListItem>
            <asp:ListItem Value="No" >No</asp:ListItem>
        </euc:EformExtendedRadioButtonList>
        
        
	</td>
  </tr>
  
  
  
  
<tr id="ProstateSitesOfDiseaseAndProgressionCriteriaSurveyContainer" style="display: none;">


<td>
<table cellpadding="0" cellspacing="0"><tr><td colspan="2" style="padding-bottom: 14px;">Date: 
<euc:EformTextBox Runat="server"  ID="SurveyDateText_1" RecordId="1" Table="Surveys" Field="SurveyDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True" />
<euc:EformHidden id="SurveyDate_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyDate"/></td></tr>


<tr>

<td style="vertical-align: bottom;" onmouseover="populatePreviousSites();">



<span class="controlBoxTitle">Known Sites of Disease</span><br />


<euc:EformTextBox id="SurveyType_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyType" style="display: none;" />


<table border="0" cellspacing="0" cellpadding="3" class="ClinicalEformTable" style="background-color:#FFFFFF" id="ProstateSitesOfDiseaseContainer" onclick="activateProstateSitesOfDiseaseSurveyHiddenFields();" >
  <tr>
    <td height="32" class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >&nbsp;</td>
    <td  class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>
    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>
  </tr>
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Site</td>
    <td  class="controlBoxDataGridHeaderFirstCol" >Present<span style="width: 60px;">&nbsp;</span>Absent </td>
    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Bone</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_Bone" RecordId="1" ParentRecordId="1"  GroupName="Bone" runat="server"
			Field1="SurveyItem" Value1="Bone">
			<euc:EformRadioButton Id="BonePresent" Value="Present" runat="server"/><span style="width: 67px;">&nbsp;</span>
			<euc:EformRadioButton Id="BoneAbsent" Value="Absent" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Lymph Nodes</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_LymphNodes" RecordId="2" ParentRecordId="1"  GroupName="LymphNodes" runat="server"
			Field1="SurveyItem" Value1="Lymph Nodes">
			<euc:EformRadioButton Id="LymphNodesPresent" Value="Present" runat="server"/><span style="width: 67px;">&nbsp;</span>
			<euc:EformRadioButton Id="LymphNodesAbsent" Value="Absent" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon1" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Lung</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_Lung" RecordId="3" ParentRecordId="1"  GroupName="Lung" runat="server"
			Field1="SurveyItem" Value1="Lung">
			<euc:EformRadioButton Id="LungPresent" Value="Present" runat="server"/><span style="width: 67px;">&nbsp;</span>
			<euc:EformRadioButton Id="LungAbsent" Value="Absent" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon2" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Liver</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_Liver" RecordId="4" ParentRecordId="1"  GroupName="Liver" runat="server"
			Field1="SurveyItem" Value1="Liver">
			<euc:EformRadioButton Id="LiverPresent" Value="Present" runat="server"/><span style="width: 67px;">&nbsp;</span>
			<euc:EformRadioButton Id="LiverAbsent" Value="Absent" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon3" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Local Disease</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_LocalDisease" RecordId="5" ParentRecordId="1"  GroupName="LocalDisease" runat="server"
			Field1="SurveyItem" Value1="Local Disease">
			<euc:EformRadioButton Id="LocalDiseasePresent" Value="Present" runat="server"/><span style="width: 67px;">&nbsp;</span>
			<euc:EformRadioButton Id="LocalDiseaseAbsent" Value="Absent" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon4" runat="server"/></td>
  </tr>
</table>



</td>
<td style="vertical-align: top; padding-left: 40px;">

<span class="controlBoxTitle">Progression Criteria</span><br />


<euc:EformHidden id="SurveyType_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyType" Value="Progression Criteria"/>

<euc:EformHidden id="SurveyDate_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyDate"/>
<euc:EformHidden id="SurveyDateText_2" runat="server" RecordId="2" Table="Surveys" Field="SurveyDateText"/>

<table id="ProstateProgressionCriteriaContainer" onclick="activateSurveyHiddenFields();" border="0" cellspacing="0" cellpadding="3" class="ClinicalEformTable" style="background-color:#FFFFFF" >
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align: left;" >Site</td>
    <td  class="controlBoxDataGridHeaderFirstCol" >Yes&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No</td>
    <td class="controlBoxDataGridHeaderFirstCol" >&nbsp;</td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >PSA</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_PSA" RecordId="1" ParentRecordId="2"  GroupName="PSA" runat="server"
			Field1="SurveyItem" Value1="PSA">
			<euc:EformRadioButton Id="PSAYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="PSANo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon5" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Bone</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_Bone_2" RecordId="2" ParentRecordId="2"  GroupName="Bone" runat="server"
			Field1="SurveyItem" Value1="Bone">
			<euc:EformRadioButton Id="BoneYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="BoneNo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon6" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Lymph Nodes</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_LymphNodes_2" RecordId="3" ParentRecordId="2"  GroupName="LymphNodes" runat="server"
			Field1="SurveyItem" Value1="Lymph Nodes">
			<euc:EformRadioButton Id="LymphNodesYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="LymphNodesNo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon7" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Lung</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_Lung_2" RecordId="4" ParentRecordId="2"  GroupName="Lung" runat="server"
			Field1="SurveyItem" Value1="Lung">
			<euc:EformRadioButton Id="LungYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="LungNo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon8" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Liver</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_Liver_2" RecordId="5" ParentRecordId="2"  GroupName="Liver" runat="server"
			Field1="SurveyItem" Value1="Liver">
			<euc:EformRadioButton Id="LiverYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="LiverNo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon9" runat="server"/></td>
  </tr>
  <tr  >
    <td height="32" class="ClinicalEformPopulatedColumn" >Local Disease</td>
    <td align="center" class="ClinicalEformPopulatedColumn" >
        <euc:EformRadioButtonGroup Table="SurveyItems" Field="SurveyItemResult" id="SurveyItemResult_LocalDisease_2" RecordId="6" ParentRecordId="2"  GroupName="LocalDisease" runat="server"
			Field1="SurveyItem" Value1="Local Disease">
			<euc:EformRadioButton Id="LocalDiseaseYes" Value="Yes" runat="server"/><span style="width: 37px;">&nbsp;</span>
			<euc:EformRadioButton Id="LocalDiseaseNo" Value="No" runat="server"/>
	    </euc:EformRadioButtonGroup>
	</td>
    <td align="center" class="ClinicalEformPopulatedColumn" ><euc:EformDeleteIcon ID="EformDeleteIcon10" runat="server"/></td>
  </tr>
</table>



</td>
    

</tr></table>



</td>
  </tr>
</table>
<script type="text/javascript">
    updateProstateSitesOfDiseaseDate();
    updateProstateProgressionCriteriaDate();
    showHideBasedOnRadioToggle($('ProstateSitesOfDiseaseAndProgressionCriteriaToggleContainer'), $('ProstateSitesOfDiseaseAndProgressionCriteriaSurveyContainer'), 'Yes');
</script>

<br/>
<br/>
<br/>
