<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BreastQScoresBySurvey.aspx.cs"
    Inherits="Caisis.UI.Modules.Breast.Reports.BreastQScoresBySurvey" %>

<%@ Register TagPrefix="excel" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="chart" Namespace="Caisis.UI.Core.Utilities" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BreastQ Score By Survey</title>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../../../StyleSheets/DataAnalysis.css" rel="stylesheet" type="text/css" />
    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>
    <script type="text/javascript">

        Browser.ResizeElement({
            nodeId: "MainOverflow",
            customResizer: function (w, h) {
                var overflow = document.getElementById("MainOverflow");
                if (overflow)
                    overflow.style.maxHeight = h - 375 + "px";
            }
        });

        function viewBreastQDefinition(title, url) {
            top.showModalWithConfig(url, title, { width: 900, height: 600 });
            return false;
        }
    </script>
    <style type="text/css">
        .pdFormFieldLabel {
            display: inline-block;
            width: auto;
            float: none;
            font-weight: bold;
        }

        .dataGrid td {
            padding: 3px;
            border: 1px solid #bbbbbb;
        }
    </style>
</head>
<body style="background: transparent;">
    <form id="form1" runat="server">
        <cic:CaisisSelect runat="server" ID="SurveyGroupSelection" ShowLabel="true" AutoPostBack="true" OnSelectedIndexChanged="OnSurveyGroupChange"
            FieldLabel="Type">
        </cic:CaisisSelect>
        <cic:CaisisSelect runat="server" ID="SurveySelection" ShowLabel="true"
            FieldLabel="Survey" Visible="false">
        </cic:CaisisSelect>
        <asp:Button ID="ReportBtn" runat="server" Text="View Report" CssClass="dataEntryButtonGray" OnClick="OnSurveyChange" Visible="false" />
        <asp:Panel runat="server" ID="ResultsPanel" Visible="false">
            <div id="MainOverflow" style="overflow: auto; max-height: 200px; margin: 5px auto;">
                <asp:GridView runat="server" ID="BreastQScores" AutoGenerateColumns="false" EnableViewState="false"
                    GridLines="Vertical" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
                    RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                    HorizontalAlign="Left">
                    <Columns>
                        <asp:BoundField HeaderText="MRN" DataField="MRN" />
                        <asp:TemplateField HeaderText="Survey">
                            <ItemTemplate>
                                <a title="View BreastQ Definition" href="BreastQDefinitions.aspx?surveyType=<%# Server.UrlEncode(GetNormalizedScoringSurvey(Eval("Survey").ToString())) %>" onclick="return viewBreastQDefinition(this.title, this.href);"><%# Eval("Survey") %></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Label runat="server" ID="NoResults" Visible="false" CssClass="boldText"></asp:Label>
            </div>
            <excel:ExcelExportButton runat="server" ID="ExportBtn" CssClass="dataEntryButtonGray"
                Text="Export to Excel" ToolTip="Export to Excel" OnClick="OnExportClick" />
        </asp:Panel>
    </form>
</body>
</html>
