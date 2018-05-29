<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.UrodynamicsVerification" CodeFile="UrodynamicsVerification.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="UrodynamicsVerification" id="UrodynamicsVerification" />
<span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Verification"></asp:Label></span><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600"  class="eformLargePopulatedTable">
  
  <tr>
    <td style="vertical-align: top; width: 35px; padding-right: 0px;">
    
        <euc:EformCheckbox TABLE="NoTable" FIELD="ProcedureVerification" Runat="server" ID="Instructions" Value="Patient Identity has been confirmed and agreement of planned procedure with patient and consent ensured." style="padding-left: 0px;" />
    
        
    
    </td>
    <td style="vertical-align: top; width: 565px; padding-left: 0px;">
    
        Patient Identity has been confirmed and agreement of planned procedure with patient and consent ensured.
    
        
    
    </td>  </tr>
 
</table>

<br/><br/><br/>