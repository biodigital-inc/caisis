<%@ Page Language="C#" EnableViewState="true" AutoEventWireup="true" CodeFile="MissingCatheterRemovalPostOp.aspx.cs"
    Inherits="Caisis.UI.Modules.Prostate.Reports.MissingCatheterRemovalPostOp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>MissingCatheterRemovalPostOp</title>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
</head>
<body id="ReportContentBody" runat="server" class="reportContentBody">
    <form id="Form1" method="post" runat="server">
        <table width="100%"   cellpadding="1" cellspacing="0" border="0">
            <tr>
                <td align="left" valign="top">
                    <%= resultMessage%>
                    <table cellspacing="0" cellpadding="1" border="0">
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="4" border="0" style="border-right: #cccccc 1px solid;
                                    border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid">
                                    <tr>
                                        <td width="100" class="ListManDataTableTop" style="text-align: left;">
                                            MRN</td>
                                        <td width="150" class="ListManDataTableTop" style="text-align: left;">
                                            Name</td>
                                        <td width="100" class="ListManDataTableTop" style="text-align: left;">
                                            Surgery</td>
                                        <td width="150" class="ListManDataTableTop" style="text-align: left;">
                                            Case Surgeon</td>
                                        <td width="200" class="ListManDataTableTop" style="text-align: left;">
                                            Institution</td>
                                    </tr>
                                    <asp:Repeater ID="reportResults" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td class="dataGridItemRowA" valign="top">
                                                    <%# Eval("PtMrn") %>
                                                </td>
                                                <td class="dataGridItemRowA" valign="top">
                                                    <%# Eval("PtLastName") %>
                                                    ,
                                                    <%# Eval("PtFirstName") %>
                                                </td>
                                                <td class="dataGridItemRowA" valign="top">
                                                    <%# Eval("ProcName") %>
                                                </td>
                                                <td class="dataGridItemRowA" valign="top">
                                                    <%# Eval("OpCaseSurgeon") %>
                                                </td>
                                                <td class="dataGridItemRowA" valign="top">
                                                    <%# Eval("OpInstitution") %>
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
                                                    <%# Eval("ProcName") %>
                                                </td>
                                                <td class="dataGridItemRowB" valign="top">
                                                    <%# Eval("OpCaseSurgeon") %>
                                                </td>
                                                <td class="dataGridItemRowB" valign="top">
                                                    <%# Eval("OpInstitution") %>
                                                </td>
                                            </tr>
                                        </AlternatingItemTemplate>
                                    </asp:Repeater>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
