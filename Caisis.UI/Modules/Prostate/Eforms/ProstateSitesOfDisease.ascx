<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ProstateSitesOfDisease" CodeFile="ProstateSitesOfDisease.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<script type="text/javascript">

var updateProstateSitesOfDiseaseDate = function(survDateText, survDate)
{
	document.getElementById('<% = SurveyDateText_1.ClientID %>').value = survDateText;
	document.getElementById('<% = SurveyDate_1.ClientID %>').value = survDate;

}


</script>


<a name="ProstateSitesOfDisease" /><span class="controlBoxTitle">Known Sites of Disease</span><br />


<euc:EformHidden id="SurveyType_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyType" Value="Prostate Sites of Disease"/>

<euc:EformHidden id="SurveyDate_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyDate"/>
<euc:EformHidden id="SurveyDateText_1" runat="server" RecordId="1" Table="Surveys" Field="SurveyDateText"/>

<table width="400" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" onclick="if(window.apptDateText && window.apptDate) {updateProstateSitesOfDiseaseDate(apptDateText, apptDate); }">
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
<script type="text/javascript">if(window.apptDateText && window.apptDate) {updateProstateSitesOfDiseaseDate(apptDateText, apptDate); }</script>
<br/>
<br/>
<br/>
