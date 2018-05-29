<%@ Reference Page="~/Admin/AdminEmailUser.aspx" %>
<%@ Page language="c#" Inherits="Caisis.UI.Admin.AdminEditPassword" CodeFile="AdminUpdatePassword.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
  <HEAD>
		<title>Email Administrator</title>
		<meta content="Microsoft Visual Studio 7.0" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<meta content="NOINDEX" name="ROBOTS">
		<meta http-equiv="PRAGMAS" content="NO-CACHE">
		<meta http-equiv="EXPIRES" content="0">
		<meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
<link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css">
<style type="text/css">
.LDAPGray
    {
        background-color: #cccccc;
    }
</style>
  </HEAD>

<body class="AdminBody">
<form id="dataForm" method="post" runat="server">
<input type="hidden" id="RandomPasswordHolder" runat="server">
<table width="520" border="0" cellspacing="0" cellpadding="0">
	<tr>
	<td> 
	<table id="SelectUserTable" runat="server" width="520" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="2" class="adminFieldLabel">Please select user:</td>
	</tr>
	<tr>
		<td colspan="2"><input id="SelectSubmitted" runat="server" type="hidden" value="false" NAME="SelectSubmitted">
		<select id="SelectUserName" runat="server" style="width:250" NAME="SelectUserName"></select></td>
	</tr>
	</table>
	
	<table id="FormTable" runat="server" width="520" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
      <td height="30" class="adminFieldLabel" width="100">&nbsp;</td>
      <td>use random password<input type="checkbox" name="PswdType" value="true" Checked ID="PswdType" Runat="server"/>
     </td>
    </tr>
	<tr>
      <td height="30" class="adminFieldLabel" width="100">enter new password *</td>
      <td><input type="text" id="UserPassword" runat="server" tabIndex=5 maxLength=50>
        <asp:RequiredFieldValidator Runat="server" Display="Dynamic" ControlToValidate="UserPassword" ErrorMessage="New password is required." ID="Passwordvalidator"/></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td height="30" class="adminFieldLabel">&nbsp;</td>
      <td><asp:ImageButton ID="UpdateBtn" OnCommand="UpdateButtonClick" Runat=server src="../Images/ButtonUpdate.gif"></asp:ImageButton>&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="CancelBtn" OnCommand="CancelButtonClick" Runat=server src="../Images/ButtonCancel.gif"></asp:ImageButton></td>
    </tr>
    <tr runat="server" id="UseLDAPRow" visible="false">
    <td height="30" class="adminFieldLabel">&nbsp;</td>
        <td>
            * The system is currently configured to use LDAP Authentication.
        </td>
    </tr>
  </table>
  </td>
  </tr>
  <tr>
	<td height="50" valign="middle"><asp:Literal ID="valMsg" Runat=server></asp:Literal></td>
</tr>
</table>
</form>
</body>
</HTML>
