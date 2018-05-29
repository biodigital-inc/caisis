<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.EncountersVitalSigns2" CodeFile="EncountersVitalSigns2.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />


<a name="EncountersVitalSigns2" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Encounter Assessment"></asp:Label><br/>

<table width="600" border="0" cellspacing="0" cellpadding="10" style="border: solid 1px #cccccc;">
  <tr>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>Date</strong></td>
    <td width="120" class="ClinicalEformGridColumnOne"><euc:EformTextBox id="EncDateText" Table="Encounters" Field="EncDateText" ShowCalendar="True" CalcDate="True" Runat="server" Width="80px"/>
                                               		   <euc:EformHidden id="EncDate" Table="Encounters" Field="EncDate" Runat="server"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>Height (cm)</strong></td>
    <td width="100"  class="ClinicalEformGridColumnTwo " ><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncHeight" Runat="server" ID="Height" ShowNumberPad="true"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>Weight (kg)</strong></td>
    <td class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncWeight" Runat="server" ID="Weight" ShowNumberPad="true"/></td>
  </tr>
  <tr>
    <td align="right" class="ClinicalEformGridColumnTwo"><strong>Notes</strong></td>
    <td width="100"  class="ClinicalEformGridColumnTwo "><euc:EformTextArea TextMode="MultiLine" style="width:100px;" TABLE="Encounters" FIELD="EncNotes" Runat="server" ID="EformTextBox1" ShowTextEditor="true"/></td>
    <td width="50" align="right"  class="ClinicalEformGridColumnTwo"><strong>BSA</strong></td>
    <td width="100"  class="ClinicalEformGridColumnTwo"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncBSA" Runat="server" ID="BSA" ShowNumberPad="true" ReadOnly="true"/></td>
    <td align="right" class="ClinicalEformGridColumnOne"><strong>BMI</strong></td>
    <td rowspan="2" valign="middle" class="ClinicalEformGridColumnOne"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncBMI" Runat="server" ID="BMI" ShowNumberPad="true" ReadOnly="true"/></td>

  </tr>
</table>
<br/>
<br/>
<br/>
