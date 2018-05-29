<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminAddVersion.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminAddVersion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Treatment Arm</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        function addNewVersion() {
            return parent.editVersionInfo(-1);
        }

        function refreshParent() {
            parent.refreshAdminProtocol();

            parent.hideSchemaPortal();
        }
        function cancelNew() {
            parent.hideSchemaPortal();
        }

        function copyVersion(id) {
            parent.copyVersionInfo(id);
            return false;
        }

        /* ]]> */
    </script>

</head>
<body class="PatientPortalBody_miniTabs">
    <form id="form1" runat="server">
    <div class="PatientTitleBar" style="margin-bottom: 50px;">
        <span id="PageTitle" style="font-weight: bold;">Add New Protocol Version</span>
    </div>
    <div style="width: 700px; margin-left: 14px;">
        <span class="ProtocolMgmtTitle">You may copy an existing version and its schemas, or
            create a new, blank version of this protocol.</span><br />
        (If you copy an existing version can modify the duplicated schemas later.)
        <div class="PatientPanel" style="width: 100%; padding-left: 8px; margin-top: 10px;">
            <div style="margin-top: 10px; margin-bottom: 10px; font-weight: bold;">
                Existing versions for this protocol are listed here.</div>
            <table border="0" cellspacing="0" cellpadding="0" style="width: 100%">
                <tr>
                    <td class="dashboardTitleBar" style="color: #111111; font-weight: bold; width: 70px;
                        padding-left: 50px;">
                        Version
                    </td>
                    <td class="dashboardTitleBar" style="color: #111111; font-weight: bold; padding-left: 20px;">
                        Treatment Arms
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div style="overflow: auto; height: 200px; width: 97%;">
                            <table style="width: 97%;" border="0" cellspacing="0" cellpadding="0">
                                <asp:Repeater runat="server" ID="ArmsListRptr" OnItemDataBound="PopulateTreatmentArms">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="dashboardVersionRow_<%# Container.ItemIndex % 2==0 ? "A": "B" %>" style="padding: 8px;
                                                width: 20%; border-right: none; text-align: center;">
                                                <div style=" padding: 3px;">
                                                    <%# Eval("VersionNumber")%>
                                                </div>
                                                <img alt="Copy Version" title="Copy Version" src="Images/Button_Copy_small.png" onclick="return copyVersion(<%# Eval("ProtocolVersionId") %>);"
                                                    style="cursor: pointer;" />
                                            </td>
                                            <td class="dashboardVersionRow_<%# Container.ItemIndex % 2==0 ? "A": "B" %>" style="border-left: none;">
                                                <asp:Label runat="server" ID="NoSchemasText" CssClass="boldText" Visible="false" style=" display: block; padding-top: 9px;">No Treatment Arms</asp:Label>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-top: solid 1px #dddddd;">
                                                    <asp:Repeater runat="server" ID="ArmsListRptrInner">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td style="width: 50%;" class="dashboardTreatmentArmRow_<%# Container.ItemIndex % 2==0 ? "A": "B" %>">
                                                                    <span title="<%# Server.HtmlEncode(Eval("ProtocolArmDescription").ToString()) %>">
                                                                        <%# Caisis.UI.Core.Classes.PageUtil.GetTrimmedDescription(Eval("ProtocolArmDescription").ToString(), 80) %>
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </table>                                                
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
            <img onclick="return addNewVersion();" style="cursor: pointer; margin-top: 16px;
                margin-left: 20px;" alt="Add Treatment Arm" src="Images/Button_CreateANewBlankVersion.png" />
            <img onclick="cancelNew();" style="cursor: pointer; margin-top: 16px; margin-left: 20px;"
                alt="Cancel" src="Images/Button_Cancel.png" />
        </div>
    </div>
    </form>
</body>
</html>
