<%@ Page EnableEventValidation="false" language="c#" Inherits="Caisis.UI.Admin.AdminGroups" CodeFile="AdminGroups.aspx.cs" CodeFileBaseClass="Caisis.UI.Admin.AdminBasePage" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<HTML>
    <HEAD>
        <title>Group Administrator</title>
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
    </HEAD>
    <body class="AdminBody">
        <form id="dataForm" method="post" runat="server">
            <table width="490" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td colspan="2" align="right">
                        <div id="RepeaterDiv" runat="server">
                            <table width="570" border="0" cellspacing="3" cellpadding="0">
                               
                                <tr>
                                    <td width="160" class="requiredField">Name</td>
                                    <td width="200" class="requiredField">Description</td>
                                    <td width="100" class="requiredField">Role Assigned</td>
                                    <td width="120" height="20" align="right" class="requiredField">
                                    <a class="requiredField" href="AdminGroups.aspx?addNew=yes">Add New Group &gt;&gt;</a></td>
                                    <!--<a href="AdminGroupsSplash.aspx" class="requiredField">&lt; back</a></td> -->
                                </tr>
                                <tr>
                                    <td height="1" colspan="4" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
                                </tr>
                                <tr>
                                    <td colspan="4" height="238" valign="top"><img src="../Images/shim.gif" width="1" height="1"><br>
                                        <div class="patientDataFormDiv" id="PDFormDiv" style="BORDER-RIGHT: #000000 1px; BORDER-TOP: #000000 1px; Z-INDEX: 1; VISIBILITY: visible; OVERFLOW: auto; BORDER-LEFT: #000000 1px; WIDTH: 600px; BORDER-BOTTOM: #000000 1px; POSITION: absolute; HEIGHT: 450px; BACKGROUND-COLOR: #ffffff; layer-background-color: #ffffff">
                                            <table width="570" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="150"><img src="../Images/shim.gif" width="1" height="1"></td>
                                                    <td width="200"><img src="../Images/shim.gif" width="1" height="1"></td>
                                                    <td width="120" align="center"><img src="../Images/shim.gif" width="1" height="1"></td>
                                                    <td width="110"><img src="../Images/shim.gif" width="1" height="1"></td>
                                                </tr>
                                                <asp:Repeater ID="rptGroups" Runat="server">
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td height="25"><%# ((System.Data.DataRowView)Container.DataItem)["GroupName"]%>&nbsp;</td>
                                                            <td height="25"><%# ((System.Data.DataRowView)Container.DataItem)["GroupDescription"]%>&nbsp;</td>
                                                            <td height="25">&nbsp;&nbsp;&nbsp;<%# ((System.Data.DataRowView)Container.DataItem)["Role"]%>&nbsp;</td>
                                                            <td align="right" nowrap>&nbsp;&nbsp;
                                                                <asp:ImageButton ID="EditBtn" OnCommand="EditButtonClick" CommandName='<%# ((System.Data.DataRowView)Container.DataItem)["GroupId"]%>' Runat=server src="../Images/ButtonEditSmall.gif">
                                                                </asp:ImageButton>&nbsp;&nbsp;&nbsp;
                                                                <asp:ImageButton ID="DeleteBtn" OnCommand="DeleteButtonClick" CommandName='<%# ((System.Data.DataRowView)Container.DataItem)["GroupId"]%>' Runat=server ImageUrl="../Images/ButtonDeleteSmall.gif">
                                                                </asp:ImageButton></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <SeparatorTemplate>
                                                        <tr>
                                                            <td height="1" colspan="4" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
                                                        </tr>
                                                    </SeparatorTemplate>
                                                    <FooterTemplate>
                                                        <tr>
                                                            <td height="1" colspan="4" class="ListManDataTableDottedLine"><img src="../Images/shim.gif" width="1" height="1"></td>
                                                        </tr>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                               
                            </table>
                        </div>
                        <table id="AddGroupTable" runat="server" width="570" border="0" cellspacing="3" cellpadding="0">
                            <tr>
                                <td><input type="hidden" id="GroupId" runat="server"></td>
                            </tr>
                            <tr>
                                <td>group name</td>
                                <td><input type="text" id="GroupName" style="WIDTH:250px" runat="server"><asp:RequiredFieldValidator ControlToValidate="GroupName" ErrorMessage="please enter a group name" Runat="server"
                                        id="RequiredFieldValidator1"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>group description</td>
                                <td><textarea id="GroupDesc" runat="server" style="WIDTH:250px; HEIGHT:60px"></textarea><asp:RequiredFieldValidator ControlToValidate="GroupDesc" ErrorMessage="please enter a description" Runat="server"
                                        id="RequiredFieldValidator2"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td>select role</td>
                                <td><select id="GroupRole" name="GroupRole" runat="server" style="WIDTH:250px"></select><asp:RequiredFieldValidator ControlToValidate="GroupRole" ErrorMessage="please enter a role" Runat="server"
                                        id="RequiredFieldValidator3"></asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td height="30" valign="bottom"><asp:ImageButton ID="AddBtn" OnCommand="AddButtonClick" width="65" height="21" Runat="server" src="../Images/AdminImages/submit.gif"></asp:ImageButton><asp:ImageButton ID="UpdateBtn" OnCommand="UpdateButtonClick" width="65" height="21" Runat="server"
                                        src="../Images/AdminImages/submit.gif"></asp:ImageButton></td>
                            </tr>
                        </table>
                    <td></td>
                <tr>
                    <td colspan="2" valign="middle"><asp:Literal ID="valMsg" Runat="server"></asp:Literal><img src="../Images/shim.gif" width="1" height="1"></td>
                </tr>
            </table>
        </form>
    </body>
</HTML>
