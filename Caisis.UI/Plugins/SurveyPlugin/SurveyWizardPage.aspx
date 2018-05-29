<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SurveyWizardPage.aspx.cs"
    Inherits="Caisis.UI.Plugins.SurveyPlugin.SurveyWizardPage" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Survey Wizard</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="SurveyStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="../../ClientScripts/DynamicControls.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        var fireUnload = true;

        function disableSurveyUnLoad() { fireUnload = false; }

        function reloadMainPage(sId, isLast, doPopupClose) {
            if (fireUnload && sId != '') {
                var par = window.opener ? window.opener : window.parent;
                // if function is defined in parent page
                if (par && par.onSurveySave) {
                    var doClose = par.onSurveySave.call(par, sId);
                    if (doClose && doPopupClose != false) { closeAfterSave(); return; }
                }
                else {
                    var win = top.getModalCallingWindow();
                    if (win!= null) {
                        // if loaded into modal, signal calling page
                        if (win.onSurveySave) {
                            var doClose = win.onSurveySave.call(win, sId);
                            if ((doClose || isLast) && doPopupClose != false) {
                                top.hideModal();
                                return;
                            }
                        }
                    }
                    closeAfterSave();
                }
            }
        }

        function closeAfterSave() {
            // confirm closing window
            var doClose = true;//confirm('You have just saved the Survey, would you like to close this window?');
            if (doClose) {
                window.close();
            }
        }

        function notifyNoPatient() {
            alert('You have not choosen a Patient, you will not be able to save a Survey without first loading a Patient. This page will now close.');
            window.close();
        }
        
        function verifyChangeForm(view, targetURL) {
            var message = 'You are about to change to a ' + view + ' View of this Survey.\n';
            message += 'Any changes you have made to the survey responses will be lost.\n';
            message += 'Are you sure you want to change the View?';
            var doSubmit = confirm(message);
            // if changing view, persist values in url
            if (doSubmit && window.SURVEY_CLIENT_IDS) {
                var buffer = new Array();
                for (var i = 0; i < SURVEY_CLIENT_IDS.length; i++) {
                    var field = SURVEY_CLIENT_IDS[i][0];
                    var fieldId = SURVEY_CLIENT_IDS[i][1];
                    var fieldValue = getValue($(fieldId));
                    // always add value (even empty)
                    buffer.push(field + '=' + encodeURI(fieldValue));
                }
                window.location = targetURL + (buffer.length > 0 ? '&' + buffer.join('&') : '');
            }
            return false;
        }
        
        // supresses ENTER keypress and moves focus to next field
        function supressSurveySubmitAndTab(next,e)
        {
            // if ENTER is pressed, prevent submit and move to next field
            // otherwise, default action
            if(e.keyCode==13 && next)
            {
                stopBubble(e);
                next.focus();  
            }
        }

        // supresses short fields from submitting on ENTER
        function addSupressSubmitOnFields() {
            var isShortForm = <%= (SurveyLength== SurveyLengthType.Short).ToString().ToLower() %>;
            if(isShortForm)
            {
                var fields = document.getElementById('ShortQuestions').getElementsByTagName('INPUT');
                var shortFields = new Array();
                // filter lists to text fields
                for(var i=0;i<fields.length;i++){ if(fields[i].className =='ShortSurveyQuestionField') shortFields.push(fields[i]); }
                // setup events
                for(var i=0;i<shortFields.length;i++)
                {
                    var field = shortFields[i];
                    var next = shortFields[i+1]
                    $(field).addEvent('keypress',curry(supressSurveySubmitAndTab,next));
                }
            }
        }
        
        // reload page on modal closing
        function onModalClose() {
            var formIsDirty = isFormDirty();
            if(formIsDirty) {
                var doSave = confirm('You have made changes to the form, would you like to save the Survey before closing?');
                // trigger click event to save form
                if(doSave) {
                    if(<%= SaveBtn.Visible.ToString().ToLower() %> && window._doSurveySaveClick) {
                        window._doSurveySaveClick();
                    }
                    else if(<%= NextBtn.Visible.ToString().ToLower() %> && window._doSurveyNextClick) {
                        window._doSurveyNextClick();
                    }
                    return false;
                    //reloadMainPage('<%= SurveyIdField.Value %>', true, false);
                }
            }
            return true;
        }

        /* ]]> */
    </script>

    <style type="text/css">
        #SurveyFields
        {
            position: relative;
        }
        .SurveyTableFields
        {
            table-layout: fixed;
            width: 100%;
        }
        .SurveyTableFields td
        {
            text-align: left;
            vertical-align: top;
        }
        .LabelCol
        {
            font-weight: bold;
            padding-right: 5px;
            width: 160px;
            white-space: nowrap;
        }
        #LongView
        {
            clear: both;
        }
        #ShortView
        {
            background-color: #ffffff;
            clear: both;
        }
        .NavBtn
        {
            padding: 10px;
        }
        .SurveyField
        {
            width: 125px;
        }
        .userSurveyResponseMessage
        {
            float: left;
        }
        .ShowAllBtn
        {
            font-size: 14px;
            font-weight: bold;
            color: #000000;
        }
    </style>
</head>
<body onunload="return false; reloadMainPage('<%= SurveyIdField.Value %>');">
    <form id="form1" runat="server">

    <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <asp:HiddenField runat="server" ID="SurveyIdField" />
    <asp:HiddenField runat="server" ID="UserSurveyType" />
    <asp:HiddenField runat="server" ID="ViewType" Value="Long" />
    <asp:HiddenField runat="server" ID="PageNumberField" Value="0" />
    <div id="SurveyContainer">
        <asp:Panel runat="server" ID="SurveyChoserPanel" Visible="false">
            <span class="SectionTitle" style="display: inline;">Survey List:</span>
            <cic:CaisisSelect runat="server" ID="SurveyList" ShowLabel="false" DataTextField="SurveyType"
                DataValueField="MetadataSurveyId" AutoPostBack="true" OnSelectedIndexChanged="HandleChooseSurvey">
            </cic:CaisisSelect>
        </asp:Panel>
        <div id="ViewBtnContainer">
            <asp:HyperLink runat="server" ID="LongViewBtn" Text="Long View" ToolTip="Show a long version of this Survey"
                CssClass="ViewTabBtn" OnPreRender="SetBtnAction" onclick="return verifyChangeForm('Long', this.href);"></asp:HyperLink>
            <asp:HyperLink runat="server" ID="ShortViewBtn" Text="Short View" ToolTip="Show a short version of this Survey"
                CssClass="ViewTabBtn" OnPreRender="SetBtnAction" onclick="return verifyChangeForm('Short', this.href);"></asp:HyperLink>
        </div>
        <!-- Survey Heading -->
        <h1 style="display: block;">
            <asp:Label runat="server" ID="SurveyTitle"></asp:Label>
        </h1>
        <!-- Fields for Survey -->
        <asp:Panel runat="server" ID="SurveyFields" CssClass="SurveyView">
            <table class="SurveyTableFields">
                <thead>
                    <tr>
                        <td class="LabelCol">
                            <label for="SurveyDateText" title="Date">
                                Date
                            </label>
                        </td>
                        <td class="LabelCol">
                            <label for="SurveyResult" title="Result">
                                Result</label>
                        </td>
                        <td class="LabelCol">
                            <label for="SurveyTotal" title="Total">
                                Total</label>
                        </td>
                        <td class="LabelCol">
                            <label for="SurveyVersion" title="Version">
                                Version</label>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <cic:CaisisTextBox runat="server" ID="SurveyDateText" Table="Surveys" Field="SurveyDateText"
                                ShowLabel="false" ShowCalendar="true" CalcDate="false" OnValueChanged="SetSurveyUpdate"
                                CssClass="SurveyField"> 
                            </cic:CaisisTextBox>
                            <cic:CaisisHidden runat="server" ID="SurveyDate" Table="Surveys" Field="SurveyDate"
                                ShowLabel="false" OnValueChanged="SetSurveyUpdate" />
                        </td>
                        <td>
                            <cic:CaisisTextBox runat="server" ID="SurveyResult" Table="Surveys" Field="SurveyResult"
                                CssClass="SurveyField" ShowLabel="false" OnValueChanged="SetSurveyUpdate"></cic:CaisisTextBox>
                        </td>
                        <td>
                            <cic:CaisisTextBox runat="server" ID="SurveyTotal" Table="Surveys" Field="SurveyTotal"
                                CssClass="SurveyField" ShowLabel="false" OnValueChanged="SetSurveyUpdate"></cic:CaisisTextBox>
                        </td>
                        <td>
                            <cic:CaisisComboBox runat="server" ID="SurveyVersion" Table="Surveys" Field="SurveyVersion"
                                CssClass="SurveyField" ShowLabel="false" LookupCode="SurveyVersion" OnValueChanged="SetSurveyUpdate"></cic:CaisisComboBox>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table class="SurveyTableFields">
                <thead>
                    <tr>
                        <td class="LabelCol">
                            <label>
                                Survey Type
                            </label>
                        </td>
                        <td class="LabelCol">
                            <label for="SurveyQuality" title="Quality">
                                Quality</label>
                        </td>
                        <td class="LabelCol">
                            <label for="SurveyDataSource" title="Data Source">
                                Data Source</label>
                        </td>
                        <td class="LabelCol">
                            <label for="SurveyNotes" title="Version">
                                Notes</label>
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <%= SurveyList.SelectedItem != null ? SurveyList.SelectedItem.Text : "" %>
                        </td>
                        <td>
                            <cic:CaisisSelect runat="server" ID="SurveyQuality" Table="Surveys" Field="SurveyQuality"
                                CssClass="SurveyField" ShowLabel="false" LookupCode="DataQuality" OnValueChanged="SetSurveyUpdate">
                            </cic:CaisisSelect>
                        </td>
                        <td>
                            <cic:CaisisComboBox runat="server" ID="SurveyDataSource" Table="Surveys" Field="SurveyDataSource"
                                CssClass="SurveyField" ShowLabel="false" LookupCode="DataSource" OnValueChanged="SetSurveyUpdate"></cic:CaisisComboBox>
                        </td>
                        <td>
                            <cic:CaisisTextArea ID="SurveyNotes" runat="server" Table="Surveys" Field="SurveyNotes"
                                CssClass="SurveyField" ShowLabel="false" ShowTextEditor="true" OnValueChanged="SetSurveyUpdate"></cic:CaisisTextArea>
                        </td>
                    </tr>
                </tbody>
            </table>
        </asp:Panel>
        <!-- Short Version of Survey -->
        <asp:Panel runat="server" ID="ShortView" CssClass="SurveyView" Visible="false">
            <ol id="ShortQuestions">
                <asp:Repeater runat="server" ID="ShortViewQuestionRptr" OnItemCreated="InitQuestionsAndResponses" OnItemDataBound="BindQuestionLabelsAndHiddenFields">
                    <ItemTemplate>
                        <li class="ShortSurveyQuestion">
                            <asp:Label runat="server" ID="DataEntryResponse" CssClass="redText userSurveyResponseMessage" Visible="false">*&nbsp;</asp:Label>
                            <asp:Label runat="server" ID="QuestionNum" AssociatedControlID="QuestionResponse"
                                CssClass="ShortQuestionNumber"></asp:Label>
                            <asp:Label runat="server" ID="Question" CssClass="SurveyQuestionHidden" Visible="false"></asp:Label>
                            <asp:HiddenField runat="server" ID="SurveyItemId" />
                            <cic:CaisisTextBox runat="server" CssClass="ShortSurveyQuestionField" ID="QuestionResponse"
                                Table="SurveyItems" Field="SurveyItemResult" OnValueChanged="HandleControlValueChange"
                                Width="50px" ShowLabel="false"></cic:CaisisTextBox>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ol>
            <div style="clear: both;">
                &nbsp;</div>

            <script type="text/javascript">
                /* <![CDATA[ */
                addSupressSubmitOnFields();
                /* ]]> */
            </script>

        </asp:Panel>
        <!-- Long Version of Survey -->
        <asp:Panel runat="server" ID="LongView">
            <asp:LinkButton runat="server" ID="ShowAllBtn" Text="View All Questions On 1 Page" ToolTip="Click to view all questions of this survey on a single page" CssClass="ShowAllBtn" OnClick="ShowAllPagesClick" Visible="false"></asp:LinkButton>
            <!-- List Of Pages -->
            <ol class="SurveyPages">
                <asp:Repeater runat="server" ID="SurveyPageRptr" OnItemDataBound="BindPageSections">
                    <ItemTemplate>
                        <li class="SurveyPage">
                            <h2 class="PageTitle">
                                <%#  Container.DataItem.ToString() %>
                            </h2>
                            <!-- List of Sections for Page -->
                            <ol class="SurveySections">
                                <asp:Repeater runat="server" ID="PageSectionsRptr" OnItemDataBound="BindSectionQuestions"
                                    OnPreRender="ShowHideSectionStyles">
                                    <ItemTemplate>
                                        <li class="SurveySection">
                                            <h3 runat="server" id="SurveySectionTitle" class="SurveySectionTitle">
                                                <%# Eval("Section") %>
                                            </h3>
                                            <!-- List Of Questions for Section -->
                                            <ol runat="server" id="SurveyQuestions" class="SurveyQuestions">
                                                <asp:Repeater runat="server" ID="SectionQuestionsRptr" OnItemCreated="InitQuestionsAndResponses" OnItemDataBound="BindQuestionLabelsAndHiddenFields">
                                                    <ItemTemplate>
                                                        <li class="SurveyQuestion">
                                                            <asp:Label runat="server" ID="DataEntryResponse" CssClass="redText userSurveyResponseMessage" Visible="false">*&nbsp;</asp:Label>
                                                            <div runat="server" id="FullQuestion">
                                                                <asp:Label runat="server" ID="QuestionNum" CssClass="QuestionNumber"></asp:Label>
                                                                <asp:Label runat="server" ID="Question" AssociatedControlID="QuestionResponse" CssClass="QuestionText"></asp:Label>
                                                            </div>
                                                            <asp:HiddenField runat="server" ID="SurveyItemId" />
                                                            <asp:HiddenField runat="server" ID="MetaQuestionId" />
                                                            <div style="padding-left: 5px;">
                                                                <asp:PlaceHolder runat="server" ID="DynamicCICHolder"></asp:PlaceHolder>
                                                                <!-- Special Image -->
                                                                <img runat="server" id="Renal_Diagram_1" src="Images/Renal_Diagram.png" visible="false" style="vertical-align: top; margin-left: 25px;" />
                                                                <img runat="server" id="Renal_Diagram_2" src="Images/Renal_Diagram_Anterior_Posterior.png" visible="false" style="vertical-align: top; margin-left: 25px;" />
                                                            </div>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ol>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ol>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ol>
        </asp:Panel>
        <span class="redText" style="display: block; text-align:  right;">* User Entered Questions</span>
        <div id="NavButtons">
            <asp:ImageButton runat="server" ID="BackBtn" CssClass="NavBtn" OnClick="BackClick"
                ImageUrl="Images/Button_Back.gif" AlternateText="Previous Page" ToolTip="Previous Page"
                OnClientClick="disableSurveyUnLoad();" Style="float: left;" />
            <asp:ImageButton runat="server" ID="NextBtn" CssClass="NavBtn" OnClick="NextClick"
                OnClientClick="disableSurveyUnLoad();" ImageUrl="Images/Button_Next.gif" AlternateText="Next Page"
                ToolTip="Next Page" Style="float: right;" />
            <asp:ImageButton runat="server" ID="SaveBtn" CssClass="NavBtn" ImageUrl="Images/Button_Save.gif"
                AlternateText="Save Survey" ToolTip="Save Survey" OnClick="SaveSurveyClick" Style="float: right;" />
        </div>
        <asp:Label ID="PageNumberNav" runat="server" CssClass="PageNumberNav"></asp:Label>
    </div>
    </form>
</body>
</html>
