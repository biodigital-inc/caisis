<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminEligibilityQuestionnaire.aspx.cs"
    Inherits="Caisis.UI.Modules.ProtocolMgmt.AdminEligibilityQuestionnaire" %>

<%@ Register TagPrefix="grid" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Eligibility Questionaire</title>
    <link rel="stylesheet" type="text/css" href="../../StyleSheets/GlobalStyles.css" />
    <link rel="stylesheet" type="text/css" href="StyleSheets/ProtocolMgmtStyles.css" />

    <script type="text/javascript" src="../../ClientScripts/utilities.js"></script>

    <script type="text/javascript" src="ProtocolMgmtScripts.js"></script>

    <script type="text/javascript">
        /* <![CDATA[ */


        var MainOverflowMinHeight = 200;

        /*
        function onWindowResize() {
            if ($('MainOverflow')) {
                $('MainOverflow').style.height = Math.max(MainOverflowMinHeight, getHeight(window) - 150) + 'px';
                if ($('surveyQuestions')) {
                    $('surveyQuestions').style.maxHeight = Math.max(100, getHeight(window) - 480) + 'px';
                }
            }
        }
        */

        function validateNewQuestionaire(field) {
            var valid = $(field).value.replace(' ', '') != '';
            if (!valid) {
                alert('Please enter a valid Questionnaire Name.');
                field.focus();
            }
            return valid;
        }

        // show next question to enter
        function showNextRow() {
            var hiddenRows = $('QuestionsGrid').tag('TR.ItemRow_Hidden');
            if (hiddenRows.length > 0) {
                var nextRow = hiddenRows[0];
                nextRow.className = nextRow.rowIndex % 2 == 0 ? 'ItemRow_A' : 'ItemRow_B';
            }
            else {
                alert('Please save the form before adding new rows.');
            }
            return false;
        }

        function showNewQuestionnaire() {
            var diagLayer = $('NewQuestionnaireLayer');
            diagLayer.show('block');
            diagLayer.center();
        }

        function hideNewQuestionnaire() {
            $('NewQuestionnaireLayer').hide('none');
        }

        /* ]]> */
    </script>

    <style type="text/css">
        #DataEntryPanel
        {
            margin-top: 10px;
            width: auto;
        }
        label
        {
            font-weight: bold;
        }
        .ItemRow_Hidden
        {
            display: none;
        }
        .ItemRow_Visible
        {
            display: inline;
        }
        .SurveyDataEntryField
        {
            margin-left: 10px;
        }
        
        #NewQuestionnaireLayer
        {
            display: none;
            position: absolute;
            top: 0px;
            left: 0px;
            width: 302px;
            height: 326px;
            padding: 10px;
            z-index: 10000;
            background-image: url(images/SmallPopupBG_216High.png);
            background-repeat: no-repeat;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="MetadataSurveyId" />
    <div id="NewQuestionnaireLayer"><table style="width: 100%; font-weight: bold;">
                <tr>
                    <td colspan="2" style="padding-bottom: 12px; color: #8d2a2c; font-size: 12px;">
                        Create New Questionnaire
                    </td>
                </tr>
                <tr><td colspan="2" style=" padding: 10px; padding-bottom: 30px; text-align: left;">
                <label for="NewQuestionnaireName" style="margin-right: 6px;">
                Questionnaire Title</label><br /><asp:TextBox TextMode="MultiLine" runat="server" ID="NewQuestionnaireName" Width="250" Height="50" />
            
                </td></tr>
                
                <tr><td style="vertical-align: top;">
                    <img src="Images/Button_Cancel.png" onclick="hideNewQuestionnaire();" style="cursor: pointer; margin-left: 20px;" />
                </td><td style="vertical-align: top; text-align: right;">
                    <asp:ImageButton ImageUrl="Images/Button_Create.png" runat="server" ID="CreateNewBtn" Text="Create a New Questionnaire" OnClick="AddNewQuestionnaire" OnClientClick="return validateNewQuestionaire('NewQuestionnaireName');" style="margin: 0px 34px 0px 0px;" />
                </td></tr>
        </table></div>
    
    
    <div style="display: none;">
        <span style="color: #8d2a2c; font-size: 14px; font-weight: bold;">Eligibility Questionnaires:
            <asp:Label runat="server" ID="ProtocolNumberLabel"></asp:Label>
        </span>
        <p class="smallPrint">
            <asp:Label runat="server" ID="ProtocolLabel"></asp:Label>
        </p>
    </div>   
        
        
    <div id="MainOverflow" style="border: solid 1px #dddddd; background-color: #fafafa; margin-left: auto;
        margin-right: auto; padding: 10px 30px 10px 30px; overflow: auto; height: 500px;">
        <div>

<table cellpadding="0" cellspacing="0" style="width: auto; margin: 0px auto 0px auto;"><tr><td style="vertical-align: top;">

        <div style="margin: 0px auto 18px auto; font-size: 12px;">An eligibility questionnaire should be assigned to each existing version of the protocol.  If necessary, create a new questionnaire by clicking the applicable button.<br />
        Select a questionnaire from the dropdown to preview or edit the questionnaire below.</div>
        
        <table style="width: 480px; font-weight: bold; margin-left: auto; margin-right: auto;">
            <thead>
                <tr>
                    <td style="width: 65px; text-align: center; font-size: 10px; line-height: 10px;">
                        Protocol Version
                    </td>
                    <td>
                        Associated Questionnaire
                    </td>
                    <td style="text-align: right;"><img src="Images/Button_CreateNewQuestionnaire_small.png" onclick="showNewQuestionnaire();" style="cursor: pointer;" /></td>
                </tr>
            </thead>
        </table>
        <div id="versionListDiv" style="width: 510px; overflow: auto; max-height: 100px; margin-left: auto; margin-right: auto;">
        <grid:ExtendedGridView runat="server" ID="ProtocolVersionsGrid" TableName="ProtocolMgr_ProtocolVersions"
            DataKeyNames="ProtocolVersionId,ProtocolId" AutoGenerateColumns="false" CssClass="dataGrid"
            OnRowDataBound="BindQuestionsList" VisibleBlankRows="0"
            BlankRowCssClass="ItemRow_Hidden" Width="490px"
            BlankRows="10" ShowHeader="false" ShowFooter="false" GridLines="None" CellPadding="2"
            CellSpacing="0" Style="padding: 0px; margin: 0px;" RowStyle-CssClass="ItemRow_A" AlternatingRowStyle-CssClass="ItemRow_B">
            <Columns>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-Width="65px" >
                    <ItemTemplate>
                        <%# Eval("VersionNumber")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="AssocaitedSurveyLabel"></asp:Label>
                        <asp:DropDownList runat="server" ID="AssociatedSurveyList" DataTextField="SurveyTitle"
                            DataValueField="MetadataSurveyId" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="PopulateExistingSurvey">
                            <asp:ListItem Text="-- Select Questionnaire for This Version --" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:ImageButton runat="server" ID="EditBtn" ImageUrl="Images/Button_ViewEdit_small.png" AlternateText="Edit Questionnaire" ToolTip="Edit Questionnaire"
                            OnClick="EditMetadataSurveyClick"  Visible="false" />
                        <asp:ImageButton runat="server" ID="DeleteBtn" AlternateText="Delete Association with Questionnaire"
                            ToolTip="Delete Association with Questionnaire" OnClick="DeleteAssociationClick"
                            OnClientClick="return confirm('Are you sure you want to remove the questionnaire from this protocol version?');"
                            ImageUrl="Images/Button_Remove_small.png" Visible="false" style="margin-left: 8px;" />
                        <asp:ImageButton  ImageUrl="Images/Button_UseThisQuestionnaire_small.png" runat="server" ID="UpdateBtn"  OnClick="UpdateAssociationClick" Text="Use this Questionnaire" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </grid:ExtendedGridView></div></td></tr></table></div>
        <asp:Panel runat="server" ID="DataEntryPanel" Visible="false" Style="margin-top: 22px;
            margin-left: auto; margin-right: auto;">
            
            <div style="margin: 0px auto 10px auto; font-size: 13px; font-weight: bold; color: #111111;">Preview / Edit Questionnaire</div>
            
            <label for="SurveyType" style="font-size: 12px; color: #333333;">
                Title
                <cic:CaisisTextBox runat="server" ID="SurveyType" Table="MetadataSurveys" Field="SurveyType"
                    ShowLabel="false" OnTextChanged="MarkSurveyDirty" Width="200px" Style="border: solid 1px #cccccc;
                    font-size: 13px; margin-right: 20px;"></cic:CaisisTextBox></label>
                    <br />
            <asp:Label runat="server" ID="ReadOnlyMessage" Text="This questionnaire is currently associated with other Protocols (or versions), and cannot be edited." style="color: #666666;"></asp:Label>
            <table style="width: 100%; font-weight: bold; margin-top: 10px;" class="dataGridHeader">
                <tr>
                    <td style="width: 125px; color: #ffffff;">
                        Question Number
                    </td>
                    <td style="color: #ffffff;">
                        Question
                    </td>
                </tr>
            </table>
            <div id="surveyQuestions" style="overflow: auto; overflow-x: hidden;margin-bottom: 7px; max-height: 175px;">
                <grid:ExtendedGridView runat="server" ID="QuestionsGrid" TableName="MetadataSurveyQuestions"
                    DataKeyNames="MetadataSurveyId,MetadataSurveyQuestionId" AutoGenerateColumns="false"
                    CssClass="dataGrid" RowStyle-CssClass="ItemRow_A" VisibleBlankRows="0" BlankRowCssClass="ItemRow_Hidden"
                    AlternatingRowStyle-CssClass="ItemRow_B" Width="100%" BlankRows="10" ShowHeader="false"
                    ShowFooter="false" CellPadding="0" CellSpacing="0" Style="padding: 0px; margin: 0px;">
                    <Columns>
                        <grid:ExtendedTemplateField ItemStyle-Width="125px" HeaderText="Question Number">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="CaisisTextBox1" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                                    Field="QuestionNumber" Width="50px" CssClass="SurveyDataEntryField"></cic:CaisisTextBox>
                            </ItemTemplate>
                        </grid:ExtendedTemplateField>
                        <grid:ExtendedTemplateField HeaderText="Question">
                            <ItemTemplate>
                                <cic:CaisisTextBox ID="CaisisTextBox2" runat="server" ShowLabel="false" Table="MetadataSurveyQuestions"
                                    Field="Question" Width="500px" CssClass="SurveyDataEntryField"></cic:CaisisTextBox>
                            </ItemTemplate>
                        </grid:ExtendedTemplateField>
                    </Columns>
                </grid:ExtendedGridView>
            </div>
            <asp:ImageButton runat="server" ID="SaveBtn" ImageUrl="Images/Button_Save.png" ToolTip="Save"
                OnClick="SaveQuestionnaireClick"  OnClientClick="return validateNewQuestionaire('SurveyType');" Style="float: right; margin-right: 30px;" /><asp:ImageButton
                    runat="server" ID="AddRowBtn" ImageUrl="~/Images/DataGridAddNewRow.gif" OnClientClick="return showNextRow();" />
        </asp:Panel>
    </div>
    </form>
</body>
</html>
