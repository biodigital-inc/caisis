<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReportChartControl.ascx.cs"
    Inherits="Caisis.UI.Core.DataAnalysis.Reports.ReportChartControl" %>
<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Core.Utilities" %>
<chart:CaisisChart ID="ReportChart" runat="server" Height="450px" Width="900px"
    ImageLocation="~/App_Data/TempImages/ChartPic_#SEQ(300,3)" ImageType="Png" BorderDashStyle="Solid"
    BackGradientStyle="DiagonalLeft" BackColor="#5996AF" EnableViewState="True" ViewStateContent="All">
    <Legends>
        <asp:Legend Enabled="True" IsTextAutoFit="False" Name="Default" BackColor="#D0E1E9"
            BorderColor="#DDEAF0" Docking="Bottom" Font="Arial, 11px, style=Bold">
        </asp:Legend>
    </Legends>
    <BorderSkin SkinStyle="Emboss"></BorderSkin>
    <Series>
        <%-- <asp:series ChartArea="ChartArea1" XValueType="DateTime" Name="Series1" CustomProperties="LabelsRadialLineSize=1, LabelStyle=outside" BorderColor="180, 26, 59, 105" Color="194, 65, 140, 240"></asp:series>--%>
        <asp:Series BorderWidth="3" XValueType="DateTime" Name="Series1" BorderColor="180, 26, 59, 105"
            Color="220, 65, 140, 240" ShadowOffset="2" YValueType="Double">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BorderDashStyle="Solid"
            BackSecondaryColor="White" BackColor="AliceBlue" ShadowColor="Transparent" BackGradientStyle="TopBottom">
            <AxisY2 Enabled="False">
            </AxisY2>
            <AxisX2 Enabled="False">
            </AxisX2>
            <Area3DStyle Rotation="10" Perspective="10" Inclination="15" IsRightAngleAxes="False"
                WallWidth="0" IsClustered="False"></Area3DStyle>
            <AxisY LineColor="64, 64, 64, 64" IsLabelAutoFit="False" ArrowStyle="None">
                <LabelStyle Font="Arial, 8.25pt, style=Bold" />
                <MajorGrid LineColor="64, 64, 64, 64" />
            </AxisY>
            <AxisX LineColor="64, 64, 64, 64" IsLabelAutoFit="False" ArrowStyle="None">
                <LabelStyle Font="Arial, 8.25pt, style=Bold" IsStaggered="false" />
                <MajorGrid LineColor="64, 64, 64, 64" />
            </AxisX>
        </asp:ChartArea>
    </ChartAreas>
</chart:CaisisChart>
