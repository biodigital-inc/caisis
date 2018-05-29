<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NeuroSpecimensMissingCyto.aspx.cs"
    Inherits="Caisis.UI.Modules.Neuro.Reports.NeuroSpecimensMissingCyto" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>NeuroSpecimensMissingCyto</title>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

     <script type="text/javascript">
        /* <![CDATA[ */
        function navigateToPatientOnList(epid) {
            var patientRedirectPath = '<%= Page.ResolveUrl("~/Core/DataEntryForms/Index.aspx") %>' + '?verifyPatientId=true&epid=' + epid
            window.top.location = patientRedirectPath;
        }
        /* ]]> */
    </script>

</head>
<body id="ReportContentBody" runat="server" class="reportContentBody">
    <form id="Form1" method="post" runat="server">
        <table width="100%"   cellpadding="1" cellspacing="0" border="0">
            <tr>
                <td align="center" valign="top">
                    <%= resultMessage%>
                    <table cellspacing="0" cellpadding="1" border="0">
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="4" border="0" style="border-right: #cccccc 1px solid;
                                    border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid">
                                    <tr>
                                        <td width="150" class="ListManDataTableTop" style="text-align: left;">
                                            <asp:LinkButton ID="PtName" runat="server" Text="Patient Name" Font-Underline="true" 
                                                OnCommand="SortRecords" CommandName="PtName" ToolTip="Patient Name"/>
                                        </td>
                                        <td width="100" class="ListManDataTableTop" style="text-align: center;">
                                            <asp:LinkButton ID="PtMRN" runat="server" Text="MRN" Font-Underline="true" 
                                                OnCommand="SortRecords" CommandName="PtMRN" ToolTip="MRN"/>
                                        </td>
                                        <td width="100" class="ListManDataTableTop" style="text-align: center;">
                                            <asp:LinkButton ID="PathDate" runat="server" Text="Pathology Date" Font-Underline="true" 
                                                OnCommand="SortRecords" CommandName="PathDate" ToolTip="Pathology Date" />
                                        </td>
                                        <td width="200" class="ListManDataTableTop" style="text-align: center;">
                                            <asp:LinkButton ID="PathHistology" runat="server" Text="Histology" Font-Underline="true" 
                                                OnCommand="SortRecords" CommandName="PathHistology" ToolTip="Histology" />
                                        </td>
                                    </tr>
                                    <asp:Repeater ID="reportResults" runat="server">
                                        <ItemTemplate>
                                            <tr class="listLayer" id="listTR" style="cursor: pointer;" onmouseover="this.className='listLayerOver'" 
                                                onmouseout="this.className='listLayer'" 
                                                onclick="navigateToPatientOnList('<%# Caisis.Security.CustomCryptoHelper.Encrypt(Eval("PatientId").ToString())%>');">
                                                <td width="150" valign="top" align="left"><%# Eval("PtLastName") %>, <%# Eval("PtFirstName") %></td>
                                                <td width="100" valign="top" align="center"><%# Eval("PtMRN") %></td>
                                                <td width="100" valign="top" align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "PathDate", "{0:d}") %>
                                                </td>
                                                <td width="200" valign="top" align="center"><%# Eval("PathHistology") %></td>
                                            </tr>
                                        </ItemTemplate>
                                        <SeparatorTemplate>
                                            <tr>
                                                <td colspan="4" class="ListManDataTableDottedLine"></td>
                                            </tr>
                                        </SeparatorTemplate>
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