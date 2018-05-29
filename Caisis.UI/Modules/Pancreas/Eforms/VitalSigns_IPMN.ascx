<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.VitalSigns_IPMN" CodeFile="VitalSigns_IPMN.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="VitalSigns_IPMN" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Vital Signs"></asp:Label><br/>
<table width="690" border="0" cellspacing="0" cellpadding="3" style="border-top: solid 1px #cccccc;border-right: solid 1px #cccccc;">
  <tr>
    <td height="34" align="right" class="ClinicalEformGridColumnTwo" style="border-left: solid 1px #cccccc;border-bottom: solid 1px #cccccc;"><strong>Date</strong></td>
    <td colspan="7" class="ClinicalEformGridColumnTwo" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox id="EncDateText" Table="Encounters" RecordId="1" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="80px"/><euc:EformHidden id="EncDate" Table="Encounters" RecordId="1" Field="EncDate" Runat="server"/></td>
  </tr>
  <tr>
    <td width="50" height="34" align="right" class="ClinicalEformGridColumnOne" style="border-left: solid 1px #cccccc;"><strong>BP</strong></td>
    <td width="100" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" Table="Encounters" RecordId="1" FIELD="EncSystolic" Runat="server" ID="EncSystolic" ShowNumberPad="false"  title="Systolic" /> <span style="font-size: 14px; font-weight: bold;">/</span> <euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:30px;" Table="Encounters" RecordId="1" FIELD="EncDiastolic" Runat="server" ID="EncDiastolic" ShowNumberPad="false" title="Diastolic" /></td>
    <td width="80" align="right" class="ClinicalEformGridColumnTwo"><strong>HR</strong></td>
    <td width="90" class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" Table="Encounters" RecordId="1" FIELD="EncPulse" Runat="server" ID="Pulse" ShowNumberPad="true"/></td>
    <td width="80" align="right" class="ClinicalEformGridColumnOne"><strong>Temp</strong></td>
    <td width="90" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" Table="Encounters" RecordId="1" FIELD="EncTemp" Runat="server" ID="Temp" ShowNumberPad="true"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>Resp</strong></td>
    <td width="100" class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" Table="Encounters" RecordId="1" FIELD="EncRespiration" Runat="server" ID="Resp" ShowNumberPad="true"/></td>
  </tr>
  <tr>
    <td height="34" align="right" class="ClinicalEformGridColumnTwo" style="border-left: solid 1px #cccccc;border-bottom: solid 1px #cccccc;"><strong>KPS</strong></td>
    <td class="ClinicalEformGridColumnTwo" style="border-bottom: solid 1px #cccccc;"><euc:EformComboBox LookupCode="KPS" style="width:60px;" DropDownWidth="600" DropDownHeight="auto" Table="Encounters" RecordId="1" FIELD="EncKPS" Runat="server" ID="KPS" /><%--<euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" Table="Encounters" RecordId="1" FIELD="EncKPS" Runat="server" ID="KPS" ShowNumberPad="true"/>--%></td>
    <td align="right" class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #cccccc;"><strong>Height</strong> <span style="font-size: 9px; color: 333333;">(cm)</span></td>
    <td class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" Table="Encounters" RecordId="1" FIELD="EncHeight" Runat="server" ID="Height" ShowNumberPad="true"/></td>
    <td align="right" class="ClinicalEformGridColumnTwo" ><strong>Weight</strong> <span style="font-size: 9px; color: 333333;">(kg)</span></td>
    <td class="ClinicalEformGridColumnTwo" ><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" Table="Encounters" RecordId="1" FIELD="EncWeight" Runat="server" ID="Weight" ShowNumberPad="true"/></td>
    <td align="right" class="ClinicalEformGridColumnOne"><strong>BSA</strong></td>
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" Table="Encounters" RecordId="1" FIELD="EncBSA" Runat="server" ID="BSA" ShowNumberPad="true"/></td>
  </tr>
  <tr>
    <td height="34">&nbsp;</td>
    <td>&nbsp;</td>
    <td align="right" class="ClinicalEformGridColumnTwo">&nbsp;</td>
    <td class="ClinicalEformGridColumnTwo">&nbsp;</td>
    <td align="right" class="ClinicalEformGridColumnOne" style="border-left: solid 1px #cccccc;border-bottom: solid 1px #cccccc;"><strong>O2/Sat</strong></td>
    <td class="ClinicalEformGridColumnOne" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" Table="Encounters" RecordId="1" FIELD="EncOxygenSaturation" Runat="server" ID="EncOxygenSaturation" ShowNumberPad="true"/></td>
    <td align="right" class="ClinicalEformGridColumnTwo" style="border-bottom: solid 1px #cccccc;"><strong>BMI</strong></td>
    <td class="ClinicalEformGridColumnTwo" style="border-bottom: solid 1px #cccccc;"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" Table="Encounters" RecordId="1" FIELD="EncBMI" Runat="server" ID="BMI" ShowNumberPad="true"/></td>
  </tr>
</table>
<br/>
<br/>
<br/>
