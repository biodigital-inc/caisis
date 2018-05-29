<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NeuroPendingItems.aspx.cs"
    Inherits="Caisis.UI.Modules.Neuro.Reports.NeuroPendingItems" CodeFileBaseClass="Caisis.UI.Core.Classes.BasePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>NeuroPendingItems</title>
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
        <table width="100%" cellpadding="1" cellspacing="0" border="0">
            <tr>
                <td align="center" valign="top">
                    <%= resultMessage%>
                    <table cellspacing="0" cellpadding="1" border="0">
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="4" border="0" style="border-right: #cccccc 1px solid;
                                    border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid;">
                                    <tr>
                                        <td width="150" class="ListManDataTableTop" style="text-align: left;">
                                            <asp:LinkButton ID="PtName" runat="server" Text="Name" Font-Underline="true" 
                                                OnCommand="SortRecords" CommandName="PtName"/></td>
                                        <td width="100" class="ListManDataTableTop" style="text-align: center;">D.O.B</td>
                                        <td width="100" class="ListManDataTableTop" style="text-align: center;">
                                            <asp:LinkButton ID="PtMRN" runat="server" Text="MRN" Font-Underline="true" 
                                                OnCommand="SortRecords" CommandName="PtMRN"/></td>
                                        <td width="200" class="ListManDataTableTop" style="text-align: center;">Items</td>
                                        <td width="90" class="ListManDataTableTop" style="text-align: center;">
                                            <asp:LinkButton ID="VitalStatus" runat="server" Text="Status" 
                                                Font-Underline="true" OnCommand="SortRecords" CommandName="VitalStatus"/></td>     
                                        <td width="100" class="ListManDataTableTop" style="text-align: center;">
                                            <asp:LinkButton ID="LastAccessed" runat="server" Text="LastAccessed" 
                                                Font-Underline="true" OnCommand="SortRecords" CommandName="LastAccessed"/></td>
                                    </tr>
                                    <asp:Repeater ID="reportResults" runat="server">
                                        <ItemTemplate>
                                            <tr class="listLayer" id="listTR" style="cursor: pointer;" onmouseover="this.className='listLayerOver'" 
                                                onmouseout="this.className='listLayer'" 
                                                onclick="navigateToPatientOnList('<%# Caisis.Security.CustomCryptoHelper.Encrypt(Eval("PatientId").ToString())%>');">
                                                <td width="150" valign="top" align="left"><%# Eval("PtFirstName")%> <%# Eval("PtLastName")%></td>
                                                <td width="100" valign="top" align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "PtBirthDate", "{0:d}")%>
                                                </td>
                                                <td width="100" valign="top" align="center"><%# Eval("PtMRN") %></td> 
                                                <td width="200" valign="top" align="center"><%# Eval("Items") %></td>
                                                <td width="90" valign="top" align="center"><%# Eval("VitalStatus")%></td>
                                                <td width="100" valign="top" align="center">
                                                    <%# DataBinder.Eval(Container.DataItem, "LastAccessed", "{0:d}")%>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <SeparatorTemplate>
                                            <tr>
                                                <td colspan="6" class="ListManDataTableDottedLine"></td>
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