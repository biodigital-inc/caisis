<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Application_Utilities.aspx.cs"
    Inherits="Caisis.UI.Admin.Application_Utilities" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Utilities</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AuditTableGrid
        {
            table-layout: fixed;
            width: 100%;
            margin: 15px auto;
        }
        #AuditTableGrid tr > th
        {
            background-color: #aaa;
            font-size: 13px;
            font-weight: bold;
        }
        #AuditTableGrid tr:nth-child(odd)    
        {
             background-color: #eee;
        }
        #AuditTableGrid tr:nth-child(even)    
        {
            background-color: #ddd;
        }
        #AuditTableGrid tr:hover
        {
            background-color: #bbb;
            font-weight: bold;
        }
        #AuditTableGrid td
        {
            padding: 3px;
        }
        td.invalid
        {
            color: #ffffff;
            background-color: #8D2A2C;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server" ID="Message" CssClass="redText">&nbsp;</asp:Label>
        <h3>
            Application Caching</h3>
        <p>
            Refresh app cached application items, including metadata, lookup codes and menus.
        </p>
        <asp:Button runat="server" ID="ApplicationBtn" Text="Refresh the Application Cache"
            CssClass="dataEntryButtonGray" OnCommand="RefreshApplicationItem" CommandArgument="Application" />
        <p>
            Refresh the lookup code cache.
        </p>
        <asp:Button runat="server" ID="LookupCodesBtn" Text="Refresh the Lookup Code Cache"
            CssClass="dataEntryButtonGray" OnCommand="RefreshApplicationItem" CommandArgument="LookupCodes" />
        <p>
            Refresh cached business object metadata
        </p>
        <asp:Button runat="server" ID="BusinessObjectsBtn" Text="Refresh the Business Object Cache"
            CssClass="dataEntryButtonGray" OnCommand="RefreshApplicationItem" CommandArgument="BusinessObjects" />
        <p>
            Refresh Patient Data Menus
        </p>
        <asp:Button runat="server" ID="PatientDataBtn" Text="Refresh Patient Data Menus"
            CssClass="dataEntryButtonGray" OnCommand="RefreshApplicationItem" CommandArgument="PatientData" />
        <h3>
            Audit Biz Objects
        </h3>
        <asp:Button runat="server" ID="AuditBizBtn" Text="Audit Tables and Business Objects" CssClass="dataEntryButtonGray"
            OnClick="PublishTableAudit" />
        <asp:CheckBoxList runat="server" ID="AuditOptions" RepeatLayout="Table">
            <asp:ListItem Text="Only Show Tables" Selected="False"></asp:ListItem>
            <asp:ListItem Text="Only Show Conflicts" Selected="True"></asp:ListItem>
        </asp:CheckBoxList>
        <asp:GridView runat="server" ID="AuditTableGrid" AutoGenerateColumns="false" UseAccessibleHeader="true"  OnRowDataBound="SetInvalidColumns">
            <Columns>
                <asp:BoundField DataField="Table" HeaderText="Table Name" />
                <asp:BoundField DataField="Field" HeaderText="Field Name" />
                <asp:TemplateField HeaderText="Database">
                    <ItemTemplate>
                        <%# Eval("InDB") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="BusinessObject">
                    <ItemTemplate>
                        <%# Eval("InBiz") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
