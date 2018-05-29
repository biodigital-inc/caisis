<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ClinicalStage_ProstateUICC02" CodeFile="ClinicalStage_ProstateUICC02.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<br />
<a name="ClinicalStage_ProstateUICC02" />
<span class="controlBoxTitle">Clinical Stage at Diagnosis (TNM) UICC02</span><br/>
<table id="StatusContainer" border="0" cellspacing="0" cellpadding="16" width="650" class="eformLargePopulatedTable" style="margin-bottom: 20px;">

    <tr>
	<td style="width: 40px; padding-right: 0px; padding-top: 19px;">Date
<euc:EformTextBox style="display: none;" TABLE="ClinicalStages" RecordId="1" FIELD="ClinStageDisease" Runat="server" ID="ClinStageDisease"/>
<euc:EformTextBox style="display: none;" TABLE="ClinicalStages" RecordId="1" FIELD="ClinStageSystem" Runat="server" ID="ClinStageSystem"/>
<euc:EformTextBox style="display: none;" TABLE="ClinicalStages" RecordId="1" FIELD="ClinStageQuality" Runat="server" ID="ClinStageQuality"/>
					
					<euc:EformHidden TABLE="ClinicalStages" RecordId="1" FIELD="ClinStageDate" Runat="server" ID="ClinStageDate"/>
	</td>
	<td  style="width: 200px;">
					<euc:EformTextBox style="width:100px" TABLE="ClinicalStages" RecordId="1" FIELD="ClinStageDateText" Runat="server" ShowCalendar="True" CalcDate="True" ID="ClinStageDateText" AppendToOnChange="setClinStageHiddenFields();" />
	</td>
	<td style="width: 70px;">T Stage
	</td><td >
	<euc:EformSelect style="width:60px;" DropDownWidth="300" LookupCode="StageClin_Prostate_02_T" TABLE="ClinicalStages" RecordId="1" FIELD="ClinStageT" Runat="server" ID="ClinStageT" AppendToOnChange="setClinStageHiddenFields();" /> <%--  AppendToOnChange="setDefaultClinStageDate();" --%>
	</td>
	
    </tr>
    <tr>
    <td colspan="2" style="padding-top: 0px;">&nbsp;</td>
	<td style="padding-top: 0px;">N Stage
	</td><td style="padding-top: 0px;">
	<euc:EformSelect style="width:60px;" DropDownWidth="220" DropDownHeight="auto" LookupCode="StageClin_Prostate_02_N" TABLE="ClinicalStages" RecordId="1" FIELD="ClinStageN" Runat="server" ID="ClinStageN" AppendToOnChange="setClinStageHiddenFields();"  /> <%--  AppendToOnChange="setDefaultClinStageDate();" --%>
	</td>
    </tr>
    <tr>
    <td colspan="2" style="padding-top: 0px;">&nbsp;</td>
	<td style="padding-top: 0px;">M Stage
	</td><td  style="padding-top: 0px;">
	<euc:EformSelect style="width:60px;" DropDownWidth="280" DropDownHeight="auto" LookupCode="StageClin_Prostate_02_M" TABLE="ClinicalStages" RecordId="1" FIELD="ClinStageM" Runat="server" ID="ClinStageM" AppendToOnChange="setClinStageHiddenFields();"   /> <%--  AppendToOnChange="setDefaultClinStageDate();" --%>
	</td>
    </tr>
</table>
<%-- 
<script type="text/javascript" >
function setDefaultClinStageDate()
{
    if ($('<% =ClinStageT.ClientID %>').value != '' || $('<% =ClinStageN.ClientID %>').value != '' || $('<% =ClinStageM.ClientID %>').value != '')
    {
        if (DiagnosisDateTextVal && DiagnosisDateVal && DiagnosisDateTextVal != '' && $('<% =ClinStageDateText.ClientID %>').value == '')
        {
            $('<% =ClinStageDateText.ClientID %>').value = DiagnosisDateTextVal;
            $('<% =ClinStageDate.ClientID %>').value = DiagnosisDateVal;
        }
    }
}
</script>
--%>
<script  type="text/javascript">
function setClinStageHiddenFields()
{
    if($('<% =ClinStageDateText.ClientID %>').value != '' || $('<% =ClinStageT.ClientID %>').value != '' || $('<% =ClinStageN.ClientID %>').value != '' || $('<% =ClinStageM.ClientID %>').value != '')
    {
        $('<% =ClinStageDisease.ClientID %>').value = 'Prostate';
        $('<% =ClinStageSystem.ClientID %>').value = 'UICC_02';
        $('<% =ClinStageQuality.ClientID %>').value = 'STD';
    }
    else
    {
        $('<% =ClinStageDisease.ClientID %>').value = '';
        $('<% =ClinStageSystem.ClientID %>').value = '';
        $('<% =ClinStageQuality.ClientID %>').value = '';
    }
}
</script>