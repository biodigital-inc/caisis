<%@ Page language="c#" Inherits="Caisis.UI.Core.Utilities.ForgotPassword" CodeFile="ForgotPassword.aspx.cs" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" > 

<html>
  <head>
    <title>ForgotPassword</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta content="NOINDEX" name="ROBOTS">
		<meta http-equiv="PRAGMAS" content="NO-CACHE">
		<meta http-equiv="EXPIRES" content="0">
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
		<script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
		<LINK href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
  </head>
  <body>
	
<div id="FormTable" runat="server">
   		<form id="FPForm" method="post" runat="server">
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr><td align="center" height="400">
	<table cellpadding="0" cellspacing="0" border="0" width="400">
	<tr>
	<td colspan="6"><img src="../../Images/ForgotYourPasswordTop.gif" height="37" width="400" border="0" /><br></td>
	</tr>
	<tr class="popupTable">
	<td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	<td ><img src="../../Images/shim.gif" height="1" width="26" border="0" /></td>
	<td ><img src="../../Images/shim.gif" height="1" width="82" border="0" /></td>
	<td ><img src="../../Images/shim.gif" height="1" width="10" border="0" /></td>
	<td ><img src="../../Images/shim.gif" height="1" width="280" border="0" /></td>
	<td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	</tr>
	<tr class="popupTable">
	<td  class="loginBorder" height="60"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	<td >&nbsp;</td>
	<td colspan="3">Please enter your username and a new password will be sent to the<br>email address on record. <br><span id="ValidationMsg" runat="server" class="LoginError"></span><br>
	</td>
	<td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	</tr>
	<tr class="popupTable">
	<td  class="loginBorder" height="38"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	<td >&nbsp;</td>
	<td class="popupLabel">username</td>
	<td >&nbsp;</td>
	<td ><input type="text" class="popupField" ID="userName" runat="server" NAME="userName" /></td>
	<td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	</tr>
	
	<tr class="popupTable">
	<td  class="loginBorder" height="40"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	<td colspan="4" align="center"><input type="image" id="submitButton" src="../../Images/requestNewPassword.gif" height="22" width="159" /></td>
	<td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	</tr>
	<tr class="popupTable">
	<td  class="loginBorder" height="20"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	<td colspan="4" align="center">&nbsp;</td>
	<td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	</tr>
	<tr class="popupTable">
	<td colspan="6"><img src="../../Images/ContactAdministratorBottom.gif" height="4" width="400" border="0" /><br></td>
	</tr>
	</table>
	</td></tr></table>

		</form>
</div>
	
	
	<div id="SentTable" style="VERTICAL-ALIGN: baseline; WIDTH: 500px; TEXT-INDENT: 30px; HEIGHT: 400px; TEXT-ALIGN: center" runat="server">
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
		<span class="popupAlert"><asp:Label ID="emailMessage" Runat="server"></asp:Label></span><br><br><br><br>
				<a href="javascript:this.window.close();"><img src="../../Images/closeWindow.gif" height="22" width="98" border="0" title="Close Window" /></a>
	</div>
  </body>
</html>
