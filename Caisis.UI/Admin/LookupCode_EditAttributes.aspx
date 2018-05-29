<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LookupCode_EditAttributes.aspx.cs"
    Inherits="Caisis.UI.Admin.EditAttributes" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Lookup Attributes</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>
    <script type="text/javascript">
        /* <![CDATA[ */
        
        function lookupAttributesUpdated() {
            if(top.hideModal) {
                top.hideModal();
            }
        }
        
        /* ]]> */
    </script>
    <style type="text/css">
        input[type="text"]
        {
            background-color: transparent;
        }
    </style>

</head>
<body class="AdminBody">
    <form id="form1" runat="server">
    <div style="max-height: 270px; overflow: auto; overflow-x: hidden;">
        <custom:ExtendedGridView runat="server" ID="AttributesGrid" CssClass="dataGrid" RowStyle-CssClass="dataGridItemRowA"
                    AlternatingRowStyle-CssClass="dataGridItemRowB"  TableName="LookupAttributes"
            DataKeyNames="AttributeId" AutoGenerateColumns="false" BlankRows="3" VisibleBlankRows="3"
            OnRowDeleted="RebingAfterDelete" Width="94%" HeaderStyle-BackColor="#00668d" HeaderStyle-ForeColor="#ffffff">
            <Columns>
                <custom:ExtendedTemplateField HeaderText="Attribute" ItemStyle-Width="92%">
                    <ItemTemplate>
                        <cic:CaisisTextBox runat="server" ID="AttributeName" Table="LookupAttributes" Field="AttributeName"
                            ShowLabel="false" style="width: 90%;"></cic:CaisisTextBox>
                    </ItemTemplate>
                </custom:ExtendedTemplateField>
                <custom:GridRowDeleteImage ItemStyle-HorizontalAlign="Center"></custom:GridRowDeleteImage>
            </Columns>
        </custom:ExtendedGridView>
    </div>
    <asp:Button runat="server" ID="UpdateBtn" Text="Update" CssClass="dataEntryButtonGray" OnClick="UpdateClick" style="float: right; margin-right: 100px; margin-top: 8px;" />
    </form>
</body>
</html>
