<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientBulkScreening.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.PatientBulkScreening" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PatientScreening</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/jquery.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        Browser.ResizeElement({ nodeId: 'MainOverflow', heightOffset: 275 });

        jQuery.noConflict();

        // on load
        jQuery(document).ready(function () {

        });

        function showNextRow(btn, gridId) {
            var container = jQuery("#MainOverflow");
            var rows = jQuery("#" + gridId);
            var rows = rows.find("TR");
            var hiddenRows = rows.filter(":hidden");
            var nextHiddenRow = hiddenRows.first();
            if (nextHiddenRow.length === 0) {
                jQuery(btn).hide();
            }
            else {
                nextHiddenRow.show();
                container.scrollTop(container.height());
            }
        }
    </script>
    <style type="text/css">
        #PDContainer {
            width: 800px;
            margin: auto;
        }

            #PDContainer table {
                table-layout: fixed;
                margin: 0;
                width: 100%;
            }


        .DataRecordOverflow {
            border: 1px solid #bbb;
            border-collapse: collapse;
        }

            .DataRecordOverflow table.DataRecords {
                border: none;
            }

        #MainOverflow {
            position: relative;
            overflow: auto;
            height: 100%;
        }

        #PDContainer table td {
            text-align: center;
        }

        #UpdateBtn {
            display: block;
            width: 150px;
            margin: auto;
        }
    </style>

</head>
<body class="<%= ReadOnly ? "" : "PatientPortalBody_miniTabs" %>">
    <div runat="server" id="PatientPortalHeaderBar" class="PatientTitleBar" style="height: 60px; margin-top: 6px;">
        Assign Protocol Subjects
    </div>
    <form id="form1" runat="server">
        <div id="PDContainer">
            <table class="DataRecords">
                <thead>
                    <tr class="dataGridHeader">
                        <th runat="server" id="InstitutionHeader">Institution</th>
                        <th runat="server" id="StudyIdHeader">Subject ID (Assigned)</th>
                        <th>Subject ID</th>
                        <th>Registered Date</th>
                        <th>Race</th>
                        <%--                        <th style="width: 100px;">Delete</th>--%>
                    </tr>
                </thead>
            </table>
            <div id="MainOverflow" class="DataRecordOverflow">
                <script type="text/javascript" src="../../ClientScripts/popcalendar.js"></script>
                <cic:ExtendedGridView runat="server" ID="BulkPatientEdit" TableName="PatientProtocols" DataKeyNames="PatientProtocolId,PatientId,PatientProtocolStatusId,IdentifierId" ShowHeader="false"
                    BorderWidth="0" GridLines="Horizontal" CssClass="DataRecords" BlankRows="10" BlankRowCssClass="dataGridBlankRowHidden" VisibleBlankRowCssClass="dataGridBlankRowVisible" AutoGenerateColumns="false" OnRowDeleted="BulkPatientEdit_RowDeleted">
                    <Columns>
                        <asp:TemplateField HeaderText="Subject ID">
                            <ItemTemplate>
                                <cic:CaisisTextBox runat="server" ShowLabel="false" ID="Identifier" Table="Identifiers" Field="Identifier" Value='<%# Eval("Identifier") %>' Width="125px"></cic:CaisisTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Registered Date">
                            <ItemTemplate>
                                <cic:CaisisTextBox runat="server" ShowLabel="false" ID="PtProtocolStatusDateText" Table="PatientProtocolStatus" Field="PtProtocolStatusDateText" Value='<%# Eval("PtProtocolStatusDateText", "{0:d}") %>' ShowCalendar="true" CalcDate="true" Width="75px"></cic:CaisisTextBox>
                                <cic:CaisisHidden runat="server" ShowLabel="false" ID="PtProtocolStatusDate" Table="PatientProtocolStatus" Field="PtProtocolStatusDate" Value='<%# Eval("PtProtocolStatusDate") %>' DisplayCalculatedDate="false"></cic:CaisisHidden>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Race">
                            <ItemTemplate>
                                <cic:CaisisComboBox runat="server" ShowLabel="false" ID="PtRace" Table="Patients" Field="PtRace" LookupCode="PtRace" Value='<%# Eval("PtRace") %>' Width="125px"></cic:CaisisComboBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<cic:GridRowDeleteImage ItemStyle-Width="100px"></cic:GridRowDeleteImage>--%>
                    </Columns>
                </cic:ExtendedGridView>
                <asp:GridView runat="server" ID="BulkPatientReadOnly" TableName="PatientProtocols" ShowHeader="false"
                    BorderWidth="0" GridLines="Horizontal" CssClass="DataRecords" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField HeaderText="" DataField="Institution" />
                        <asp:BoundField HeaderText="" DataField="PtProtocolStudyId" />
                        <asp:BoundField HeaderText="" DataField="Identifier" />
                        <asp:BoundField HeaderText="" DataField="PtProtocolStatusDateText" />
                        <asp:BoundField HeaderText="" DataField="PtRace" />
                    </Columns>
                </asp:GridView>
            </div>
            <span runat="server" id="AddBtn" class="dataEntryButtonGray AddNewRowBtn" onclick="showNextRow(this, 'BulkPatientEdit');">Add Row</span>
        </div>
        <asp:Button runat="server" ID="UpdateBtn" Text="Update" OnClick="UpdateBtn_Click" CssClass="dataEntryButtonRed" />
    </form>
</body>
</html>
