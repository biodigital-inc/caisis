<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BreastQProcessOfCareChart.ascx.cs"
    Inherits="Caisis.UI.Modules.Breast.Reports.BreastQProcessOfCareChart" %>
<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Core.Utilities" %>
<chart:CaisisChart runat="server" ID="ProcessOfCareChart" Width="780" Height="400"
    CssClass="breastQChart">
    <Titles>
        <asp:Title Name="MainTitle" Alignment="TopCenter" Text="Process Of Care: Satisfaction"
            ForeColor="Black" Visible="true">
        </asp:Title>
    </Titles>
    <Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="MainArea" >
            <AxisX Title="" TitleAlignment="Center" Interval="1" LineWidth="0" TextOrientation="Horizontal"
                IntervalOffset="0" IsStartedFromZero="true" LabelAutoFitStyle="WordWrap" IsLabelAutoFit="true">
                <MajorGrid Enabled="false" />
                <MinorGrid Enabled="false" />
                <MajorTickMark Enabled="false" />
                <LabelStyle Enabled="true" />
            </AxisX>
            <AxisY Title="" TitleFont="8pt Arial Bold" Minimum="0" IsStartedFromZero="true"
                Maximum="100" Interval="10">
            </AxisY>
        </asp:ChartArea>
    </ChartAreas>
</chart:CaisisChart>
