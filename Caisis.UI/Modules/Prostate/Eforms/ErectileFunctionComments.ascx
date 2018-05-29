<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Prostate.Eforms.ErectileFunctionComments" CodeFile="ErectileFunctionComments.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="ErectileFunctionComments" />
<span class="controlBoxTitle">Comments</span><br />
<table width="650" border="0" cellpadding="8" cellspacing="0" class="eformLargePopulatedTable">
          <tr> 
            <td  style="width: 30%; white-space: nowrap; padding-left: 15px; vertical-align: top; padding-top: 10px;">
            <span><euc:EformCheckbox TABLE="NoTable" FIELD="ReviewedEMRforMedicalandSurgicalHx" Runat="server" ID="ReviewedEMRforMedicalandSurgicalHx" Value="Yes"/>Reviewed EMR for medical and surgical history</span>
            <br/>
	        <euc:EformTextArea TextMode="MultiLine" Table="NoTable" Field="AdditionalErectileFunctionComments" Rows="4" style="width: 600px;" Id="AdditionalErectileFunctionComments" Runat="server"></euc:EformTextArea>
            </td>
          </tr>
</table>
<br/><br/>