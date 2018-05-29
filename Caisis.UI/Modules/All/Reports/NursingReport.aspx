<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NursingReport.aspx.cs" Inherits="Caisis.UI.Modules.All.Reports.NursingReport" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Nursing Report</title>
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
    
    td.ListManDataTableCell
    {
        background-color:#ffffff;
        vertical-align: top;
        border-right: 1px solid #888888 ; border-top: 1px solid #888888 ; border-left: 1px solid #888888 ; border-bottom: 1px solid #888888 ; 
    }   
    </style>
    <style type="text/css" media="print" >
    .parameterEntryTable 
    {
        display: none;
    }
    .SectionTitle
    {
        font-size: 18pt;
        
    }
    .QueryResultDescription
    {
        margin-top: 20px;
        font-size: 14px;
    }
    .ListManDataTableCell
    {
        font-size: 13px;
    }
    </style>
</head>
<body class="reportContentBody">

    <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <form id="form1" runat="server">
        <span id="LoadingLayer" style="display: none;"><span id="LoadingTextLayer"></span></span>
        <span class="SectionTitle">Nursing Report</span>
        <table class="parameterEntryTable" style="table-layout: fixed; width: 95%; margin: auto;">
            <tr>
                <td>
                    Physician
                </td>
                <td>
                    Start Date</td>
                <td>
                    End Date</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList runat="server" ID="PhysiciansSelect" DataTextField="ApptPhysician" Width="90%">
                    </asp:DropDownList></td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="StartDateField" onblur="setTodayOnBlur(this);"
                        ShowLabel="false" ShowCalendar="true"></cic:CaisisTextBox>
                </td>
                <td>
                    <cic:CaisisTextBox runat="server" ID="EndDateField" onblur="setTodayOnBlur(this);"
                        ShowLabel="false" ShowCalendar="true"></cic:CaisisTextBox>
                </td>
                <td>
                    <asp:ImageButton runat="server" ID="RunReportBtn" ImageUrl="~/Images/Search_small.gif"
                        OnClick="RunReportClick" OnClientClick="showLoading();" />
                    <%--<asp:ImageButton ID="ExcelBtn" AlternateText="Save for Microsoft Excel" ImageUrl="~/Images/ExcelIcon.gif"
                        runat="server" OnClick="ExportToExcelClick"></asp:ImageButton>--%>
                </td>
            </tr>
            <tr style="height:5px;"></tr>
        </table>
        <div class="QueryResultDescription"><asp:Label runat="server" ID="UserText"></asp:Label></div>
        <div id="RepeaterDiv" runat="server">
            <table id="RptrTbl" cellspacing="0" cellpadding="0" width="100%" border="1" style="border-right: #cccccc 1px solid; border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid;">
                <asp:Repeater ID="nursingRptr" runat="server" OnItemDataBound="BindData">
                    <HeaderTemplate>
                        <tr style="border-bottom: #cccccc 1px solid; font-weight:bold;">
                            <td class="ListManDataTableTop">Appt Date</td>
                            <td class="ListManDataTableTop">Appt Time</td>
                            <td class="ListManDataTableTop">MRN</td>
                            <td class="ListManDataTableTop">Last Name</td>
                            <td class="ListManDataTableTop">First Name</td>
                            <td class="ListManDataTableTop">Visit Type</td>
                            <td class="ListManDataTableTop" style=" width:300px;">HPI</td>
                            <td class="ListManDataTableTop" style=" width:150px;">Problems & Plans</td>
                            <td class="ListManDataTableTop" style="width:250px;">Comments</td>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="ListManDataTableCell"><%# Eval("Date")%></td> 
                            <td class="ListManDataTableCell" nowrap><%# DataBinder.Eval(Container.DataItem, "ApptTime", "{0:t}") %></td>
                            <td class="ListManDataTableCell"><%# Eval("ApptMRN")%></td>                           
                            <td class="ListManDataTableCell"><%# Eval("ApptLastName")%></td>
                            <td class="ListManDataTableCell"><%# Eval("ApptFirstName")%></td>
                            <td class="ListManDataTableCell"><%# Eval("ApptVisitType")%>&nbsp;</td>
                            <td class="ListManDataTableCell"  style=" width:300px;">
                                <asp:Literal ID="PtHPI" runat="server">&nbsp;</asp:Literal>
                            </td>                        
                            <td class="ListManDataTableCell" style=" width:150px; height:75px;">
                                <asp:Literal id="ProbsPlans" runat="server">&nbsp;</asp:Literal>
                            </td>
                            <td class="ListManDataTableCell" style=" width:250px;">&nbsp;</td>
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <tr>
                            <td class="ListManDataTableCell"><%# Eval("Date") %></td>
                            <td class="ListManDataTableCell" nowrap><%# DataBinder.Eval(Container.DataItem, "ApptTime", "{0:t}") %></td>
                            <td class="ListManDataTableCell"><%# Eval("ApptMRN")%></td>
                            <td class="ListManDataTableCell"><%# Eval("ApptLastName")%></td>
                            <td class="ListManDataTableCell"><%# Eval("ApptFirstName")%></td>
                            <td class="ListManDataTableCell"><%# Eval("ApptVisitType")%>&nbsp;</td>
                            <td class="ListManDataTableCell" style=" width:300px;">
                                <asp:Literal ID="PtHPI" runat="server">&nbsp;</asp:Literal>
                            </td>                        
                            <td class="ListManDataTableCell" style=" width:150px; height:75px;">
                                <asp:Literal id="ProbsPlans" runat="server">&nbsp;</asp:Literal>
                            </td>
                            <td class="ListManDataTableCell" style=" width:250px;">&nbsp;</td>
                        </tr> 
                    </AlternatingItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>