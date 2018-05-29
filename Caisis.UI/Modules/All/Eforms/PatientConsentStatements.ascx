<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PatientConsentStatements" CodeFile="PatientConsentStatements.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<style  type="text/css">

#RisksDiscussedTable
{
    margin-top: 50px;
    background-position: left center;
    width: 650px;
}
#RisksDiscussedTable td
{
    font-weight: bold;
    padding: 8px 3px 8px 3px;
    vertical-align: top;
}
</style>
	<a name="PatientConsentStatements" />
<table id="RisksDiscussedTable" class="eformLargePopulatedTable" cellspacing="0" >
<tr>
<td>
<euc:EformCheckBox ID="TreatmentRisksDiscussed" Table="NoTable" Field="TreatmentRisksDiscussed" runat="server" Value="Risks, benefits and rationale of treatment plan discussed in detail. All questions answered."/>
</td>
<td>Risks, benefits and rationale of treatment plan discussed in detail. All questions answered.</td>
</tr>
<tr>
<td>
<euc:EformCheckBox ID="ProtocolRisksDiscussed" Table="NoTable" Field="ProtocolRisksDiscussed" runat="server" Value="The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent."  />
</td>
<td>The patient reviewed and signed the informed consent. The patient received a signed copy of the informed consent.</td>
</tr>
</table>
<br/><br/>
  
