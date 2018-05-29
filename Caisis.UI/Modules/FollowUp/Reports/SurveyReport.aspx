<%@ Page Language="C#" EnableViewState="true" AutoEventWireup="true" CodeFile="SurveyReport.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.SurveyReport" %> 

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Surveys Sent Report</title>
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script type="text/javascript">
    var seconds = 0;
    function redirectParent(parentUrl)
    {
        parent.location.href = parentUrl;
    }
    
    function verifyFields()
    {
        var ptype = $("ProcedureType");
        if(ptype.value == "" || ptype.value == " ")
        { 
            alert('Please enter a procedure type first.');
            return false;
        }
        else { return true; }
    }
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
        a  { color: #00668d; }   /* patient name link */
        a:visited { color: #00668d; }
        a:active { color:  #00668d; }
        
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
        .LabelName { width:20px; padding-right:5px; }
        .NoLabel { width:0px; height:0px; display:none; } 
        .NarrowTextBox { width:75px; }
    </style>
</head>
<body class="reportContentBody">

    <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <form id="form1" runat="server">
  
        <span id="LoadingLayer" style="display: none;"><span id="LoadingTextLayer"></span></span>
        <table style="table-layout: fixed; width: 99%; margin: auto;" border="0">
            <tr>
                <td style="width: 125px; text-align: left;">
                    &nbsp;&nbsp;<span class="LabelName">Form:</span>
                    <cic:CaisisSelect ID="ddlFormType" runat="server" LabelClass="NoLabel" AutoPostBack="False"
                        Width="70">
                    </cic:CaisisSelect>
                </td>
                <td style="width: 225px;">
                    <span class="LabelName">Procedure:</span>
                     <cic:CaisisSelect ID="ProcedureType" CssClass="NarrowTexBox" runat="server" LabelClass="NoLabel" AutoPostBack="False" ShowLabel="false" Width="150" LookupCode="ProcName,ModuleDefault,FollowUp"></cic:CaisisSelect>
                                   
                 </td>
                <td style="width: 350px;">
                    <span class="LabelName">Date Sent From:</span>
                    <cic:CaisisTextBox runat="server" ID="StartDateField" onblur="setTodayOnBlur(this);"
                        ShowLabel="false" ShowCalendar="true" LabelClass="NoLabel" CssClass="NarrowTextBox"></cic:CaisisTextBox>
                    &nbsp;&nbsp;&nbsp; <span class="LabelName">To:</span>
                    <cic:CaisisTextBox runat="server" ID="EndDateField" onblur="setTodayOnBlur(this);"
                        ShowLabel="false" ShowCalendar="true" LabelClass="NoLabel" CssClass="NarrowTextBox"></cic:CaisisTextBox>
                </td>
                <td style="width: 100px;">
                    <asp:ImageButton runat="server" ID="RunReportBtn" ImageUrl="~/Images/Search_small.gif"
                        OnClick="RunReportClick" OnClientClick="verifyFields(); showLoading();" />
                    <excel:ExcelExportImageButton ID="ExcelBtn" runat="server" OnClick="ExportToExcelClick" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Label runat="server" ID="UserText"></asp:Label>
        <asp:GridView runat="server" CellPadding="3" ID="ReportGrid" CssClass="dataGrid"
            HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA" RowStyle-Wrap="false"
            AlternatingRowStyle-Wrap="false" AlternatingRowStyle-CssClass="dataGridItemRowB"
            OnSorting="HandleSorting" AutoGenerateColumns="false" AllowSorting="true" HeaderStyle-ForeColor="white">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="PatientId" Target="_parent" DataNavigateUrlFormatString="../ViewPatientSurveySummary.aspx?ptId={0}"
                    DataTextField="Patient" HeaderText="Patient" SortExpression="Patient"
                    ItemStyle-Width="200"/>
                <asp:BoundField DataField="Survey" HeaderText="Survey" SortExpression="Survey"
                    ItemStyle-Width="200" />
                <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month"
                    ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Treating Physician" HeaderText="Treating Physician" SortExpression="Treating Physician"
                    ItemStyle-Width="200" />
                <asp:BoundField DataField="Sent Date" SortExpression="Sent Date" HeaderText="Sent Date"
                    ItemStyle-Width="50" />
                <asp:BoundField DataField="Received Date" SortExpression="Received Date"
                    HeaderText="Received Date" ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
