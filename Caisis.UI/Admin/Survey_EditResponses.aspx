<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Survey_EditResponses.aspx.cs"
    Inherits="Caisis.UI.Admin.Survey_EditResponses" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Admin: Edit Responses</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>
    <script type="text/javascript">

        Browser.ResizeElement({ customResizer: resizeContainers });
        function resizeContainers() {
            var height = getHeight(window);
            var overflow = document.getElementById("GridOverflow");
            overflow.style.maxHeight = (height - 185) + "px";
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <!-- Read Only View -->
    <div id="ReadOnlyPanel">
        <asp:Repeater runat="server" ID="ReadOnlyRptr" OnItemDataBound="SetInputControls">
            <ItemTemplate>
                <li id="Question_<%# Eval("MetadataSurveyQuestionId") %>" class="SurveyQuestion">
                    <button class="editBtn dataEntryButtonRed" onclick="return editSurveyQuestion('<%# Eval("MetadataSurveyId") %>', '<%# Eval("MetadataSurveyQuestionId") %>');"
                        title="Edit">
                        Edit</button>
                    <span class="QuestionNumber">
                        <%# Eval("QuestionNumber")%></span>
                    <asp:Label runat="server" ID="QuestionText" CssClass="QuestionText"><%# Eval("Question")%></asp:Label>
                    <div>
                        <asp:PlaceHolder runat="server" ID="QuestionResponseControl"></asp:PlaceHolder>
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="DataEntryPanel">
        <asp:HiddenField runat="server" ID="QuestionId" />
        <table>
            <tr>
                <td>
                    <label for="PageField">
                        Page
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox ID="PageField" CssClass="PageNumber" runat="server" ShowLabel="false"
                        Table="MetadataSurveyQuestions" Field="Page" Width="25px"></cic:CaisisTextBox>
                </td>
                <td>
                    <label for="Section">
                        Section</label>
                </td>
                <td>
                    <cic:CaisisTextBox ID="Section" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                        Field="Section" Width="150"></cic:CaisisTextBox>
                </td>
                <td>
                    <label for="QuestionNumber">
                        Question #
                    </label>
                </td>
                <td>
                    <cic:CaisisTextBox ID="QuestionNumber" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                        Field="QuestionNumber" Width="25px"></cic:CaisisTextBox>
                </td>
                <td>
                    <label for="SortNumber">
                        Sort #</label>
                </td>
                <td>
                    <cic:CaisisTextBox ID="SortNumber" CssClass="SortNumber" runat="server" ShowLabel="false"
                        Table="MetadataSurveyQuestions" Field="SortNumber" Width="25"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="Question">
                        Question
                    </label>
                </td>
                <td colspan="7">
                    <cic:CaisisTextBox ID="Question" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                        Field="Question" Width="100%"></cic:CaisisTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="ControlType">
                        Control Type</label>
                </td>
                <td>
                    <cic:CaisisSelect ID="ControlType" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                        Field="ResponseControlType">
                        <asp:ListItem Text="CaisisTextBox" Value="CaisisTextBox">
                        </asp:ListItem>
                        <asp:ListItem Text="CaisisTextArea" Value="CaisisTextArea">
                        </asp:ListItem>
                        <asp:ListItem Text="CaisisSelect" Value="CaisisSelect">
                        </asp:ListItem>
                        <asp:ListItem Text="CaisisCheckBox" Value="CaisisCheckBox">
                        </asp:ListItem>
                        <asp:ListItem Text="CaisisCheckBoxList" Value="CaisisCheckBoxList">
                        </asp:ListItem>
                        <asp:ListItem Text="CaisisRadioButtonList" Value="CaisisRadioButtonList">
                        </asp:ListItem>
                    </cic:CaisisSelect>
                </td>
                <td>
                    <label for="ResponseLayout">
                        Layout Type</label>
                </td>
                <td>
                    <cic:CaisisSelect ID="ResponseLayout" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                        Field="ResponseLayout">
                        <asp:ListItem Text="Vertical" Value="Vertical">
                        </asp:ListItem>
                        <asp:ListItem Text="Horizontal" Value="Horizontal">
                        </asp:ListItem>
                    </cic:CaisisSelect>
                </td>
                <td>
                    <label for="ResponseRequired">
                        Required</label>
                </td>
                <td>
                    <cic:CaisisSelect ID="ResponseRequired" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                        Field="ResponseRequired">
                        <asp:ListItem Text="False" Value="False"></asp:ListItem>
                        <asp:ListItem Text="True" Value="True"></asp:ListItem>
                    </cic:CaisisSelect>
                </td>
            </tr>
        </table>
    </div>
    <h3>
        Responses</h3>
    <!-- List Of Response for Question -->
    <div id="GridOverflow" style="max-height: 95%; overflow: auto; display: inline-block; margin: 5px;">
        <cic:ExtendedGridView runat="server" ID="SurveyQuestionResponsesGrid" DataKeyNames="MetadataQuestionResponseId,MetadataSurveyQuestionId"
            TableName="MetadataQuestionResponses" AutoGenerateColumns="false"  CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
            RebindOnDelete="true" ShowHeader="true" GridLines="None" BlankRows="10" VisibleBlankRows="5"
            OnRowDataBound="SetResponseCopyEvent">
            <Columns>
                <cic:ExtendedTemplateField ItemStyle-VerticalAlign="Top" ItemStyle-Width="25px">
                    <ItemTemplate>
                        <%# Container.DataItemIndex + 1 %>
                        .
                    </ItemTemplate>
                </cic:ExtendedTemplateField>
                <cic:ExtendedTemplateField HeaderText="Response Text" ItemStyle-VerticalAlign="Top"
                    ItemStyle-Width="275px">
                    <ItemTemplate>
                        <cic:CaisisTextBox ID="ResponseTextField" runat="server" Table="MetadataQuestionResponses"
                            Field="ResponseText" ShowLabel="false" Width="250px"></cic:CaisisTextBox>
                    </ItemTemplate>
                </cic:ExtendedTemplateField>
                <cic:ExtendedTemplateField HeaderText="Response Value" ItemStyle-VerticalAlign="Top">
                    <ItemTemplate>
                        <cic:CaisisTextBox ID="ResponseValueField" runat="server" Table="MetadataQuestionResponses"
                            Field="ResponseValue" ShowLabel="false" Width="85px"></cic:CaisisTextBox>
                    </ItemTemplate>
                </cic:ExtendedTemplateField>
                <cic:GridRowDeleteImage ShowHeader="false">
                </cic:GridRowDeleteImage>
            </Columns>
        </cic:ExtendedGridView>
    </div>
    <div style="text-align: center;">
        <asp:Button runat="server" ID="SaveBtn" OnClick="SaveClick" Text="Save" CssClass="dataEntryButtonRed" />
        <asp:Button runat="server" ID="CancelBtn" OnClick="CancelClick" Text="Cancel" CssClass="dataEntryButtonGray" />
        <asp:Button runat="server" ID="DeleteBtn" OnClick="DeleteClick" Text="Delete" CssClass="dataEntryButtonGray" OnClientClick="return confirmDelete('Are you sure you want to delete this question?');" />
    </div>
    </form>
</body>
</html>
