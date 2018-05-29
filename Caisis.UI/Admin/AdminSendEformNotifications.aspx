<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminSendEformNotifications.aspx.cs"
    Inherits="Caisis.UI.Admin.AdminSendEformNotifications" %>

<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Send EForm Notification</title>
    <link type="text/css" rel="stylesheet" href="../StyleSheets/GlobalStyles.css" />
    <style type="text/css">
    .dataGrid 
    { 
        text-align: center; 
        table-layout: fixed; 

    }
    .dataGrid td
    {
        vertical-align: middle;
    }
    </style>

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript">
    /* <![CDATA[ */  
    function checkUncheckAll(checkState)
    {
        var gridId = '<%= SendNotificationGrid.ClientID %>';
        var grid = document.getElementById(gridId);
        var gridRows = grid.getElementsByTagName('tr');
        for(var i=0;i<gridRows.length;i++)
        {
            var firstRowCell = gridRows[i].getElementsByTagName('td')[0];
            if(firstRowCell)
            {
                firstRowCell.getElementsByTagName('input')[0].checked = checkState;
            }
        }
    }
    var imgDir = "../Images/Calendar/";
     /* ]]> */
    </script>

</head>
<body >
    <form id="form1" runat="server" visible="true">
        <div runat="server" id="SearchPanel" style="margin-top: 10px;">
            <asp:HiddenField runat="server" ID="HiddenDateValue" />
            <custom:CaisisTextBox runat="server" ID="DateChooser" ShowLabel="false" ShowCalendar="true"></custom:CaisisTextBox>

            <script type="text/javascript" src="../ClientScripts/popcalendar.js"></script>

            <asp:Button runat="server" ID="DateChooserSearch" Text="Search" OnClick="RunSearch" />
            <span runat="server" style="display: block; margin-top: 10px; font-weight: bold;"
                id="SearchResultsMessage"></span>
        </div>
        <div runat="server" id="GridPanel" visible="false">
            <asp:GridView OnDataBound="OnNotificationGridBound" CssClass="dataGrid" DataKeyNames="SurgeryAppointmentId"
                RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                HeaderStyle-CssClass="dataGridHeader" runat="server" ID="SendNotificationGrid"
                AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField HeaderStyle-Width="20px" ItemStyle-Width="20px" ControlStyle-Width="20px">
                        <ItemTemplate>
                            <asp:CheckBox ID="EmailUserCheckBox" runat="server" Checked="false" />
                        </ItemTemplate>
                        <HeaderTemplate>
                            <input type="checkbox" runat="server" onclick="checkUncheckAll(this.checked);" />
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <span>
                                <%# Eval("ApptCaseSurgeon") %>
                            </span>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <span>Case Surgeon</span>
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <span>
                                <%# Eval("ApptEform") %>
                            </span>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <span>EForm</span>
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <span>
                                <%# Eval("ApptLastName") %>
                                ,
                                <%# Eval("ApptFirstName") %>
                            </span>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <span>Patient Name</span>
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <span>
                                <%# Eval("ApptMRN") %>
                            </span>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <span>Appointment MRN</span>
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <span>
                                <%# Eval("ApptSurgeonEmail") %>
                            </span>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <span>Surgeon Email</span>
                        </HeaderTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <%# Eval("LastNotificationSent") %>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <span>Last Notification Sent Date</span>
                        </HeaderTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="SendEmailBtn" runat="server" Text="Send Emails" OnCommand="SendEmailNotificationsClick" />
        </div>
    </form>
</body>
</html>
