<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PreAndPostOpDiagnosis" CodeFile="PreAndPostOpDiagnosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="PreAndPostOpDiagnosis" />
<span class="controlBoxTitle">Preoperative Diagnosis</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		
<euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="PreOpDiagnosis" Rows="4" style="width: 550px;" Runat="server" ID="PreOpDiagnosis"/>
		
		
 
        
	</td>

  </tr>
</table>
<br/><br/><br/>


<span class="controlBoxTitle">Postoperative Diagnosis</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		
<euc:EformTextArea TextMode="MultiLine" TABLE="NoTable" FIELD="PostOpDiagnosis" Rows="4" style="width: 550px;" Runat="server" ID="PostOpDiagnosis"/>		
		
 
        
	</td>

  </tr>
</table>
<br/><br/><br/>

