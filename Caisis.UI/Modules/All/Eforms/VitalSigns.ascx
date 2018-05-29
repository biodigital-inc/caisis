<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.VitalSigns" CodeFile="VitalSigns.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">

<a name="VitalSigns" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Vital Signs"></asp:Label><br/>
<table width="690" border="0" cellspacing="0" cellpadding="3" style="border-top: solid 1px #cccccc;border-right: solid 1px #cccccc;">
  <tr>
    <td width="50" height="34" align="right" class="ClinicalEformGridColumnOne" style="border-left: solid 1px #cccccc;"><strong>BP</strong></td>
    <td width="100" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Encounters" FIELD="EncSystolic" Runat="server" ID="EncSystolic" ShowNumberPad="false"  title="Systolic" /> <span style="font-size: 14px; font-weight: bold;">/</span> <euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" TABLE="Encounters" FIELD="EncDiastolic" Runat="server" ID="EncDiastolic" ShowNumberPad="false" title="Diastolic" /></td>
    <td width="80" align="right" class="ClinicalEformGridColumnTwo"><strong>Pulse</strong></td>
    <td width="90" class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncPulse" Runat="server" ID="Pulse" ShowNumberPad="true"/></td>
    <td width="80" align="right" class="ClinicalEformGridColumnOne"><strong>Temp</strong></td>
    <td width="90" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncTemp" Runat="server" ID="Temp" ShowNumberPad="true"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>Resp</strong></td>
    <td width="100" class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncRespiration" Runat="server" ID="Resp" ShowNumberPad="true"/></td>
  </tr>
  <tr>
    <td height="34" align="right" class="ClinicalEformGridColumnTwo" style="border-left: solid 1px #cccccc;border-bottom: solid 1px #cccccc;"><strong>KPS</strong></td>
    <td class="ClinicalEformGridColumnTwo" style="border-bottom: solid 1px #cccccc;"><euc:EformComboBox LookupCode="KPS" style="width:60px;" DropDownWidth="420" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="KPS" /><%--<euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncKPS" Runat="server" ID="KPS" ShowNumberPad="true"/>--%></td>
    <td align="right" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #cccccc;"><strong>Height</strong> <span style="font-size: 9px; color: 333333;">(cm)</span></td>
    <td class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height" ShowNumberPad="true"/></td>
    <td align="right" class="ClinicalEformGridColumnTwo" style="border-bottom: solid 1px #cccccc;"><strong>Weight</strong> <span style="font-size: 9px; color: 333333;">(kg)</span></td>
    <td class="ClinicalEformGridColumnTwo" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight" ShowNumberPad="true"/></td>
    <td align="right" class="ClinicalEformGridColumnOne"><strong>BSA</strong></td>
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA" ShowNumberPad="true"/></td>
  </tr>
  <tr>
    <td colspan="6">&nbsp;</td>

    <td align="right" class="ClinicalEformGridColumnOne" style="border-left: solid 1px #cccccc;border-bottom: solid 1px #cccccc;"><strong>BMI</strong></td>
    <td class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI" ShowNumberPad="true"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
