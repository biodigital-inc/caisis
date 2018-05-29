<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProtocolScreeningReport.aspx.cs" Inherits="Caisis.UI.Modules.All.Reports.ProtocolScreeningReport" %>
<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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

    	if (!ptype)
    		return;
    		
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
                <td style="width: 200px; text-align: left;">
                    &nbsp;&nbsp;<span class="LabelName">Physcian:</span><br />
                    <cic:CaisisSelect ID="PhysiciansSelect" DataTextField="ApptPhysician" runat="server" LabelClass="NoLabel" Width="90%"/>
                </td>
                <td style="width: 200px; white-space:nowrap">
                    <span class="LabelName">Clinic Date:</span><br />
                    <cic:CaisisTextBox runat="server" ID="ClinicDateField" onblur="setTodayOnBlur(this);"
                        ShowLabel="false" ShowCalendar="true" LabelClass="NoLabel"></cic:CaisisTextBox>
                  
                </td>
                <td style="width: 300px; vertical-align: bottom">
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
                
                    
                 <asp:BoundField 
                    DataField="ProtocolNum" HeaderText="Protocol" SortExpression="ProtocolNum"
                    ItemStyle-Width="50"/>
                   
                <asp:BoundField 
                    DataField="ApptMRN" HeaderText="MRN" SortExpression="ApptMRN"
                    ItemStyle-Width="50"/>
                    
                 <asp:BoundField DataField="Name_Full" HeaderText="Name" SortExpression="Name_Full"
                    ItemStyle-Width="200" />
                    
                <asp:BoundField DataField="Age" HeaderText="Sent Date"
                    ItemStyle-Width="25" />
                    
                <asp:BoundField DataField="ApptTime" HeaderText="Appt Time"  DataFormatString="{0:d}" SortExpression="ApptTime"
                    ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center" />
           
                <asp:BoundField DataField="ApptVisitType" 
                    HeaderText="Visit Type" ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center" />
                    
                     <asp:BoundField DataField="PtProtocolStatusDate" 
                    HeaderText="Status Date" ItemStyle-Width="50" DataFormatString="{0:d}" ItemStyle-HorizontalAlign="Center" />
                    
                     <asp:BoundField DataField="PtProtocolStatus" 
                    HeaderText="Status" ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center" />
                    
                     <asp:BoundField DataField="PtProtocolStatusReason" 
                    HeaderText="Reason" ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center" />
                    
                     <asp:BoundField DataField="PtProtocolStatusNotes" 
                    HeaderText="Status Notes" ItemStyle-Width="100" ItemStyle-HorizontalAlign="Center" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
