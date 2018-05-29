<%@ Page Language="c#" Inherits="Caisis.UI.Core.Utilities.EmailAdmin" CodeFile="EmailAdmin.aspx.cs" %>
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
        <LINK href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet">
        <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>
        <script type="text/javascript">
			function detectScreenVars()
			{
				if (document.getElementById('screenResolution'))
				{
					document.getElementById('screenResolution').value = screen.width + ' x ' + screen.height;
					document.getElementById('colorDepth').value = screen.colorDepth;
				}
			}
        </script>
    </HEAD>
    <body leftMargin="0" topMargin="0" rightMargin="0" onload="this.window.focus();detectScreenVars();">
        <div id="sentMessageTable" style="VERTICAL-ALIGN: baseline; WIDTH: 500px; TEXT-INDENT: 30px; HEIGHT: 400px; TEXT-ALIGN: center"
            runat="server">
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <span class="popupAlert">Thank you! Your email has been sent and will be<br>
                responded to as quickly as possible.</span><br>
            <br>
            <br>
            <br>
            <a href="javascript:this.window.close();"><img src="../../Images/closeWindow.gif" height="22" width="98" border="0" title="Close Window"></a>
        </div>
        <form id="MailForm" method="post" runat="server">
            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                <tr>
                    <td align="center" height="400">
                        <table cellpadding="0" cellspacing="0" border="0" width="400">
                            <TBODY>
                                <tr>
                                    <td colspan="6"><img src="../../Images/ContactAdministratorTop.gif" height="37" width="400" border="0"><br>
                                    </td>
                                </tr>
                                <tr class="popupTable">
                                    <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                    <td><img src="../../Images/shim.gif" height="1" width="26" border="0"></td>
                                    <td><img src="../../Images/shim.gif" height="1" width="82" border="0"></td>
                                    <td><img src="../../Images/shim.gif" height="1" width="10" border="0"></td>
                                    <td><img src="../../Images/shim.gif" height="1" width="280" border="0"></td>
                                    <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                </tr>
                                <tr class="popupTable">
                                    <td class="loginBorder" height="60"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                    <td>&nbsp;</td>
                                    <td colspan="3">Please enter the details of your question or problem below. An<br>
                                        administrator will answer your question as soon as possible.<br>
                                        <br>
                                        <asp:RequiredFieldValidator ControlToValidate="txtFrom" id="FromValidator1" style="LEFT: 76px; POSITION: absolute; TOP: 120px"
                                            runat="server" ErrorMessage="Please enter your email address in the 'from' field." Width="260px" Height="23px"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ControlToValidate="txtFrom" id="FromValidator2" style="LEFT: 76px; POSITION: absolute; TOP: 120px"
                                            runat="server" ErrorMessage="Please Enter a Valid From Email address" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator id="ToValidator1" style="LEFT: 30px; POSITION: absolute; TOP: 30px" runat="server"
                                            ErrorMessage="Please Enter the Email To." Width="200px" Height="23px" ControlToValidate="txtTo"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator id="ToValidator2" style="LEFT: 30px; POSITION: absolute; TOP: 30px" runat="server"
                                            ErrorMessage="Please Enter a Valid To Email address" ControlToValidate="txtTo" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                        <input id="fromFName" type="hidden" runat="server" name="fromFName"><input id="fromLName" type="hidden" runat="server" NAME="fromLName"><input id="fromUName" type="hidden" runat="server" NAME="fromUName"><input id="screenResolution" type="hidden" name="screenResolution"><input id="colorDepth" type="hidden" name="colorDepth"><input id="browserSize" type="hidden" name="browserSize"><asp:Label CssClass="LoginError" ID="ErrorMsg" Runat="server" />
                                    </td>
                                    <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                </tr>
                                <tr class="popupTable">
                                    <td class="loginBorder" height="22"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                    <td>&nbsp;</td>
                                    <td class="popupLabel">from</td>
                                    <td>&nbsp;</td>
                                    <td><asp:TextBox CssClass="popupField" id="txtFrom" runat="server" /></td>
                                    <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                </tr>
                                <tr class="popupTable">
                                    <td class="loginBorder" height="22"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                    <td>&nbsp;</td>
                                    <td class="popupLabel">to</td>
                                    <td>&nbsp;</td>
                                    <td><asp:TextBox CssClass="popupField" id="txtTo" runat="server" /></td>
                                    <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                </tr>
                                <tr class="popupTable">
                                    <td class="loginBorder" height="22"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                    <td>&nbsp;</td>
                                    <td class="popupLabel">subject</td>
                                    <td>&nbsp;</td>
                                    <td><asp:TextBox CssClass="popupField" id="txtSubject" runat="server" /></td>
                                    <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                </tr>
                                <tr class="popupTable">
                                    <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                    <td colspan="4">&nbsp;</td>
                                    <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                </tr>
                                <tr class="popupTable">
                                    <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                    <td>&nbsp;</td>
                                    <td class="popupLabel" valign="top">your message</td>
                                    <td>&nbsp;</td>
                                    <td><textarea Class="popupField" runat="server" id="txtContent" style="HEIGHT: 90px" NAME="txtContent"></textarea></td>
                                    <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                                </tr>
                                <%---
	<tr class="popupTable">
	<td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	<td >&nbsp;</td>
	<td class="popupLabel" valign="top"><input type="checkbox" id="sendPatientInfo" value="true" /></td>
	<td >&nbsp;</td>
	<td >Send administrator information about the current patient along with my message</td>
	<td  class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0" /></td>
	</tr>
---%>
                </tr>
                <tr class="popupTable">
                    <td class="loginBorder" height="40"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                    <td colspan="4" align="center"><asp:ImageButton ImageUrl="../../Images/send.gif" Height="22" Width="56" ID="imgBtnSend" Runat="server" /></td>
                    <td class="loginBorder"><img src="../../Images/shim.gif" height="1" width="1" border="0"></td>
                </tr>
                <tr class="popupTable">
                    <td colspan="6"><img src="../../Images/ContactAdministratorBottom.gif" height="4" width="400" border="0"><br>
                    </td>
                </tr>
            </table>
            </TD></TR></TBODY></TABLE>
        </form>
    </body>
</HTML>
