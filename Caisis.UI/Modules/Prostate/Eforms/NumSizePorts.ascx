<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.NumSizePorts" CodeFile="NumSizePorts.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<!-- BEGIN Urachael Sparing -->
<a name="NumSizePorts" /><span class="controlBoxTitle">&nbsp;&nbsp;Number & Size of Ports</span><br />
<table width="525" cellpadding="5" cellspacing="0" class="ClinicalEformTable" id="AllergiesHtmlTable">
  <tr>
    <td width="14%" class="controlBoxDataGridHeaderFirstCol" >&nbsp;Size</td>
    <td class="controlBoxDataGridHeaderFirstCol">Number of Ports </td>
    <td height="10%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
    <td width="50%" class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>

  <tr>
    <td height="28" class="ClinicalEformGridColumnOne" align="center">5 mm</td>
    <td valign="baseline" align="center"><euc:EformTextBox id="NumSize5Ports" Table="ProstatectomyProc" Field="ProcNumSize5Ports"  ShowNumberPad="true" ShowCalendar="False" CalcDate="False" Runat="server" style="width: 30px"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne" align="center">8 mm</td>
    <td valign="baseline" align="center"><euc:EformTextBox id="NumSize8Ports" Table="ProstatectomyProc" Field="ProcNumSize8Ports"  ShowNumberPad="true" ShowCalendar="False" CalcDate="False" Runat="server" style="width: 30px"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr >
    <td height="28" class="ClinicalEformGridColumnOne" align="center">10 mm</td>
    <td valign="baseline" align="center"><euc:EformTextBox id="NumSize10Ports" Table="ProstatectomyProc" Field="ProcNumSize10Ports"  ShowNumberPad="true" ShowCalendar="False" CalcDate="False" Runat="server" style="width: 30px"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="28" class="ClinicalEformGridColumnOne" align="center">12 mm</td>
    <td valign="baseline" align="center"><euc:EformTextBox id="NumSize12Ports" Table="ProstatectomyProc" Field="ProcNumSize12Ports"  ShowNumberPad="true" ShowCalendar="False" CalcDate="False" Runat="server" style="width: 30px"/></td>
    <td><euc:EformDeleteIcon runat="server"/></td>
    <td>&nbsp;</td>
  </tr>
</table>
<br/>
<br/>

<!-- END Seminal Vessicles -->
