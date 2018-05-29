<%@ Page Language="C#" ContentType="text/xml" EnableViewState="false" AutoEventWireup="true"
    CodeFile="ProtocolsCallBack.aspx.cs" Inherits="Caisis.UI.Core.Utilities.ProtocolsCallBack" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Protocols Viewer</title>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Formatted table to appear on Client -->
        <table style="table-layout: fixed; background-color: #ffffff; white-space: normal;
            border: 1px solid black; width: 80%;" align="center" cellspacing="2" cellpadding="0"
            border="0">
            <asp:Repeater ID="ProtocolRepeater" runat="server">
                <ItemTemplate>
                    <tr>
                        <td colspan="1" valign="top" style="font-weight: bold;">
                            Protocol Title</td>
                        <td colspan="3">
                            <span>
                                <%# Server.HtmlEncode(Eval("ProtocolTitle").ToString()) %>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="font-weight: bold;">
                            IRB #</td>
                        <td>
                            <span>
                                <%# Server.HtmlEncode(Eval("ProtocolNum").ToString()) %>
                            </span>
                        </td>
                        <td valign="top" style="font-weight: bold;">
                            Short Description</td>
                        <td>
                            <span>
                                <%# Server.HtmlEncode(Eval("ProtocolAlias").ToString()) %>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" style="font-weight: bold;">
                            Principal Investigator</td>
                        <td>
                            <span>
                                <%# Server.HtmlEncode(Eval("ProtocolPI").ToString()) %>
                            </span>
                        </td>
                        <td valign="top" style="font-weight: bold;">
                            Department</td>
                        <td>
                            <span>
                                <%# Server.HtmlEncode(Eval("ProtocolDept").ToString()) %>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" valign="top" style="font-weight: bold;">
                            Notes</td>
                        <td colspan="3">
                            <span>
                                <%# Server.HtmlEncode(Eval("ProtocolNotes").ToString()) %>
                            </span>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </form>
</body>
</html>
