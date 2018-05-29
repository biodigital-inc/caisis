<%@ Control Language="C#" Inherits="Caisis.UI.Modules.Pancreas.Eforms.FollowUpStatus_IPMN" CodeFile="FollowUpStatus_IPMN.ascx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BaseEFormControl"%>
<%@ Register TagPrefix="euc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>



<style type="text/css">

table#FollowUpStatus_IPMN_HTMLTable
{
}
table#FollowUpStatus_IPMN_HTMLTable td
{

}

td.PancreasCheckBoxListContainer label
{
    margin-right: 10px;
}

</style>


<a name="FollowUpStatus_IPMN" /><asp:Label ID="ComponentTitle" runat="server" CssClass="controlBoxTitle" Text="Follow Up Status"></asp:Label><br/>
<table border="0" cellspacing="0" cellpadding="5" class="eformLargePopulatedTable" id="FollowUpStatus_IPMN_HTMLTable" >


<tbody id="FollowUpStatus">
    <tr>
        <td >Date of Last Followup</td>
        <td><euc:EformTextBox Runat="server" ID="StatusDateText" RecordId="2" TABLE="Status" FIELD="StatusDateText" style="width:80px;"  ShowCalendar="True" CalcDate="True"   />
	        <euc:EformHidden Runat="server" ID="StatusDate" RecordId="2" Table="Status" Field="StatusDate" /></td>
    </tr>
    <tr>
        <td >Disease</td>
        <td>
            <euc:EformDropDownList ID="StatusDisease" runat="server" ShowEmptyListItem="true" Table="Status" Field="StatusDisease" RecordId="2" >
                <asp:ListItem Value="" > </asp:ListItem>
                <asp:ListItem>Pancreas</asp:ListItem>
                <asp:ListItem>Pancreas Cancer</asp:ListItem>                
            </euc:EformDropDownList>
        </td>
    </tr>
    <tr>
        <td >Disease Status</td>
        <td>
            <euc:EformDropDownList ID="Status" runat="server" ShowEmptyListItem="true" Table="Status" Field="Status" RecordId="2" >
                <asp:ListItem Value="" > </asp:ListItem>
                <asp:ListItem>No Evidence of Disease</asp:ListItem>
                <asp:ListItem>Alive with Disease</asp:ListItem>
                <asp:ListItem>Death from Disease</asp:ListItem>
                <asp:ListItem>Death from Other Causes</asp:ListItem>
                <asp:ListItem>Death from Unknown Causes</asp:ListItem>
            </euc:EformDropDownList>
        </td>
    </tr>
    <tr>
        <td >Pancreas Disease Status</td>
        <td class="PancreasCheckBoxListContainer">
            
        <euc:EformCheckBoxList RecordId="2" TABLE="Status" FIELD="StatusNotes" id="Status_2" CellSpacing="0" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" Uncheckable="true" >
	        <asp:ListItem Value="Pancreas Disease Status: Stable Disease">Stable Disease</asp:ListItem>
	        <asp:ListItem Value="Pancreas Disease Status: Progressive ">Progressive Disease</asp:ListItem>
	        <asp:ListItem Value="Pancreas Disease Status: Resected">Resected</asp:ListItem>
        </euc:EformCheckBoxList>
        



        
        </td>
    </tr>
</tbody>

</table>
<br/><br/><br/>