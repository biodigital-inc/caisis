<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminManagePatients.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminManagePatients" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Patients</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript">

        function confirmDeletePatientProtocol() {
            return confirmDelete('Are you sure you would like to remove this Patient from this Protocol and its associated Treatment Arm?');
        }

        function confirmDeletePatientSchema() {
            return confirmDelete('Are you sure you would like to remove this Patient from this Treatment Arm?');
        }

        function refreshMain() {
            var modalCaller = top.getModalCallingWindow();
            if (modalCaller) {
                modalCaller.location = modalCaller.location;
            }
        }

    </script>

    <style type="text/css">
        ol
        {
            display: block;
            vertical-align: top;
            margin: 0;
            padding: 0;
        }
        ol > li > span
        {
            display: inline-block;
            width: 125px;
            vertical-align: top;
        }
        table th
        {
            padding-top: 3px;
            padding-bottom: 3px;
        }
        .dataEntryButtonRed
        {
            font-size: 9px;
            padding: 1px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table border="0" width="100%" cellspacing="0" cellpadding="0">
        <thead class="dataGridHeader">
            <tr>
                <th style="width: 15%;">
                    Study Id
                </th>
                <th style="width: 25%;">
                    Patient (MRN)
                </th>
                <th style="width: 25%;">
                    Remove from Protocol
                </th>
                <th style="width: 35%;">
                    Remove from Treatment Arm
                </th>
            </tr>
        </thead>
    </table>
    <div style="overflow: auto; max-height: 425px;">
        <table border="0" width="100%" cellspacing="0" cellpadding="0">
            <asp:Repeater runat="server" ID="PatientProtocolsRptr" OnItemDataBound="BuildPatientSchemas">
                <ItemTemplate>
                    <tr>
                        <td style="width: 15%;" class="dashboardTreatmentArmRow_<%# Container.ItemIndex%2==0?"A":"B" %> noRightBorder">
                            <%# Eval("PtProtocolStudyId")%>
                        </td>
                        <td style="width: 25%;" class="dashboardTreatmentArmRow_<%# Container.ItemIndex%2==0?"A":"B" %> noRightBorder">
                            <asp:Label runat="server" ID="PatientName" CssClass="boldText"></asp:Label>
                            (<asp:Label runat="server" ID="PtMRN" CssClass="boldText"></asp:Label>)
                        </td>
                        <td style="width: 25%; text-align: center;" class="dashboardTreatmentArmRow_<%# Container.ItemIndex%2==0?"A":"B" %> noRightBorder">
                            <asp:HiddenField runat="server" ID="PatientProtocolId" Value='<%# Eval("PatientProtocolId") %>' />
                            <asp:Button runat="server" ID="DeletePatientProtocolBtn" CssClass="dataEntryButtonRed"
                                OnClientClick="return confirmDeletePatientProtocol();" Text="Remove" OnCommand="DeletePatientFromProtocol" />
                        </td>
                        <td style="width: 35%;" class="dashboardTreatmentArmRow_<%# Container.ItemIndex%2==0?"A":"B" %> noLeftBorder">
                            <ol>
                                <asp:Repeater runat="server" ID="PatientSchemasRptr">
                                    <ItemTemplate>
                                        <li><span class="boldText">
                                            <%# Eval("ProtocolArmDescription") %></span>
                                            <asp:Button runat="server" ID="DeleteBtn" CssClass="dataEntryButtonRed" Text="Remove"
                                                OnClientClick="return confirmDeletePatientSchema();" OnCommand="DeletePatientFromTreatment"
                                                CommandArgument='<%# Eval("PatientSchemaId") %>' />
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ol>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    </form>
</body>
</html>
