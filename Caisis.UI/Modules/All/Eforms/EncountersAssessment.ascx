<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.EncountersAssessment" CodeFile="EncountersAssessment.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="EncountersAssessment" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Assessment"></asp:Label><br/>

<table width="650" border="0" cellspacing="0" cellpadding="10" style="border: solid 1px #cccccc;">
  <tr>
    <td width="50" align="right" class="ClinicalEformGridColumnTwo"><strong>ECOG </strong></td>
    <td width="100" class="ClinicalEformGridColumnTwo"><euc:EformComboBox style="width:60px;" TABLE="Encounters" FIELD="EncECOG_Score" Runat="server" ID="EncECOG_Score" LookupCode="EncECOG_Score" DropDownWidth="575px"/></td>
    <td width="50" align="right" class="ClinicalEformGridColumnOne"><strong>KPS</strong></td>
    <td width="100" class="ClinicalEformGridColumnOne"><euc:EformComboBox ShowCalendar="False" CalcDate="False" style="width:60px;" TABLE="Encounters" FIELD="EncKPS" LookupCode="EncKPS_Score" Runat="server" ID="KPS" DropDownWidth="575px" /></td>
  </tr>
</table>
<br/>
<br/>
<br/>
