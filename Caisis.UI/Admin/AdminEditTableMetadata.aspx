<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEditTableMetadata.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminEditTableMetadata" %>

<%@ Register TagPrefix="grid" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Edit Table Metadata</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../ClientScripts/PatientDataEntry.js"></script>

    <script type="text/javascript" src="../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        Browser.ResizeElement({ nodeId: 'TabsOverflow', heightOffset: 225 });

        function editTableMetadata(tableName, tableId) { 
            var diseaseId = '<%= QueryDiseaseId %>';
            var url = 'AdminEditFieldMetadata.aspx?tableId=' + tableId + '&diseaseId=' + diseaseId;
            var title = 'Edit ' + tableName + ' Form';
            top.showModalWithConfig(url, title, { width: '100%', height: '100%' });          
            return false;
        }

        /* ]]> */
    </script>

    <style type="text/css">
        #TabsOverflow
        {
            overflow: auto;
        }
        #UpdateBtn,
        #AddTablesBtn
        {
            position: fixed;
            bottom: 35px;
            right: 35px;
            width: 70px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Tabs" class="EditDataEntryForm_ChildTable">
        <div class="EditDataEntryForm_ChildTableTitleOuterContainer">
            <span id="Tabs_Link_0" class="EditDataEntryForm_ChildTableTitleInnerContainer" onclick="setActiveDataEntryTab('Tabs', 0);">
                <span id="Tabs_Text_0" class="EditDataEntryForm_ChildTableTitle">Edit Metadata Tables</span></span>
            <span id="Tabs_Link_1" class="EditDataEntryForm_ChildTableTitleInnerContainer dataEntryTabDisabled"
                onclick="setActiveDataEntryTab('Tabs', 1);"><span id="Tabs_Text_1" class="EditDataEntryForm_ChildTableTitle">
                    Add Metadata Table</span></span>
            <div id="TabsOverflow">
                <div id="Tabs_Tab_0">
                    <cic:CaisisHidden runat="server" ID="DiseaseAttributeId" Table="DiseaseAttributes"
                        Field="DiseaseAttributeId">
                    </cic:CaisisHidden>
                    <%-- 
            A list of unique Table Attributes
            TableAttributeId: represents the pri key of the specified table attribute
                ID = {TableAttirbuteName}_Id
                Table = MetadataTableAttributes
                Field = {TableAttirbuteName}
                Value = {TableAttributeId}
        --%>
                    <asp:PlaceHolder runat="server" ID="MetadataAttributesContainer">
                        <cic:CaisisHidden runat="server" ID="TableLabel_Id" Table="MetadataTableAttributes"
                            Field="TableLabel" />
                        <cic:CaisisHidden runat="server" ID="TableDescription_Id" Table="MetadataTableAttributes"
                            Field="TableDescription" />
                    </asp:PlaceHolder>
                    <%-- 
            A list of unique Metadata Tables and Associated Table Metadata
            
            TableAttributeValueId: represents the pri key to the table's specific metadata
                ID = {TableAttirbuteName}_ValueId
                Table = MetadataTableAttributeValues
                Field = {TableAttirbuteName}
                Value = {TableAttributeValueId}
            TableAttributeValue:  represents the value of table's specific metadata
                ID = {TableAttirbuteName}
                Table = MetadataTableAttributeValues
                Field = {TableAttirbuteName}
                Value = {TableAttributeValue}
        --%>
                    <asp:GridView runat="server" ID="MetadataGrid" DataKeyNames="TableId,TableName" AutoGenerateColumns="false"
                        CssClass="dataGrid" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                        GridLines="None" OnRowDataBound="SetActiveRow">
                        <Columns>
                            <asp:BoundField DataField="TableName" HeaderText="Table Name" />
                            <asp:TemplateField HeaderText="Table Label">
                                <ItemTemplate>
                                    <cic:CaisisHidden runat="server" ID="TableLabel_ValueId" Table="MetadataTableAttributeValues"
                                        Field="TableLabel" />
                                    <cic:CaisisHidden runat="server" ID="TableLabel_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                        Field="TableLabel" />
                                    <cic:CaisisTextBox runat="server" ID="TableLabel" Table="MetadataTableAttributeValues"
                                        Field="TableLabel" ShowLabel="false" Width="200px">
                                    </cic:CaisisTextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Table Description">
                                <ItemTemplate>
                                    <cic:CaisisHidden runat="server" ID="TableDescription_ValueId" Table="MetadataTableAttributeValues"
                                        Field="TableDescription" />
                                    <cic:CaisisHidden runat="server" ID="TableDescription_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                                        Field="TableDescription" />
                                    <cic:CaisisTextArea runat="server" ID="TableDescription" Table="MetadataTableAttributeValues"
                                        Field="TableDescription" ShowLabel="false" Width="400px">
                                    </cic:CaisisTextArea>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Edit Metadata">
                                <ItemTemplate>
                                    <span class="dataEntryButtonGray" onclick="editTableMetadata('<%# Eval("TableName") %>','<%# Eval("TableId") %>')">Edit Metadata</span>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button runat="server" ID="UpdateBtn" OnClick="UpdateClick" Text="Update" CssClass="dataEntryButtonGray" />
                </div>
                <div id="Tabs_Tab_1" style="display: none;">
                    <asp:GridView runat="server" ID="NewMetadataTablesGrid" DataKeyNames="TABLE_NAME"
                        AutoGenerateColumns="false" CssClass="dataGrid" RowStyle-CssClass="dataGridItemRowA"
                        AlternatingRowStyle-CssClass="dataGridItemRowB" GridLines="None">
                        <Columns>
                            <asp:TemplateField HeaderText="TableName">
                                <ItemTemplate>
                                    <%# Eval("TABLE_NAME") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox runat="server" ID="AddMetaTableCheckBox" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button runat="server" ID="AddTablesBtn" OnClick="AddTablesClick" Text="Add Tables"
                        CssClass="dataEntryButtonGray" />
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
