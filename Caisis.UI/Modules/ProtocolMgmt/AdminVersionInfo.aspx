<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminVersionInfo.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminVersionInfo" %>
    
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Protocol Version</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../../ClientScripts/headerJS.js" type="text/javascript"></script>

    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <table runat="server" id="VersionInfoDetailsLayer" width="100%" border="0" cellspacing="0"
            cellpadding="0" style="margin: auto;">
            <tr>
                <td class="dashboardBG_TopLeft">
                    <div>
                        
                        <table width="99%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td class="dashboard_ProtocolInfo" style="width: 130px; font-weight: bold;">
                                    <span class="requiredField">Version Number</span>
                                </td>
                                <td class="dashboard_ProtocolInfo" style="font-weight: bold;">
                                    <cic:CaisisTextBox ID="VersionNumber" runat="server" Table="ProtocolMgr_ProtocolVersions" Field="VersionNumber" 
                                        ShowHelpBubble="false" ShowLabel="false" Required="true" />
                                    <asp:RequiredFieldValidator ID="VersionNumberValidator" runat="server" ControlToValidate="VersionNumber" ErrorMessage="Version Number is Required" />
                                </td>
                            </tr>
                            <tr>
                                <td class="dashboard_ProtocolInfo" style="font-weight: bold;">
                                    <span class="requiredField">Approval Date</span>
                                </td>
                                <td class="dashboard_ProtocolInfo" style="font-weight: bold;">
                                    <cic:CaisisTextBox ID="ApprovalDate" runat="server" Table="ProtocolMgr_ProtocolVersions" Field="ApprovalDate" 
                                        ShowHelpBubble="false" ShowCalendar="true" ShowLabel="false" Required="true" />
                                    <asp:RequiredFieldValidator ID="ApprovalDateValidator" runat="server" ControlToValidate="ApprovalDate" ErrorMessage="Approval Date is Required" />
                                </td>
                            </tr>
                            <tr>
                                <td class="dashboard_ProtocolInfo">
                                    Version Reason</td>
                                <td class="dashboard_ProtocolInfo">
                                    <cic:CaisisTextArea ID="VersionReason" runat="server" Table="ProtocolMgr_ProtocolVersions" Field="VersionReason" 
                                        ShowHelpBubble="false" ShowLabel="false" Width="300px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                            </tr>
                        </table>
                        
                        
                        
                        <div style="text-align: left; margin-top: 10px; margin-bottom: 10px; ">
                        
                        <asp:Label ID="UserMessage" runat="server" style="font-size: 11px;">Fields named in <span class="requiredField">red</span> are required.</asp:Label>
                        
                                <asp:ImageButton ID="CancelButton" runat="server" ImageUrl="Images/Button_Cancel.png"
                                    AlternateText="Cancel" ToolTip="Cancel" CausesValidation="false" OnClick="CancelButton_Click" style="margin-right: 30px; margin-left: 100px;" />
                                    
                                    <asp:ImageButton ID="SaveButton" runat="server" ImageUrl="Images/Button_Save.png"
                                    AlternateText="Save" ToolTip="Save" CausesValidation="true" OnClick="SaveButton_Click"  />
                                
                        </div>
                    
                    
                    </div>
                </td>
                <td class="dashboardBG_TopRight">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="dashboardBG_BottomLeft">
                    &nbsp;</td>
                <td class="dashboardBG_BottomRight">
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
