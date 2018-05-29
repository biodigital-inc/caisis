<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BulkUploadForm.aspx.cs" Inherits="Caisis.UI.Plugins.FileLoader.BulkUploadForm" %>

<%@ Import Namespace="System.Collections.Generic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bulk File Uploader</title>
</head>
<body>
    <form id="form1" runat="server">
    <h2>
        Bulk Uploader</h2>
    <table border="1" cellpadding="1">
        <tr>
            <td>
                Source Directory
            </td>
            <td>
                <asp:Label runat="server" ID="SourceDirectory"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                Target Directory
            </td>
            <td>
                <asp:Label runat="server" ID="DestinationDirectory"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                Run Upload
            </td>
            <td>
                <asp:Button runat="server" ID="VerifyBtn" Text="PREVIEW Bulk Upload" OnClick="DoBulkUpload" />
            </td>
        </tr>
        <tr>
            <td>
                Results
            </td>
            <td>
                <asp:Label runat="server" ID="Message"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Panel runat="server" ID="LivePanel" Visible="false">
        <h2>
            Total Files:
            <asp:Label runat="server" ID="TotalFiles" Text="0"></asp:Label>
        </h2>
        <h2>
            Total to Upload:
            <asp:Label runat="server" ID="TotalToUploadFiles" Text="0"></asp:Label>
        </h2>
        <h2>
            Total Uploaded:
            <asp:Label runat="server" ID="TotalUploaded" Text="0"></asp:Label></h2>
        <asp:GridView runat="server" ID="AuditGridView" AutoGenerateColumns="true">
        </asp:GridView>
        <asp:Button runat="server" ID="DoRunBtn" Text="RUN Bulk Upload" OnClick="DoBulkUpload" />
    </asp:Panel>
    </form>
</body>
</html>
