<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.LocalMD" CodeFile="LocalMD.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<a name="LocalMD" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Local MD" style="margin-right: 40px;"></asp:Label>

<table cellspacing="0">
<tr>
<td>

<span style="display: block; background-color: #cccccc; color: #000000; font-weight: bold; padding: 4px;">Physcian #1</span>
<table cellpadding="4" cellspacing="0" class="ClinicalEformTable" >
<tr>
<td>First Name</td>
<td style="padding-right: 30px;"><euc:EformTextBox RecordId="1" style="width: 75px;" Table="PhysicianLocal" Field="PhFirstName" id="PhFirstName_1" runat="server" /></td>
<td>Last Name</td>
<td><euc:EformTextBox RecordId="1" style="width: 75px;" Table="PhysicianLocal" Field="PhLastName" id="PhLastName_1" runat="server" /></td>
</tr>
<tr>
<td>Address</td>
<td colspan="3"><euc:EformTextBox RecordId="1" style="width: 150px;" Table="PhysicianLocal" Field="PhAddress1" id="PhAddress1_1" runat="server" /></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><euc:EformTextBox RecordId="1" style="width: 150px;" Table="PhysicianLocal" Field="PhAddress2" id="PhAddress2_1" runat="server" /></td>
</tr>
<tr>
<td>City</td>
<td colspan="3"><euc:EformTextBox RecordId="1" style="width: 150px;" Table="PhysicianLocal" Field="PhCity" id="PhCity_1" runat="server" /></td>
</tr>
<tr>
<td>State</td>
<td><euc:EformComboBox  LookupCode="State"  DropDownWidth="150px"  style="width:50px;" Field="PhState" RecordId="1" Table="PhysicianLocal" Runat="server" id="PhState_1"  /></td>
<td style="text-align: right;">Zip</td>
<td><euc:EformTextBox RecordId="1" style="width: 75px;" Table="PhysicianLocal" Field="PhPostalCode" id="PhPostalCode_1" runat="server" /></td>
</tr>
<tr>
<td>Phone</td>
<td><euc:EformTextBox RecordId="1" style="width: 75px;" Table="PhysicianLocal" Field="PhWorkPhone" id="PhWorkPhone_1" runat="server" /></td>
<td style="text-align: right;">Fax</td>
<td><euc:EformTextBox RecordId="1" style="width: 75px;" Table="PhysicianLocal" Field="PhFax" id="PhFax_1" runat="server" /></td>
</tr>
<tr>
<td>Specialty</td>
<td colspan="3"><euc:EformComboBox  LookupCode="PhSpecialty"  DropDownWidth="150px"  style="width:150px;" Field="PhSpecialty" RecordId="1" Table="PhysicianLocal" Runat="server" id="PhSpecialty_1"  /></td>
</tr>
</table>

</td>
<td style="padding-left: 10px;">
<span style="display: block; background-color: #cccccc; color: #000000; font-weight: bold; padding: 4px;"">Physcian #2</span>
<table cellpadding="4" cellspacing="0" class="ClinicalEformTable" >
<tr>
<td>First Name</td>
<td style="padding-right: 30px;"><euc:EformTextBox  RecordId="2" style="width: 75px;" Table="PhysicianLocal" Field="PhFirstName" id="PhFirstName_2" runat="server" /></td>
<td>Last Name</td>
<td><euc:EformTextBox  RecordId="2" style="width: 75px;" Table="PhysicianLocal" Field="PhLastName" id="PhLastName_2" runat="server" /></td>
</tr>
<tr>
<td>Address</td>
<td colspan="3"><euc:EformTextBox  RecordId="2" style="width: 150px;" Table="PhysicianLocal" Field="PhAddress1" id="PhAddress1_2" runat="server" /></td>
</tr>
<tr>
<td>&nbsp;</td>
<td colspan="3"><euc:EformTextBox  RecordId="2" style="width: 150px;" Table="PhysicianLocal" Field="PhAddress2" id="PhAddress2_2" runat="server" /></td>
</tr>
<tr>
<td>City</td>
<td colspan="3"><euc:EformTextBox  RecordId="2" style="width: 150px;" Table="PhysicianLocal" Field="PhCity" id="PhCity_2" runat="server" /></td>
</tr>
<tr>
<td>State</td>
<td><euc:EformComboBox  LookupCode="State"  DropDownWidth="150px"  style="width:50px;" Field="PhState"  RecordId="2" Table="PhysicianLocal" Runat="server" id="PhState_2"  /></td>
<td style="text-align: right;">Zip</td>
<td><euc:EformTextBox  RecordId="2" style="width: 75px;" Table="PhysicianLocal" Field="PhPostalCode" id="PhPostalCode_2" runat="server" /></td>
</tr>
<tr>
<td>Phone</td>
<td><euc:EformTextBox  RecordId="2" style="width: 75px;" Table="PhysicianLocal" Field="PhWorkPhone" id="PhWorkPhone_2" runat="server" /></td>
<td style="text-align: right;">Fax</td>
<td><euc:EformTextBox  RecordId="2" style="width: 75px;" Table="PhysicianLocal" Field="PhFax" id="PhFax_2" runat="server" /></td>
</tr>
<tr>
<td>Specialty</td>
<td colspan="3"><euc:EformComboBox  LookupCode="PhSpecialty"  DropDownWidth="150px"  style="width:150px;" Field="PhSpecialty" RecordId="2" Table="PhysicianLocal" Runat="server" id="PhSpecialty_2"  /></td>
</tr>
</table>
</td>
</tr>
</table>

<br/><br/>
<br/>