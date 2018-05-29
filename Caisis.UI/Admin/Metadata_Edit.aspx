<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Metadata_Edit.aspx.cs" Inherits="Caisis.UI.Admin.Metadata_Edit" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit Table and Field Metadata</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../ClientScripts/PatientDataEntry.js"></script>

    <script type="text/javascript" src="../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        Browser.ResizeElement({ nodeId: 'TabsOverflow', heightOffset: 225 });

        /* ]]> */
    </script>

    <script type="text/javascript">
        /* <![CDATA[ */

        // confirm deleting of attribute type
        function confirmAttributeDelete(type) {
            var buffer = new Array();
            buffer.push('Are you sure you would like to delete this ' + type + ' attribute?');
            buffer.push('Deleting this attribute will also delete any ' + type + ' metadata associated with this attribute.');

            var message = buffer.join('\n');
            return confirm(message);
        }

        function showHideFieldAttribute(index) {
            var btn = $('FieldAttributes_Btn_' + index);
            var row = $('FieldAttributes_Row_' + index);
            row.style.display = row.style.display == 'block' ? 'none' : 'block';
            return false;
        }

        /* ]]> */
    </script>

    <style type="text/css">
        #TabsOverflow
        {
            overflow: auto;
        }

        #UpdateBtn
        {
            float: right;
        }
        .dataGrid
        {
            margin: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Tabs" class="EditDataEntryForm_ChildTable">
        <div class="EditDataEntryForm_ChildTableTitleOuterContainer" >
            <span id="Tabs_Link_0" class="EditDataEntryForm_ChildTableTitleInnerContainer" onclick="setActiveDataEntryTab('Tabs', 0);">
                <span id="Tabs_Text_0" class="EditDataEntryForm_ChildTableTitle">Table Attributes</span></span>
            <span id="Tabs_Link_1" class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled"
                onclick="setActiveDataEntryTab('Tabs', 1);"><span id="Tabs_Text_1" class="EditDataEntryForm_ChildTableTitle">
                    Field Attributes</span></span>
            <div id="TabsOverflow">
                <div id="Tabs_Tab_0">
                    <custom:ExtendedGridView runat="server" ID="TableAttributesGrid" TableName="MetadataTableAttributes"
                        DataKeyNames="TableAttributeId" AutoGenerateColumns="false" OnRowDeleted="RebuildOnDelete"
                        BlankRows="1" VisibleBlankRows="1" GridLines="None" CssClass="dataGrid" RowStyle-CssClass="dataGridItemRowA"
                        AlternatingRowStyle-CssClass="dataGridItemRowB" VisibleBlankRowCssClass="dataGridBlankRowVisible">
                        <Columns>
                            <custom:ExtendedTemplateField HeaderText="Table Attribute Name">
                                <ItemTemplate>
                                    <cic:CaisisTextBox runat="server" ID="AttributeName" ShowLabel="false" Table="MetadataTableAttributes"
                                        Field="TableAttributeName" Width="200px"></cic:CaisisTextBox>
                                </ItemTemplate>
                            </custom:ExtendedTemplateField>
                            <custom:ExtendedTemplateField HeaderText="Table Attribute Description">
                                <ItemTemplate>
                                    <cic:CaisisTextBox ID="AttributeDescription" ShowLabel="false" runat="server" Table="MetadataTableAttributes"
                                        Field="TableAttributeDescription" Width="300px"></cic:CaisisTextBox>
                                </ItemTemplate>
                            </custom:ExtendedTemplateField>
                            <custom:ExtendedTemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Button runat="server" ID="DeleteBtn" CommandName="Delete" Text="Delete" OnClientClick="return confirmAttributeDelete('Table');"
                                        CssClass="dataEntryButtonGray" Visible='<%# !string.IsNullOrEmpty(Eval("TableAttributeId").ToString()) %>' />
                                </ItemTemplate>
                            </custom:ExtendedTemplateField>
                        </Columns>
                    </custom:ExtendedGridView>
                </div>
                <div id="Tabs_Tab_1" style="display: none;" align="center">
                    <table style="table-layout: fixed; ">
                        <thead>
                            <tr>
                                <th style="width: 280px; white-space:nowrap; ">
                                    Field Attribute
                                </th>
                                <th style="width: 300px; white-space:nowrap; ">
                                    Field Attribute Description
                                </th>
                                <th style="width: 80px; white-space:nowrap; ">
                                    Delete
                                </th>
                            </tr>
                        </thead>
                    </table>
                    <custom:ExtendedGridView runat="server" ID="FieldAttributesGrid" TableName="MetadataFieldAttributes"
                        DataKeyNames="AttributeId" AutoGenerateColumns="false" AutoBindChildGridByRowPrimaryKey="true"
                        OnRowDeleted="RebuildOnDelete" BlankRows="1" VisibleBlankRows="1" GridLines="None"
                        CssClass="dataGrid" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                        VisibleBlankRowCssClass="dataGridBlankRowVisible" ShowHeader="false">
                        <Columns>
                            <custom:ExtendedTemplateField>
                                <ItemTemplate>
                                    <table>
                                        <tr>
                                            <td style="width: 40%;">
                                                <table>
                                                    <tr>
                                                        <td><cic:CaisisTextBox runat="server" ID="AttributeName" ShowLabel="false" Table="MetadataFieldAttributes"
                                                                Field="AttributeName" Width="200px"></cic:CaisisTextBox></td>
                                                        <td><button id="FieldAttributes_Btn_<%# Container.DataItemIndex %>" class="dataEntryButtonGray"
                                                                onclick="return showHideFieldAttribute(<%# Container.DataItemIndex %>);">
                                                                options</button></td>
                                                    </tr>
                                                </table>                                               
                                            </td>
                                            <td style="width: 40%;">
                                                <cic:CaisisTextBox ID="AttributeDescription" ShowLabel="false" runat="server" Table="MetadataFieldAttributes"
                                                    Field="FieldAttributeDescription" Width="300px"></cic:CaisisTextBox>
                                            </td>
                                            <td>
                                                <asp:Button runat="server" ID="DeleteBtn" CommandName="Delete" Text="Delete" OnClientClick="return confirmAttributeDelete('Field');"
                                                    CssClass="dataEntryButtonGray" Visible='<%# !string.IsNullOrEmpty(Eval("AttributeId").ToString()) %>' />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <div id="FieldAttributes_Row_<%# Container.DataItemIndex %>" style="display: none;" align="left">
                                                    Attribute Options
                                                    <custom:ExtendedGridView runat="server" ID="FieldAttributeOptionsGrid" TableName="MetadataFieldAttributeValueOptions"
                                                        DataKeyNames="AttributeId,AttributeOptionId" GridLines="None" AutoGenerateColumns="false"
                                                        RebindOnDelete="true" BlankRows="3" VisibleBlankRows="3" ShowHeader="false">
                                                        <Columns>
                                                            <custom:ExtendedTemplateField>
                                                                <ItemTemplate>
                                                                    <cic:CaisisTextBox runat="server" ID="AttributeOptionValue" ShowLabel="false" Table="MetadataFieldAttributeValueOptions"
                                                                        Field="AttributeOptionValue" Width="200px"></cic:CaisisTextBox>
                                                                </ItemTemplate>
                                                            </custom:ExtendedTemplateField>
                                                            <custom:ExtendedTemplateField>
                                                                <ItemTemplate>
                                                                    <asp:Button runat="server" ID="DeleteBtn" CommandName="Delete" Text="Delete" OnClientClick="return confirmDelete();"
                                                                        CssClass="dataEntryButtonGray" Visible='<%# !string.IsNullOrEmpty(Eval("AttributeOptionId").ToString()) %>' />
                                                                </ItemTemplate>
                                                            </custom:ExtendedTemplateField>
                                                        </Columns>
                                                    </custom:ExtendedGridView>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </custom:ExtendedTemplateField>
                        </Columns>
                    </custom:ExtendedGridView>
                </div>
            </div>
        </div>
        <asp:Button runat="server" ID="UpdateBtn" Text="Update" OnClick="UpdateClick" CssClass="dataEntryButtonGray" />
    </div>
    </form>
</body>
</html>
