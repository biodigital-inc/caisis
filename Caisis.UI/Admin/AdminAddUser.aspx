<%@ Reference Page="~/Admin/AdminEmailUser.aspx" %>
<%@ Reference Page="~/Admin/AdminUserToGroup.aspx" %>
<%@ Page Language="C#" Inherits="Caisis.UI.Admin.AdminAddUser" CodeFile="AdminAddUser.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Administrator</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    /* <![CDATA[ */
    function focusOnUser()
    {
        var userName = document.getElementById('UserName');
        if(userName){ userName.focus(); }
    }
    function setPassword()
    {				
        var pswdType = document.getElementById('<%= PswdType.ClientID %>');
        var userPswd = document.getElementById('<%= UserPassword.ClientID %>');
        var randomPswd = document.getElementById('<%= RandomPasswordHolder.ClientID %>');
        userPswd.value = pswdType.checked ? randomPswd.value : '';
    }
    function populateUser(username, email, firstname, lastname, employeeID)
    {
		document.getElementById('UserName').value = username;
		document.getElementById('UserEmail').value = email;
		document.getElementById('UserFirstName').value = firstname;
		document.getElementById('UserLastName').value = lastname;
		document.getElementById('UserEmployeeId').value = employeeID;
    }
    function openSearchLayer()
    {
		document.getElementById('LdapFrame').src = 'AdminLdapSearch.aspx';
		document.getElementById('LdapLayer').style.visibility = 'visible';
    }
    function closeSearchLayer()
    {
		document.getElementById('LdapFrame').src = '';
		document.getElementById('LdapLayer').style.visibility = 'hidden';
    }
    /* ]]> */
    </script>
    <style type="text/css">
    .LDAPGray
    {
        background-color: #cccccc;
    }
    </style>
</head>
<body onload="focusOnUser();" class="AdminBody">
<form id="userForm" method="post" runat="server">
<input type="hidden" id="RandomPasswordHolder" runat="server" name="RandomPasswordHolder" />
 <table width="520" border="0" cellspacing="0" cellpadding="0">
 <tr>
		<td colspan="2"><asp:Literal ID="valMsg" runat="server"></asp:Literal></td>
</tr>
<tr>
	<td>
	<table id="AddUserTable" runat="server" width="520" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="100" height="30" class="adminFieldLabel">username</td>
      <td><input class="adminField" type="text" id="UserName" runat="server" tabindex="1" maxlength="50" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id="SearchLdapButton" runat="server" visible="false" type="button" onclick="openSearchLayer();" value="Search LDAP" />
      <asp:RequiredFieldValidator Runat="server" Display="Dynamic" ControlToValidate="UserName" ErrorMessage="username is required." ID="Requiredfieldvalidator1"/></td>
    </tr>
    <tr> 
      <td height="30" class="adminFieldLabel">password *</td>
      <td><input class="adminField" type="text" id="UserPassword" runat="server" tabIndex="2" maxLength="50" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="PswdType" value="true" id="PswdType" runat="server" onclick="setPassword();" /><label for="PswdType">random</label>
			<asp:RequiredFieldValidator Runat="server" Display="Dynamic" ControlToValidate="UserPassword" ErrorMessage="password is required." ID="PasswordValidator"/>
		</td>
    </tr>
    <tr> 
      <td height="30" class="adminFieldLabel">employee id</td>
      <td><input class="adminField" type="text" id="UserEmployeeId" runat="server" tabIndex=3 maxLength=50 />
	  </td>
	</tr>
    <tr> 
      <td height="30" class="adminFieldLabel">email</td>
      <td><input class="adminField"  type="text" id="UserEmail" runat="server" tabIndex=4 maxLength=50 />
       <asp:RegularExpressionValidator id="Validator2" runat="server" ErrorMessage="please enter a valid email address" ControlToValidate="UserEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
	  </td>
	</tr>
    <tr> 
      <td height="30" class="adminFieldLabel">first name</td>
      <td><input class="adminField"  type="text" id="UserFirstName" runat="server" tabIndex=5 maxLength=50 /></td>
    </tr>
    <tr> 
      <td height="30" class="adminFieldLabel">last name</td>
      <td><input type="text" id="UserLastName" runat="server" tabIndex=6 maxLength=50 class="adminField" ></td>
    </tr>
    <tr>
      <td height="30" class="adminFieldLabel">&nbsp;</td>
      <td><asp:ImageButton ID="SubmitBtn" OnCommand="SubmitButtonClick" Runat=server ImageUrl="../Images/AdminImages/submit.gif"></asp:ImageButton>&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="CancelBtn" OnCommand="CancelButtonClick" Runat=server ImageUrl="../Images/ButtonCancel.gif"></asp:ImageButton></td>
    </tr>
        <tr runat="server" id="UseLDAPRow" visible="false">
            <td colspan="2">
                * The system is currently configured to use LDAP Authentication.
            </td>
        </tr>
  </table>
  </td>
 </tr>
 </table>
 <!-- TODO: search (not type-ahead) via AJAX -->
 <div id="LdapLayer" style="top: 200px; width: 350px; height: 160px; position: absolute; Z-INDEX: 10; display: block;  OVERFLOW: hidden;">
	<iframe  id="LdapFrame" frameborder="0" width="100%" height="95%" scrolling="no" src="AdminLdapSearch.aspx" runat="server"/>
</div>
</form>
</body>
</HTML>
