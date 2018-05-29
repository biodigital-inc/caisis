<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RepairSexualMedicineAssessmentSurveyResults.aspx.cs"
    Inherits="Caisis.UI.Modules.Gynecology.Reports.RepairSexualMedicineAssessmentSurveyResults" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin: Repair Surveys</title>
    <link href="../../../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script type="text/javascript">
        Browser.ResizeElement({ nodeId: "MainOverflow", heightOffset: 250 });
    
    </script>
    <style type="text/css">
        #MainOverflow
        {
            height: 300px;
            border: 1px solid #dddddd;
            background-color: #eeeeee;
            overflow: auto;
            margin: 5px auto;
        }
        #FixBtn
        {
            font-weight: bold;
            width: 150px;
        }
        .FormFields
        {
            display: inline-block;
        }
        label
        {
            display: inline-block;
            width: 45px;
        }
        .AuditCellMismatch
        {
            background-color: #4C0000;
            color: #ffffff;
            font-weight: bold;
        }
        .AuditCellText
        {
            white-space: pre-wrap;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <h2>
        Sexual Medicine Clinical Assessment</h2>
    <h3>
        Date Range</h3>
    <div class="FormFields">
        <asp:Label runat="server" AssociatedControlID="FromDate">From:</asp:Label>
        <cic:CaisisTextBox runat="server" ID="FromDate" ShowLabel="false" Width="75px"></cic:CaisisTextBox>
    </div>
    <div class="FormFields">
        <asp:Label runat="server" AssociatedControlID="ToDate">To:</asp:Label>
        <cic:CaisisTextBox runat="server" ID="ToDate" ShowLabel="false" Width="75px"></cic:CaisisTextBox>
    </div>
    <asp:Button runat="server" ID="UpdateBtn" Text="Get Survey Listing" OnClick="RunReport"
        CssClass="dataEntryButtonGray" />
    <h3>
        Results</h3>
    <div>
        <span class="boldText">
            Total Records: </span>
        <asp:Label runat="server" ID="TotalCount"></asp:Label></div>
    <div>
        <span class="boldText">
            Total Notes Mismatch: </span>
        <asp:Label runat="server" ID="DifferentCount"></asp:Label></div>
    <div id="MainOverflow">
        <asp:GridView runat="server" ID="SurveyGrid" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
            RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
            AutoGenerateColumns="false" OnRowDataBound="SetColumnValues" Width="100%">
            <Columns>
                <asp:BoundField DataField="MRN" HeaderText="MRN" />
                <asp:BoundField DataField="SurveyDate" DataFormatString="{0:d}" HeaderText="Survey Date"
                    ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="FSFI Score" HeaderText="FSFI Score" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="SSS Score" HeaderText="SSS Score" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Total VAS Score" HeaderText="Total VAS Score" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="Composite VAS Score" HeaderText="Composite VAS Score"
                    ItemStyle-HorizontalAlign="Center" />
                <asp:TemplateField HeaderText="CURRENT Notes">
                    <ItemTemplate>
                        <cic:CaisisHidden runat="server" ID="SurveyId" />
                        <!-- Individual Scores -->
                        <cic:CaisisHidden runat="server" ID="FSFIScore" />
                        <cic:CaisisHidden runat="server" ID="SSSScore" />
                        <cic:CaisisHidden runat="server" ID="TotalVASScore" />
                        <cic:CaisisHidden runat="server" ID="CompositeVASScore" />
                        <div runat="server" id="ActualValueText" class="AuditCellText">
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CALCULATED Notes">
                    <ItemTemplate>
                        <div runat="server" id="TargetValueText" class="AuditCellText">
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MISMATCH" ItemStyle-HorizontalAlign="Center"></asp:TemplateField>
                <asp:TemplateField HeaderText="Fix Selected" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%--  <asp:Button runat="server" ID="FixBtn" Text="Fix Selected" CssClass="dataEntryButtonGray"
                        OnCommand="FixSelected" CommandArgument='<%# Eval("SurveyId") %>' />--%>
                        <asp:CheckBox runat="server" ID="DoUpdate" Checked="false" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:Button runat="server" ID="FixBtn" Text="Fix Selected" OnClick="FixSelected"
        CssClass="dataEntryButtonGray" Style="float: right;" />
    </form>
</body>
</html>
