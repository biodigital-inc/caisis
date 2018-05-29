<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.EncountersNotes" CodeFile="EncountersNotes.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>


<a name="EncountersNotes" id="EncountersNotes" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Additional Notes"></asp:Label><br/>

<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		<euc:EformTextArea id="EncDateText" Table="Encounters" Field="EncNotes" Rows="7" Width="550" runat="server"/>
	</td>
 </tr>
</table>
<br/><br/><br/>