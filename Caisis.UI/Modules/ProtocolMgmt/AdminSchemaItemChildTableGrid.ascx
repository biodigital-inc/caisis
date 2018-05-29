<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminSchemaItemChildTableGrid.ascx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminSchemaItemChildTableGrid" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<script type="text/javascript">
function UpdateAssociatedDate(dateTextElement)
{
}
</script>

<div runat="server" id="MainDiv" style="margin-bottom:40px; margin-left: 10px;">
    <asp:Label runat="server" ID="SelectedChildTableName" Font-Size="14px" Font-Bold="true"></asp:Label><br />
    <span style="color: #666666; font-size: 10px;">Mark the checkbox above each column to be collected.  Optional preset values can be entered for each column.<img src="Images/Icon_QuestionMark_10px.png" style="width: 10px; height: 10px; vertical-align: middle; margin-left: 4px; cursor: help;" title="Enter a value here if the parameter is pre-defined by the study (e.g. Lab Test may be PSA).  Leave this column blank if you would like to collect this data at the visit (e.g. the result of the lab test)." /></span> 
    
    <table runat="server" id="MainTable" class="ChildTableGrid" cellpadding="3" cellspacing="0" style="margin-top: 6px;">
        <tr>
            <td>
                <asp:Repeater runat="server" ID="RepeaterChildTableOpt" OnItemDataBound="AssignCheckBoxes">
                    <ItemTemplate>
                        <td style="vertical-align: bottom; text-align: center; border-right: solid 1px #eeeeee;<%# Container.DataItem is CaisisHidden ? "display: none;" : "" %>">
                            <asp:CheckBox ID="CollectOptions" runat="server" />
                        </td>
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Repeater runat="server" ID="RepeaterChildTableHeader">
                    <ItemTemplate>
                        <td align="center" style="border-right: solid 1px #eeeeee; white-space: nowrap;<%# Container.DataItem is CaisisHidden ? "display: none;" : "" %>">
                            <span class="FieldTitle">
                                <asp:Label ID="ChildTableColumnName" Text="<%# ((ICaisisInputControl)Container.DataItem).FieldLabel %>" CssClass='<%# ((ICaisisInputControl)Container.DataItem).Required ? "requiredField" : "" %>' runat="server" />
                                <asp:Label ID="ChildTableColumnNameHidden" Text="<%# ((ICaisisInputControl)Container.DataItem).Field %>" runat="server" Visible="false" />
                            </span>
                        </td>
                    </ItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Repeater ID="ChildTableGridView" runat="server" OnItemDataBound="BindChildRepeaters">
                    <ItemTemplate>
                        <tr class="ChildTableRow" style="display: <%# SetRowVisibility(Container.ItemIndex.ToString(), DataBinder.Eval(Container.DataItem,"SchemaItemId").ToString()) %>">
                            <td>
                                <cic:CaisisHidden Enabled="true" class="HiddenFieldRowIndex" runat="server" ID="FieldRowIndex" Table="ProtocolMgr_SchemaItemFields"
                                                            Field="FieldRowIndex" Value='<%# Eval("FieldRowIndex") %>'  />
                            </td>
                            <asp:Repeater ID="ChildTableColRptr" runat="server" OnItemDataBound="AddDynamicControls">
                                <ItemTemplate>
                                    <td  class="dataGridItemRowB" style="border: solid 1px #cccccc;<%# Container.DataItem is CaisisHidden ? "display: none;" : "" %>">
                                        <cic:CaisisHidden runat="server" ID="SchemaItemFieldId" Table="ProtocolMgr_SchemaItemFields"
                                                            Field="SchemaItemFieldId"  />
                                        <asp:PlaceHolder ID="cicControlHolder" runat="server"></asp:PlaceHolder>
                                    </td>
                                </ItemTemplate>
                            </asp:Repeater>
                            <td>
                                <asp:Button ID="btnDeleteRow" runat="server" Text="Delete" OnCommand="DeleteSchemaItemRow" CommandArgument='<%# Eval("SchemaItemId") %>'  />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr class="ChildTableRow" style="display: <%# SetRowVisibility(Container.ItemIndex.ToString(), DataBinder.Eval(Container.DataItem,"SchemaItemId").ToString()) %>">
                            <td >
                                <cic:CaisisHidden Enabled="true" class="HiddenFieldRowIndex" runat="server" ID="FieldRowIndex" Table="ProtocolMgr_SchemaItemFields"
                                                            Field="FieldRowIndex" Value='<%# Eval("FieldRowIndex") %>'  />
                            </td>
                            <asp:Repeater ID="ChildTableColRptr" runat="server" OnItemDataBound="AddDynamicControls">
                                <ItemTemplate>
                                    <td  class="dataGridItemRowA" style="border: solid 1px #cccccc;<%# Container.DataItem is CaisisHidden ? "display: none;" : "" %>">
                                        <cic:CaisisHidden runat="server" ID="SchemaItemFieldId" Table="ProtocolMgr_SchemaItemFields"
                                                            Field="SchemaItemFieldId"  />
                                        <asp:PlaceHolder ID="cicControlHolder" runat="server"></asp:PlaceHolder>
                                    </td>
                                </ItemTemplate>
                            </asp:Repeater>
                            <td>
                                <asp:Button ID="btnDeleteRow" runat="server" Text="Delete" OnCommand="DeleteSchemaItemRow" CommandArgument='<%# Eval("SchemaItemId") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                </asp:Repeater>
            </td>
        </tr>
    </table>
    <asp:ImageButton ID="buttonAddNewChildTableCol" runat="server" ImageUrl="Images/DataGrid_AddRow.png"
        CausesValidation="false" style="margin-left: 6px;" />
</div>

<img src="Images/AddSchemaItems_TableDivider.png" style="width: 80%; margin-left: 50px; margin-right: auto; margin-top: 20px; margin-bottom: 20px;" />