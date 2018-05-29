<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.EncountersVitalSigns" CodeFile="EncountersVitalSigns.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="EncountersVitalSigns" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Vital Signs"></asp:Label><br/>

<table width="650" border="0" cellspacing="0" cellpadding="6" style="border: solid 1px #cccccc;">
  <tr>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>BP</strong></td>
    <td width="100" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Encounters" FIELD="EncSystolic" Runat="server" ID="EncSystolic" ShowNumberPad="false"  title="Systolic" /> <span style="font-size: 14px; font-weight: bold;">/</span> <euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Encounters" FIELD="EncDiastolic" Runat="server" ID="EncDiastolic" ShowNumberPad="false" title="Diastolic" /></td>
    <td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>Pulse</strong></td>
    <td width="100" class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncPulse" Runat="server" ID="Pulse" ShowNumberPad="true"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>Temp</strong></td>
    <td width="100" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncTemp" Runat="server" ID="Temp" ShowNumberPad="true"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>Resp</strong></td>
    <td width="100" class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncRespiration" Runat="server" ID="Resp" ShowNumberPad="true"/></td>
  </tr>
  <tr>
    <td align="right" class="ClinicalEformGridColumnTwo"><strong>Height<br />(cm)</strong></td>
    <td class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height" ShowNumberPad="true"/></td>
    <td align="right" class="ClinicalEformGridColumnOne"><strong>Weight<br />(kg)</strong></td>
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight" ShowNumberPad="true"/></td>
    <td align="right" class="ClinicalEformGridColumnTwo"><strong>BSA</strong></td>
    <td rowspan="2" valign="middle" class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA" ReadOnly="true"/></td>
    <td align="right" class="ClinicalEformGridColumnOne"><strong>BMI</strong></td>
    <td rowspan="2" valign="middle" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI" ReadOnly="true"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
