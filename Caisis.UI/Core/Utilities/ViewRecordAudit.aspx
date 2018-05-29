<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" CodeFile="ViewRecordAudit.aspx.cs"
    Inherits="Core_DataEntryForms_ViewRecordAudit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Audit Record</title>
    <link type="text/css" rel="stylesheet" href="../../StyleSheets/GlobalStyles.css" />
    <style type="text/css">
    .CurrentGridRow 
    { 
        height: 25px;
        background-color: #cccccc; 
    }
    #ShowHideHelper
    {
        display: block; font-weight: bold; cursor: pointer; text-decoration: none; color: #333333;
    }
    .patientDataSectionTitle { display: block; margin-top: 10px; }
    </style>

    <script type="text/javascript">
    function showHideChanges(doShow)
    {
        var tds = document.getElementById('CurrentRecordAuditGrid').getElementsByTagName('TD');
        for(var i=0;i<tds.length;i++) 
        {
            var c = tds[i],s=tds[i].style,hide=!doShow;
            if(s.backgroundColor!="" && s.color!="" && hide) 
            { 
                c.refBG = s.backgroundColor; 
                s.backgroundColor = "";
                c.refC = s.color; 
                s.color = ""; 
            }
            else if(c.refBG && c.refC && doShow) 
            { 
                s.backgroundColor = c.refBG;
                s.color = c.refC; 
            }
        }
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <!-- Parent Table -->
        <span class="patientDataSectionTitle">Parent Record</span>
        <asp:HyperLink runat="server" ID="ParentTableLink" CssClass="TableRecordLink"></asp:HyperLink>
        <!-- List of Child Tables (Forms) -->
        <span class="patientDataSectionTitle">Child Records</span>
        <asp:Repeater runat="server" ID="rptTableList" OnItemDataBound="SetTableLinks">
            <ItemTemplate>
                <a runat="server" id="TableLink" class="TableRecordLink"></a>
            </ItemTemplate>
        </asp:Repeater>
        <div style="margin-top: 25px;">
            <!-- Grid For Current Record -->
            <asp:Label CssClass="patientDataSectionTitle" runat="server" ID="CurrentRecordTitle"></asp:Label>
            <asp:GridView CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA"
                AlternatingRowStyle-CssClass="dataGridItemRowB" runat="server" ID="CurrentRecordGrid"
                AutoGenerateColumns="false" OnRowDataBound="SetupCurrentRecordGridRow">
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <HeaderTemplate>
                    <span>View Record Audit</span>
                    </HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="ViewRecord" OnCommand="SetAuditGridViewOnViewClick">View Audit</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <!-- Grid For Auditted Record -->
            <asp:Label CssClass="patientDataSectionTitle" ID="CurrentAuditTitle" runat="server"></asp:Label>
            <span visible="false" runat="server" id="ShowHideHelper">( <span onclick="showHideChanges(true);">
                SHOW CHANGES</span> | <span onclick="showHideChanges(false);">HIDE CHANGES</span>
                )</span>
            <asp:GridView CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA"
                AlternatingRowStyle-CssClass="dataGridItemRowB" runat="server" ID="CurrentRecordAuditGrid"
                AutoGenerateColumns="false">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <span>Logged By</span>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <span>
                                <%#Eval("LoggedBy") %>
                            </span><a href="javascript:;" onclick="window.open('EmailUser.aspx?toUser=<%# Eval("LoggedBy") %>','blank','width=400,height=400,top=0,left=0');">
                                <img src="../../Images/EmailLockedByUser.gif" style="border: none; text-align: center;"
                                    alt="Email User <%# Eval("LoggedBy") %>" /></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
