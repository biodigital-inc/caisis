<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PatientChart.aspx.cs" Inherits="Core_Utilities_PatientChart" %>

<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Core.Utilities" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Caisis Lab Chart</title>
    <style type="text/css">
        body
        {
            margin: 0px 0px 0px 0px;
            padding: 10px 10px 10px 10px;
        }
        #chartTitle
        {
            font-family: Arial, Helvetica, sans-serif;
            color: #8d2a2c;
            font-weight: bold;
            font-size: 16px;
            margin-left: 20px;
            margin-bottom: 0px;
        }
        #chartLegend
        {
            border: solid 1px #DDEAF0;
            background-color: #F5F9FB;
            font-family: Arial, Helvetica, sans-serif;
            color: #111111;
            font-size: 12px;
            margin-top: 34px;
            padding: 8px 15px 5px 8px;
        }
        #noLabsMsg
        {
            width: 800px;
            border: solid 1px #DDEAF0;
            background-color: #F5F9FB;
            font-family: Arial, Helvetica, sans-serif;
            color: #8d2a2c;
            font-size: 14px;
            padding: 50px 0px 50px 0px;
            margin-top: 10px;
            text-align: center;
        }
        #closeButton
        {
            cursor: pointer;
            margin: 15px auto 0px auto;
        }
        #PrintButton
        {
            float: right;
            vertical-align: text-bottom;
            margin-right: 44px;
            cursor: pointer;
        }
        .LabFilters td
        {
            white-space: nowrap;
        }
        .chartErrors
        {
            border: solid 1px #D90000;
            background-color: #FFE8E8;
            font-family: Arial, Helvetica, sans-serif;
            color: #000000;
            font-size: 12px;
            margin-top: 20px;
            padding: 8px 15px 5px 8px;
        }
        a.button
        {
            border: solid 1px #cccccc;
            padding: 2px 6px;
            color: #333333;
            font-size: 10px;
            background-color: #ffffff;
            text-decoration: none;
        }
        a.button:hover
        {
            border: solid 1px #8d2a2c;
            color: #8d2a2c;
        }
        
        #dateRangeContainer
        {
            border: solid 1px #DDEAF0;
            background-color: #F5F9FB;
            font-family: Arial, Helvetica, sans-serif;
            color: #111111;
            font-size: 12px;
            margin-top: 14px;
            padding: 8px 15px 5px 8px;

        }
    </style>
    <style media="print" type="text/css">
        #PrintButton
        {
            display: none;
        }
        #chartLegend
        {
            display: none;
        }
    </style>

    <script type="text/javascript">
        function closeChart() {
            window.close();
            return false;
        }
        function printChart() {
            window.focus();
            window.print();
            return false;
        }
        
        function checkMaxSelected()
        {
            var checkboxes = document.getElementById('<% = chartLegend.ClientID %>').getElementsByTagName('input');
            var maxAllowed = 10;
            
            if (checkboxes.length > 0)
            {
                    var numChecked = 0;
                    for (var i = 0; i < checkboxes.length; i++)
                    {
                        if (checkboxes[i].checked) numChecked += 1;
                    }
                    if (numChecked > maxAllowed)
                    {
                        alert('Currently this graph is limited to show only ' + maxAllowed.toString() + ' types of labs.');
                        return false;
                    }
            }
            
        }
    </script>

<script src="../../ClientScripts/utilities.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <table cellspacing="0">
        <tr>
            <td style="width: 810px;">
                
                <asp:Panel ID="HeaderInfo" runat="server"> 
                    <img id="PrintButton" runat="server" src="Print.png" onclick="printChart();" />
                    <span id="chartTitle">Lab Values for
                        <asp:Literal ID="PatientName" runat="server" /></span>
                    <div id="noLabsMsg" runat="server" visible="false">
                        No lab values have been recorded for this patient.<br />
                        <img id="closeButton" src="../../Images/Close.gif" onclick="closeChart();" /></div>
                </asp:Panel>
                <chart:LabChartControl runat="server" ID="MainChart" Height="450px" Width="800px" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" ImageType="Png">
                </chart:LabChartControl>
            </td>
            <td style="vertical-align: top; text-align:left;">
                <div id="chartLegend" runat="server" style="overflow:auto; overflow-x: hidden;">
                    <strong style="font-size: 12px;">Show Lab:</strong>
                    <asp:DropDownList  ID="LabCheckList" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SetLabOnCheckChange" />
                    
                    <strong style="font-size: 12px; margin-top: 12px;display: block;" title="Scale for second plot is shown on right side of the graph.">Add/Compare:</strong>
                    <asp:DropDownList  ID="LabCheckList2" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SetLabOnCheckChange" Visible="false" />
   <%--                  <asp:CheckBoxList ID="LabCheckList" runat="server" CssClass="LabFilters" AutoPostBack="true" RepeatLayout="Table"
                        OnSelectedIndexChanged="SetLabOnCheckChange"  onclick="checkMaxSelected();">
                    </asp:CheckBoxList>--%>
                </div>
                
                <div id="dateRangeContainer" style="overflow: visible; position: relative; " title="Leave Start and/or End date fields blank to set automatically">

<div style="position: absolute; right: 250px; overflow: visible;"><script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script></div>
                    <span style="display: block; font-weight: bold;">Date Range <span style="font-size: smaller; font-weight: normal; font-style: italic;">(Optional)</span></span>
                    
                    <span style="margin-top: 9px; display: block;">Start</span>
                    <cic:CaisisTextBox runat="server" ID="DateRange_Start" ShowCalendar="true" ShowLabel="false" Width="65px" />
                    <span style="margin-top: 9px; display: block;">End</span>
                    <cic:CaisisTextBox runat="server" ID="DateRange_End" ShowCalendar="true" ShowLabel="false" Width="65px" />
                    <asp:LinkButton runat="server" ID="SetRangeBtn" OnClick="SetDateRange" Text="Set Range" CssClass="button" />
                    
                    
                    
                    <asp:Literal ID="teststart" runat="server" /><br />
                    <asp:Literal ID="testend" runat="server" />
                    
                    
                </div>
                <div id="chartErrors" runat="server" class="chartErrors" visible="false" title="Labs without dates and labs with non-numerical results cannot be graphed." />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
