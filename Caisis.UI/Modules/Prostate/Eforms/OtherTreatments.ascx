<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.OtherTreatments" CodeFile="OtherTreatments.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript"> 
function showOtherTreatment(divId, treatmentCheckbox)
{
	if(treatmentCheckbox.checked == true)
	{
		document.getElementById(divId).style.display = 'block';
	}
	else
	{
		document.getElementById(divId).style.display = 'none';
	}
}

</script>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="OtherTreatments" /><span class="controlBoxTitle">Other Treatments</span><br>
<table width="650" border="0" cellspacing="0" cellpadding="5" class="eformLargePopulatedTable">
  <tr>
    <td><label>
      <input id="MedTxCheckbox" type="checkbox" name="MedTxCheckbox" value="true" onclick="showOtherTreatment('MedTxDiv', this)" />
    Show Medical Therapy</label></td>
    <td><label>
      <input id="RadTxCheckbox" type="checkbox" name="RadTxCheckbox" value="true" onclick="showOtherTreatment('RadTxDiv', this)" />
      Show Radiation Therapy</label></td>
    <td><label>
      <input id="BrachyTxCheckbox" type="checkbox" name="BrachyTxCheckbox" value="true" onclick="showOtherTreatment('BrachyTxDiv', this)" />
      Show BrachyTherapy </label></td>
  </tr>
</table>
<br/><br/><br/>