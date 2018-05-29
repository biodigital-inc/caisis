<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ConfigDropDown.ascx.cs"
    Inherits="Caisis.UI.Core.Utilities.ConfigDropDown" %>
<select id="<%= !string.IsNullOrEmpty(this.FormClientId) ? this.FormClientId : this.ClientID %>"
    name="<%= !string.IsNullOrEmpty(this.FormClientName) ? this.FormClientName : this.UniqueID %>"
    class="<%= CssClass %>" onchange="<%= OnClientChange %>">
    <asp:Literal runat="server" ID="BlankItem" Visible="false" Text="<option label={0}{1}{0} value={0}{1}{0}>{1}</option>">
    </asp:Literal>
    <asp:Literal runat="server" ID="NoItemsLiteral" Visible="false" Text="<option label={0}{1}{0} value={0}{0}>{1}</option>">
    </asp:Literal>
    <asp:Repeater runat="server" ID="EformDropDownRptr" OnItemDataBound="BindDiseaseEforms">
        <ItemTemplate>
            <asp:Repeater runat="server" ID="DiseaseEformsRptr" OnItemDataBound="SetEformVisibility">
                <HeaderTemplate>
                    <optgroup label="<%# Server.HtmlEncode((Container.NamingContainer.NamingContainer as RepeaterItem).DataItem.ToString()) %>">
                </HeaderTemplate>
                <ItemTemplate>
                    <option label="<%# Server.HtmlEncode(Eval("DisplayName").ToString()) %>" value="<%# Server.HtmlEncode(Eval("DisplayValue").ToString()) %>" <asp:Literal ID="defaultselection" runat="server" />>
                        <%# Server.HtmlEncode(Eval("DisplayName").ToString()) %>
                    </option>
                </ItemTemplate>
                <FooterTemplate>
                    </optgroup>
                </FooterTemplate>
            </asp:Repeater>
        </ItemTemplate>
    </asp:Repeater>
</select>