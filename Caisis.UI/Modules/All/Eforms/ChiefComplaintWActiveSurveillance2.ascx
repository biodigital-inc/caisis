<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ChiefComplaintWActiveSurveillance2" CodeFile="ChiefComplaintWActiveSurveillance2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="ChiefComplaintWActiveSurveillance2" id="ChiefComplaintWActiveSurveillance2" />
<span class="controlBoxTitle">Appointment</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">
 <tr >
	<td ><strong>Date</strong><br/>
		<euc:EformTextBox id="EncDateText" Table="Encounters" Field="EncDateText" RecordId="1" ShowCalendar="True" CalcDate="True" Runat="server"/>
		<euc:EformHidden id="EncDate" Table="Encounters" Field="EncDate" RecordId="1" Runat="server"/>
	</td>
	<td ><strong>Attending</strong><br/>
		<euc:EformComboBox LookupCode="ApptPhysician" id="EncPhysician" Table="Encounters" Field="EncPhysician" RecordId="1" runat="server"/>
		<euc:EformHidden id="EncType" Table="Encounters" Field="EncType" RecordId="1" runat="server"/>
	</td>
  </tr>
</table>
<br/><br/><br/>
<span class="controlBoxTitle">Chief Complaint</span>
<euc:EformCheckBox runat="server" Table="NoTable" Field="EncChiefComplaint_PresetOption" id="EncChiefComplaint_PresetOption" Value="Active Surveillance" onclick="addPresetOptionText();" style="margin-left: 40px;" /><span id="PresetOptionText">Active Surveillance</span>
<br />
<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable"><euc:EformTextArea TextMode="MultiLine" TABLE="Encounters" RecordId="1" FIELD="EncChiefComplaint" Rows="4" style="width: 560px;" Runat="server" ID="EncChiefComplaint"/></td>
  </tr>
 
</table>

<script type="text/javascript">

var PresetOptionText = $('PresetOptionText').innerHTML;
var cb = $('<% = EncChiefComplaint_PresetOption.ClientID %>');
var ta = $('<% = EncChiefComplaint.ClientID %>');

function addPresetOptionText()
{
    var PresetOptionTextAlreadyAdded = (ta.value.toUpperCase().indexOf(PresetOptionText.toUpperCase()) == 0) ? true : false;

    if (cb.checked)
    {
        if (!PresetOptionTextAlreadyAdded) ta.value = PresetOptionText + ta.value;
    }
    else
    {
        if (PresetOptionTextAlreadyAdded) ta.value = ta.value.substring(PresetOptionText.length);
    }
}

</script>
<br/><br/><br/>