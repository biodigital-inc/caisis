<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.ProcedureVerification" CodeFile="ProcedureVerification.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="ProcedureVerification" id="ProcedureVerification" />
<span class="controlBoxTitle">Verification</span><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable">
    
        Patient identity has been confirmed and agreement of planned procedure with patient ensured.<br /><br />
    
        <euc:EformCheckbox TABLE="NoTable" FIELD="ProcedureVerification" Runat="server" ID="ProcedureVerification_Field" Value="Yes" style="padding-left: 250px;" /> Yes
    
    </td>
  </tr>
 
</table>

<br/><br/><br/>