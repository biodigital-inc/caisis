<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEditGroup.aspx.cs" Inherits="Caisis.UI.Admin.AdminEditGroup" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Edit Group</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <span class="requiredField">View/Edit Group</span>
    <asp:PlaceHolder runat="server" ID="GroupFields">
        <table style="margin-top: 10px;">
            <tr>
                <td>
                    <label for="GroupName" class="adminNavBoxContainerTitle">
                        Name
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="GroupName" ShowLabel="false" Table="Groups"
                        Field="GroupName" Width="350px"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="GroupDescription" class="adminNavBoxContainerTitle">
                        Description
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="GroupDescription" ShowLabel="false" Table="Groups"
                        Field="GroupDescription" Width="350px"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td style="padding-top: 25px;">
                    <label for="GroupRole" class="adminNavBoxContainerTitle">
                        Assigned Role
                    </label>
                </td>
                <td style="padding-top: 25px;">
                    <cic:CaisisSelect runat="server" ID="GroupRole" ShowLabel="false" Table="Groups"
                        Field="RoleId" DataTextField="Role" DataValueField="RoleId" Width="150px">
                    </cic:CaisisSelect>
                </td>
            </tr>
        </table>
    </asp:PlaceHolder>
    <table style="width: 100%; vertical-align: top; margin-top: 25px;">
        <thead>
            <tr>
                <td>
                    <span class="adminNavBoxContainerTitle">Assigned Datasets</span>
                </td>
                <td>
                    <span class="adminNavBoxContainerTitle">Assigned Modules/Tabes</span>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <table class="dataGrid" style=" table-layout: fixed; min-width: 200px; margin: 0px;">
                        <asp:Repeater runat="server" ID="DatasetsRptr" OnItemDataBound="SetCheckBoxes">
                            <ItemTemplate>
                                <tr class="<%# Container.ItemIndex % 2==0 ? "dataGridItemRowA" : "dataGridItemRowB" %>">
                                    <td style="width: 25px; text-align: center;">
                                        <cic:CaisisCheckBox runat="server" ID="KeyField" ShowLabel="false" Table="GroupDatasets"
                                            Field="GroupDatasetId" />
                                        <cic:CaisisHidden runat="server" ID="ValueField" ShowLabel="false" Table="GroupDatasets"
                                            Field="GroupDatasetId" Value='<%# Eval("DatasetId") %>'>
                                        </cic:CaisisHidden>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" AssociatedControlID="KeyField"><%# Eval("DatasetName") %></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </td>
                <td>
                    <table class="dataGrid" style="table-layout: fixed;min-width: 200px; margin: 0px;">
                        <asp:Repeater runat="server" ID="TabsRptr" OnItemDataBound="SetCheckBoxes">
                            <ItemTemplate>
                                <tr class="<%# Container.ItemIndex % 2==0 ? "dataGridItemRowA" : "dataGridItemRowB" %>">
                                    <td style="width: 25px; text-align: center;">
                                        <cic:CaisisCheckBox runat="server" ID="KeyField" ShowLabel="false" Table="Groups"
                                            Field="GroupAccessCode" />
                                        <cic:CaisisHidden runat="server" ID="ValueField" ShowLabel="false" Table="Groups"
                                            Field="GroupAccessCode" Value='<%# Eval("Name") %>'>
                                        </cic:CaisisHidden>
                                    </td>
                                    <td>
                                        <asp:Label runat="server" AssociatedControlID="KeyField"><%# Eval("Name") %></asp:Label>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:ImageButton ID="CancelBtn" runat="server" ImageUrl="~/Images/AdminImages/AdminButton_Edit.png"
                        AlternateText="Cancel" ToolTip="Cancel" />
                </td>
                <td>
                    <asp:ImageButton ID="SaveBtn" runat="server" ImageUrl="~/Images/AdminImages/AdminButton_Edit.png"
                        AlternateText="Save" ToolTip="Save" OnClick="SaveClick" />
                </td>
            </tr>
        </tbody>
    </table>
    <div class="dataEntryButtons" style="text-align: center; margin: 10px;">
    </div>
    </form>
</body>
</html>
