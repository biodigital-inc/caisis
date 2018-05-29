<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UrologySurgeonComparison.aspx.cs"
    Inherits="Caisis.UI.Modules.All.Reports.UrologySurgeonComparison" %>
<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Urology Surgeon Comparison</title>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../../../ClientScripts/utilities.js"></script>

    <script type="text/javascript">
    var imgDir = '<%= Page.ResolveUrl("~/Images/Calendar/") %>';
    var seconds = 0;
    function showLoading()
    {
        var loadingLayer = $('LoadingLayer');
        loadingLayer.show('');
        loadingLayer.center();
        showLoadingBar();
        setInterval(showLoadingBar,1000);
    }
    
    function showLoadingBar()
    {
        var loadingLayerText = $('LoadingTextLayer');
        var loadingText = 'Loading ... ' + seconds + ' Seconds';
        loadingLayerText.innerHTML = loadingText; 
        seconds++;
    }
    
    function setTodayOnBlur(field)
    {
         if(field.value.replace(' ','')=='') { field.value = '<%= DateTime.Today.ToShortDateString() %>'; }
    }
    </script>

    <style type="text/css">
    a  { color: #ffffff; }
    a:visited { color: #ffffff; }
    a:active { color: #ffffff; }
    
    #LoadingLayer
    {
        text-align: center; 
        width: 250px; 
        height: auto;
        margin: auto;
        background-color: #004256;
        color: #ffffff;
        border: 2px solid #cccccc;
        font-size: 14px; 
        font-weight: bold;
        position: absolute;
        padding: 5px;
    }
    #ReportCount
    {
        display: block;
        font-weight: bold;
        font-size: 14px;
    }
    #UserText
    {
        display: block;
        text-align: left;
        font-weight: bold;
    }
    </style>
</head>
<body class="reportContentBody">

    <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <form id="form1" runat="server">
        <span id="LoadingLayer" style="display: none;"><span id="LoadingTextLayer"></span></span>
        <span class="SectionTitle">Urology Surgical Comparison</span>
        <table style="table-layout: fixed; width: 100%; margin: auto;">
            <tr>
                <td>
                    Physician
                </td>
                <td>
                    Start Date</td>
                <td>
                    End Date</td>
                <td>
                    Procedure Type</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList runat="server" ID="PhysiciansSelect" DataTextField="ProcSurgeon"
                        DataValueField="ProcSurgeon" Width="90%">
                    </asp:DropDownList></td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="StartDateField" onblur="setTodayOnBlur(this);"
                        ShowLabel="false" ShowCalendar="true"></cic:CaisisTextBox>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="EndDateField" onblur="setTodayOnBlur(this);"
                        ShowLabel="false" ShowCalendar="true"></cic:CaisisTextBox>
                </td>
                <td><select id="proctype" runat="server" NAME="proctype"></select></td>
                <td>
                    <asp:ImageButton runat="server" ID="RunReportBtn" ImageUrl="~/Images/Search_small.gif"
                        OnClick="RunReportClick" OnClientClick="showLoading();" />
                    <excel:ExcelExportImageButton ID="ExcelBtn" runat="server" OnClick="ExportToExcelClick" />
                </td>
            </tr>
        </table>
        <asp:Label runat="server" ID="UserText"></asp:Label>
        <asp:GridView runat="server" CellPadding="3" ID="ReportGrid" CssClass="dataGrid"
            HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA" RowStyle-Wrap="false"
            AlternatingRowStyle-Wrap="false" AlternatingRowStyle-CssClass="dataGridItemRowA"
            OnSorting="HandleSorting" AutoGenerateColumns="true" AllowSorting="true">
        </asp:GridView>
    </form>
</body>
</html>
