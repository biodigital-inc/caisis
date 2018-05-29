<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEditFieldMetadataMisc.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminEditFieldMetadataMisc" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Misc Field Attributes</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .MiscFieldAttributesPanel label,.MiscFieldAttributesPanel input, .MiscFieldAttributesPanel select
        {
            display: inline-block;
            min-width: 125px;
            margin-right: 2px;
        }
        .attributeFieldWrapper
        {
            display: block;
            width: 45%;
            margin: auto;
            float: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <cic:CaisisHidden runat="server" ID="DiseaseAttributeId" Table="DiseaseAttributes"
            Field="DiseaseAttributeId">
        </cic:CaisisHidden>
        <%-- Field Attributes --%>
        <asp:PlaceHolder runat="server" ID="MetadataAttributesContainer"></asp:PlaceHolder>
        <%-- Field Attribute Values --%>
        <div style="height: 300px; overflow: auto; overflow-x: none;">
            <asp:GridView runat="server" ID="MetadataGrid" DataKeyNames="FieldId,FieldName" AutoGenerateColumns="false"
                ShowHeader="false" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
                RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                GridLines="None" OnRowCreated="AddDynamicFieldAttributes" Width="100%">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <%-- dynamically generated field attribute values --%>
                            <asp:Panel runat="server" ID="MiscFieldAttributesPanel" CssClass="MiscFieldAttributesPanel">
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:Button runat="server" ID="UpdateBtn" OnClick="UpdateClick" Text="Save Field Attributes"
            CssClass="dataEntryButtonGray largeButton" Style="float: right; margin-right: 10px;
            margin-top: 10px;" />
    </div>
    </form>
</body>
</html>
