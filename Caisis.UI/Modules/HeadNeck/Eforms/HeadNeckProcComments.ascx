<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeadNeckProcComments.ascx.cs" Inherits="Caisis.UI.Modules.All.Eforms.HeadNeckProcComments" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css" />



<a name="HeadNeckProcComments" id="HeadNeckProcComments" />
<span class="controlBoxTitle">Procedure Comments</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		

		<euc:EformTextArea TextMode="MultiLine" TABLE="Procedures" RecordId="1" FIELD="ProcNotes" Rows="12" style="width: 550px;" Runat="server" ID="ProcNotes"/>
 
        
	</td>

  </tr>
</table>
<br/><br/><br/>