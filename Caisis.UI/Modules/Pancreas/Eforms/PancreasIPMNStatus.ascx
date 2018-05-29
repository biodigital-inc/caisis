<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.PancreasIPMNStatus" CodeFile="PancreasIPMNStatus.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<link href="../../../StyleSheets/EformStyles.css" rel="stylesheet" type="text/css"/>

<a name="PancreasIPMNStatus" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Status"></asp:Label><br/>
<table width="600" border="0" cellspacing="0" cellpadding="5" class="ClinicalEformTable" style="background-color:#FFFFFF">
    <tr>        
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Date</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Disease</td>
        <td class="controlBoxDataGridHeaderFirstCol" style="text-align:left;" >Status</td>
    </tr>
    <tr>        
        <td><euc:EformTextBox Runat="server" ID="StatusDateText" TABLE="Status" RecordId="1"  FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	        <euc:EformHidden Runat="server" ID="StatusDate" TABLE="Status" RecordId="1"  Field="StatusDate" />
        </td>
        <td height="28">
            <euc:EformDropDownList ID="Disease" runat="server" ShowEmptyListItem="true" TABLE="Status" RecordId="1"  Field="StatusDisease">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem>Pancreas</asp:ListItem>
                <asp:ListItem>Pancreas Cancer</asp:ListItem>                
            </euc:EformDropDownList>
         </td>                 
        <td height="28">
            <euc:EformDropDownList ID="Status" runat="server" ShowEmptyListItem="true" TABLE="Status" RecordId="1"  Field="Status">
                <asp:ListItem Selected="True"></asp:ListItem>
                <asp:ListItem>Surveillance Only</asp:ListItem>
                <asp:ListItem>Resected</asp:ListItem>
                <asp:ListItem>Additional Workup</asp:ListItem>           
            </euc:EformDropDownList>
         </td>                 
    </tr>
</table>
<br/><br/><br/>
