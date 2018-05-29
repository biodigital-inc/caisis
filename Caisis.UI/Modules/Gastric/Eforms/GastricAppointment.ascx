<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Gastric.Eforms.GastricAppointment" CodeFile="GastricAppointment.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
ComboMaxCharLength = 52;
</script>

<a name="GastricAppointment" id="GastricAppointment" />
<!--<a name="ClinicDate" id="ClinicDate" />--><span class="controlBoxTitle">Appointment</span><br/>
<table border="0" cellspacing="0" cellpadding="8" width="580" class="eformLargePopulatedTable" onclick="setEncVals();" onmouseout="setEncVals();">
  <tr >
	<td ><strong>Date</strong> <euc:EformTextBox id="EncDateText" Table="Encounters" RecordId="1" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="90"  />
		<euc:EformHidden id="EncDate" Table="Encounters" RecordId="1" Field="EncDate" Runat="server"/>
	
        <euc:EformTextBox style="display: none;" RecordId="1" TABLE="Encounters" FIELD="EncQuality" ID="EncQuality" Runat="server"  />		

	
	</td>
	<td ><strong>Attending</strong> <euc:EformComboBox LookupDistinct="Appointments;ApptPhysician;ApptPhysician" id="EncPhysician" Table="Encounters" RecordId="1" Field="EncPhysician" runat="server"/>
	</td>
  </tr>
  <tr><td colspan="2">
    <strong>Visit Type&nbsp;&nbsp;</strong>
        <euc:EformRadioButtonList Table="Encounters" RecordId="1" Field="EncType" id="EncType" GroupName="EncType" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <asp:ListItem  Value="NV" Text="NV (New Visit)&nbsp;&nbsp;&nbsp;"  />
            <asp:ListItem  Value="IR" Text="IR (Internal New Visit)&nbsp;&nbsp;&nbsp;"  />
        </euc:EformRadioButtonList>
  </td></tr>
  <tr><td colspan="2">
    <strong>Institution&nbsp;&nbsp;</strong>
        <euc:EFormComboBox Table="Encounters" RecordId="1" Field="EncInstitution" id="EncInstitution" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal" Width="260" DropDownWidth="260" DropDownHeight="auto" LookupCode="Institution,UseAsDefault,True" Uncheckable="true"  />

  </td></tr>
</table>
<br/><br/>

<script type="text/javascript">
function setEncVals()
{
    if ($('<% = EncDateText.ClientID %>').value.length > 0 || $('<% = EncPhysician.ClientID %>').value.length > 0 )
    { 
        $('<% = EncQuality.ClientID %>').value = 'STD';
        if ($('<% = EncInstitution.ClientID %>').value.length < 1 ) { $('<% = EncInstitution.ClientID %>').value = 'Memorial Sloan Kettering Cancer Center'; }
        
    }
    else  { $('<% = EncQuality.ClientID %>').value = ''; }
    
}

setEncVals();
</script>
