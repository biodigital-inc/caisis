<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EFormSectionFieldList.ascx.cs"
    Inherits="Caisis.UI.Admin.EFormSectionFieldList" %>
<ol class="<%= ColumnCSSClassList %>">
    <asp:Repeater runat="server" ID="SectionFieldsRptr" OnItemDataBound="BuildControlsAndLabel">
        <ItemTemplate>
            <li class="<%= ItemCSSClassList %>">
                <asp:Label runat="server" ID="FieldLabel" CssClass="EformFieldLabel EformFieldLabelColumn"></asp:Label>&nbsp;&nbsp;
                <input type="hidden" class="Field_TableName" value="<%# Eval("Table") %>" />
                <input type="hidden" class="Field_FieldName" value="<%# Eval("Field") %>" />
                <input type="hidden" class="Field_ControlType" value="<%# Eval("ControlType") %>" />
                <div class="fieldControlContainer EformFieldControlColumn" style="display: none;">
                    <asp:PlaceHolder runat="server" ID="DynamicControlPlaceHolder"></asp:PlaceHolder>
                </div>
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ol>
