<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demo2.aspx.cs" Inherits="spaw2_demo_demo2" ValidateRequest="false" %>
<%@ Register TagPrefix="spaw" Namespace="Solmetra.Spaw2" Assembly="Solmetra.Spaw2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>SPAW Editor v.2 .NET Edition Demo #2</title>
    <link rel="stylesheet" type="text/css" href="../wysiwyg.css" />
</head>
<body>
    <form id="form1" runat="server">
    
    <p>
        This is the demonstration of <strong>only some</strong> of the advanced features found in <a href="http://spaweditor.com/" target="_top"><strong>SPAW Editor</strong></a><strong>
            version 2 .NET Edition.</strong></p>
        <p>
            <em>Note: This demonstration asumes that the default configuration file found in the
                distribution archive is unmodified. In case you have already modified configuration,
                some of the features described below might not work as described.</em></p>
        <p>
            This is what is demonstrated in this script:</p>
        <ul>
            <li>there are 3 wysiwyg editors on the page;</li>
            <li><strong>minimize loading time</strong>: all 3 are controlled by a single floating
                toolbar (originating from the first editor);</li>
            <li><strong>save space</strong>: first editor has 2 pages (see tabs at the top) which
                is equivalent to having 2 editors (or as much as you want);</li>
            <li><strong>control available features</strong>: users can switch first (top) editor
                to HTML mode and back, but can't do the same with 2 small editors at the bottom;</li>
            <li><strong>control file manager according to your business logic</strong>: if you try
                to insert picture (for example) from the top editor you will have access to all
                directories configured in configuration file. However if you do the same from the
                small editors you will only see the "Images" directory (provided you didn't change
                directory configuration in config file). But if you have some subdirectories in
                "Images" you will only see them when accessing through the "small" editors, but
                not the "big" one.</li>
        </ul>
        <p>
        You can learn how to achieve everything mentioned above by analyzing source code
        of this page (<em>demo2.aspx/demo2.aspx.cs</em>).        </p>

    
    <table width="100%" border="0" cellpadding="3" cellspacing="0">
    <tr>
        <td colspan="2">
            <spaw:Editor ID="spaw1" runat="server"
                FloatingMode="True" ToolbarSet="all">
                <Pages>
                    <spaw:EditorPage Caption="English text" ClientID="spaw1" />
                    <spaw:EditorPage Caption="Lithianian translation" ClientID="spaw1_2" />
                </Pages>
            </spaw:Editor>
        </td>
    </tr>
    <tr>
        <td>
            <spaw:Editor ID="spaw2" runat="server"
                Height="100px" FloatingMode="True" ToolbarFromID="spaw1" 
                ModeStripVisible="false" StatusBarVisible="false" Resizable="false" />
        </td>
        <td>
            <spaw:Editor ID="spaw3" runat="server"
                Height="100px" FloatingMode="True" ToolbarFromID="spaw1" 
                ModeStripVisible="false" StatusBarVisible="false" Resizable="false" />
        </td>
    </tr>
    </table>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit Form" /><br />
        <br />

        <asp:Panel ID="Panel1" runat="server" Visible="false">
        <strong>Here's the resulting output from the instances of SPAW Editor above:</strong><br />
                <br />
        <table width="100%" border="0" cellpadding="7" cellspacing="0" style="border: solid 1px #cccccc; border-collapse:collapse;">
        <tr>
            <th colspan="2" style="border: solid 1px #cccccc; background-color: #cccccc;">Content of the first page (English text) of the first editor (top):
            </th>
        </tr>
        <tr>
            <td colspan="2"  style="border: solid 1px #cccccc;">
            <asp:Label ID="spaw1Text" runat="server" />
            </td>
        </tr>
        <tr>
            <th colspan="2" style="border: solid 1px #cccccc; background-color: #cccccc;">Content of the second page (Lithuanian translation) of the first editor (top):
            </th>
        </tr>
        <tr>
            <td colspan="2" style="border: solid 1px #cccccc;">
            <asp:Label ID="spaw12Text" runat="server" />
            </td>
        </tr>
        <tr>
            <th valign="top" style="border: solid 1px #cccccc; background-color: #cccccc;">Content of the bottom left editor:
            </th>
            <th valign="top" style="border: solid 1px #cccccc; background-color: #cccccc;">Content of the bottom right editor:
            </th>
        </tr>
        <tr>
            <td valign="top" style="border: solid 1px #cccccc;">
            <asp:Label ID="spaw2Text" runat="server" />
            </td>
            <td valign="top" style="border: solid 1px #cccccc;">
            <asp:Label ID="spaw3Text" runat="server" />
            </td>
        </tr>
        </table>
        </asp:Panel>
    </form>
</body>
</html>
