<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolPatientCallbacks.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.ProtocolPatientCallbacks" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <%-- Patient Search --%>
        <input runat="server" type="hidden" id="PatientResults_Single" />
        <asp:GridView runat="server" Width="100%" ID="PatientResults" AutoGenerateColumns="false"
            CssClass="dataGrid" RowStyle-CssClass="dataGridItemRowB" AlternatingRowStyle-CssClass="dataGridItemRowA"
            ShowHeader="false" OnRowDataBound="SetPtChooser" Font-Size="11px" CellPadding="0"
            CellSpacing="0" Style="padding: 0px; margin: 0px; border: solid 1px #cccccc;">
            <Columns>
                <asp:BoundField DataField="PtLastName" HeaderText="Last Name" />
                <asp:BoundField DataField="PtFirstName" HeaderText="First Name" />
                <asp:BoundField DataField="PtMRN" HeaderText="MRN" />
            </Columns>
        </asp:GridView>
        <%-- Participant Id --%>
        <input runat="server" type="hidden" id="ParticipantId" value="" />
        <%-- Clinic List --%>
        <select runat="server" id="ClinicPatients" datatextfield="ApptName" datavaluefield="ApptEncryptedPatientId">
        </select>
    </div>
    </form>
</body>
</html>
