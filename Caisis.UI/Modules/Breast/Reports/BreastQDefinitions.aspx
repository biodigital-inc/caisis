<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BreastQDefinitions.aspx.cs"
    Inherits="Caisis.UI.Modules.Breast.Reports.BreastQDefinitions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BreastQ Definition</title>
    <link href="../../../StyleSheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../../../StyleSheets/DataAnalysis.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <table class="dataGrid">
            <thead class="dataGridHeader">
                <tr>
                    <th>Survey</th>
                    <th>Scale</th>
                    <th>Title</th>
                    <th>Alias</th>
                    <th>Questions</th>
                    <th>Manual</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="SurveysRptr" runat="server" OnItemDataBound="OnBuildDefinitions">
                    <ItemTemplate>
                        <asp:Repeater runat="server" ID="DefinitionsRptr">
                            <ItemTemplate>
                                <tr class="<%# Container.ItemIndex%2==0?"dataGridItemRowA":"dataGridItemRowB" %>">
                                    <td class="boldText"><%# Container.ItemIndex == 0 ? Eval("Survey") : "" %></td>
                                    <td><%# Eval("ScaleName") %></td>
                                    <td><%# Eval("ScaleTitle") %></td>
                                    <td><%# Eval("ScaleAlias") %></td>
                                    <td><%# Eval("ScaleQuestions") %></td>
                                    <td><%# Eval("ManualScoring") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </form>
</body>
</html>
