<%@ Reference Page="~/Admin/AdminUserToGroup.aspx" %>

<%@ Page AutoEventWireup="true" Language="C#" Inherits="Caisis.UI.Admin.AdminEmailUser"
    CodeFile="AdminEmailUser.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
    <title>Admin Email User</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    input[type="text"],textarea
    {
        width: 250px;
    }
    td
    {
        vertical-align: top;
    }
    </style>
</head>
<body>
    <form id="MailForm" method="post" runat="server">
    <asp:Panel runat="server" ID="EmailUserPanel">
        <table style="width: 100%; table-layout: fixed;" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <input type="hidden" id="newUserBool" value="false" runat="server" />
                    <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td style="width: 75px;">
                                <label for="txtFrom" class="boldText">
                                    from</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFrom" runat="server" />
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtFrom"
                                    ErrorMessage="from address is required." ID="Requiredfieldvalidator2"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="Regularexpressionvalidator1" runat="server" ErrorMessage="please enter a valid email address"
                                    ControlToValidate="txtFrom" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtTo" class="boldText">
                                    to</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTo" runat="server" />
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtTo"
                                    ErrorMessage="to address is required." ID="Requiredfieldvalidator1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="Validator2" runat="server" ErrorMessage="please enter a valid email address"
                                    ControlToValidate="txtTo" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtBcc" class="boldText">
                                    bcc</label>
                            </td>
                            <td valign="top">
                                <asp:TextBox ID="txtBcc" runat="server" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="please enter a valid email address"
                                    ControlToValidate="txtBcc" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtSubject" class="boldText">
                                    subject</label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSubject" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="adminFieldLabel" colspan="2">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="txtContent" class="boldText">
                                    your message</label>
                            </td>
                            <td>
                                <textarea runat="server" id="txtContent" rows="300" cols="120"
                                    style="height: 120px;" name="txtContent"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtContent"
                                    ErrorMessage="please enter a message body." ID="Requiredfieldvalidator3" /></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="height: 30px;" class="adminFieldLabel">
                                &nbsp;
                            </td>
                            <td style="width: 200px;" align="left">
                                <asp:Button runat="server" ID="SendBtn" OnClick="SendButtonClick" Text="Send" CssClass="dataEntryButtonGray" />
                                <asp:Button runat="server" ID="CancelBtn" OnClientClick="this.form.reset(); return false;"
                                    Text="Cancel" CssClass="dataEntryButtonGray" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel runat="server" ID="MessageNewUser" Visible="false">
        <div>
            Your message has been sent to the new user.</div>
        <p>
            Would you like to add this user to a group? <a href="AdminUserToGroup.aspx?userId=<%= userId %>&newUser=yes">
                Yes</a> <a href="AdminAddUser.aspx">No</a>
        </p>
    </asp:Panel>
    <asp:Panel runat="server" ID="MessageNormalUser" Visible="false">
        Your message has been sent. <!--<a href="?">Email another user?</a>-->
    </asp:Panel>
    </form>
</body>
</html>
