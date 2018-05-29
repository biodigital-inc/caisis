<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminUpdateDiseases.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminUpdateDiseases" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Institutions Table</title>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/GlobalStyles.css" />
</head>
<body class="AdminBody">
    <form id="form1" runat="server">
    <div>
        <custom:ExtendedGridView runat="server" ID="DiseaseGrid" TableName="Diseases" DataKeyNames="DiseaseId"
            BlankRows="3" VisibleBlankRows="3" ShowHeader="true" OnRowDeleted="RebuildDiseases" AutoGenerateColumns="false" HeaderStyle-CssClass="dataGridHeader">
            <Columns>
                <custom:ExtendedTemplateField HeaderText="Diease">
                    <ItemTemplate>
                        <custom:CaisisTextBox runat="server" ID="DiseaseNameField" ShowLabel="false" Table="Diseases" Field="DiseaseName" Width="200px"></custom:CaisisTextBox>
                    </ItemTemplate>
                </custom:ExtendedTemplateField>
                <custom:GridRowDeleteImage>
                </custom:GridRowDeleteImage>
            </Columns>
        </custom:ExtendedGridView>
        <asp:ImageButton ID="SaveBtn" ImageUrl="~/Images/DataEntryButtons/Button_Save_On.gif"
            runat="server" OnClick="SaveDiseases" />
    </div>
    </form>
</body>
</html>
