<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BreastQScaleChart.ascx.cs"
    Inherits="Caisis.UI.Modules.Breast.Reports.BreastQScaleChart" %>
<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Core.Utilities" %>
<chart:CaisisChart runat="server" ID="BreastQChart" Width="370" Height="400" CssClass="breastQChart">
    <Titles>
        <asp:Title Name="MainTitle" ForeColor="Black">
        </asp:Title>
    </Titles>
    <ChartAreas>
        <asp:ChartArea Name="MainArea">
            <AxisX Title="" LineWidth="0" IsLabelAutoFit="false" Enabled="True">
                <MajorGrid Enabled="false" />
                <MinorGrid Enabled="false" />
                <MajorTickMark Enabled="false" />
                <%-- Set angle of labels (vertical labels) --%>
                <LabelStyle Angle="-90" Enabled="true" />
            </AxisX>
            <AxisY TitleFont="8pt Arial Bold" IsStartedFromZero="true" Minimum="0" Maximum="100"
                Interval="10">
            </AxisY>
        </asp:ChartArea>
    </ChartAreas>
</chart:CaisisChart>
