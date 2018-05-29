<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.EncountersVitalSigns4" CodeFile="EncountersVitalSigns4.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="EncountersVitalSigns4" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Vital Signs"></asp:Label><br/>

<table width="650" border="0" cellspacing="0" cellpadding="6" style="border: solid 1px #cccccc;">
  <tr>
    <td align="center" class="ClinicalEformGridColumnTwo"><strong>Height<br />(cm)</strong></td>
    <td class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height" ShowNumberPad="false"/></td>
    <td align="center" class="ClinicalEformGridColumnOne"><strong>Weight<br />(kg)</strong></td>
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight" ShowNumberPad="false"/></td>
    <td align="center" class="ClinicalEformGridColumnTwo"><strong>BSA</strong></td>
    <td valign="middle" class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA" ShowNumberPad="false" ReadOnly="true"/></td>
    <td align="center" class="ClinicalEformGridColumnOne"><strong>BMI</strong></td>
    <td valign="middle" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI" ShowNumberPad="false" ReadOnly="true"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
