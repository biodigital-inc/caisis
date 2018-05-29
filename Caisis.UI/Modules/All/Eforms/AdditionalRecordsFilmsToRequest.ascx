<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.AdditionalRecordsFilmsToRequest" CodeFile="AdditionalRecordsFilmsToRequest.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="AdditionalRecordsFilmsToRequest"  />
<span class="controlBoxTitle">Additional Records/Films to Request</span><br/>
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		
	<euc:EformTextArea TextMode="MultiLine" Table="NoTable" Field="AdditionalRecordsToRequest" Rows="2" style="width: 600px; height: 36px;" Id="AdditionalRecordsToRequest" Runat="server" />
	</td>

  </tr>

</table>
<br/><br/>
