<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminSchemaItemList.ascx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminSchemaItemList" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<div runat="server" id="MainDiv" >
    <div style="width: 500px; margin-left: auto; margin-right: auto; margin-bottom: 5px;">
        <asp:Label style="font-size: 14px; font-weight: bold; color: #111111;" ID="TableName" runat="server" />
    </div>
    <table id="SchemaItemsTable" class="SchemaItemsTable" cellpadding="0" cellspacing="0" border="0" style="width: 500px; margin-left: auto; margin-right: auto;">
	            <tr >
                    <td style="width: 12%; padding-left: 1px; border: none; font-size: 11px; color: #000000; font-weight: bold;">
                            Collect
                    </td>
                    <td style="width: 36%; border: none;">&nbsp;
                    </td>
                    <td style="width: 52%; border: none; font-size: 11px; color: #000000;"><strong>Pre-Set Value</strong> (optional)<img src="Images/Icon_QuestionMark_12px.png" style="width: 12px; height: 12px; vertical-align: middle; margin-left: 6px; cursor: help;" title="Enter a value here if the parameter is pre-defined by the study (e.g. Lab Test may be PSA).  Leave this column blank if you would like to collect this data at the visit (e.g. the result of the lab test)." /></td>
                </tr>
	    <asp:Repeater runat="server" EnableViewState="true" ID="SchemaItemsListRptr" OnItemDataBound="PopulateItemValues">
            <ItemTemplate>
                <tr class="dataGridItemRowB">
                    <td style="vertical-align: top; padding-top: 4px; padding-bottom: 2px; border-right: none; padding-left: 10px; ">
                            <asp:CheckBox ID="CheckBoxCollect" runat="server" />
                    </td>
                    <td style="vertical-align: top; padding-top: 7px; padding-bottom: 2px; border-right: none; border-left: none; font-weight: bold;">
                            <asp:Label runat="server" ID="ItemAttrName"></asp:Label>
                    </td>
                    <td style="vertical-align: top; padding-top: 4px; padding-bottom: 2px; border-left: none;">
                            <asp:PlaceHolder ID="DynamicControlHolder" runat="server" />
                    </td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr class="dataGridItemRowA" >
                    <td style="vertical-align: top; padding-top: 4px; padding-bottom: 2px; border-right: none; padding-left: 10px; ">
                            <asp:CheckBox ID="CheckBoxCollect" runat="server" />
                    </td>
                    <td style="vertical-align: top; padding-top: 7px; padding-bottom: 2px; border-right: none; border-left: none; font-weight: bold;">
                            <asp:Label runat="server" ID="ItemAttrName"></asp:Label>
                    </td>
                    <td style="vertical-align: top; padding-top: 4px; padding-bottom: 2px; border-left: none;">
                            <asp:PlaceHolder ID="DynamicControlHolder" runat="server" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
        </asp:Repeater>
	</table>
</div>
<img src="Images/AddSchemaItems_TableDivider.png" style="width: 80%; margin-left: 50px; margin-right: auto; margin-top: 20px; margin-bottom: 20px;" />