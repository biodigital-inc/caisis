<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.PatientsNotes" CodeFile="PatientsNotes.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="PatientsNotes" id="EncountersNotes" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Additional Notes"></asp:Label><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		<euc:EformTextArea id="PtNotes" Table="Patients" Field="PtNotes" Rows="7" Width="550" runat="server"/>
	</td>
 </tr>
</table>
<br/><br/><br/>