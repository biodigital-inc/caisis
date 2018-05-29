<%@ Page language="c#" Inherits="Caisis.UI.Admin.AdminEditDeleteUser" CodeFile="AdminEditDeleteUser.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
    <title>Admin Edit/Delete User</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">  
    /* <![CDATA[ */
		
	function confirmUserDelete()
	{
		return confirm('Are you sure you want to permanently delete this user?');
	}
	
	function addDate(cb)
	{
	    var deactivateDate = document.getElementById('DeactivateDate');
	    deactivateDate.value = cb.checked ? '<%= DateTime.Today.ToShortDateString() %>' : '';
	}
		
     /* ]]> */
    </script>

</head>
    <body class="AdminBody">
        <form id="userForm" method="post" runat="server">
            <table width="520" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td>
                        <table id="SelectUserTable" runat="server" width="520" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td colspan="2" class="adminFieldLabel">Please select user:</td>
                            </tr>
                            <tr>
                                <td colspan="2"><input id="SelectSubmitted" runat="server" type="hidden" value="false">
                                    <select id="SelectUserName" runat="server" style="WIDTH:250px">
                                    </select></td>
                            </tr>
                        </table>
                        <table id="FormTable" runat="server" width="520" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td colspan="2">&nbsp;</td>
                            </tr>
                            <tr>
                                <td width="100" height="30" class="adminFieldLabel">username</td>
                                <td><input type="text" id="UserName" runat="server" tabIndex="2" maxLength="50" NAME="UserName"
                                        class="adminField">
                                    <asp:RequiredFieldValidator Runat="server" Display="Dynamic" ControlToValidate="UserName" ErrorMessage="UserName is required."
                                        ID="Requiredfieldvalidator1" /></td>
                            </tr>
                            <tr>
                                <td height="30" class="adminFieldLabel">email</td>
                                <td><input type="text" id="UserEmail" runat="server" tabIndex="3" maxLength="50" NAME="UserEmail"
                                        class="adminField"></td>
                            </tr>
                            <tr>
                                <td height="30" class="adminFieldLabel">first name</td>
                                <td><input type="text" id="UserFirstName" runat="server" tabIndex="4" maxLength="50" NAME="UserFirstName"
                                        class="adminField"></td>
                            </tr>
                            <tr>
                                <td height="30" class="adminFieldLabel">last name</td>
                                <td><input type="text" id="UserLastName" runat="server" tabIndex="5" maxLength="50" NAME="UserLastName"
                                        class="adminField"></td>
                            </tr>
                             <tr>
                                <td height="30" class="adminFieldLabel">employee id</td>
                                <td><input type="text" id="UserEmployeeId" runat="server" tabIndex="6" maxLength="50" NAME="UserEmployeeId"
                                        class="adminField"></td>
                            </tr>
                            <tr>
                                <td height="30" class="adminFieldLabel"><label for="Deactivate" title="Deactivate User">deactivate</label></td>
                                <td>
                                    <input type="checkbox" id="Deactivate" title="Deactivate User" value="yes" runat="server"
                                        tabindex="6" onclick="addDate(this);" />date
                                    <input type="text" id="DeactivateDate" runat="server" tabindex="7" maxlength="50"
                                        name="DeactivateDate" class="adminField" style="width: 80px;" />
                                </td>
                            </tr>
                            <tr>
                                <td height="60" class="adminFieldLabel">&nbsp;</td>
                                <td><asp:ImageButton ID="EditBtn" OnCommand="UpdateButtonClick" Runat="server" ImageUrl="../Images/ButtonUpdate.gif"></asp:ImageButton>&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="DeleteBtn" OnClientClick="return confirmUserDelete();" OnCommand="DeleteButtonClick" Runat="server" ImageUrl="../Images/ButtonDelete.gif"></asp:ImageButton>&nbsp;&nbsp;&nbsp;&nbsp;<asp:ImageButton ID="CancelBtn" OnCommand="CancelButtonClick" Runat="server" ImageUrl="../Images/ButtonCancel.gif"></asp:ImageButton>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td><asp:Literal ID="valMsg" Runat="server"></asp:Literal></td>
                </tr>
            </table>
        </form>
    </body>
</html>
