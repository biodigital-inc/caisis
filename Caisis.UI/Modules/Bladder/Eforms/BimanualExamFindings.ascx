<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.BimanualExamFindings" CodeFile="BimanualExamFindings.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="BimanualExamFindings" id="BimanualExamFindings" />
<!--<a name="ClinicDate" id="ClinicDate" />--><span class="controlBoxTitle">Bimanual Examination Findings</span><br/>

<table width="650" border="0" cellpadding="0" cellspacing="0" class="eformLargePopulatedTable" id="EndoProceduresTable"  style="margin-bottom: 0px; border: solid 1px #cccccc;">
<tr>
	<td height="30">
	
		<euc:EformRadioButtonGroup Table="EncBimanualExams" Field="BimanualResult" id="BimanualResult" GroupName="BimanualResult" runat="server">
    		<euc:EformRadioButton Id="BimanualResult_Normal" Value="Normal" runat="server"/>Normal<span style="width: 80px;">&nbsp;</span>
			<euc:EformRadioButton Id="BimanualResult_Abnormal" Value="Abnormal" runat="server"/>Abnormal		</euc:eformradiobuttongroup>
		<span style="width: 20px;">&nbsp;</span>
		<euc:EformRadioButtonGroup Table="NoTable" Field="BimanualMassOrInduration" id="BimanualMassOrInduration" GroupName="BimanualMassOrInduration" runat="server">
    		<euc:EformRadioButton Id="BimanualMassOrInduration_Mass" Value="Mass" runat="server"/>Mass<span style="width: 30px;">&nbsp;</span>
			<euc:EformRadioButton Id="BimanualMassOrInduration_Induration" Value="Induration" runat="server"/>Induration		</euc:eformradiobuttongroup>	</td>
<tr>
  <td height="50" style="padding-left:13px;">Induration / Thickening Location 
    <euc:EformTextBox ID="BimanualIndurationLocation" Table="NoTable" Field="BimanualIndurationLocation" runat="server" style="width: 100px;"/></td>
<tr>
  <td height="70" style="padding-left:13px;" nowrap><table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td rowspan="2" valign="bottom" style="padding-right: 15px;" >Mass Size</td>
        <td style="font-size:10px; font-weight: 400;">length (cm)</td>
        <td style="font-size:10px; font-weight: 400;">width (cm)</td>
        <td style="font-size:10px; font-weight: 400;">height (cm)</td>
      </tr>
      <tr>
        <td><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncBimanualExams" FIELD="BimanualLength" Runat="server" ID="BimanualLength" ShowNumberPad="true"/>&nbsp;&nbsp;&nbsp;x&nbsp;&nbsp;&nbsp;</td>
        <td><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncBimanualExams" FIELD="BimanualWidth" Runat="server" ID="BimanualWidth" ShowNumberPad="true"/>&nbsp;&nbsp;&nbsp;x&nbsp;&nbsp;&nbsp;</td>
        <td><euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="EncBimanualExams" FIELD="BimanualHeight" Runat="server" ID="BimanualHeight" ShowNumberPad="true"/></td>
      </tr>
    </table></td>
<tr>
  <td height="70" style="padding-left:13px;"><table border="0" cellspacing="0" cellpadding="4">
  <tr>
    <td rowspan="2" valign="top" style="padding-right: 15px;">Involvement of </td>
    <td><euc:EformCheckbox TABLE="EncBimanualExams" FIELD="BimanualVaginaInv" Runat="server" ID="BimanualVaginaInv" Value="True" /> Vagina</td>
    <td><euc:EformCheckbox TABLE="EncBimanualExams" FIELD="BimanualRectumInv" Runat="server" ID="BimanualRectumInv" Value="True" /> Rectum</td>
    <td><euc:EformCheckbox TABLE="EncBimanualExams" FIELD="BimanualCervixInv" Runat="server" ID="BimanualCervixInv" Value="True" /> Cervix</td>
  </tr>
  <tr>
    <td><euc:EformCheckbox TABLE="EncBimanualExams" FIELD="BimanualUrethraInv" Runat="server" ID="BimanualUrethraInv" Value="True" /> Urethra</td>
    <td><euc:EformCheckbox TABLE="EncBimanualExams" FIELD="BimanualL_SidewallInv" Runat="server" ID="BimanualL_SidewallInv" Value="True" /> Pelvic Sidewall - Left</td>
    <td><euc:EformCheckbox TABLE="EncBimanualExams" FIELD="BimanualR_SidewallInv" Runat="server" ID="BimanualR_SidewallInv" Value="True" /> Pelvic Sidewall - Left</td>
  </tr>
</table>
</td>
<tr>
  <td height="40" style="padding-left:13px;">&nbsp;</td>
</table>


<br/><br/><br/>