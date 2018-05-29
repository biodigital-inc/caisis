<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.NephPreAndPostOpDiagnosis" CodeFile="NephPreAndPostOpDiagnosis.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>

<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>


<a name="NephPreAndPostOpDiagnosis" />
<span class="controlBoxTitle">Preoperative Diagnosis</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		
<euc:EformTextArea TextMode="MultiLine" TABLE="NephrectomyProc" FIELD="ProcPreOpDiagnosis" Rows="4" style="width: 550px;" Runat="server" ID="PreOpDiagnosis"/>
		
		
 
        
	</td>

  </tr>
</table>
<br/><br/><br/>


<span class="controlBoxTitle">Postoperative Diagnosis</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		
<euc:EformTextArea TextMode="MultiLine" TABLE="NephrectomyProc" FIELD="ProcPostOpDiagnosis" Rows="4" style="width: 550px;" Runat="server" ID="PostOpDiagnosis"/>		
		
 
        
	</td>

  </tr>
</table>
<br/><br/><br/>

