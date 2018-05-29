<%@ Control Language="c#" Inherits="Caisis.UI.Core.Help.ImageToolTip" CodeFile="ImageToolTip.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseControl" %>
<script src="/ClientScripts/Help.js" type="text/javascript"></script>
<div id="helpLayer" style="Z-INDEX:1; VISIBILITY:hidden; WIDTH:201px; POSITION:absolute">
	<table width="201" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td><img src="/Images/shim.gif" width="15" height="1"></td>
			<td><img src="/Images/shim.gif" width="5" height="1"></td>
			<td><img src="/Images/shim.gif" width="176" height="1"></td>
			<td><img src="/Images/shim.gif" width="5" height="1"></td>
		</tr>
		<tr>
			<td colspan="4" align="right"><img src="/Images/helpBubbleTop.gif" width="187" height="3"></td>
		</tr>
		<tr>
			<td valign="top" class="helpLeftBG"><img src="/Images/helpBubblePointer.gif" width="15" height="10" vspace="5"></td>
			<td bgcolor="#fbfbef" class="helpLeftBG">&nbsp;</td>
			<td bgcolor="#fbfbef" class="helpText" align="center"><asp:Image Width="175" ImageUrl="/Images/Workflows/FormScreenshotURONP_Medications.gif"></asp:Image></td>
			<td bgcolor="#fbfbef" class="helpRightBG">&nbsp;</td>
		</tr>
		<tr>
			<td class="helpLeftBG" height="25">&nbsp;</td>
			<td bgcolor="#fbfbef" class="helpLeftBG">&nbsp;</td>
			<td align="right" bgcolor="#fbfbef" class="helpText">&nbsp;</td>
			<td bgcolor="#fbfbef" class="helpRightBG">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="4" align="right"><img src="/Images/helpBubbleBottom.gif" width="187" height="3"></td>
		</tr>
	</table>
</div>