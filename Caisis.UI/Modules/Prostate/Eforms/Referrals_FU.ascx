<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.Referrals_FU" CodeFile="Referrals_FU.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Referrals_FU" /><span class="controlBoxTitle">Referrals</span><br>

<table width="650" border="0" cellspacing="0" cellpadding="10" class="eformLargePopulatedTable" >
  <tr>
    <td >
	<euc:EformCheckbox TABLE="NoTable" FIELD="Referral_SexMedConsult" Runat="server" ID="Referral_SexMedConsult" Value="Sexual Med Consult"/> Sexual Med Consult
	<img src="../../../Images/shim.gif" width="50" height="1" /> 
	<euc:EformCheckbox TABLE="NoTable" FIELD="Referral_RadTxConsult" Runat="server" ID="Referral_RadTxConsult" Value="Radiation Tx Consult"/> Radiation Tx Consult
	<img src="../../../Images/shim.gif" width="50" height="1" /> 
	<euc:EformCheckbox TABLE="NoTable" FIELD="Referral_MedOncConsult" Runat="server" ID="Referral_MedOncConsult" Value="Medical Oncology Consult"/> Medical Oncology Consult
	</td>
  </tr>
</table>
<br/>
<br/>
<br/>
