<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEformNotificationLog.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminEformNotificationLog" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Eform Notification Log</title>
    <link type="text/css" rel="stylesheet" href="../StyleSheets/GlobalStyles.css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript">
    var imgDir = "../Images/Calendar/";
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div style="margin-top: 10px;">
            <custom:CaisisTextBox runat="server" ID="DateChooser" ShowLabel="false" ShowCalendar="true"></custom:CaisisTextBox>

            <script type="text/javascript" src="../ClientScripts/popcalendar.js"></script>

            <asp:Button runat="server" ID="DateChooserSearch" Text="Search" OnClick="RunSearch" />
            <span runat="server" style="display: block; margin-top: 10px; font-weight: bold;"
                id="SearchMessage"></span>
        </div>
        <div>
            <asp:GridView EnableViewState="false" CssClass="dataGrid" RowStyle-CssClass="dataGridItemRowA"
                AlternatingRowStyle-CssClass="dataGridItemRowB" HeaderStyle-CssClass="dataGridHeader"
                runat="server" ID="NotificationLogGrid" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="ApptCaseSurgeon" HeaderText="Surgeon" />
                    <asp:BoundField DataField="ApptSurgeonEmail" HeaderText="Surgeon Email" />
                    <asp:BoundField DataField="ApptEform" HeaderText="EForm" />
                    <asp:BoundField DataField="ApptMRN" HeaderText="Patient MRN" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <span>
                                <%# Eval("ApptLastName")%>
                                ,
                                <%# Eval("ApptFirstName")%>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="LastNotificationSent" HeaderText="Sent Date" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
