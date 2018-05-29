<%@ Page ContentType="text/xml" EnableViewState="false" Language="C#" AutoEventWireup="true"
    CodeFile="PatientSearch.aspx.cs" Inherits="Caisis.UI.Core.Utilities.PatientSearch" %>

<%@ Import Namespace="System.Data" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Search</title>
</head>
<body>
    <form id="ParientSearchForm" runat="server">
    <span id="SearchCount" runat="server"></span><span id="SingleSearchEPID" runat="server">
    </span>
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <asp:Repeater ID="PatientsRptr" runat="server" OnItemDataBound="HandleIdentifiersColumn">
            <ItemTemplate>
                <tr class="listLayer" onmouseover="this.className='listLayerOver'" onmouseout="this.className='listLayer'"
                    onclick="navigateToPatient('<%# Caisis.Security.CustomCryptoHelper.Encrypt(Eval("PatientId").ToString())%>', true);">
                    <td class="smallHeaderText" style="text-align: left;">
                        <span>
                            <%# Server.HtmlEncode(pc.GetPatientLastName((Container.DataItem as DataRowView)["PtLastName"].ToString()) + ", " + pc.GetPatientFirstName((Container.DataItem as DataRowView)["PtFirstName"].ToString()))%>
                        </span>
                    </td>
                    <td class="smallHeaderText" style="text-align: center;">
                        <span>
                            <%# Server.HtmlEncode(pc.GetPatientDateOfBirth((Container.DataItem as DataRowView)["PtBirthDateText"].ToString())) %>
                        </span>
                    </td>
                    <td class="smallHeaderText" style="text-align: right;">
                        <asp:Label ID="IdentifierCol" runat="server"></asp:Label>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    </form>
</body>
</html>
