<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupCode_QuickView.aspx.cs"
    Inherits="Caisis.UI.Admin.LookupCode_QuickView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lookup Code Quick View</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <thead>
                <tr>
                    <th>
                        Lookup Code
                    </th>
                    <th>
                        Lookup Description
                    </th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater runat="server" ID="LkpCodesRptr">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <%# Eval("LkpCode") %>
                            </td>
                            <td>
                                <%# Eval("LkpDescription") %>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    </form>
</body>
</html>
