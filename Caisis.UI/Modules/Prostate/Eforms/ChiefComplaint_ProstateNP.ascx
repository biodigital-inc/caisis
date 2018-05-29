<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ChiefComplaint_ProstateNP" CodeFile="ChiefComplaint_ProstateNP.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<a name="ChiefComplaint_ProstateNP"  />
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
<span class="controlBoxTitle">Chief Complaint</span>
<euc:EformCheckBox runat="server" Table="NoTable" Field="EncChiefComplaint_PresetOption" id="EncChiefComplaint_PresetOption" Value="Prostate Cancer" onclick="addPresetOptionText();" style="margin-left: 40px;" /><span id="PresetOptionText">Prostate Cancer</span>
<euc:EformCheckBox runat="server" Table="NoTable" Field="EncChiefComplaint_PresetOption2" id="EncChiefComplaint_PresetOption2" Value="Elevated PSA" onclick="addPresetOptionText();" style="margin-left: 40px;" /><span id="PresetOptionText2">Elevated PSA</span>
<br />
<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable"><euc:EformTextArea TextMode="MultiLine" TABLE="Encounters" FIELD="EncChiefComplaint" Rows="4" style="width: 560px;" Runat="server" ID="EncChiefComplaint"/></td>
  </tr>
 
</table>

<script type="text/javascript">

var PresetOptionText = $('PresetOptionText').innerHTML;
var PresetOptionText2 = $('PresetOptionText2').innerHTML;
var cb = $('<% = EncChiefComplaint_PresetOption.ClientID %>');
var cb2 = $('<% = EncChiefComplaint_PresetOption2.ClientID %>');
var ta = $('<% = EncChiefComplaint.ClientID %>');

function addPresetOptionText()
{
    var PresetOption1AlreadyAdded = (ta.value.toUpperCase().indexOf(PresetOptionText.toUpperCase()) == 0) ? true : false;
    var PresetOption2AlreadyAdded = (ta.value.toUpperCase().indexOf(PresetOptionText2.toUpperCase()) == 0) ? true : false;
    
    var combinedOptionText = (PresetOptionText + ', ' + PresetOptionText2);
    var PresetOption1And2AlreadyAdded = (ta.value.toUpperCase().indexOf(combinedOptionText.toUpperCase()) == 0) ? true : false;
    
    var typedText = '';

    if (PresetOption1And2AlreadyAdded)
    {
        typedText = ta.value.substring(combinedOptionText.length); 
    }
    else if (PresetOption1AlreadyAdded)
    {
        typedText = ta.value.substring(PresetOptionText.length); 
    }
    else if (PresetOption2AlreadyAdded)
    {
        typedText = ta.value.substring(PresetOptionText2.length); 
    }
    else
    {
        typedText = ta.value; 
    }
    
    if (cb.checked && cb2.checked) { ta.value = combinedOptionText + typedText; }
    else if (cb.checked && !cb2.checked) { ta.value = PresetOptionText + typedText; }
    else if (!cb.checked && cb2.checked) { ta.value = PresetOptionText2 + typedText; }
    else if (!cb.checked && !cb2.checked) { ta.value = typedText; }
}

</script>
<br/><br/><br/>