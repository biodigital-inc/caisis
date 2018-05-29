<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.Diagnosis" CodeFile="Diagnosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">
<a name="Diagnosis" id="Diagnosis" />
<span class="controlBoxTitle">Diagnosis</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">
  
  <tr>
    <td >Preoperatve<br/><euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="Diagnosis_PreOp" Rows="7"   style="width: 250px;" Runat="server" ID="Diagnosis_PreOp"/></td>
    <td >Postoperatve<br/><euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="Diagnosis_PostOp" Rows="7" style="width: 250px;"   Runat="server" ID="Diagnosis_PostOp"/></td>
</tr>
 
</table><br/><br/><br/>