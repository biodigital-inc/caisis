<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Survey_Edit.aspx.cs" Inherits="Caisis.UI.Admin.Survey_Edit" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Admin</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */
        
        Browser.ResizeElement({ nodeId: 'SurveyListOverflow', heightOffset: 350 });

        var src;

        var activeRow;

        function setActiveQuestion(id) {
            src = id;

            // show layer
            $('CannedLayer').show();
            $('CannedLayer').center();
        }
        function setQuestionFromCanned(val) {
            var srcControl = $(src);
            srcControl.value = val;

            // Blink when setting value
            srcControl.style.backgroundColor = '#fff0e2';
            var returnColor = function() { srcControl.style.backgroundColor = ''; }
            setTimeout(returnColor, 500);

            closeCannedQuestions();
        }

        function closeCannedQuestions() {
            $('CannedLayer').hide();
        }

        function upClick(row) {
            var a = row.previousSibling;
            var b = row;
            swapRowPosition(a, b);
            determineRowColor(b, a);
        }

        function downClick(row) {
            var a = row;
            var b = row.nextSibling;
            swapRowPosition(a, b);
            determineRowColor(a, b);
        }

        function determineRowColor(movedRow, adjustedRow) {
            if (activeRow) { activeRow.className = getRowClassName(movedRow); }

            activeRow = movedRow;
            activeRow.className = 'MovedRow';

            adjustedRow.className = getRowClassName(adjustedRow);
        }

        function getRowClassName(row) { return row.rowIndex % 2 == 0 ? 'dataGridItemRowB' : 'dataGridItemRowA'; }




        function swapRowPosition(row1, row2) {
            row2.parentNode.removeChild(row2);
            row1.parentNode.insertBefore(row2, row1);

            var row1Field = $(row1).tag('*.SortNumber')[0];
            var row2Field = $(row2).tag('*.SortNumber')[0];

            swapRowFieldValues(row1Field, row2Field);
        }

        function swapRowFieldValues(field1, field2) {
            var field1Value = field1.value;
            var field2Value = field2.value;
            field1.value = field2Value;
            field2.value = field1Value;
        }

        window.addEvent('load', function() {
            if ($('SurveyQuestionsGrid') == null) { return; }
            var fp = function(row) {
                if (row.className == 'dataGridHeader') { return; }

                var prevRow = row.previousSibling;
                var nextRow = row.nextSibling;

                var upBtn = row.tag('*.NumPositionLink')[0];
                var downBtn = row.tag('*.NumPositionLink')[1];
                
                upBtn.className += ' fieldSortWidget fieldSortWidgetUp';
                downBtn.className += ' fieldSortWidget fieldSortWidgetDown';
                

                if (prevRow != null && prevRow.className != 'dataGridHeader') {
                    upBtn.addEvent('click', curry(upClick, row));
                }
                if (nextRow != null) {
                    downBtn.addEvent('click', curry(downClick, row));
                }
            }

            $('SurveyQuestionsGrid').tag('TR.dataGridItemRowA').foreach(fp);
            $('SurveyQuestionsGrid').tag('TR.dataGridItemRowB').foreach(fp);
            $('SurveyQuestionsGrid').tag('TR.dataGridBlankRowVisible').foreach(fp);
        });

        function showCreateSurvey() {
            $('CreateSurveyLayer').show('');
            $('CreateSurveyLayer').center();
            $('SurveyQuestionsGrid').hide('none');
            return false;
        }

        function hideCreateSurvey() {
            $('CreateSurveyLayer').hide('none');
            $('SurveyQuestionsGrid').show('');
            return false;
        }

        function showHideResponseFields(node, id) {
            if ($(id).tag('TR').length == 0) {
                alert('Please save the form before entering Responses.');
            }
            else {
                showHideOptionalFields(node, id, null, null, 'Show Responses', 'Hide Responses');
            }
        }

        function confirmSurveyDelete() {
            var message = 'Are you sure you want to delete this Survey and its corresponding Questions & Responses.';
            return confirm(message);
        }

        function closeAndReloadSurveys() {
            top.reloadDataEntryFrame();
            top.hideModal();
        }

        /* ]]> */
    </script>

    <style type="text/css">
        .ViewTabBtn
        {
            border: 1px solid black;
            background-color: #ffffff;
            color: #000000;
            padding: 3px;
            width: 125px;
            display: block;
            text-align: center;
            font-weight: bold;
            text-decoration: none;
        }
        .SortNumber
        {
            display: none;
        }
        .adminBoxHeaderArea label
        {
            margin-right: 6px;
        }
    </style>
</head>
<body class="AdminBody">
    <form id="form1" runat="server">
    <div id="SurveyContainer">
        <cic:CaisisSelect runat="server" ID="SurveyList" DataTextField="SurveyType" DataValueField="MetadataSurveyId"
            AutoPostBack="true" OnSelectedIndexChanged="BindQuestionsGrid" ShowLabel="false" style="display: none;">
        </cic:CaisisSelect>
        
        <div runat="server" id="CreateSurveyLayer" style="position: absolute; width: 350px;
            height: 250px; display: none; background-color: #ffffff; border: 1px solid #999999;">
            <table style="width: 100%; margin: auto;" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td colspan="2" style="color: #ffffff; background-color: #990000; font-weight: bold;
                        text-align: center; border: 2px solid #000000;">
                        Create a New Survey
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        Survey Name
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="CaisisTextBox1" runat="server" Table="MetadataSurveys" Field="SurveyType"
                            ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        Survey Category
                    </td>
                    <td>
                        <cic:CaisisComboBox ID="CaisisTextBox2" runat="server" LookupCode="SurveyCategory"
                            Table="MetadataSurveys" Field="SurveyCategory" ShowLabel="false"></cic:CaisisComboBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        Send Condition
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="CaisisTextBox3" runat="server" Table="MetadataSurveys" Field="SendCondition"
                            ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px;">
                        Version Number
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="CaisisTextBox4" runat="server" Table="MetadataSurveys" Field="VersionNumber"
                            ShowLabel="false"></cic:CaisisTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <button onclick="return hideCreateSurvey();">
                            Cancel</button>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Create A New Survey" OnClick="CreateNewSurvey" />
                    </td>
                </tr>
            </table>
        </div>
        <asp:Panel runat="server" ID="SurveyFields" Visible="false">
            <div style="position: absolute; top: 5px; right: 5px; display: inline-block;">
                <a href="Survey_Edit.aspx?metadataSurveyId=<%= QueryMetaSurveyId %>" class="dataEntryButtonRed">Edit in Standard Mode</a>
                <a href="Survey_Edit_Dynamic.aspx?metadataSurveyId=<%= QueryMetaSurveyId %>" class="dataEntryButtonGray">Edit in Preview Mode</a>
            </div>
            <span class="adminNavBoxContainerTitle" style="margin-right: 60px;">Survey Info</span>
            <div class="adminBoxHeaderArea" style="margin: 15px auto;">
            <table style="width: 800px;" cellpadding="2" cellspacing="2" border="0">
                <tr>
                    <td>
                        <label for="ExistingSurveyType">
                            Name</label>
                    </td>
                    <td colspan="5">
                        <cic:CaisisTextBox ID="ExistingSurveyType" runat="server" Table="MetadataSurveys"
                            Field="SurveyType" ShowLabel="false" OnValueChanged="MarkSurveyDirty" Width="500"></cic:CaisisTextBox>
                    </td>
                    </tr><tr>
                    <td>
                        <label for="ExistingSurveyCategory">
                            Category</label>
                    </td>
                    <td>
                        <cic:CaisisComboBox ID="ExistingSurveyCategory" runat="server" Table="MetadataSurveys"
                            Field="SurveyCategory" LookupCode="SurveyCategory" ShowLabel="false" OnValueChanged="MarkSurveyDirty"></cic:CaisisComboBox>
                    </td>
                    <td>
                        <label for="ExistingSendCondition">
                            Send Condition</label>
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="ExistingSendCondition" runat="server" Table="MetadataSurveys"
                            Field="SendCondition" ShowLabel="false" OnValueChanged="MarkSurveyDirty"></cic:CaisisTextBox>
                    </td>
                    <td style="width: 100px;">
                        <label for="ExistingVersionNumber">
                            Version Number</label>
                    </td>
                    <td>
                        <cic:CaisisTextBox ID="ExistingVersionNumber" runat="server" Table="MetadataSurveys"
                            Field="VersionNumber" ShowLabel="false" OnValueChanged="MarkSurveyDirty" Width="40"></cic:CaisisTextBox>
                    </td>
                </tr>
            </table>
            </div>
            <span class="adminNavBoxContainerTitle">Questions &amp; Responses</span>
            <div id="SurveyListOverflow" style=" overflow: auto; height: 250px;">
                <cic:ExtendedGridView runat="server" ID="SurveyQuestionsGrid" DataKeyNames="MetadataSurveyQuestionId,MetadataSurveyId"
                    TableName="MetadataSurveyQuestions" AutoBindChildGridByRowPrimaryKey="true" AutoUpdateChildGridViews="true"
                    AutoGenerateColumns="false" Width="100%" CssClass="dataGrid" HeaderStyle-CssClass="dataGridHeader"
                    RowStyle-CssClass="dataGridItemRowA" AlternatingRowStyle-CssClass="dataGridItemRowB"
                    BlankRows="10" VisibleBlankRows="5" VisibleBlankRowCssClass="dataGridBlankRowVisible"
                    BlankRowCssClass="dataGridBlankRowHidden" OnRowDataBound="SetSortNumber" RebindOnDelete="true">
                    <Columns>
                        <cic:ExtendedTemplateField HeaderText="Page" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="PageField" CssClass="PageNumber" runat="server" ShowLabel="false"
                                    Table="MetadataSurveyQuestions" Field="Page" Width="25px"></cic:CaisisTextBox>
                            </ItemTemplate>
                        </cic:ExtendedTemplateField>
                        <cic:ExtendedTemplateField HeaderText="Q #" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="QuestionNumber" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                                    Field="QuestionNumber" Width="25px"></cic:CaisisTextBox>
                            </ItemTemplate>
                        </cic:ExtendedTemplateField>
                        <cic:ExtendedTemplateField HeaderText="Sort" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="SortNumber" CssClass="SortNumber" runat="server" ShowLabel="false"
                                    Table="MetadataSurveyQuestions" Field="SortNumber" Width="25"></cic:CaisisTextBox>
                                <span class="sortWidgetContainer"><a href="#" class="NumPositionLink" title="Move field up">
                                    &nbsp;</a><br />
                                    <a href="#" class="NumPositionLink" title="Move field down">&nbsp;</a> </span>
                            </ItemTemplate>
                        </cic:ExtendedTemplateField>
                        <cic:ExtendedTemplateField HeaderText="Question" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="Question" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                                    Field="Question" Width="375"></cic:CaisisTextBox>
                                <span style="cursor: pointer; text-decoration: underline;" onclick=" showHideResponseFields(this,'QuestionResponses_<%# Container.DataItemIndex %>');">
                                    add/edit responses</span>
                                <div id="QuestionResponses_<%# Container.DataItemIndex %>" class="QuestionResponses"
                                    style="display: none;">
                                    <!-- List Of Response for Question -->
                                    <cic:ExtendedGridView runat="server" ID="SurveyQuestionResponsesGrid" DataKeyNames="MetadataQuestionResponseId,MetadataSurveyQuestionId"
                                        TableName="MetadataQuestionResponses" AutoGenerateColumns="false" Width="100%"
                                        RebindOnDelete="true" ShowHeader="true" GridLines="None" BlankRows="10" VisibleBlankRows="5"
                                        OnRowDataBound="SetResponseCopyEvent">
                                        <Columns>
                                            <cic:ExtendedTemplateField ItemStyle-VerticalAlign="Top" ItemStyle-Width="50px">
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
                            </ItemTemplate>
                        </cic:ExtendedTemplateField>
                        <cic:ExtendedTemplateField HeaderText="Copy" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <a href="#" onclick="setActiveQuestion('<%# (Container as Control).FindControl("Question").ClientID %>'); return false;">
                                    copy</a>
                            </ItemTemplate>
                        </cic:ExtendedTemplateField>
                        <cic:ExtendedTemplateField HeaderText="Section" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="Section" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                                    Field="Section" Width="150"></cic:CaisisTextBox>
                            </ItemTemplate>
                        </cic:ExtendedTemplateField>
                        <cic:ExtendedTemplateField HeaderText="Required" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisSelect ID="ResponseRequired" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                                    Field="ResponseRequired">
                                    <asp:ListItem Text="False" Value="False"></asp:ListItem>
                                    <asp:ListItem Text="True" Value="True"></asp:ListItem>
                                </cic:CaisisSelect>
                            </ItemTemplate>
                        </cic:ExtendedTemplateField>
                        <cic:ExtendedTemplateField HeaderText="Response Control Type" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
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
                            </ItemTemplate>
                        </cic:ExtendedTemplateField>
                        <cic:ExtendedTemplateField HeaderText="Response Layout" ItemStyle-VerticalAlign="Top">
                            <ItemTemplate>
                                <cic:CaisisSelect ID="ResponseLayout" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                                    Field="ResponseLayout">
                                    <asp:ListItem Text="Vertical" Value="Vertical">
                                    </asp:ListItem>
                                    <asp:ListItem Text="Horizontal" Value="Horizontal">
                                    </asp:ListItem>
                                </cic:CaisisSelect>
                            </ItemTemplate>
                        </cic:ExtendedTemplateField>
                        <cic:GridRowDeleteImage HeaderText="Delete" ItemStyle-VerticalAlign="Top">
                        </cic:GridRowDeleteImage>
                    </Columns>
                </cic:ExtendedGridView>
            </div>
        </asp:Panel>
        <div style="text-align: center; margin-top: 10px;">
        
        <asp:LinkButton runat="server" ID="DeleteBtn" CssClass="dataEntryButtonGray" OnClick="DeleteSurvey"
            OnClientClick="return confirmSurveyDelete();" Text="Delete This Survey" Visible="false" style="margin-right: 70px;"></asp:LinkButton>
            
        <asp:HyperLink runat="server" ID="PreviewBtn" CssClass="dataEntryButtonGray" Text="Preview" Target="surveyWindow" Visible="false" style="margin-right: 70px;"></asp:HyperLink>
        
        
            <asp:LinkButton runat="server" ID="SaveBtn" CssClass="dataEntryButtonGray"
                OnClick="SaveQuestions" Text="Save" Visible="false" />
        </div>
    </div>
    <!-- Layer for Copying Canned Questions -->
    <div id="CannedLayer" style="position: absolute; width: 500px; height: 400px; display: none;
        border: 2px solid #333333;">
        <iframe id="CannedFrame" name="CannedFrame" src="../Plugins/SurveyPlugin/CannedQuestionsChoose.aspx"
            frameborder="0" style="width: 100%; height: 100%;"></iframe>
    </div>
    </form>
</body>
</html>
