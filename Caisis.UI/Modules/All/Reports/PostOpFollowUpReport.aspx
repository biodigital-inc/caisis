<%@ Page Language="C#" Inherits="Caisis.UI.Modules.All.Reports.PostOpFollowUpReport"
    CodeFile="PostOpFollowUpReport.aspx.cs" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>
<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Post Op Follow Up Report</title>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
</head>
<body id="ReportContentBody" runat="server" class="reportContentBody">
    <form id="Form1" method="post" runat="server">
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td align="left" width="100%" valign="top">
                    <table cellspacing="0" cellpadding="1" border="0" width="100%">
                        <tr style="font-weight: bold">
                            <td valign="middle">
                                <img src="../../../Images/shim.gif" width="1" height="35" align="left">
                                Type:<br />
                                <asp:DropDownList ID="OpType" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                Surgeon:<br />
                                <asp:DropDownList ID="OpSurgeon" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                Institution:<br />
                                <asp:DropDownList ID="OpInstitution" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style=" white-space: nowrap;">
                                Months Since Surgery:<br />
                                <asp:DropDownList ID="DateRange" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td style=" white-space: nowrap;">
                                Months Since PSA:<br />
                                <asp:DropDownList ID="MonthsSincePSA" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>
                                &nbsp;&nbsp;<asp:ImageButton ID="RunReportBtn" ImageUrl="../../../Images/Search_small.gif"
                                    runat="server" Width="52" Height="19" ImageAlign="AbsMiddle" />
                            </td>
                            <td>
                                <excel:ExcelExportImageButton ID="ExcelBtn" runat="server" OnClick="ExcelBtn_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <asp:Label ID="resultMessage" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td colspan="7">
                                <asp:Panel ID="RP_LP_Panel" runat="server">
                                    <table style="border-right: #cccccc 1px solid; border-top: #cccccc 1px solid; border-left: #cccccc 1px solid;
                                        border-bottom: #cccccc 1px solid" cellspacing="0" cellpadding="4" width="100%"
                                        border="0">
                                        <tr>
                                            <td class="ListManDataTableTop" style="font-size: 9px; text-align: left" width="100">
                                                MRN</td>
                                            <td class="ListManDataTableTop" style="font-size: 9px; text-align: left" width="150">
                                                <asp:LinkButton ID="SortByName" runat="server"><u>Name</u></asp:LinkButton></td>
                                            <td class="ListManDataTableTop" style="font-size: 9px; text-align: left" width="80">
                                                Phone</td>
                                            <td class="ListManDataTableTop" title="Operation Type" style="font-size: 9px; text-align: left"
                                                width="80">
                                                Type</td>
                                            <td class="ListManDataTableTop" title="Surgeon" style="font-size: 9px; text-align: left"
                                                width="80">
                                                Surgeon</td>
                                            <td class="ListManDataTableTop" style="font-size: 9px; text-align: left" width="60">
                                                Date</td>
                                            <td class="ListManDataTableTop" title="Months Since Surgery" style="font-size: 9px;
                                                text-align: left" width="50">
                                                <asp:LinkButton ID="SortByMonthsSinceSurgery" runat="server"><u>MSS</u></asp:LinkButton></td>
                                            <td class="ListManDataTableTop" title="Last PSA Data Post Surgery" style="font-size: 9px;
                                                text-align: left" width="60">
                                                Last PSA Date</td>
                                            <td class="ListManDataTableTop" style="font-size: 9px; text-align: left" width="50">
                                                PSA</td>
                                            <td class="ListManDataTableTop" title="Months Since PSA" style="font-size: 9px; text-align: left"
                                                width="50">
                                                <asp:LinkButton ID="SortByMonthsSincePSA" runat="server"><u>MS PSA</u></asp:LinkButton></td>
                                            <td class="ListManDataTableTop" style="font-size: 9px; text-align: left" width="80">
                                                Action Date</td>
                                            <td class="ListManDataTableTop" style="font-size: 9px; text-align: left" width="80">
                                                Action</td>
                                            <%-- <td width="100" class="ListManDataTableTop"  style="text-align: left; font-size: 9px;">Action Notes</td> --%>
                                        </tr>
                                        <asp:Repeater ID="RP_LP_Repeater" runat="server" OnItemDataBound="RP_LP_Repeater_DataBound">
                                            <ItemTemplate>
                                                <tr>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("PtMrn") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("PtLastName") %>
                                                        ,
                                                        <%# Eval("PtFirstName") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("PtPhoneNumber") %>
                                                        (
                                                        <%# Eval("PtPhoneType") %>
                                                        )
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("ProcName") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("OpCaseSurgeon") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("OpDateText") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("MonthsSinceSurgery") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("LabDateText") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("LabResult") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("MonthsSincePSA") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("ActionDateText") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("ActionItem") %>
                                                    </td>
                                                    <%-- <td bgcolor="ffffff" valign="top"></td> --%>
                                                </tr>
                                                <tr id="ActionNotesRow" runat="server">
                                                    <td colspan="12" bgcolor="ffffff">
                                                        <strong>Action Notes:</strong>
                                                        <%# Eval("ActionNotes") %>
                                                    </td>
                                                </tr>
                                                <tr style="padding: 0px;">
                                                    <td colspan="12" bgcolor="#ffffff" style="padding: 0px; border-bottom: solid 1px #cccccc;">
                                                        <img src="../../../Images/shim.gif" height="1" width="1" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <AlternatingItemTemplate>
                                                <tr>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("PtMrn") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("PtLastName") %>
                                                        ,
                                                        <%# Eval("PtFirstName") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("PtPhoneType") %>
                                                        <%# Eval("PtPhoneNumber") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("ProcName") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("OpCaseSurgeon") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("OpDateText") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("MonthsSinceSurgery") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("LabDateText") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("LabResult") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("MonthsSincePSA") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("ActionDateText") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("ActionItem") %>
                                                    </td>
                                                    <%-- <td class="dataGridItemRowB" valign="top"> </td> --%>
                                                </tr>
                                                <tr id="ActionNotesRow" runat="server">
                                                    <td colspan="12" class="dataGridItemRowB">
                                                        <strong>Action Notes:</strong>
                                                        <%# Eval("ActionNotes") %>
                                                    </td>
                                                </tr>
                                                <tr style="padding: 0px;">
                                                    <td colspan="12" class="dataGridItemRowB" style="padding: 0px; border-bottom: solid 1px #cccccc;">
                                                        <img src="../../../Images/shim.gif" height="1" width="1" />
                                                    </td>
                                                </tr>
                                            </AlternatingItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </asp:Panel>
                                <asp:Panel ID="LN_Panel" runat="server">
                                    <table style="border-right: #cccccc 1px solid; border-top: #cccccc 1px solid; border-left: #cccccc 1px solid;
                                        border-bottom: #cccccc 1px solid" cellspacing="0" cellpadding="4" width="100%"
                                        border="0">
                                        <!-- Mrn first and last name, SurgDateText, MonthsSinceSurgery, *SurgCaseSurgeon, *Optype, PathHistology, LastFollowUpDateText,LastFollowUpDate, MonthsToLastFollowUp, MonthsSinceFollowUp -->
                                        <tr>
                                            <td class="ListManDataTableTop" style="font-size: 9px; text-align: left" width="70">
                                                MRN</td>
                                            <td class="ListManDataTableTop" style="font-size: 9px; text-align: left" width="140">
                                                Name</td>
                                            <td class="ListManDataTableTop" style="font-size: 9px; text-align: left" width="110">
                                                Phone</td>
                                            <td class="ListManDataTableTop" title="Operation Type" style="font-size: 9px; text-align: left"
                                                width="80">
                                                Type</td>
                                            <td class="ListManDataTableTop" title="Surgeon" style="font-size: 9px; text-align: left"
                                                width="80">
                                                Surgeon</td>
                                            <td class="ListManDataTableTop" title="Surgery Date" style="font-size: 9px; text-align: left"
                                                width="80">
                                                Date</td>
                                            <td class="ListManDataTableTop" title="Months Since Surgery" style="font-size: 9px;
                                                text-align: left" width="50">
                                                MSS</td>
                                            <td class="ListManDataTableTop" style="font-size: 9px; text-align: left" width="80">
                                                Path Histology</td>
                                            <td class="ListManDataTableTop" title="Last Follow Up Date" style="font-size: 9px"
                                                width="50">
                                                Last FU Date</td>
                                            <td class="ListManDataTableTop" title="Months Betweem Surgery and Last Follow Up"
                                                style="font-size: 9px" width="50">
                                                Months To Last FU</td>
                                            <td class="ListManDataTableTop" title="Months Since Last Follow Up" style="font-size: 9px"
                                                width="80">
                                                Months<br />
                                                Since FU</td>
                                        </tr>
                                        <asp:Repeater ID="LN_Repeater" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("PtMrn") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("PtLastName") %>
                                                        ,
                                                        <%# Eval("PtFirstName") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("PtPhoneType") %>
                                                        <%# Eval("PtPhoneNumber") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("ProcName") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("OpCaseSurgeon") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("OpDateText") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("MonthsSinceSurgery") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top">
                                                        <%# Eval("PathHistology") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top" align="center">
                                                        <%# Eval("LastFollowUpDateText") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top" align="center">
                                                        <%# Eval("MonthsToLastFollowUp") %>
                                                    </td>
                                                    <td bgcolor="ffffff" valign="top" align="center">
                                                        <%# Eval("MonthsSinceFollowUp") %>
                                                    </td>
                                                </tr>
                                                <tr style="padding: 0px;">
                                                    <td colspan="12" bgcolor="#ffffff" style="padding: 0px; border-bottom: solid 1px #cccccc;">
                                                        <img src="../../../Images/shim.gif" height="1" width="1" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <AlternatingItemTemplate>
                                                <tr>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("PtMrn") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("PtLastName") %>
                                                        ,
                                                        <%# Eval("PtFirstName") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("PtPhoneType") %>
                                                        <%# Eval("PtPhoneNumber") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("ProcName") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("OpCaseSurgeon") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("OpDateText") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("MonthsSinceSurgery") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("PathHistology") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("LastFollowUpDateText") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("MonthsToLastFollowUp") %>
                                                    </td>
                                                    <td class="dataGridItemRowB" valign="top">
                                                        <%# Eval("MonthsSinceFollowUp") %>
                                                    </td>
                                                </tr>
                                                <tr style="padding: 0px;">
                                                    <td colspan="12" class="dataGridItemRowB" style="padding: 0px; border-bottom: solid 1px #cccccc;">
                                                        <img src="../../../Images/shim.gif" height="1" width="1" />
                                                    </td>
                                                </tr>
                                            </AlternatingItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
