<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientDeviations.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientDeviations" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Deviations</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        // notify parnet page that record has been updated
        function notifyRecordUpdate(isDelete) {
            if (parent.notifyUnplannedEventUpdate) parent.notifyUnplannedEventUpdate();
        }

        function cancelEnterDate() {
            if (parent.hideDeviation) { parent.hideDeviation(); }
            return false;
        }

        /* ]]> */
    </script>

    <style type="text/css">
        body
        {
            margin: 0px 0px 0px 0px;
        }
        .LabelTd
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            text-align: right;
            width: auto;
            vertical-align: top;
        }
        .requiredMessage
        {
            display: block;
        }
    </style>
</head>
<body>

    <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>

    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="PatientItemId" />
    <asp:HiddenField runat="server" ID="PatientDeviationId" />
    
    
    <div class="UnplannedEventContainer">
    <table cellpadding="5" cellspacing="0" border="0" style="width: auto;">
        <tr>
            <td class="LabelTd">
                <label for="ScheduledDateText">
                    Date</label>
            </td>
            <td>
                <cic:CaisisTextBox runat="server" ID="ScheduledDateText" ShowLabel="false" ShowCalendar="true"
                    CalcDate="true"></cic:CaisisTextBox>
                <cic:CaisisHidden runat="server" ID="ScheduledDate" DisplayCalculatedDate="false"
                    Table="ProtocolMgr_PatientItems" Field="ScheduledDate" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ScheduledDateText"
                    ErrorMessage="* Required." CssClass="requiredMessage" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            <td class="LabelTd">
                <label for="DeviationType">
                    Deviation Type</label>
            </td>
            <td>
                <cic:CaisisTextBox runat="server" ID="DeviationType" ShowLabel="false" Table="ProtocolMgr_PatientDeviations"
                    Field="DeviationType" Required="true"></cic:CaisisTextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DeviationType"
                    ErrorMessage="* Required" CssClass="requiredMessage" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>            
        </tr>
        <tr>
            <td class="LabelTd">
                <label for="DeviationDescription">
                    Description</label>
            </td>
            <td>
                <cic:CaisisTextBox runat="server" ID="DeviationDescription" ShowLabel="false" Table="ProtocolMgr_PatientDeviations"
                    Field="DeviationDescription"></cic:CaisisTextBox>
            </td>
            <td class="LabelTd">
                <label for="DeviationReason">
                    Reason for Deviation</label>
            </td>
            <td>
                <cic:CaisisTextBox runat="server" ID="DeviationReason" ShowLabel="false" Table="ProtocolMgr_PatientDeviations"
                    Field="DeviationReason"></cic:CaisisTextBox>
            </td>
        </tr>
        <tr>
            <td class="LabelTd">
                <label for="DeviationScheduleChange">
                    Schedule Change</label>
            </td>
            <td>
                <cic:CaisisTextBox runat="server" ID="DeviationScheduleChange" ShowLabel="false"
                    Table="ProtocolMgr_PatientDeviations" Field="DeviationScheduleChange"></cic:CaisisTextBox>
            </td>
            <td class="LabelTd">
                <label for="DeviationDateReportedIRBText">
                    Date Reported to IRB</label>
            </td>
            <td>
                <cic:CaisisTextBox runat="server" ID="DeviationDateReportedIRBText" ShowLabel="false"
                    Table="ProtocolMgr_PatientDeviations" Field="DeviationDateReportedIRB" ShowCalendar="true"
                    CalcDate="false"></cic:CaisisTextBox>
            </td>
        </tr>
        <tr>
            <td class="LabelTd">
                <label for="DeviationDateReportedSponsorText">
                    Date Reported to Sponsor</label>
            </td>
            <td>
                <cic:CaisisTextBox runat="server" ID="DeviationDateReportedSponsorText" ShowLabel="false"
                    Table="ProtocolMgr_PatientDeviations" Field="DeviationDateReportedSponsor" ShowCalendar="true"
                    CalcDate="false"></cic:CaisisTextBox>
            </td>
            <td class="LabelTd">
                <label for="DeviationDateReportedFDAText">
                    Date Reported to FDA</label>
            </td>
            <td>
                <cic:CaisisTextBox runat="server" ID="DeviationDateReportedFDAText" ShowLabel="false"
                    Table="ProtocolMgr_PatientDeviations" Field="DeviationDateReportedFDA" ShowCalendar="true"
                    CalcDate="false"></cic:CaisisTextBox>
            </td>
        </tr>
        <tr>
        <td class="LabelTd">
                <label for="DeviationNotes">
                    Notes</label>
            </td>
            <td rowspan="3">
                <cic:CaisisTextArea runat="server" ID="DeviationNotes" ShowLabel="false" Table="ProtocolMgr_PatientDeviations"
                    Field="DeviationNotes" Style="height: 100px;"></cic:CaisisTextArea>
            </td>
        </tr>
    </table>
    </div>
    
    <div style="width: 86%; margin: 0px auto 0px auto; text-align: right;"><asp:ImageButton runat="server" ID="DeleteBtn" ImageUrl="Images/Button_Delete.png"
        ToolTip="Delete" OnClick="DeleteClick" OnClientClick="return confirmDelete();" style="float: left;" />
    <asp:ImageButton runat="server" ID="CancelBtn" ImageUrl="Images/Button_Cancel.png"
        ToolTip="Cancel" OnClientClick="return cancelEnterDate();" style="margin-right: 20px;" />
    <asp:ImageButton runat="server" ID="UpdateBtn" ImageUrl="Images/Button_Save.png"
        ToolTip="Save" OnClick="SaveClick" />
    </div>
    </form>
</body>
</html>
