<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminProtocolOrganizations.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminProtocolOrganizations" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Protocol Organizations</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />
    <script type="text/javascript">

        function reloadMainPage() {
            if (top.hideModal) {
                top.hideModal();
            }
        }
 
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="ProjectIdField" />
    <asp:Label runat="server" ID="ProjectLabel" CssClass="boldText">
        No Project associated with this Protocol
    </asp:Label>
    <asp:PlaceHolder runat="server" ID="DataEntryPanel" Visible="false">
        <div style="max-height: 465px; overflow: auto;">
            <table border="0" width="100%" cellspacing="0" cellpadding="0">
                <thead class="dataGridHeader">
                    <tr>
                        <th style="width: 35px;">
                            &nbsp;
                        </th>
                        <th>
                            Organization
                        </th>
                        <th style="width: 40%;">
                            Role
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater runat="server" ID="OrganizationsRptr" OnItemDataBound="SetFieldValues">
                        <ItemTemplate>
                            <tr title="<%# Eval("Contacts") %>">
                                <td class="dashboardTreatmentArmRow_<%# Container.ItemIndex%2==0?"A":"B" %> noRightBorder">
                                    <asp:HiddenField runat="server" ID="OrganizationIdField" Value='<%# Eval("OrganizationId") %>' />
                                    <asp:HiddenField runat="server" ID="ProjectOrganizationIdField" Value='<%# Eval("ProjectOrganizationId") %>' />
                                    <asp:CheckBox runat="server" ID="AssociateOrganizations" Checked='<%# Eval("ProjectOrganizationId")+""!="" %>' OnCheckedChanged="MarkUpdateRow" />
                                </td>
                                <td class="dashboardTreatmentArmRow_<%# Container.ItemIndex%2==0?"A":"B" %> noLeftBorderm noRightBorder">
                                    <asp:Label runat="server" AssociatedControlID="AssociateOrganizations">
                                <%# Eval("Name") %></asp:Label>
                                </td>
                                <td class="dashboardTreatmentArmRow_<%# Container.ItemIndex%2==0?"A":"B" %> noLeftBorder">
                                    <cic:CaisisSelect ID="ProjectOrganizationType" runat="server" ShowLabel="false" Table="Project_ProjectOrganization"
                                        Field="OrganizationType" DataTextField="Name" DataValueField="OrganizationType"
                                        Width="90%" LookupCode="ProjectOrganizationRole" OnSelectedIndexChanged="MarkUpdateRow">
                                    </cic:CaisisSelect>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <asp:Button runat="server" ID="UpdateBtn" Text="Update" CssClass="dataEntryButtonGray"
            OnClick="UpdateProjectOrganizations" Style="margin-top: 10px;" />
    </asp:PlaceHolder>
    </form>
</body>
</html>
