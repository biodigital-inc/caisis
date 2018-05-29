<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ChiefComplaint_AS_Status" CodeFile="ChiefComplaint_AS_Status.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="ChiefComplaint_AS_Status" id="ChiefComplaint_AS_Status" />
<span class="controlBoxTitle">Appointment</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">
 <tr >
	<td ><strong>Date</strong><br/>
		<euc:EformTextBox id="EncDateText" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server"/>
		<euc:EformHidden id="EncDate" Table="Encounters" Field="EncDate" Runat="server"/>
	</td>
	<td ><strong>Attending</strong><br/>
		<euc:EformComboBox LookupCode="ApptPhysician" id="EncPhysician" Table="Encounters" Field="EncPhysician" runat="server"/>
		<euc:EformHidden id="EncType" Table="Encounters" Field="EncType" runat="server"/>
	</td>
  </tr>
</table>
<br/><br/><br/>

<style type="text/css">
.ActiveSurveillanceStatusMsg
{
    font-size: smaller;
    color: #8d2a2c;
    margin-left: 35px;
}
</style>
<span class="controlBoxTitle">Chief Complaint</span><euc:EformCheckBox runat="server" Table="NoTable" Field="EncChiefComplaint_PresetOption" id="EncChiefComplaint_PresetOption" Value="Active Surveillance" onclick="addPresetOptionText();" style="margin-left: 20px;" /><span id="PresetOptionText">Active Surveillance</span><span id="PresetOptionValue" style="display: none;">Active Surveillance for Prostate Cancer</span><%-- <span id="ActiveSurveillanceStatusMsg" runat="server" class="ActiveSurveillanceStatusMsg">An Active Surveillance status record will be added.</span>--%>
<br />
<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable"><euc:EformTextArea TextMode="MultiLine" TABLE="Encounters" FIELD="EncChiefComplaint" Rows="4" style="width: 560px;" Runat="server" ID="EncChiefComplaint"/></td>
  </tr>
 
</table>

<euc:EformTextBox id="ASStatus" Table="Status" Field="Status" RecordId="2" Runat="server" Visible="false" Value="Active Surveillance" style="display: none;" />

<script type="text/javascript">

//var PresetOptionText = $('PresetOptionText').innerHTML;
var PresetOptionText = $('PresetOptionValue').innerHTML;
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