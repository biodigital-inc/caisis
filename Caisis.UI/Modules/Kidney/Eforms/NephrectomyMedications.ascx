<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.NephrectomyMedications" CodeFile="NephrectomyMedications.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="NephrectomyMedications" />
<span class="controlBoxTitle">Medications</span> <br />

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >



<euc:EformCheckBox Table="Medications" RecordId="1" Field="Medication" id="Medication_1" runat="server" Value="Calcium channel blockers" Text="Calcium channel blockers"  /><br />
<euc:EformCheckBox Table="Medications" RecordId="2" Field="Medication" id="Medication_2" runat="server" Value="Furosamide" Text="Furosamide"  /><br />
<euc:EformCheckBox Table="Medications" RecordId="3" Field="Medication" id="Medication_3" runat="server" Value="ACE inhibitors" Text="ACE inhibitors"  /><br />
<euc:EformCheckBox Table="Medications" RecordId="4" Field="Medication" id="Medication_4" runat="server" Value="Heparin" Text="Heparin"  /><br />
Other <euc:EformTextBox CssClass="InputText" style="width: 250px;" Table="Medications" RecordId="5" Field="Medication" id="Medication_5" runat="server" />
        
	</td>

  </tr>
</table>
<br/><br/>
