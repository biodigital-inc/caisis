<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PreliminaryRecommendations" CodeFile="PreliminaryRecommendations.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="PreliminaryRecommendations" id="PreliminaryRecommendations" />
<span class="controlBoxTitle">Preliminary Recommendations</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="600">
  
  <tr>
    <td class="eformLargePopulatedTable"><euc:EformTextArea TextMode="MultiLine" TABLE="Encounters" FIELD="EncChiefComplaint" Rows="4" style="width: 550px;" Runat="server" ID="EncChiefComplaint"/></td>
  </tr>
 
</table>

<br/><br/><br/>