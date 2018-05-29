<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompleteSurveys.aspx.cs"
    Inherits="Caisis.UI.Modules.FollowUp.CompleteSurveys" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script type="text/javascript">
    function setTodayOnBlur(field)
    {
         if(field.value.replace(' ','')=='') { field.value = '<%= DateTime.Today.ToShortDateString() %>'; }
    }

    function viewSurveyResponses(surveyId) {
        var surveyURL = '<%= Page.ResolveUrl("~/Plugins/SurveyPlugin/SurveyPrintablePage.aspx?surveyId=") %>' + surveyId;
        var title = 'View Survey Responses';
        top.showModalWithConfig(surveyURL, title, { width: '80%', height: '80%', context: window });
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
        .NarrowTextBox { width:100px; }
          
    </style>

</head>
<body class="reportContentBody">

    <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <form id="form1" runat="server">
    
         <table style="table-layout: fixed; width: 100%; margin: auto;" border="0">
            <tr>
                <td style="width: 225px; text-align: left; white-space: nowrap;">
                    <span class="LabelName">Survey:</span>
                    <cic:CaisisSelect ID="ddlSurveyType" runat="server" ShowLabel="false" DataTextField="SurveyType" Enabled="true" ></cic:CaisisSelect> 
                </td>
                <td style="width: 350px;">
                    <span class="LabelName">Received From:</span>
                    <cic:CaisisTextBox Width="70" runat="server" ID="StartDateField" onblur="setTodayOnBlur(this);"
                        ShowLabel="false" ShowCalendar="true" LabelClass="NoLabel" CssClass="NarrowTextBox"></cic:CaisisTextBox>
                    &nbsp;&nbsp;&nbsp; <span class="LabelName">To:</span>
                    <cic:CaisisTextBox Width="70" runat="server" ID="EndDateField" onblur="setTodayOnBlur(this);"
                        ShowLabel="false" ShowCalendar="true" LabelClass="NoLabel" CssClass="NarrowTextBox"></cic:CaisisTextBox>
                </td>
                <td style="width: 120px;">
                    <asp:ImageButton runat="server" ID="RunReportBtn" ImageUrl="~/Images/Search_small.gif"
                        OnClick="RunReportClick" />
                    <excel:ExcelExportImageButton ID="ExcelBtn" runat="server" OnClick="ExportToExcelClick" />
                </td>
            </tr>
            <tr>
                <td><asp:RequiredFieldValidator ID="SurveyTypeRequired" runat="server" ControlToValidate="ddlSurveyType" Display="Dynamic" ErrorMessage="Please select a survey" /></td>
                <td colspan="2">
                    <img src="../../../Images/shim.gif" width="800" height="1" />&nbsp;</td>
            </tr>
        </table>
        <asp:Label runat="server" ID="UserText"></asp:Label>
        <asp:GridView runat="server" CellPadding="3" ID="ReportGrid" CssClass="dataGrid"
            HeaderStyle-CssClass="dataGridHeader" RowStyle-CssClass="dataGridItemRowA" RowStyle-Wrap="false"
            AlternatingRowStyle-Wrap="false" AlternatingRowStyle-CssClass="dataGridItemRowB"
            HeaderStyle-Wrap="true" AutoGenerateColumns="true">
            <Columns>
                <asp:TemplateField HeaderText="View Survey" ItemStyle-HorizontalAlign="center">
                    <ItemTemplate>
                        <img alt="Edit" title="View Survey" src="../../../Images/Browse.gif" height="20"
                            style="cursor: pointer;" onclick="viewSurveyResponses('<%#Eval("SurveyId") %>')" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
