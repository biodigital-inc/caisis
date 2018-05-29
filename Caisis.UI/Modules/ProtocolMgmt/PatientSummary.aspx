<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientSummary.aspx.cs" Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientSummary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PatientSummary</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        function loadStatus(status) {
            status = status.replace(' ', '');
            if (status == 'Eligible') {
                parent.setActiveTab('PatientEligibility');
            }
            else {
                // manually reload patient index with registration tab and selected panel
                if (parent.parent && parent.parent.loadTabPage) {
                    // adjust for screening status
                    if (status.indexOf('Screening') > -1) {
                        status = 'Screening';
                    }
                    parent.parent.patientAssigned('<%= BaseProtocolId %>', '<%= BaseSchemaId %>', '<%= BasePatientId %>', status);
                }
                else {
                    parent.setActiveTab('PatientRegistration');
                }
            }
        }

    /* ]]> */
    </script>

    <style type="text/css">
    .PatientPanelSection
    {
        width: 100%;
    }

    #SaveBtn
    {
        float: right;
    }
    .RecentItemRow
    {
        background-color: Transparent;
        cursor: pointer;
    }
    .RecentItemRow:hover
    {
        background-color: #E3D1D3;
        cursor: pointer;
    }
    .RecentItem
    {
        background-position: 17px 3px;
        background-repeat: no-repeat;
        padding-left: 30px;
        width: 40%;
        vertical-align: top;
        font-size: 12px;
        height: 20px;
        font-weight: normal;
        color: #222222;
    }
    .RecentItemInfo
    {
        vertical-align: top;
        font-size: 12px;
        font-weight: normal;
        color: #222222;
    }
    .RecentItemSubHeading
    {
        background-position: 8px 6px;
        background-repeat: no-repeat;
        padding-left: 24px;
        vertical-align: top;
        font-size: 12px;
        font-weight: bold;
        color: #000000;
    }
    table.PatientStatusTable
    {
        width: 100%;
        font-weight: normal;
        color: #222222;
    }
    table.PatientStatusTable td
    {
        font-size: 12px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 95%; margin: auto; padding-top: 34px;">
            <table style="width: 100%; table-layout: fixed;">
                <tr>
                    <td style="vertical-align: top;">
                        <div id="PatientPanelLeft" class="PatientPanelSection">
                            <span style="color: #8d2a2c; font-size: 15px; font-weight: bold;">This patient is currently
                                <%= LatestPatientStatus %> for Protocol <%= ProtocolNumber %>.</span>
                            <div style="margin: 0px auto 5px auto; width: 100%;">
                                <table rules="rows" cellspacing="0" border="0" style="width: 100%; margin-bottom: 20px; border: solid 1px #cccccc; border-bottom: none;">
                                    <asp:Repeater runat="server" ID="PatientProtocolStatusRptr">
                                        <ItemTemplate>
                                            <tr onclick="loadStatus('<%# Eval("PtProtocolStatus").ToString().Replace("'","\'") %>');"
                                                class="<%# Container.ItemIndex % 2 == 0 ? "ItemRow_A" : "ItemRow_B" %>" onmouseover="this.className = 'ItemRow_Hover';"
                                                onmouseout="this.className = '<%# Container.ItemIndex % 2 == 0 ? "ItemRow_A" : "ItemRow_B" %>';">
                                                <td style="width: 20px; vertical-align: middle; padding-left: 7px; border-bottom: solid 1px #cccccc;">
                                                    <img src="Images/CheckMark.png" />
                                                </td>
                                                <td style="vertical-align: middle;border-bottom: solid 1px #cccccc;">
                                                    <table class="PatientStatusTable">
                                                        <tr>
                                                            <td style="width: 60px;">
                                                                <%# Eval("PtProtocolStatusDate") %>
                                                            </td>
                                                            <td class="boldText" style="width: 225px;">
                                                                <%# Eval("PtProtocolStatus") %>
                                                            </td>
                                                            <td style="width: auto;">
                                                                <%# Eval("PtProtocolStatusReason") %>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </table>
                                <span style="font-size: 13px; color: #222222; font-weight: bold;">Notes</span>
                                <asp:TextBox ID="PtProtocolNotes" runat="server" TextMode="MultiLine" Width="99%" Height="100px"
                                    Style="border: solid 1px #cccccc;" OnTextChanged="UpdatePatientProtocolNotes"></asp:TextBox>
                            </div>
                             <asp:ImageButton runat="server" ID="SaveBtn" ImageUrl="Images/Button_Save.png" AlternateText="Save Changes"
                            Width="71px" Height="25px" style="margin-right: 50px;" />
                        </div>
                    </td>
                    <td style="width: 20px;">
                        &nbsp;
                    </td>
                    <td style="vertical-align: top;">
                        <span style="font-size: 13px; color: #222222; font-weight: bold;">Recent and Upcoming Visits</span>
                        <div id="PatientPanelRight" style="overflow: auto; overflow-x: hidden; margin: 0px auto 5px auto; width: 100%;">
                            <table rules="all" class="dataGrid" cellspacing="0" border="0" cellpadding="4" style="width: 100%; ">
                                <tr class="AltItemRow_A"><td  class="RecentItemSubHeading"  style="background-image: url(Images/Icon_Performed_large.png);"><asp:Label ID="CompletedItemSubtitle" runat="server">No recent visits for this patient.</asp:Label>
                                    <table cellpadding="0" cellspacing="0" style="width: 400px; margin-top: 8px; margin-bottom: 5px;">
                                <asp:Repeater runat="server" ID="CompletedVisitsRptr">
                                    
                                    <ItemTemplate>
                                        <tr class="RecentItemRow" onclick="parent.loadPatientItem('<%# EncryptValue(Eval("PatientItemId").ToString()) %>','PatientSummary');" >
                                            <td class="RecentItem" style="background-image: url(Images/Icon_<%# Eval("Status") %>.png);"><%# Eval("ItemDescription") %>
                                            </td>
                                            <td class="RecentItemInfo"><%# Eval("Status") %> on <%# Eval("ScheduledDate", "{0:d}") %>&nbsp;</td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater></table></td></tr><tr class="ItemRow_B"><td  class="RecentItemSubHeading"  style="background-image: url(Images/Icon_Scheduled_large.png);"><asp:Label ID="ScheduledItemSubtitle" runat="server">No visits are currently scheduled for this patient.</asp:Label>
                                    <table cellpadding="0" cellspacing="0" style="width: 400px; margin-top: 8px;">
                                <asp:Repeater runat="server" ID="ScheduledVisitsRptr">
                                    <ItemTemplate>
                                        <tr class="RecentItemRow" onclick="parent.loadPatientItem('<%# EncryptValue(Eval("PatientItemId").ToString()) %>','PatientSummary');" >
                                            <td class="RecentItem" style="background-image: url(Images/Icon_<%# Eval("Status") %>.png);"><%# Eval("ItemDescription") %>
                                            </td>
                                            <td class="RecentItemInfo"><%# Eval("Status") %> for <%# Eval("ScheduledDate", "{0:d}") %>&nbsp;</td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater></table></td></tr><tr class="AltItemRow_A"><td  class="RecentItemSubHeading"  style="background-image: url(Images/Icon_Anticipated_large.png);"><asp:Label ID="AnticipatedItemSubtitle" runat="server">No visits are waiting to be scheduled.</asp:Label>
                                    <table cellpadding="0" cellspacing="0" style="width: 400px; margin-top: 8px;">
                                <asp:Repeater runat="server" ID="AnticipatedVisitsRptr">
                                    <ItemTemplate>
                                        <tr class="RecentItemRow" onclick="parent.loadPatientItem('<%# EncryptValue(Eval("PatientItemId").ToString()) %>','PatientSummary');" >
                                            <td class="RecentItem" style="background-image: url(Images/Icon_<%# Eval("Status") %>.png);"><%# Eval("ItemDescription") %>
                                            </td>
                                            <td class="RecentItemInfo"><%# Eval("ScheduledDate", "{0:d}") %>&nbsp;</td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater></table></td></tr>
                            </table>
                        </div>
                        <img id="CalendarKeyImg" runat="server" src="Images/Key_ItemStatus_noUnplannedEvent.png" style="float: left; margin-top: 0px;" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <script type="text/javascript">
        /* <![CDATA[ */
        setMaxHeight('PatientPanelRight', 300);
        /* ]]> */
    </script>
</body>
</html>
