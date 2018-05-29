<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminImportData.aspx.cs" Inherits="Caisis.UI.Admin.AdminImportData" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="val" Namespace="Caisis.UI.Core.Classes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Import data from Excel/CSV</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../ClientScripts/headerJS.js"></script>
    <script type="text/javascript" src="../ClientScripts/Admin.js"></script>

    <script type="text/javascript">
        function confirmExport() {
            var response = confirm('Are you SURE you want to export results to excel that contains patient identifiers?');
            if (response == true) { return true; }
            else { return false; }
        }

        function alertError() {
            alert('Error uploading the data. Please verify if is is a valid CSV (Comma delimited) file!');
        }

        function alertSuccess() {
            alert('Data uploaded successfully!');
        }

        function alertNoData() {
            alert('There are no results to export to excel !');
        }

    </script>
    <style type="text/css">
        #TableSelectionLabel {
            width: 250px;
            display: block;
            margin: 15px auto;
            font-size: 13px;
            font-weight: bold;
        }

        #TableSelection {
            font-weight: bold;
            font-size: 12px;
        }

        .dataGrid tr.updated {
            background-color: #f8fafc;
        }

        .dataGrid tr.not-impotred {
            background-color: #eeeeee;
        }

        .dataGrid tr.inserted {
            background-color: #ffffff;
        }

        .importNotice {
        }

        #Header {
            margin: 10px auto;
            display: block;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Select Table -->
        <label id="TableSelectionLabel">
            Table Selection: 
        <asp:DropDownList runat="server" ID="TableSelection" AutoPostBack="true" OnSelectedIndexChanged="OnTableSelection">
            <asp:ListItem Text="--- Select a Table ---" Value=""></asp:ListItem>
            <asp:ListItem Text="Pathology Tests" Value="PathTest"></asp:ListItem>
            <asp:ListItem Text="Action Items" Value="Actions"></asp:ListItem>
        </asp:DropDownList></label>
        <asp:Panel runat="server" ID="MainImportContainer" Visible="false">
            <!-- Header -->
            <p id="Header"><b>NOTE:</b> Make sure that column names in the attached CSV file match the column names in the Caisis table: <span runat="server" id="SelectedTable" class="boldText"></span> (<span runat="server" id="SelectedFields" class="boldText"></span>). Order of columns doesn't matter.</p>
            <!-- PathTest Upload -->
            <asp:Panel runat="server" ID="PathTestPanel" Visible="false">
                <h3>Select file to import data into PathTests table for Neuro Patients (CSV format)</h3>
                <asp:FileUpload runat="server" ID="FileUploadBtn" />
                <asp:Button runat="server" OnCommand="UploadPathTest" CommandArgument="preview" CssClass="dataEntryButtonGray" Text="Preview Data" />
                <asp:Button runat="server" ID="ImportBtn" CssClass="dataEntryButtonRed" Text="Import Data"
                    OnCommand="UploadPathTest" />
                <val:ExcelExportImageButton ID="ExcelBtn" runat="server" OnClick="ExportToExcelClick" Visible="false" />
                <asp:GridView ID="dataGrid" runat="server" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
                    OnRowDataBound="SetGridViewState" />
            </asp:Panel>
            <!-- ActionItem Upload -->
            <asp:Panel runat="server" ID="ActionsPanel" Visible="false">
                <h3>Select a file (CSV format) for upload into the Action Items table.</h3>
                <asp:FileUpload runat="server" ID="ActionItemFileUpload" />
                <asp:Button runat="server" OnCommand="UploadActionItems" CommandArgument="preview" CssClass="dataEntryButtonGray" Text="Preview Data" />
                <asp:Button runat="server" OnCommand="UploadActionItems" CssClass="dataEntryButtonRed" Text="Import Data" />
                <asp:GridView runat="server" ID="ActionItemPreview" AutoGenerateColumns="true" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" OnRowDataBound="SetGridViewState">
                </asp:GridView>
            </asp:Panel>
        </asp:Panel>
    </form>
</body>
</html>
