<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Survey_Edit_Dynamic.aspx.cs"
    Inherits="Caisis.UI.Admin.Survey_Edit_Dynamic" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Admin</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Plugins/SurveyPlugin/SurveyStyles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../ClientScripts/utilities.js"></script>
    <script type="text/javascript" src="../ClientScripts/DynamicControls.js"></script>
    <script type="text/javascript" src="../ClientScripts/PatientDataEntry.js"></script>
    <script type="text/javascript" src="../ClientScripts/jQuery.js"></script>
    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();

        jQuery(document).ready(function(e) {
            var surveyId = jQuery("#SurveyList option:selected").val();
            if(surveyId && surveyId != "") {
                // populate a list of all questions
                loadSurveyQuestions(surveyId, "");
            }
        });

        function loadSurveyQuestions(surveyId, questionId) {
            doRemoteSurveyCall("load", surveyId, questionId, function(response) {
                var remoteDOM = jQuery(response);
                var readOnlyQuestions = remoteDOM.find("#ReadOnlyPanel > li");
                var allQuestionsList = jQuery("#AllQuestionsList");
                // update single question
                if(questionId && questionId != "") {
                    var localQuestion = jQuery("#Question_" + questionId);
                    var remoteQuestion = remoteDOM.filter("#Question_" + questionId);
                    localQuestion.insertAfter(remoteQuestion);
                    localQuestion.remove();
                }
                // update all questions
                else {
                    // update panel
                    allQuestionsList.empty();
                    allQuestionsList.append(readOnlyQuestions);
                }
                showHideEditFrame(false);
            });
        }

        function setSurveyQuestionPage(action, surveyId, questionId) {
            var dataEnrty = jQuery("#EditFrame");
            dataEnrty.attr("src", "Survey_EditResponses.aspx?action=" + action + "&metaSurveyId=" + surveyId + "&metaQuestionId=" + (questionId ? questionId : ""));
        }

        function doRemoteSurveyCall(action, surveyId, questionId, callback) {
            // load all questions
            var loadURL = "Survey_EditResponses.aspx?action=" + action + "&metaSurveyId=" + surveyId;
            // load single question
            if(questionId && questionId != "") {
                loadURL = loadURL + "&metaQuestionId=" + questionId;
            }
            jQuery.ajaxSetup({ cache: false });
            jQuery.get(loadURL, callback); 
        }

        function getSurveyQuestion(surveyId, questionId)
        {
        }

        function editSurveyQuestion(surveyId, questionId) {
            setSurveyQuestionPage("edit", surveyId, questionId);
            showHideEditFrame(true);
            return false;
        }

        function hideSurveyQuestion() {
            editSurveyQuestion("", "");
            return false;
        }
        
        function deleteSurveyQuestion(surveyId, questionId) {
            doRemoteSurveyCall("delete", surveyId, questionId, function(response) {
                loadSurveyQuestions(surveyId, "");
            });
            return false;
        }

        function showHideEditFrame(doShow) {
            var questionsContainer = jQuery("#SurveyPagesContainer");
            var questions = jQuery("#SurveyPages");
            var editFrame = jQuery("#EditFrame");
            if(doShow) {
                questionsContainer.hide();
                editFrame.show();
            }
            else {
                questionsContainer.show();
                editFrame.hide();
            }
        }

        Browser.ResizeElement({ customResizer: resizeContainers });
        //Browser.ResizeElement({ nodeId: '', heightOffset: 400 });
        

        function resizeContainers() {
            var height = jQuery(window).height();
            var overflow = jQuery("#SurveyListOverflow");
            var pages = jQuery("#SurveyPages");
            overflow.css("max-height", height- 225);
            pages.css("max-height", height - 275);
        }

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
        .SurveyQuestions
        {
            border: 1px solid #eee;
            background-color: transparent;
        }
        .SurveyQuestion
        {
            margin: 3px auto;
            padding: 5px;
            position: relative;
            border: 1px solid transparent;
        }
        .SurveyQuestion:hover
        {
            border: 1px solid #bbbbbb;
        }
        .SurveyQuestion button
        {
            position: absolute;
            top: 5px;
            right: 5px;
            width: 75px;
        }
        .SurveyQuestion button.editBtn
        {
            right: 95px;
        }
        .SurveyQuestion:hover button
        {
            display: inline-block;
        }
        .EditDataEntryForm_ChildTableTitleOuterContainer > div
        {
            padding: 5px;
        }
        #Buttons
        {
            text-align: center;
        }
        #Buttons .dataEntryButtonGray,
        #Buttons .dataEntryButtonRed
       {
            margin: auto 10px;
       }
    </style>
</head>
<body class="AdminBody">
    <form id="form1" runat="server">
    <div style="position: absolute; top: 5px; right: 5px; display: inline-block;">
        <a href="Survey_Edit.aspx?metadataSurveyId=<%= QueryMetaSurveyId %>" class="dataEntryButtonGray">Edit in Standard Mode</a>
        <a href="Survey_Edit_Dynamic.aspx?metadataSurveyId=<%= QueryMetaSurveyId %>" class="dataEntryButtonRed">Edit in Preview Mode</a>
    </div>
    <cic:CaisisSelect runat="server" ID="SurveyList" DataTextField="SurveyType" DataValueField="MetadataSurveyId"
        AutoPostBack="true" OnSelectedIndexChanged="BindQuestionsGrid" ShowLabel="false"
        Style="display: none;">
    </cic:CaisisSelect>
    <asp:Panel runat="server" ID="SurveyFields" Visible="false">
        <h2>
            Survey Details</h2>
        <div>
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
                </tr>
                <tr>
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
                <tr>
                    <td colspan="6">
                        <div id="Buttons" style="text-align: center; margin-top: 10px;">
                            <asp:LinkButton runat="server" ID="SaveBtn" CssClass="dataEntryButtonRed" OnClick="SaveQuestions"
                                Text="Save" Visible="false" />
                           <asp:LinkButton runat="server" ID="DeleteBtn" CssClass="dataEntryButtonGray" OnClick="DeleteSurvey"
                                OnClientClick="return confirmSurveyDelete();" Text="Delete" Visible="false"></asp:LinkButton>
                            <asp:HyperLink runat="server" ID="PreviewBtn" CssClass="dataEntryButtonGray" Text="Preview"
                                Target="surveyWindow" Visible="false"></asp:HyperLink>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <h2>
        Questions &amp; Responses</h2>
    <div id="SurveyListOverflow" style="overflow: auto; max-height: 95%;">
        <div id="SurveyPagesContainer">
            <ol id="SurveyPages" class="SurveyPages" style="overflow: auto; max-height: 95%;">
                <li class="_SurveyPage">
                    <!-- Remotely Loaded Questions -->
                    <ol id="AllQuestionsList" class="SurveyQuestions">
                    </ol>
                </li>
            </ol>
            <span class="dataEntryButtonGray" onclick="return editSurveyQuestion('<%= QueryMetaSurveyId %>', '');">
                Add a Question</span>
        </div>
        <iframe id="EditFrame" name="EditFrame" src="Survey_EditResponses.aspx" frameborder="0"
            style="width: 100%; height: 365px; display: none;"></iframe>
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
