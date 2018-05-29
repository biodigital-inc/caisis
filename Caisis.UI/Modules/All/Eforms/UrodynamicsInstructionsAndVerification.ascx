<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.UrodynamicsInstructionsAndVerification" CodeFile="UrodynamicsInstructionsAndVerification.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="UrodynamicsInstructionsAndVerification" id="UrodynamicsInstructionsAndVerification" />
<span class="controlBoxTitle"><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Instructions &amp; Verification"></asp:Label></span><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600"  class="eformLargePopulatedTable">
  
  <tr>
    <td style="vertical-align: top; width: 35px; padding-right: 0px;">
    
        <euc:EformCheckbox TABLE="NoTable" FIELD="Instructions" Runat="server" ID="Instructions" Value="Post instructions reviewed. Fact Cards 'Instructions Following Your Urodynamics Study' provided to patient." style="padding-left: 0px;" />    </td>
    <td style="vertical-align: top; width: 565px; padding-left: 0px;">
    
    Post instructions reviewed. Fact Cards "Instructions Following Your Urodynamics Study" provided to patient.    </td>  </tr>
  <tr>
    <td style="vertical-align: top; width: 35px; padding-right: 0px; padding-top: 0px;"><euc:EformCheckbox TABLE="NoTable" FIELD="ProcedureVerification" Runat="server" ID="ProcedureVerification" Value="Patient Identity has been confirmed and agreement of planned procedure with patient and consent ensured." style="padding-left: 0px;" />
    </td>
    <td style="vertical-align: top; width: 565px; padding-left: 0px; padding-top: 0px;"> Patient Identity has been confirmed and agreement of planned procedure with patient and consent ensured. </td>
  </tr>
</table>

<br/><br/><br/>