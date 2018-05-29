<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SurveyPrintablePage.aspx.cs"
    Inherits="Caisis.UI.Plugins.SurveyPlugin.SurveyPrintablePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
    <title>Survey Print Page</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="SurveyStyles.css" />
    <style type="text/css">
        td
        {
            vertical-align: top;
            text-align: left;
        }
        .SurveyLabel
        {
            background-color: #ffffff;
            font-weight: bold;
            width: auto;
        }
        .SurveyLabelText
        {
            background-color: #ffffff;
            width: auto;
            display: block;
            white-space: no-wrap;
        }
        .HeaderScoreCell
        {
            font-weight: bold;
            background-color: #ffffff;
            text-align: center;
        }
        .TableLeftCell
        {
            font-weight: bold;
            background-color: #ffffff;
            text-align: left;
        }
        .TableScoreCell
        {
            background-color: #ffffff;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: 15px auto 15px auto; width: 80%;">
        <asp:Panel runat="server" ID="ViewBtnContainer" Visible="false">
            <asp:HyperLink runat="server" CssClass="ViewTabBtn" ID="EditBtn" Text="Edit" Visible="false"></asp:HyperLink>
        </asp:Panel>
        <h2 runat="server" id="SurveyTypeLabel" class="SectionTitle">
            Survey</h2>
        <asp:Panel runat="server" ID="SurveyPanel">
            <table cellspacing="1" cellpadding="4" style="width: 500px;">
                <tr>
                    <td class="SurveyLabel">
                        Date
                    </td>
                    <td class="SurveyLabel">
                        <asp:Label CssClass="SurveyLabelText" runat="server" ID="SurveyDate"></asp:Label>&nbsp;
                    </td>
                    <td class="SurveyLabel">
                        Result
                    </td>
                    <td class="SurveyLabel">
                        <asp:Label CssClass="SurveyLabelText" runat="server" ID="SurveyResult"></asp:Label>&nbsp;
                    </td>
                    <td class="SurveyLabel">
                        Total
                    </td>
                    <td class="SurveyLabel">
                        <asp:Label CssClass="SurveyLabelText" runat="server" ID="SurveyTotal"></asp:Label>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="SurveyLabel">
                        Version
                    </td>
                    <td class="SurveyLabel">
                        <asp:Label CssClass="SurveyLabelText" runat="server" ID="SurveyVersion"></asp:Label>&nbsp;
                    </td>
                    <td class="SurveyLabel">
                        Data Source
                    </td>
                    <td class="SurveyLabel">
                        <asp:Label CssClass="SurveyLabelText" runat="server" ID="SurveyDataSource"></asp:Label>&nbsp;
                    </td>
                    <td class="SurveyLabel">
                        Data Quality
                    </td>
                    <td class="SurveyLabel">
                        <asp:Label CssClass="SurveyLabelText" runat="server" ID="SurveyQuality"></asp:Label>&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="SurveyLabel" colspan="1">
                        Notes
                    </td>
                    <td colspan="5" class="SurveyLabel">
                        <asp:Label CssClass="SurveyLabelText" runat="server" ID="SurveyNotes"></asp:Label>&nbsp;
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <!-- HANDLE SCORING IF SURVEY HAS SCORING LOGIC -->
        <asp:Panel runat="server" ID="ScoresPanel" Visible="false">
            <h3 class="SectionTitle">
                Scores</h3>
            <table cellspacing="1" cellpadding="5">
                <tr>
                    <td class="HeaderScoreCell">
                        Section
                    </td>
                    <td class="HeaderScoreCell">
                        Total<br />
                        Questions
                    </td>
                    <td class="HeaderScoreCell">
                        Number<br />
                        Answered
                    </td>
                    <!--<td class="HeaderScoreCell">Sum of <br />Answered</td>-->
                    <td class="HeaderScoreCell">
                        Average of
                        <br />
                        Answered
                    </td>
                    <td class="HeaderScoreCell">
                        Average of
                        <br />
                        Standardized
                    </td>
                    <td class="HeaderScoreCell">
                        Questions<br />
                        Evaluated
                    </td>
                </tr>
                <asp:Repeater runat="server" ID="SurveyScoresRptr">
                    <ItemTemplate>
                        <tr>
                            <td class="TableLeftCell">
                                <%# Eval("Section")%>
                            </td>
                            <td class="TableScoreCell">
                                <%# Eval("TotalQuestions")%>
                            </td>
                            <td class="TableScoreCell">
                                <%# Eval("TotalQuestionsAnswered")%>
                            </td>
                            <td class="TableScoreCell">
                                <%# Eval("Average")%>
                            </td>
                            <td class="TableScoreCell">
                                <%# Eval("AverageStandardized")%>
                            </td>
                            <td class="TableScoreCell">
                                <%# Eval("QuestionsEvaluated")%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </asp:Panel>
        <h3 class="SectionTitle">
            Questions &amp; Responses</h3>
        <div style=" font-size: 12px; font-weight: bold;">
            <a class="<%= ComplexView.Visible ? "ViewTabBtn" : "ViewTabBtnDisabled" %>" href="SurveyPrintablePage.aspx?<%= GetToggleViewQueryString("simple") %>">Simple View</a>
            <a class="<%= ComplexView.Visible ? "ViewTabBtnDisabled" : "ViewTabBtn" %>" href="SurveyPrintablePage.aspx?<%= GetToggleViewQueryString("advanced") %>">Advanced View</a>
        </div>
        <%-- Advanced Layout --%>
        <asp:Panel runat="server" ID="ComplexView" Visible="false">
            <asp:Repeater runat="server" ID="PagesRptr" OnItemDataBound="BuildPageSections" OnPreRender="SetContentVisibility">
                <HeaderTemplate>
                    <ol class="SurveyPages">
                </HeaderTemplate>
                <ItemTemplate>
                    <li class="SurveyPage">
                        <h2 class="PageTitle">
                            <%#  Eval("Page") %>
                        </h2>
                        <asp:Repeater runat="server" ID="SectionsRptr" OnItemDataBound="BuildPageSectionQuestions">
                            <HeaderTemplate>
                                <ol class="SurveySections">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="SurveySection">
                                    <h3 class="SurveySectionTitle">
                                        <%# Eval("Section") %>
                                    </h3>
                                    <asp:Repeater runat="server" ID="QuestionsRptr">
                                        <HeaderTemplate>
                                            <ol class="SurveyQuestion">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <li class="SurveyQuestion"><span class="QuestionNumber">
                                                <%# Eval("SurveyItemNum")%>.</span> <span class="QuestionText">
                                                    <%# Eval("SurveyItem") %>
                                                </span><span class="SurveyResponseText">
                                                    <%# Eval("SurveyItemResult") %>
                                                </span></li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ol>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ol>
                            </FooterTemplate>
                        </asp:Repeater>
                        <%-- Current Page Numbering --%>
                        <asp:Label runat="server" ID="PageNumberNav" CssClass="PageNumberNav"></asp:Label>
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ol>
                </FooterTemplate>
            </asp:Repeater>
        </asp:Panel>
        <%-- Simple Layout --%>
        <asp:Panel runat="server" ID="SimpleView">
            <ol class="SurveyPages">
                <li class="SurveyPage">
                    <ol id="SurveyQuestions" class="SurveyQuestions">
                        <asp:Repeater runat="server" ID="SurveyItemsRptr">
                            <ItemTemplate>
                                <li class="SurveyQuestion"><span class="QuestionNumber">
                                    <%# Eval("SurveyItemNum")%>.</span> <span class="QuestionText">
                                        <%# Eval("SurveyItem") %>
                                    </span><span class="SurveyResponseText">
                                        <%# Eval("SurveyItemResult") %>
                                    </span></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ol>
                </li>
            </ol>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
