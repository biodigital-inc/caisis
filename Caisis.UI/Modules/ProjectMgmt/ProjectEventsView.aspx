<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectEventsView.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectEventsView" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Events</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater runat="server" ID="EventsRptr">
                <ItemTemplate>
                    <h3>
                        Event Title</h3>
                    <table style="vertical-align: top; width: 100%;">
                        <tbody>
                            <tr>
                                <td>
                                    Event Type
                                </td>
                                <td>
                                    <cc:CaisisTextBox runat="server" Table="ProjectEvent" ID="ProjectEventType" Field="EventType"></cc:CaisisTextBox>
                                </td>
                                <td>
                                    Pending
                                </td>
                                <td>
                                    <cc:CaisisCheckBox runat="server" Table="ProjectEvent" ID="CaisisTextsBox1" Field="EventType" />
                                </td>
                                <td>
                                    Notes
                                </td>
                                <td rowspan="2">
                                    <cc:CaisisTextArea runat="server" Table="ProjectEvent" ID="CaisisTextBox2" Field="EventType"></cc:CaisisTextArea>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Start Date
                                </td>
                                <td>
                                    <cc:CaisisTextBox runat="server" Table="ProjectEvent" ID="CaisisTextBox4" Field="EventType"></cc:CaisisTextBox>
                                </td>
                                <td>
                                    Stop Date
                                </td>
                                <td>
                                    <cc:CaisisTextBox runat="server" Table="ProjectEvent" ID="CaisisTextBox5" Field="EventType"></cc:CaisisTextBox>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
