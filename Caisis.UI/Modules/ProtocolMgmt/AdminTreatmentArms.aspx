<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminTreatmentArms.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminTreatmentArms" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Treatment Arms</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        function confirmSchemaDelete() {
            return confirm('Are you sure you want to permanently delete this treatment arm?');
        }

        function editSchemaPatients(schemaId) {
            parent.editSchemaPatients(schemaId);
            return false;
        }
        /* ]]> */
    </script>

    <style type="text/css">
        .TreatmentArmBG
        {
            background-color: #f8f8f8;
        }
        a.AccuralLimitLabel
        {
            font-weight: bold;
            color: #333333;
            text-decoration: underline;
        }
    </style>
</head>
<body class="TreatmentArmBG">
    <form id="form1" runat="server">
    <div>
        <table width="99%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="dashboardTitleBar" style="color: #111111; font-weight: bold; width: 20%;">
                                Treatment Arms for Version <%= ProtocolVersionNumber%>
                            </td>
                        </tr>
                    </table>
                    <div id="TreatmentArmListDiv" style="overflow: auto; overflow-x: hidden;">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <asp:Repeater runat="server" ID="ArmsListRptr" OnItemDataBound="SetAccuralLimitLabel">
                                <ItemTemplate>
                                    <tr>
                                        <td class="dashboardTreatmentArmRow_<%# Container.ItemIndex %2 == 0 ? "A" : "B" %> noRightBorder">
                                            <asp:Label runat="server" ID="ArmDescription"></asp:Label>
                                            &nbsp;
                                        </td>
                                        <td class="dashboardTreatmentArmRow_<%# Container.ItemIndex %2 == 0 ? "A" : "B" %> noLeftBorder"
                                            style="width: 100px; text-align: left;">
                                            <asp:Hyperlink runat="server" ID="AccuralLimitLabel" CssClass="AccuralLimitLabel"></asp:Hyperlink>&nbsp;
                                        </td>
                                        <td class="dashboardTreatmentArmRow_<%# Container.ItemIndex %2 == 0 ? "A" : "B" %> noLeftBorder noRightBorder"
                                            style="white-space: nowrap; width: 50px; text-align: center; vertical-align: middle;">
                                            <img id="EditTreatmentArm" alt="Edit Treatment" title="Edit Treatment" src="Images/Button_Edit_small.png"
                                                onclick="parent.editSchema('<%# GetQueryStringBySchema(Eval("ProtocolSchemaId").ToString()) %>');"
                                                style="cursor: pointer;" />
                                        </td>
                                        <td class="dashboardTreatmentArmRow_<%# Container.ItemIndex %2 == 0 ? "A" : "B" %> noLeftBorder"
                                            style="white-space: nowrap; width: 50px; text-align: center; vertical-align: middle;">
                                            <asp:ImageButton runat="server" ID="DeleteTreatmentArm" ImageUrl="Images/Button_Delete_small.png"
                                                OnClientClick="return confirmSchemaDelete();" OnCommand="DeleteTreatment" CommandArgument='<%# Eval("ProtocolSchemaId") %>'
                                                ToolTip="Delete Treatment" AlternateText="Delete Treatment" />&nbsp;
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <tr id="noTreatmentArmsMsg" runat="server" visible="true">
                                <td class="dashboardTreatmentArmRow_A" style="padding: 10px; font-size: 10px; font-weight: normal;">
                                    This version has no treatment arms. Click the button below to create a treatment
                                    arm for this protocol.
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td style="padding-top: 6px; padding-left: 10px;">
                    <img id="addBtn" src="Images/Button_AddNewTreatmentArm.png" alt="Add New Treatment Arm" title="Add New Treatment Arm"
                        onclick="parent.addTreatmentArm('<%= QuereyVersionId %>'); return false;" style=" cursor: pointer;" />
                </td>
            </tr>
        </table>
    </div>
    </form>

    <script type="text/javascript">
        /* <![CDATA[ */
        setMaxHeight('TreatmentArmListDiv', 150);
        /* ]]> */
    </script>

</body>
</html>