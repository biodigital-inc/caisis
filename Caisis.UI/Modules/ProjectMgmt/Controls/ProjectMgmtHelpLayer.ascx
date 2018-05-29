<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProjectMgmtHelpLayer.ascx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectMgmtHelpLayer" %>

<script type="text/javascript">
    // Set value to adjust help layer title 
    var HELP_LAYER_TITLE_ID = '<%= LayerSectionTitle.ClientID %>';
</script>

<table style="width: 98%;" cellpadding="0" cellspacing="0" border="0">
    <tr class="BlueListBar">
        <td class="BlueListBar" style="width: auto; text-align: left;">
            <img runat="server" src="../Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;"
                alt="Project Management Help" title="Project Management Help" /></td>
        <td class="BlueListBar" style="width: auto;">
            <span runat="server" id="LayerSectionTitle" style="font-weight: bold; font-size: 14px;
                margin-top: 10px; margin-left: 5px;">Help</span>
        </td>
        <td class="BlueListBar" style="width: auto; text-align: right;">
            <img runat="server" src="../Images/HeaderBarBlueRight.gif" width="6" height="35"
                align="right" alt="Project Management Help" title="Project Management Help" /></td>
    </tr>
    <tr>
        <td colspan="3">
            <div style="border-left: 1px solid #cccccc; border-right: 1px solid #cccccc; border-bottom: 1px solid #cccccc;
                width: auto; height: 150px; overflow: auto; padding: 10px; background-color: #ffffff;">
                <asp:Repeater runat="server" ID="HelpDescriptionRptr" OnItemDataBound="SetFieldTitleAndDescription">
                    <ItemTemplate>
                        <div id='<%# Eval("FieldName") %>Desc' class="UnselectedSection">
                            <span id='<%# Eval("FieldName") %>Title' class="HiddenHelpField">
                                <asp:Literal ID="FieldTitle" runat="server"></asp:Literal>
                            </span>
                            <asp:Label ID="FieldDescription" runat="server"></asp:Label>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </td>
    </tr>
</table>
