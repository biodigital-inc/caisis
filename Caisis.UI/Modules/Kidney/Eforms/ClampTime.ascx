<%@ Control Language="c#" Inherits="Caisis.UI.Modules.Kidney.Eforms.ClampTime" CodeFile="ClampTime.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl" %>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<a name="ClampTime" />

<span class="controlBoxTitle">Clamp Time</span><br />
<table border="0" cellspacing="0" cellpadding="16" width="600" class="eformLargePopulatedTable">

 <tr >
	<td >
		<euc:EformTextBox CssClass="InputText" style="width: 75px;" Table="NephrectomyProc" Field="ProcPartialClampDuration" id="ProcPartialClampDuration" runat="server" ShowNumberPad="true" /> minutes
	</td>

  </tr>
</table>
<br/><br/><br/>

