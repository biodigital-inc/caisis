<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Bladder.Eforms.CystoscopyInstructionsReviewed" CodeFile="CystoscopyInstructionsReviewed.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />
<a name="CystoscopyInstructionsReviewed" id="CystoscopyInstructionsReviewed" />
<span class="controlBoxTitle">Verification</span><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600"  class="eformLargePopulatedTable">
  
  <tr>
    <td style="vertical-align: top; width: 35px; padding-right: 0px;">
    
        <euc:EformCheckbox TABLE="NoTable" FIELD="ProcedureVerification" Runat="server" ID="ProcedureVerification_Field" Value="Post instructions reviewed. Fact Cards 'Instructions Following Your Cystoscopy' provided to patient." style="padding-left: 0px;" />
    
        
    
    </td>
    <td style="vertical-align: top; width: 565px; padding-left: 0px;">
    
        Post instructions reviewed. Fact Cards "Instructions Following Your Cystoscopy" provided to patient.<br /><br />
    
        
    
    </td>  </tr>
 
</table>

<br/><br/><br/>