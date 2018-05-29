<%@ Control Language="c#" Inherits="Caisis.UI.Modules.All.Eforms.EstBloodLoss" CodeFile="EstBloodLoss.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css">



<a name="EstBloodLoss" id="EstBloodLoss" />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td style="padding-top: 20px;">
		
		<span class="controlBoxTitle">Estimated Blood Loss</span> <euc:EformTextBox CssClass="InputText" style="width: 80px;" Table="OperatingRoomDetails" Field="OpEstBloodLoss" id="OpEstBloodLoss" runat="server" ShowNumberPad="true" /> cc 

</tr>   
</table>
<br/><br/><br/>
