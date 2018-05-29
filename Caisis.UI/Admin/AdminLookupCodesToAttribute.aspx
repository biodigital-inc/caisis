<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLookupCodesToAttribute.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminLookupCodesToAttribute" %>

<%@ Register TagPrefix="grid" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Lookup Codes to Attributes</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="../ClientScripts/Admin.js"></script>

    <script type="text/javascript">  
    /* <![CDATA[ */
    
    function onWindowResize()
    {
        var overflow = $('GridOverflow');
        if(overflow)
        {
            overflow.style.height = Math.max(100, getHeight(window) - 175) + 'px';
        }
    } 
    
    function setCheckState(index)
    {
        var row = $('LookupAttributesGrid').rows[index];
        var cb = $(row).tag('INPUT')[0];
        row.style.backgroundColor = cb.checked ? '#cc6666' : '';
    }
    
    function resetExistingAttributeValues()
    {
        $('ExistingAttributeValues').selectedIndex = 0;
    }
    
    function resetChooseAttributeValue()
    {
        $('LookupAttributeValue').value = '';
    }
    
    /* ]]> */
    </script>

    <style type="text/css">
    #GridOverflow
    {
        height: 300px; 
        width: auto; 
        overflow: auto;
        overflow-x: hidden;
        margin: 0px;
    }
    #LookupAttributesGrid
    {
        margin: 0px;
        padding: 0px;
        font-weight: bold;
    }
    #LookupAttributesGrid tr
    {
        cursor: pointer;
    }
    .ValueCheckBoxLabel
    {
        width: 100%;
        display: block;
        text-align: left;
        vertical-align: middle;
    }
    .NewAttribute
    {
        background-color: #cccccc;
    }
    .EditLink
    {
        font-weight: bold;
        color: #333333;
        display: block;
        padding: 10px auto 10px auto;
        width: 200px;
        text-align:  right;
        float: right;
        clear: both;
    }
    </style>
</head>
<body class="AdminBody">
    <form id="form1" runat="server">
        <%-- Panel for Editing LookupAttributes (default visable=false) --%>
        <asp:Panel runat="server" ID="EditAttributePanel" Visible="false">
            <a class="EditLink" href="AdminLookupCodesToAttribute.aspx?edit=false">Edit Associations</a>
            <table style="width: 400px; table-layout: fixed; margin: 0px;">
                <thead class="dataGridHeader">
                    <tr>
                        <td style="width: 75px; font-weight: bold; color: #ffffff;">
                            Delete
                        </td>
                        <td style="width: auto; font-weight: bold; color: #ffffff;">
                            Attribute Name</td>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="EditLookupAttributesRptr">
                        <ItemTemplate>
                            <tr class="<%# Container.ItemIndex%2==0 ? "dataGridItemRowA" : "dataGridItemRowB" %>">
                                <td>
                                    <asp:ImageButton runat="server" ID="DeleteAttributeBtn" ImageUrl="~/Images/iconDelete.gif"
                                        OnClientClick="return confirm('Are you sure you want to remove this Attribute?');"
                                        OnCommand="DeleteLookupAttribute" CommandArgument='<%# Eval("AttributeId") %>' />
                                </td>
                                <td>
                                    <cic:CaisisTextBox runat="server" ShowLabel="false" ID="AttributeName" Table="LookupAttributes"
                                        Field="AttributeName" Value='<%# Eval("AttributeName") %>' OnTextChanged="UpdateAttribute"
                                        Width="250px"></cic:CaisisTextBox>
                                    <cic:CaisisHidden runat="server" ShowLabel="false" ID="AttributeId" Table="LookupAttributes"
                                        Field="AttributeId" Value='<%# Eval("AttributeId") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            <tr>
                                <td class="NewAttribute">
                                    New Attribute
                                </td>
                                <td class="NewAttribute">
                                    <cic:CaisisTextBox runat="server" ShowLabel="false" ID="NewAttributeName" Table="LookupAttributes"
                                        Field="AttributeName" OnTextChanged="UpdateAttribute" Width="250px"></cic:CaisisTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: right;">
                                    <asp:ImageButton runat="server" ImageUrl="~/Images/DataEntryButtons/Button_Save_On.gif"
                                        AlternateText="Save" ToolTip="Save" OnClick="UpdateLookupAttributes" />
                                </td>
                            </tr>
                        </FooterTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:Panel>
        <%-- Panel for Editing Associations beween lookup attributes and lookup codes (default visable=true) --%>
        <asp:Panel runat="server" ID="AssociateAttributesPanel">
            <a class="EditLink" href="AdminLookupCodesToAttribute.aspx?edit=true">Edit Lookup Attributes</a>
            <table style="width: 100%; table-layout: fixed;">
                <tr>
                    <td style="width: 125px;">
                        <label for="LookupAttributesList">
                            Attribute
                        </label>
                    </td>
                    <td>
                        <cic:CaisisSelect ID="LookupAttributesList" runat="server" ShowLabel="false" DataTextField="AttributeName"
                            DataValueField="AttributeId" ShowEmptyListItem="false" OnDataBound="BindExistingAttributeValues"
                            OnSelectedIndexChanged="BindExistingAttributeValues" AutoPostBack="true">
                        </cic:CaisisSelect>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="LookupCodesList">
                            Lookup Code</label>
                    </td>
                    <td>
                        <cic:CaisisSelect runat="server" ID="LookupCodesList" ShowLabel="false" DataTextField="LkpFieldName"
                            DataValueField="LkpFieldName" ShowEmptyListItem="false" OnSelectedIndexChanged="BindExistingAttributeValues"
                            AutoPostBack="true">
                        </cic:CaisisSelect>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label for="LookupAttributeValue">
                            Attribute Value
                        </label>
                    </td>
                    <td>
                        <cic:CaisisSelect ID="ExistingAttributeValues" runat="server" ShowLabel="false" DataTextField="AttributeValue"
                            DataValueField="AttributeValue" ShowEmptyListItem="true" OnSelectedIndexChanged="MarkFormDirty"
                            Width="100px" onchange="resetChooseAttributeValue();" Visible="false">
                        </cic:CaisisSelect>
                        <cic:CaisisComboBox runat="server" ID="LookupAttributeValue"  ShowLabel="false" OnTextChanged="MarkFormDirty" OnPreRender="SetComboDistinct"></cic:CaisisComboBox>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/AdminImages/submit.gif"
                            AlternateText="Submit" ToolTip="Submit" OnClick="BindLookupAttributeValues" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Panel runat="server" ID="GridPanel" Visible="false">
                            <span style="display: block;">
                                Selected Value: <%= SelectedAttributeValue %>
                            </span>
                            <table class="dataGridHeader" style="width: 100%; table-layout: fixed; margin: 0px;">
                                <thead>
                                    <tr>
                                        <td style="width: 100px; font-weight: bold; color: #ffffff;">
                                            Use Value
                                        </td>
                                        <td style="font-weight: bold; color: #ffffff;">
                                            Lookup Code
                                        </td>
                                    </tr>
                                </thead>
                            </table>
                            <div id="GridOverflow">
                                <asp:GridView runat="server" ID="LookupAttributesGrid" DataKeyNames="LookupCodeAttributeId,LookupCodeId"
                                    CellPadding="0" CellSpacing="0" CssClass="dataGrid" RowStyle-CssClass="dataGridItemRowA"
                                    AlternatingRowStyle-CssClass="dataGridItemRowA" AutoGenerateColumns="false" OnRowDataBound="SetCheckState"
                                    Width="100%" ShowHeader="false">
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <label class="ValueCheckBoxLabel" style="text-align: center;">
                                                    <asp:CheckBox runat="server" ID="UseValueCheckBox" OnCheckedChanged="MarkRowDirty" /></label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Label runat="server" AssociatedControlID="UseValueCheckBox" CssClass="ValueCheckBoxLabel"><%# Eval("LkpCode") %></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: right;">
                        <asp:ImageButton runat="server" ID="UpdateBtn" ImageUrl="~/Images/DataEntryButtons/Button_Save_On.gif"
                            AlternateText="Save" ToolTip="Save" OnClick="UpdateLookupCodeAttributes" Visible="false" />
                    </td>
                </tr>
            </table>

            <script type="text/javascript">  
        /* <![CDATA[ */
        onWindowResize();
        /* ]]> */
            </script>

        </asp:Panel>
    </form>
</body>
</html>
