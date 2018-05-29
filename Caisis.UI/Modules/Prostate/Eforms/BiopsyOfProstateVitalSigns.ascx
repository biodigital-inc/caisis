<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.BiopsyOfProstateVitalSigns" CodeFile="BiopsyOfProstateVitalSigns.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="BiopsyOfProstateVitalSigns" id="BiopsyOfProstateVitalSigns" />
<span class="controlBoxTitle ">&nbsp;Vital Signs</span><br />

<table width="650" border="0" cellspacing="0" cellpadding="10" style="border: solid 1px #cccccc;">
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
</table>
<br /><br />

