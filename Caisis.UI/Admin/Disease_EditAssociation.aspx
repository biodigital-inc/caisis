<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Disease_EditAssociation.aspx.cs"
    Inherits="Caisis.UI.Admin.Disease_EditAssociation" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Disease Associations</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        /* <![CDATA[ */


        function closeDataEntry() {
            if (top.reloadDataEntryFrame) {
                top.reloadDataEntryFrame();
            }
            if (top.hideModal) {
                top.hideModal();
            }
        }

        /* ]]> */
    </script>

    <style type="text/css">
        .dataGrid
        {
            width: 96%;
            margin: 0px auto 0px auto;
            border-style: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="max-height: 430px; overflow: auto; overflow-x: none; border: 1px solid #cccccc;">
        <custom:ExtendedGridView runat="server" ID="DiseaseTableGrid" CssClass="dataGrid"
            RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
            GridLines="None" TableName="DiseaseAttributeValues" AutoGenerateColumns="false"
            OnRowDataBound="SetMainLabel" ShowHeader="false">
            <Columns>
                <custom:ExtendedTemplateField HeaderText="Apply To Disease" ItemStyle-Width="30px"
                    ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <cic:CaisisCheckBox runat="server" ID="DiseaseCheckBox" Table="DiseaseAttributeValues"
                            Field="DiseaseAttributeValue" />
                    </ItemTemplate>
                </custom:ExtendedTemplateField>
                <asp:TemplateField HeaderText="Table">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="MainLabel" AssociatedControlID="DiseaseCheckBox"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </custom:ExtendedGridView>
    </div>
    <asp:ImageButton runat="server" ID="SaveBtn" ImageUrl="~/Images/AdminImages/submit.gif"
        OnClick="SaveClick" Style="float: right; margin-top: 10px;" />
    </form>
</body>
</html>
