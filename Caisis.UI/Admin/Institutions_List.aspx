<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Institutions_List.aspx.cs"
    Inherits="Caisis.UI.Admin.Institutions_List" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Institutions Table</title>
    <link rel="stylesheet" type="text/css" href="../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="../StyleSheets/AdminStyles.css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        // closes the data entry form and closes modal
        function closeDataEntry() {
            var modalCaller = top.getModalCallingWindow ? top.getModalCallingWindow() : null;
            modalCaller = modalCaller || top;
            // reload main frame
            modalCaller.location = modalCaller.location;
            // close modal
            if (top.hideModal) {
                top.hideModal();
            }
        }

        /* ]]> */
    </script>

</head>
<body class="AdminBody">
    <form id="form1" runat="server">
    <!-- Institutions Grid -->
    <div style="margin-left: auto; margin-right: auto; width: 400px; padding-bottom: 10px;">
        <custom:ExtendedGridView runat="server" ID="InstitutionGrid" TableName="Institutions"
            DataKeyNames="InstitutionId" Width="100%" GridLines="None" CssClass="dataGrid"
            HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
            AutoGenerateColumns="false" HorizontalAlign="Center" BlankRows="3" VisibleBlankRows="3"
            OnRowDeleted="RebindOnDelete">
            <Columns>
                <asp:TemplateField HeaderText="Current Institutions">
                    <ItemTemplate>
                        <cic:CaisisTextBox runat="server" ID="InstitutionName" ShowLabel="false" Table="Institutions"
                            Field="Institution" Width="95%"></cic:CaisisTextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <custom:GridRowDeleteImage>
                </custom:GridRowDeleteImage>
            </Columns>
        </custom:ExtendedGridView>
        <asp:Button ID="SaveInstitutionsBtn" Text="Update" runat="server" CssClass="dataEntryButtonGray NavListFooterButton"
            OnCommand="SaveInstitutionsGrid" Style="float: right;" />
    </div>
    </form>
</body>
</html>
