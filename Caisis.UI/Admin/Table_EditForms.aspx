<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Table_EditForms.aspx.cs"
    Inherits="Caisis.UI.Admin.Table_EditForms" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Data Entry Forms</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>

    <script type="text/javascript">

        jQuery.noConflict();

        function closeDataEntry() {
            if (top.reloadDataEntryFrame) {
                top.reloadDataEntryFrame();
            }
            if (top.hideModal) {
                top.hideModal();
            }
        }

        function checkParentTable(cb, index) {
            var row = jQuery('#<%= MetadataGrid.ClientID %>').find('tr').eq(index);
            var checkboxes = row.find(':input[type="checkbox"]');
            var isActiveCheckbox = checkboxes.eq(0);
            var menuItemCheckbox = checkboxes.eq(1);
            if (isActiveCheckbox.is(':checked')) {
                menuItemCheckbox.attr('checked', 'checked');
            }
            else {
                menuItemCheckbox.removeAttr('checked');
            }
            //alert(row);
            //            var row = jQuery(cb).parents('tr').first();
            //            if(row.length==0) {
            //                return;
            //            }
            //            var depth = parseInt(row.style.paddingLeft) / 10;
            //            if (cb.checked && depth > 0) {
            //                while (true) {
            //                    var index = index - 1;
            //                    row = row.prev();// document.getElementById(index + '_Row');
            //                    if (row) {
            //                        var prevDepth = parseInt(row.css('padding-left')) / 10;
            //                        var prevCB = row.find('INPUT')[0];
            //                        if (prevDepth == 0) {
            //                            prevCB.checked = true;
            //                            break;
            //                        }
            //                        else if (prevDepth < depth) {
            //                            prevCB.checked = true;
            //                        }
            //                        else {
            //                            continue;
            //                        }
            //                    }
            //                    break;
            //                }
            //            }
        }
    
    </script>

    <style type="text/css">
        body
        {
            background-color: #ffffff;
        }
        ul
        {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }
        .dataEntryLeaf
        {
            display: inline-block; /*width: 200px;*/
        }
        #headerTable
        {
            width: 95%;
        }
        #headerTable td
        {
            font-size: 13px;
            font-weight: bold;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <%-- Disease Attribute for mapping disease specific table attributes --%>
    <cic:CaisisHidden runat="server" ID="DiseaseAttributeId" Table="DiseaseAttributes"
        Field="DiseaseAttributeId">
    </cic:CaisisHidden>
    <%-- List of Table Attributes --%>
    <asp:PlaceHolder runat="server" ID="MetadataAttributesContainer">
        <cic:CaisisHidden runat="server" ID="Form_Id" Table="MetadataTableAttributes" Field="Form" />
        <cic:CaisisHidden runat="server" ID="MenuItem_Id" Table="MetadataTableAttributes"
            Field="MenuItem" />
    </asp:PlaceHolder>
    <table cellspacing="0" id="headerTable">
        <thead>
            <tr>
                <td>
                    Data Entry Form
                </td>
                <td style="width: 100px; text-align: center;">
                    Active
                </td>
                <td style="width: 100px; text-align: center;">
                    Menu Item
                </td>
            </tr>
        </thead>
    </table>
    <div style="overflow: auto; overflow-x: hidden; max-height: 450px; border: solid 1px #cccccc;
        padding-right: 20px;">
        <%-- Main Data Entry grid for capturing attribute values --%>
        <asp:GridView runat="server" ID="MetadataGrid" DataKeyNames="TableId,TableName" AutoGenerateColumns="false"
            Width="100%" ShowHeader="false" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
            GridLines="None" OnRowDataBound="SetDiseaseSpecificIcon">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label runat="server" AssociatedControlID="Form" CssClass="dataEntryLeaf">
                            <div style="padding-left: <%# (int)Eval("TableDepth") * 14 %>px;">
                                <img alt='<%# Eval("TableName") %>' runat="server" src='<%# Eval("TableIcon").ToString()!= ""  ? Eval("TableIcon").ToString() : "~/Images/shim.gif" %>' />&nbsp;
                                <span class="boldText"><%# Eval("TableLabel")%></span>
                                (<%# Eval("TableName")%>)&nbsp;&nbsp;<asp:Image runat="server" ID="DiseaseSpecificIcon"
                                    ImageUrl="~/Images/AdminImages/AdminIcon_CustomizedField.png" Visible="false" />
                            </div>
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:HiddenField runat="server" ID="TableName_Field" Value='<%# Eval("TableName") %>' />
                        <cic:CaisisHidden runat="server" ID="Form_ValueId" Table="MetadataTableAttributeValues"
                            Field="Form" />
                        <cic:CaisisHidden runat="server" ID="Form_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                            Field="Form" />
                        <cic:CaisisCheckBox runat="server" ID="Form" Table="MetadataTableAttributeValues"
                            Field="Form" OnCheckedChanged="TrackDirtyTables" ShowLabel="false" onclick='<%#"checkParentTable(this," +  Container.DataItemIndex + ");" %>'>
                        </cic:CaisisCheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <cic:CaisisHidden runat="server" ID="MenuItem_ValueId" Table="MetadataTableAttributeValues"
                            Field="MenuItem" />
                        <cic:CaisisHidden runat="server" ID="MenuItem_DiseaseAttributeValueId" Table="DiseaseAttributeValues"
                            Field="MenuItem" />
                        <cic:CaisisCheckBox runat="server" ID="MenuItem" Table="MetadataTableAttributeValues"
                            Field="MenuItem" OnCheckedChanged="TrackDirtyTables" ShowLabel="false"></cic:CaisisCheckBox>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:Button runat="server" ID="SaveBtn" CssClass="dataEntryButtonGray NavListFooterButton"
        Text="Save" OnClick="SaveClick" Style="float: right; margin-right: 100px;" />
    <span>
        <img alt="customized" src="../Images/AdminImages/AdminIcon_CustomizedField.png" style="vertical-align: baseline;
            margin-right: 5px; cursor: pointer;" />customized for this disease</span>
    </form>
</body>
</html>
