<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminAddTreatmentArm.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminAddTreatmentArm" %>

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
        
        function displayGrid() {
            $('GridPanel').style.display = 'block';
            $('AddNewButton').style.visibility = 'hidden';
        }
        function displayNewButton() {
            $('GridPanel').style.display = 'none';
            $('AddNewButton').style.visibility = 'visible';
        }
        function cancelNew() {
            parent.hideSchemaPortal();
        }
        /* ]]> */
    </script>

    <style type="text/css">
        #ExistingArmsTable td
        {
            vertical-align: middle;
        }
    </style>
</head>
<body class="PatientPortalBody_miniTabs">
    <form id="form1" runat="server">
    <div class="PatientTitleBar" style="margin-bottom: 50px;">
        <span id="PageTitle" style="font-weight: bold;">Add Treatment Arm</span>
    </div>
    <div style="width: 600px; margin-left: 14px;">
        <span class="ProtocolMgmtTitle">The new treatment arm will need a schema.</span>
        <div class="PatientPanel" style="width: 100%;">
            <table>
                <tr>
                    <td style="font-weight: bold; color: #000000; padding: 4px 0px 10px 0px;">
                        Would you like to copy an exisiting schema or create a new one from scratch?
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton GroupName="AddType" ID="CreateSchemaRB" runat="server" Text="Create a new schema from scratch"
                            onclick="displayNewButton();" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton GroupName="AddType" ID="CopySchemaRB" runat="server" onclick="displayGrid()"
                            AutoPostBack="false" Text="Copy an existing schema for this protocol" />
                        <div id="GridPanel" style="display: none;">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout: fixed;
                                margin-top: 20px;">
                                <tr>
                                    <td style="width: 70%; vertical-align: top;">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td class="dashboardTitleBar" style="color: #111111; font-weight: bold; padding-bottom: 14px;">
                                                    Select the treatment arm you would like to copy.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="dashboardTitleBar" style="color: #111111; font-weight: bold; border-bottom: solid 1px #cccccc;">
                                                    Existing Treatment Arms
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <div style="overflow: scroll; overflow-x: hidden; height: 200px;">
                                                        <table id="ExistingArmsTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <asp:Repeater runat="server" ID="ArmsListRptr" OnItemDataBound="PopulateTreatmentArms">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td class="dashboardVersionRow_<%# Container.ItemIndex%2==0?"A":"B" %>">
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="border-top: solid 1px #dddddd;">
                                                                                <asp:Repeater runat="server" ID="ArmsListRptrInner">
                                                                                    <ItemTemplate>
                                                                                        <tr>
                                                                                            <td style="width: 100px;" class="dashboardTreatmentArmRow_<%# Container.ItemIndex%2==0?"A":"B" %>">
                                                                                                <%# Eval("VersionNumber")%>
                                                                                            </td>
                                                                                            <td style="width: 65%;" class="dashboardTreatmentArmRow_<%# Container.ItemIndex%2==0?"A":"B" %>">
                                                                                                <span title="<%# Server.HtmlEncode(Eval("ProtocolArmDescription").ToString()) %>">
                                                                                                    <%# Caisis.UI.Core.Classes.PageUtil.GetTrimmedDescription(Eval("ProtocolArmDescription").ToString(), 80) %>
                                                                                                </span>
                                                                                            </td>
                                                                                            <td id="ButtonColumn" runat="server" style="padding-left: 10px;">
                                                                                                <asp:ImageButton ID="CopyArm" runat="server" AlternateText="Copy Arm" ToolTip="Copy Arm"
                                                                                                    ImageUrl="Images/Button_Copy_small.png" OnCommand="CopyArm" CommandArgument='<%# Eval("ProtocolSchemaId") %>' />
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
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img onclick="cancelNew();" style="cursor: pointer; margin-top: 16px; margin-left: 20px;"
                            alt="Cancel" src="Images/Button_Cancel.png" />
                        <img id="AddNewButton" onclick="parent.editSchema('<%= GetQueryStringBySchema(-1) %>'); return false;"
                            height="21" width="101" style="cursor: pointer; margin-top: 16px; margin-left: 50px;
                            visibility: hidden;" alt="Create New Treatment Arm" src="Images/ButtonAddCreateNew.gif" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <%-- 
        <asp:ImageButton ID="SaveButton" ImageUrl="Images/Button_SaveItem.gif" Height="26px"
            Width="94px" CausesValidation="false" runat="server" Visible="False" />
--%>
    </form>
</body>
</html>
