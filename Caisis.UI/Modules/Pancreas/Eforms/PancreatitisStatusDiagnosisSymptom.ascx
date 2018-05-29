<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreatitisStatusDiagnosisSymptom" CodeFile="PancreatitisStatusDiagnosisSymptom.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript">
</script>


<a name="PancreatitisStatusDiagnosisSymptom" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Diagnosis Date"></asp:Label><br/>

<table width="600" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF" id="DiagnosisDateHtmlTable" >
  <tr>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Date</td>
  </tr>
<tr >
    <td height="32" class="ClinicalEformPopulatedColumn" style="white-space: nowrap; " >Diagnosis Date</td>
    <td class="ClinicalEformPopulatedColumn" >	
          <euc:EformTextBox Width="100px" RecordId="21"  TABLE="Status"  FIELD="StatusDateText" ID="StatusDateText_21" Runat="server" ShowCalendar="true" CalcDate="true"  />	
		  <euc:EformHidden                RecordId="21" Table="Status" Field="StatusDate" id="StatusDate_21" runat="server" />

		  <euc:EformTextBox Width="1px" style="display: none; " RecordId="21" Table="Status" FIELD="Status"  id="Status_21" runat="server" />
          <euc:EformTextBox Width="1px" style="display: none; " RecordId="21" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_21" Runat="server" /></td>

</tr>

<tr >
    <td height="32" class="ClinicalEformPopulatedColumn" style="white-space: nowrap; " >Onset of Symptom Date</td>
    <td class="ClinicalEformPopulatedColumn" >	
          <euc:EformTextBox Width="100px" RecordId="22"  TABLE="Status"  FIELD="StatusDateText" ID="StatusDateText_22" Runat="server" ShowCalendar="true" CalcDate="true"  />	
		  <euc:EformHidden RecordId="22" Table="Status" Field="StatusDate" id="StatusDate_22" runat="server" />

		  <euc:EformTextBox Width="1px" style="display: none; " RecordId="22" Table="Status" FIELD="Status" id="Status_22" runat="server" />
          <euc:EformTextBox Width="1px" style="display: none; " RecordId="22" TABLE="Status"  FIELD="StatusDisease" ID="StatusDisease_22" Runat="server"  /></td>

</tr>

</table>
<br/><br/><br />

<script type="text/javascript">
    /* <![CDATA[ */

    //Adds blur event to combo
    addAbsentEvent($('<%= StatusDateText_21.ClientID %>'), $('<%= StatusDate_21.ClientID %>'), $('<%= StatusDisease_21.ClientID %>'), $('<%= Status_21.ClientID %>'), 'Diagnosis Date');
    addAbsentEvent($('<%= StatusDateText_22.ClientID %>'), $('<%= StatusDate_22.ClientID %>'), $('<%= StatusDisease_22.ClientID %>'), $('<%= Status_22.ClientID %>'), 'Onset of Symptom Date');

    function addAbsentEvent(statusDateText, statusDate, statusDisease, status, statusValue) {
        $(statusDateText).addEvent('blur', curry(SetHiddenFields, statusDateText, statusDate, statusDisease, status, statusValue));
    }

    /* ]]> */

    function SetHiddenFields(statusDateText, statusDate, statusDisease, status, statusValue) {

        if (statusDateText.value != '') {

            status.value = statusValue;
            statusDisease.value = 'Pancreatitis';
        }
        else {
            status.value = '';
            statusDisease.value = '';
        }
    }


</script>