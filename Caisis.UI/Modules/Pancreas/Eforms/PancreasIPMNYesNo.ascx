<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasIPMNYesNo" CodeFile="PancreasIPMNYesNo.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PancreasIPMNYesNo" />

<table class="eformLargePopulatedTable">
    <tr>
        <td>
            <span class="controlBoxTitle"><asp:Label ID="Label1" runat="server" CssClass="controlBoxTitle" Text="IPMN"></asp:Label> ?</span></td>
        <td height="28">
            <euc:EformRadioButtonList ID="IPMNYesNo" runat="server" RepeatLayout="Table"
                RepeatDirection="Horizontal" CellSpacing="15" TabIndex="23" Table="NoTable" Field="IPMN">
                <asp:ListItem>Yes</asp:ListItem>
                <asp:ListItem>Other Cystic Neoplasms</asp:ListItem>                
            </euc:EformRadioButtonList></td>
    </tr>
</table>
<br/><br/><br/>