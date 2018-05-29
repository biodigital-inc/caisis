<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.CurrentMedicalTherapy_GU" CodeFile="CurrentMedicalTherapy_GU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">


<style type="text/css">
#CurrentMedicalTherapy_GU_Table td
{
	border-bottom: solid 1px #cccccc;
	font-weight: normal;
}
#CurrentMedicalTherapy_GU_Table tr.ClinicalEformPopulatedRow img
{
    display: none;
}
#CurrentMedicalTherapy_GU_Table tr.ClinicalEformHighlightedRow img
{
    display: none;
}
</style>

<a name="CurrentMedicalTherapy_GU" /><span class="controlBoxTitle">Current Treatment</span><br/>

<table id="CurrentMedicalTherapy_GU_Table" width="700" border="0" cellpadding="5" cellspacing="0" class="eformLargePopulatedTable">
  <tr>
    <td class="previewText" style="font-weight: bold; font-size: 11px;">Last GnRH</td>
    <td class="previewText" style=" font-weight: normal;" > Date:</td>
    <td height="24" class="previewText" ><euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="NoTable"  FIELD="LastGnRHDateText" Runat="server" ID="LastGnRHDateText" /><euc:EformHidden Runat="server" ID="LastGnRHDate" Table="NoTable" Field="LastGnRHDate" /></td>
    <td height="24" class="previewText"  style=" font-weight: normal;">Agent</td>
    <td height="24" class="previewText" ><euc:EformComboBox LookupCode="MedTxAgent" style="width:140;" DropDownWidth="220" Field="LastGnRHAgent"  Table="NoTable" Runat="server" id="LastGnRHAgent"  /></td>
  </tr>
  <tr>
    <td class="previewText" style="font-weight: bold; font-size: 11px;">Last Bisphosphonate</td>
    <td class="previewText" style=" font-weight: normal;" > Date:</td>
    <td height="24" class="previewText" ><euc:EformTextBox ShowCalendar="true" CalcDate="true" style="width:90px;" TABLE="NoTable"  FIELD="LastBisphosphonateDateText" Runat="server" ID="LastBisphosphonateDateText" /><euc:EformHidden Runat="server" ID="LastBisphosphonateDate" Table="NoTable" Field="LastBisphosphonateDate" /></td>
    <td height="24" class="previewText"  style=" font-weight: normal;">Agent</td>
    <td height="24" class="previewText" ><euc:EformComboBox LookupCode="MedTxAgent" style="width:140;" DropDownWidth="220" Field="LastBisphosphonateAgent"  Table="NoTable" Runat="server" id="LastBisphosphonateAgent"  /></td>
  </tr>
  <tr id="mostRecentTxRow" runat="server" visible="false" class="ClinicalEformPopulatedRow" onmouseover="this.className='ClinicalEformHighlightedRow';" onmouseout="this.className='ClinicalEformPopulatedRow';">
    <td class="previewText" style="border-bottom: none;font-weight: bold; font-size: 11px;">Current TX</td>
	<td class="previewText" style="font-weight: normal; border-bottom: none;" >Start Date:</td>
    <td class="previewText" style="font-weight: normal; border-bottom: none;"><asp:Label ID="CurrentTXStartDateLabel" Runat="server" />&nbsp;</td>
    <td class="previewText"   style="font-weight: normal; border-bottom: none;" >Tx</td>
    <td height="24" class="previewText"  style="font-weight: normal; border-bottom: none;" ><asp:Label ID="CurrentTXLabel" Runat="server" />&nbsp;</td>
  </tr>
  <tr id="mostRecentTxRowHelpText" runat="server" visible="false">
    <td colspan="5" height="24" class="previewText"  style="font-weight: normal; border-bottom: none;" >Click the Tx above to view/edit. <strong>For a new treatment, add it below.</strong><br />To review the complete Medical Tx history for this patient, select "Prostate Cancer Therapies" from the menu on the left. </td>
  </tr>
  <tr id="CurrentTXRow" runat="server" >
    <td class="previewText" style="border-bottom: none;font-weight: bold; font-size: 11px;">Current TX</td>
	<td class="previewText" style="font-weight: normal; border-bottom: none;" >Start Date:</td>
    <td class="previewText" style="font-weight: normal; border-bottom: none;"><euc:EformTextBox Runat="server" ID="CurrentMedTx_DateText" TABLE="NoTable" FIELD="CurrentMedTx_DateText" style="width:72px;"  ShowCalendar="True" CalcDate="True"   />
    <euc:EformHidden Runat="server" ID="CurrentMedTx_Date" Table="NoTable" Field="CurrentMedTx_Date" /></td>
    <td class="previewText"   style="font-weight: normal; border-bottom: none;" >Tx</td>
    <td height="24" class="previewText"  style="font-weight: normal; border-bottom: none;" >   
      <euc:EformComboBox LookupCode="MedTxAgent" style="width:140;" Field="CurrentMedTx_Agent" Table="NoTable" Runat="server" id="CurrentMedTx_Agent"  /></td>
  </tr>
  <tr>
    <td class="previewText" >&nbsp;</td>
    <td class="previewText" style="font-weight: normal;" >Cycle / Week</td>
    <td height="24" class="previewText" ><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="NoTable" FIELD="CurrentMedTx_CyclePerWeek" Runat="server" ID="CurrentMedTx_CyclePerWeek" ShowNumberPad="true"/></td>
    <td class="previewText" style="font-weight: normal;">Protocol #</td>
    <td class="previewText" ><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="NoTable" FIELD="CurrentMedTx_ProtocolNum" Runat="server" ID="CurrentMedTx_ProtocolNum" /></td>
  </tr>
</table>
<br/><br/>
<br/>
<script type="text/javascript" >
function populateCurrentTxFields()
{
    if (typeof(currentTreatmentTdId) != "undefined" && currentTreatmentTdId != '' && $(currentTreatmentTdId) && typeof(currentTreatmentDate) != "undefined" && currentTreatmentDate != '')
    {
        var currentTxDateText = $('<% = CurrentMedTx_DateText.ClientID %>');
        var currentTxDate = $('<% = CurrentMedTx_Date.ClientID %>');
        var currentTxAgent = $('<% = CurrentMedTx_Agent.ClientID %>');
    
        if (currentTxDateText.value.length < 1)
        {
            currentTxDateText.value = currentTreatmentDate;
            currentTxDate.value = currentTreatmentDate;
        }
        if (currentTxAgent.value.length < 1)
        {
            currentTxAgent.value = $(currentTreatmentTdId).innerHTML.substr($(currentTreatmentTdId).innerHTML.indexOf(' ')+1);
        }
    }
}
//populateCurrentTxFields();
</script>