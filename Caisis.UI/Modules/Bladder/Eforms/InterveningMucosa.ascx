<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.InterveningMucosa" CodeFile="InterveningMucosa.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="InterveningMucosa" id="InterveningMucosa" />
<!--<a name="ClinicDate" id="ClinicDate" />--><span class="controlBoxTitle">Intervening Mucosa</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable" >
    
	<euc:EformRadioButtonGroup Table="NoTable" Field="Intervening_Mucosa" id="Intervening_Mucosa" GroupName="Intervening_Mucosa_Group" runat="server">
			<euc:EformRadioButton Id="Intervening_Mucosa_1" Value="Normal" runat="server" Text="Normal" /><br  />
			<euc:EformRadioButton Id="Intervening_Mucosa_2" Value="CIS" runat="server" Text="CIS" /><br/>
			<euc:EformRadioButton Id="Intervening_Mucosa_3" Value="Inflammatory" runat="server" Text="Inflammatory" /><br/>
			<euc:EformRadioButton Id="Intervening_Mucosa_4" Value="Radiation Cystitis" runat="server" Text="Radiation Cystitis" /><br/>
			<euc:EformRadioButton Id="Intervening_Mucosa_5" Value="Other" runat="server" Text="Other (specify)" />

    </euc:EformRadioButtonGroup> <euc:EformTextBox ShowCalendar="False" CalcDate="False" style="width:160px;"  TABLE="NoTable" FIELD="Intervening_Mucosa_Other"  Runat="server" ID="Intervening_Mucosa_Other" ShowNumberPad="false"/>
    
    </td>
  </tr>
 
</table><br/><br/><br/>