<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.ProcedureNotes" CodeFile="ProcedureNotes.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="ProcedureNotes" id="ProcedureNotes" />
<span class="controlBoxTitle">Notes</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		

		<euc:EformTextArea TextMode="MultiLine" TABLE="Procedures" RecordId="1" FIELD="ProcNotes" Rows="12" style="width: 550px;" Runat="server" ID="ProcNotes"/>
 
        
	</td>

  </tr>
</table>
<br/><br/><br/>
