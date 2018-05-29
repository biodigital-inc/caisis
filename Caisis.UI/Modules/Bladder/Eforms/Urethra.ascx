<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.Urethra" CodeFile="Urethra.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="RadiographicFindings" id="RadiographicFindings" />
<span class="controlBoxTitle">Urethra</span><br/>

<table width="650" border="0" cellspacing="0" cellpadding="3" style="border: solid 1px #cccccc;" id="ExamsHtmlTable">
  
  <tr>
    <td align="center" class="controlBoxDataGridHeaderFirstCol" nowrap width="18%">Area of Urethra </td>
    <td align="center" class="controlBoxDataGridHeaderFirstCol" >Normal</td>
    <td class="controlBoxDataGridHeaderFirstCol"  nowrap>Abnormal</td>
    <td width="40%" class="controlBoxDataGridHeaderFirstCol">Findings</td>
    <td class="controlBoxDataGridHeaderFirstCol">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; padding-left: 25px;">
    Prostatic</td>
    <td class="ControlBoxLinedRows" align="center">
		<euc:EformRadioButtonGroup Table="NoTable" Field="UrethraResult_Prostatic" id="UrethraResult_Prostatic" GroupName="UrethraResult_ProstaticGroup" runat="server">
	<euc:EformRadioButton Id="UrethraResult_Prostatic_Normal" Value="Normal" runat="server" />	</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="UrethraResult_Prostatic_Abormal" Value="Abnormal" runat="server" /></euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="NoTable" FIELD="UrethraFindings_Prostatic" Runat="server" ID="UrethraFindings_Prostatic"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon1"/></td>
  </tr>
  
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; padding-left: 25px;">
    Anterior</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="NoTable" Field="UrethraResult_Anterior" id="UrethraResult_Anterior" GroupName="UrethraResult_AnteriorGroup" runat="server">
        <euc:EformRadioButton Id="UrethraResult_Anterior_Normal" Value="Normal" runat="server" />    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="UrethraResult_Anterior_Abormal" Value="Abnormal" runat="server" />
        </euc:EformRadioButtonGroup>    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="NoTable" FIELD="UrethraFindings_Anterior" Runat="server" ID="UrethraFindings_Anterior"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon2"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; padding-left: 25px;">
    Posterior</td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButtonGroup Table="NoTable" Field="UrethraResult_Posterior" id="UrethraResult_Posterior" GroupName="UrethraResult_PosteriorGroup" runat="server">
        <euc:EformRadioButton Id="UrethraResult_Posterior_Normal" Value="Normal" runat="server" />
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformRadioButton Id="UrethraResult_Posterior_Abormal" Value="Abnormal" runat="server" />
        </euc:EformRadioButtonGroup>
    </td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="NoTable" FIELD="UrethraFindings_Posterior" Runat="server" ID="UrethraFindings_Posterior"/></td>
    <td class="ControlBoxLinedRows" align="center"><euc:EformDeleteIcon runat="server" ID="Eformdeleteicon3"/></td>
  </tr>
  <tr>
    <td valign="top" class="ControlBoxLinedRowsShaded" style="border-right: none; padding-left: 25px;">
      Stricture</td>
    <td colspan="4" class="ControlBoxLinedRows">
	&nbsp;&nbsp;Location&nbsp;<euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:160px;" TABLE="NoTable" FIELD="StrictureLocation" Runat="server" ID="StrictureLocation"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	Caliber&nbsp;<euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:80px;" TABLE="NoTable" FIELD="StrictureCaliber" Runat="server" ID="StrictureCaliber"/> French	</td>
  </tr>
</table>
<br/><br/><br/>