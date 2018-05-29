<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demo.aspx.cs" Inherits="spaw2_demo_demo" ValidateRequest="false" %>
<%@ Register TagPrefix="spaw" Namespace="Solmetra.Spaw2" Assembly="Solmetra.Spaw2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SPAW Editor v.2 .NET Edition Demo #1</title>
    <link rel="stylesheet" type="text/css" href="../wysiwyg.css" />
</head>
<body>
    <form id="form1" runat="server">
    <p>
        This is a simple <a href="http://spaweditor.com/" target="_top"><strong>SPAW Editor</strong></a><strong>
            version 2 .NET Edition</strong> demonstration. This is the WYSIWYG
        control in it's simplest form and with default settings. If you can see and operate
        the Editor below, then you have properly installed and configured SPAW Editor.</p>
        <p>
        For advanced demonstration see <a href="demo2.aspx">Demo #2</a>.
        </p>
    <spaw:Editor ID="spaw1" runat="server" />    
        <br />
        <asp:Button ID="Button1" runat="server" Text="Submit Form" /><br />
        <br />
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <strong>Here's the resulting output from the instance of SPAW Editor above:</strong><br />
                <br />
                <asp:Label ID="Label1" runat="server" Width="98%" BorderColor="#cccccc" BorderWidth="1px" style="padding: 5px;"></asp:Label></asp:Panel>
    </form>
</body>
</html>
