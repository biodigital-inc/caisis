<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSchemaPatients.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminSchemaPatients" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Schema Patients</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        function onWindowResize() {
            var height = getHeight(window);
            $('ContentTableHolder').style.height = Math.max(100, height - 200) + 'px';
        }

        function confirmDeleteSchemaPatient(ptName, ptStudyId, participantID, patientId) {
            var treatmentArm = '<%= Caisis.UI.Core.Classes.PageUtil.EscapeSingleQuotes(TreatmentArmTitle.Text) %>';
            var ptText = 'Treatment Arm: ' + treatmentArm +'\nPatient: ' + ptName + '\nStudy Id: ' + ptStudyId + '\nParticipant ID: ' + participantID + '\nCaisis Patient Id: ' + patientId;
            var message = 'Are you sure you would like to remove the following patient from treatment arm?\n\n' + ptText;
            message += '\n\nNOTE: Removing this patient from the treatment arm will remove all visits related to this treatment arm, including deviations. Removing the patient will not remove data entry items in the system.';
            var doDelete = confirmDelete(message);
            if (doDelete) {
                return confirm('This action CANNOT be undone, are you sure you want to continue removing this patient?\n\n' + ptText);
            }
            return doDelete;
        }

        function reloadUpdatedSchmeaPatients(doClose) {
            if (parent.reloadTreatmentArms) { parent.reloadTreatmentArms(); }
            if (doClose && parent.hideSchemaPortal) {
                parent.hideSchemaPortal();
            }
        }

        /* ]]> */
    </script>
    <style type="text/css">
    #FooterBtns
    {
        text-align: center;
    }
    .ActionColumn
    {
        text-align: center;
    }
    .ActionColumn input
    {
        width: 45%;
        display: inline-block;
        margin: 2px;
    }
    </style>

</head>
<body class="PatientPortalBody_miniTabs">
    <form id="form1" runat="server">
    <div class="PatientTitleBar" style="margin-bottom: 50px;">
        <span id="PageTitle" style="font-weight: bold;">Edit Treatment Arm Patients:
            <asp:Label runat="server" ID="TreatmentArmTitle"> Patients</asp:Label></span>
    </div>
    <asp:Label runat="server" ID="Message" style=" display: block; position: absolute; text-align: center; width: 100%;">The Schedule has been fixed for these patients.</asp:Label>
    <div>
        <h3>Remove Patients from Treatment Arms</h3>
        <table cellpadding="0" cellspacing="0" border="0" width="100%" style="margin: auto auto auto auto; table-layout: fixed; width: 100%;">
            <tr class="BlueListBar">
                <td class="BlueListBar" style="width: 5%;">
                    <img src="Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;"
                        alt="Protocol List" />
                </td>
                <td class="BlueListBar" style="width: 10%;">
                    <asp:HyperLink ID="MRNSort" runat="server" CssClass="HeaderItem" Text="MRN"></asp:HyperLink>
                </td>
                <td class="BlueListBar">
                    <asp:HyperLink ID="NameSort" runat="server" CssClass="HeaderItem" Text="Name"></asp:HyperLink>
                </td>
                 <td class="BlueListBar" style="width: 100px;">
                    Caisis ID
                </td>
                <td class="BlueListBar" style="width: 100px;">
                    Participant ID
                </td>
                <td class="BlueListBar" style="width: 100px;">
                    <asp:HyperLink ID="StudyIdSort" runat="server" CssClass="HeaderItem" Text="StudyId"></asp:HyperLink>
                </td>
                <td class="BlueListBar" style="width: 20%; text-align: center;">
                    <span class="HeaderItem">Actions</span>
                </td>
                <td class="BlueListBar" style="width: 5%; text-align: right;">
                    <img src="Images/HeaderBarBlueRight.gif" width="6" height="35" />
                </td>
            </tr>
            <tr>
                <td colspan="8" align="center" style="vertical-align: top; padding: 0px;">
                    <div id="ContentTableHolder" style="border: 1px solid #cccccc; border-top: none;
                        overflow: auto; overflow-x: hidden; height: 200px; margin-top: 0px; width: 99%;">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" style=" table-layout: fixed; width: 100%;">
                            <asp:Repeater runat="server" ID="SchemaPatientsRptr" OnItemDataBound="SetDeleteMessage">
                                <ItemTemplate>
                                    <tr class="<%# Container.ItemIndex%2==0 ?"dataGridItemRowA":"dataGridItemRowB" %>">
                                        <td style="width: 15%; text-align: left;">
                                            &nbsp;<%# _pc.GetPatientMRN(Eval("PtMRN").ToString()) %>
                                        </td>
                                        <td style="text-align: left;">
                                            <%# _pc.GetPatientLastName(Eval("PtLastName").ToString()) %>,
                                            <%# _pc.GetPatientLastName(Eval("PtFirstName").ToString()) %>
                                        </td>
                                        <td style="width: 100px; text-align: left;">
                                            <%# Eval("PatientId")%>
                                        </td>
                                        <td style="width: 100px; text-align: left;">
                                            <%# Eval("ParticipantID")%>
                                        </td>
                                        <td style=" width: 100px; text-align: left;">
                                            <%# Eval("PtProtocolStudyId")%>
                                        </td>
                                        <td style="width: 25%;" class="ActionColumn">
                                            <asp:Button runat="server" ID="DeleteBtn" CssClass="dataEntryButtonRed" OnClientClick="return confirmDelete('Are you sure you want to remove this Patient from the treatment arm?');"
                                                OnCommand="DeletePatientFromTreatment" CommandArgument='<%# Eval("PatientSchemaId") %>'
                                                ToolTip="Delete Patient From Treatment Arm" Text="Remove" />&nbsp;
                                            <asp:Button runat="server" ID="FixBtn" Text="Fix Schedule" CssClass="dataEntryButtonRed" OnCommand="FixSinglePatientSchedule" CommandArgument='<%# Eval("PatientSchemaId") %>' ToolTip="Fix patient schedule dates + buffered dates" OnClientClick="return confirm('Are you sure you would like to update the patient\'s schedule + buffers based on their On Study date?');" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <h3>
            Patients' Schedule Fixes</h3>
        <div id="FooterBtns">
            <asp:Button runat="server" ID="FixMissingScheduleBtn" OnClick="FixAllPatientSchedules"
                Text="Fix Missing Schedules and Schema Items for all Patients + Fix Schedule and Buffer Dates for all Patients"
                CssClass="dataEntryButtonRed" />
        </div>
    </div>
    </form>
</body>
</html>
