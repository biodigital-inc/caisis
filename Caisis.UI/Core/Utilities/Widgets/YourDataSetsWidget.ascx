<%@ Control Language="C#" AutoEventWireup="true" CodeFile="YourDataSetsWidget.ascx.cs"
    Inherits="Caisis.UI.Core.Utilities.Widget.YourDataSetsWidget" %>
<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Core.Utilities" %>
<%@ Register TagPrefix="ajax" Namespace="Caisis.UI.ClientScript.Ajax" %>
<div style="margin: auto; padding: 5px; text-align: center; font-weight: bold;">
    <asp:Label ID="UserDataSetsLabel" runat="server" AssociatedControlID="UserDataSets">Change your dataset</asp:Label>&nbsp;&nbsp;&nbsp;
    <asp:DropDownList runat="server" ID="UserDataSets" DataTextField="DatasetName" DataValueField="EncDatasetId"
        AutoPostBack="false" OnSelectedIndexChanged="BuildDataset" Font-Size="12px" Font-Bold="true"
        onchange="doUpdateDataSet();">
    </asp:DropDownList>
    <ajax:CaisisAjaxHelper runat="server" ID="ajaxDatasetHelper" DoCallbackScript="doDatasetCallback"
        OnCallbackScript="doReloadDashboard" OnProcessCallback="SetNewClientSession">
    </ajax:CaisisAjaxHelper>
</div>

<script type="text/javascript">
    /* <![CDATA[ */
    
    // do ajax callback to set udpated dataset
    function doUpdateDataSet() {
        var dropDown = jQuery('#<%= UserDataSets.ClientID %>');
        var selectedValue = dropDown.val();
        doDatasetCallback(selectedValue);
    }

    // reload page on ajax return
    function doReloadDashboard(dsUpdated) {
        window.top.location = 'Dashboard.aspx';
    }

    /* ]]> */
</script>

<div style="width: 100%; max-width: 500px; margin: auto;">
    <asp:Label runat="server" ID="ChartErrorMessage"  Visible="false"
        Style="text-align: center; display: block;">
           [error creating chart: <a href="http://www.caisis.org/wiki/index.php?title=Installation#Grant_Write_Access" target="_blank">more info</a>] 
        </asp:Label>
    <chart:CaisisChart runat="server" ID="DataSetChart" Width="500" Height="225" BackColor="#f8f8f8">
        <%--    <Legends>
        <asp:Legend Enabled="True" IsTextAutoFit="True" Name="Default" BackColor="Transparent"
            Docking="Top" Font="Trebuchet MS, 10pt, style=Bold">
        </asp:Legend>
    </Legends>
--%>
        <Series>
            <asp:Series BorderWidth="1" ChartType="Area" IsXValueIndexed="true" Name="Current Dataset Stats"
                BorderColor="#D17529" Color="#E6B692" ShadowOffset="1" YValueType="Int32" Font="Arial, 9px, style=Bold"
                XValueType="String">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="MainArea" BorderColor="64, 64, 64, 64" BorderDashStyle="Solid"
                BackSecondaryColor="White" BackColor="OldLace" ShadowColor="Transparent" BackGradientStyle="TopBottom">
                <AxisY2 Enabled="False">
                </AxisY2>
                <AxisX2 Enabled="False">
                </AxisX2>
                <AxisY IntervalAutoMode="FixedCount" LineColor="64, 64, 64, 64" IsLabelAutoFit="False"
                    ArrowStyle="Triangle">
                    <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                    <MajorGrid LineColor="64, 64, 64, 64" />
                </AxisY>
                <AxisX Title="Patients In This Dataset" LineColor="64, 64, 64, 64" IsLabelAutoFit="False"
                    ArrowStyle="Triangle">
                    <LabelStyle Font="Arial, 8.25pt, style=Bold" IsStaggered="False" />
                    <MajorGrid LineColor="64, 64, 64, 64" />
                </AxisX>
            </asp:ChartArea>
        </ChartAreas>
    </chart:CaisisChart>
</div>

<script type="text/javascript">
    /* <![CDATA[ */

    // stretch chart to fill widget
    (function() {
        var chart = document.getElementById('<%= DataSetChart.ClientID %>');
        if (chart) {
            chart.style.width = '100%';
        }
    })();

    /* ]]> */
</script>

