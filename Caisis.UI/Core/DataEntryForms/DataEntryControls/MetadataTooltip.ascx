<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MetadataTooltip.ascx.cs"
    Inherits="Caisis.UI.Core.DataEntry.MetadataTooltip" %>
<div id="Metadata_<%= Table %>_<%= Field %>_Tooltip" style="display: none;" class="EditDataEntryField_Tooltip">
<div class="EditDataEntryField_TooltipContentContainer">
<img class="adminPopupCloseButton" src="../Images/shim.gif" onclick="_hideMetadataTooltip($('Metadata_<%= Table %>_<%= Field %>_Tooltip'));" />
<div class="EditDataEntryField_TooltipContent">
    <span class="EditDataEntryField_TooltipTitle">
        <%= Table %>
        <%= !string.IsNullOrEmpty(Field) ? "<img src=\"" + Page.ResolveUrl("~/Images/shim.gif") + "\" class=\"PatientDataTitleWidget\" style=\"margin: 0px 3px 1px 3px;\" >" : ""%>
        <%= Field %></span>
        
        
            <table cellspacing="0" cellpadding="1"  style="table-layout: fixed; text-align: left;border-bottom: none; width: 100%;">
                <thead>
                    <tr>
                        <td style="font-weight: bold;">
                            Attribute
                        </td>
                        <td style="font-weight: bold;">
                            Value
                        </td>
                    </tr>
                </thead>
            </table>
            <div style="max-height: 300px; overflow: auto; border-bottom: solid 1px #cccccc; overflow-x: hidden;">
            <table cellspacing="0" style="table-layout: fixed; text-align: left;border:1px solid #cccccc; width: 100%; margin-top: 0px;">
                <tbody>
                    <asp:Repeater runat="server" ID="MetadataTooltipRptr">
                        <ItemTemplate>
                            <tr class="dataGridItemRow<%# Container.ItemIndex%2 == 0 ? "A": "B" %>" style="height: auto;">
                                <td style="font-weight: bold; white-space: normal;">
                                    <%# Eval("Key") %>
                                    <img alt="Disease Specific" runat="server" style="vertical-align: baseline; margin-right: 5px; cursor: pointer;" src="~/Images/AdminImages/AdminIcon_CustomizedField.png" visible='<%# !(bool)Eval("IsDefault") %>'>
                                </td>
                                <td style="width: auto; white-space: normal;">
                                    <asp:PlaceHolder runat="server" Visible='<%# Eval("Key").ToString()!="LookupCode"  %>'>
                                        <%# Eval("Value") %>
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" Visible='<%# Eval("Key").ToString()=="LookupCode"  %>'>
                                        <a title="Edit Lookup Code <%# Eval("Value") %>" href="<%# Page.ResolveUrl("~/Admin/LookupCode_Edit.aspx") + "?diseaseId=" + Request.QueryString["diseaseId"] + "&lkpField=" + Eval("Value") %>">
                                            <%# Eval("Value") %>
                                        </a></asp:PlaceHolder>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table></div>
            <img runat="server" alt="Disease Specific" style="vertical-align: baseline; margin-right: 5px; cursor: pointer;" src="~/Images/AdminImages/AdminIcon_CustomizedField.png" />customized for this disease 

        
        
</div>
</div>

</div>
