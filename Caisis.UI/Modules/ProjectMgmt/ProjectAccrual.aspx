<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProjectAccrual.aspx.cs" Inherits="Caisis.UI.Modules.ProjectMgmt.ProjectAccrual" %>

<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Core.Utilities" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Project Accrual</title>
    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script src="../../ClientScripts/DynamicControls.js" type="text/javascript"></script>
    <script type="text/javascript" src="ProjectMgmtScripts.js"></script>
    <script src="../../ClientScripts/jquery.js" type="text/javascript"></script>
    <link href="../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../ProtocolMgmt/StyleSheets/ProtocolMgmtStyles.css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">

        Browser.ResizeElement({ nodeId: "DetailsPanel", heightOffset: 300 });
        Browser.ResizeElement({ nodeId: "AccrualDetailsPanel", heightOffset: 300 });

        jQuery.noConflict();

        function setAccrualTab(btn, tabId) {
            var btns = jQuery("#Tabs a")
            btns.removeClass("active");
            jQuery(btn).addClass("active");
            var panels = jQuery(".tabPanel");
            panels.hide();
            var panel = jQuery("#" + tabId);
            panel.show();
            return false;
        }
    </script>
    <style type="text/css">
        table.dataGrid th {
            padding: 3px 7px;
            text-align: center;
        }

        table.dataGrid td {
            padding: 5px 10px;
            text-align: center;
        }
        .tabPanel {
            display: block;
            width: 825px;
            border-radius: 2px;
            border: 1px solid #ccc;
        }
        #AccrualDetailsFrame {
            display: block;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    <h1>Project Accrual</h1>
    <p runat="server" id="ErrorText" visible="false">There are no accrual details for this Project.</p>
    <form id="dataForm" runat="server">
        <div id="tabs">
        </div>
        <div id="Tabs" class="dataEntryNavToggleContainer">
            <div class="dataEntryNavToggle">            
                <a href="#" onclick="return setAccrualTab(this, 'DetailsPanel');" class="active">Accrual Stats</a>
                <a href="#" onclick="return setAccrualTab(this, 'AccrualDetailsPanel');">Accrual Details</a>
            </div>
        </div>
        <div runat="server" id="DetailsPanel" visible="false" class="tabPanel">
            <h2>Accrual By Year and Quarter</h2>
            <asp:GridView runat="server" ID="ProjectAccrualByYearGrid" AutoGenerateColumns="false" ShowHeader="true" ShowFooter="true" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB">
                <Columns>
                    <asp:BoundField DataField="PtRegisteredYear" HeaderText="Year" />
                    <asp:BoundField DataField="PtRegisteredQuarter" HeaderText="Quarter" />
                    <asp:BoundField DataField="PatientCount" HeaderText="Subject Count" />
                </Columns>
            </asp:GridView>
            <h2>Accrual By by Year + Quarter + Institution</h2>
            <asp:GridView runat="server" ID="ProjectAccrualByInstitutionGrid" AutoGenerateColumns="false" ShowHeader="true" ShowFooter="true" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB">
                <Columns>
                    <asp:BoundField DataField="PtInstitution" HeaderText="Institution" />
                    <asp:BoundField DataField="PtRegisteredYear" HeaderText="Year" />
                    <asp:BoundField DataField="PtRegisteredQuarter" HeaderText="Quarter" />
                    <asp:BoundField DataField="TotalPatients" HeaderText="Total Patients" />
                </Columns>
            </asp:GridView>
        </div>
        <div id="AccrualDetailsPanel" style="display: none;" class="tabPanel">
            <iframe runat="server" id="AccrualDetailsFrame" frameborder="0"></iframe>
        </div>
    </form>
</body>
</html>
