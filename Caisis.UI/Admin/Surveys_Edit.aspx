<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Surveys_Edit.aspx.cs" Inherits="Caisis.UI.Admin.Surveys_Edit" %>

<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="cic" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Surveys</title>
    <link href="../Stylesheets/GlobalStyles.css" rel="stylesheet" type="text/css" />
    <link href="../Stylesheets/AdminStyles.css" rel="stylesheet" type="text/css" />

    <script src="../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery.js" type="text/javascript"></script>

    <script src="../ClientScripts/jquery-ui.js" type="text/javascript"></script>

    <script type="text/javascript">
        /* <![CDATA[ */

        jQuery.noConflict();

        jQuery(document).ready(function(e) {
            // scroll to active table LI
            var surveyId = jQuery('#CurrentSurveyId').val();
            if (surveyId && surveyId != '') {
                var li = jQuery('#Survey_' + surveyId);
                if (li.size() > 0) {
                    var scrollToPos = li.position().top - li.height() - 30;
                    jQuery('#adminBoxNavListContainer').scrollTop(Math.max(0, scrollToPos));
                }
            }
            // adjust overflow and on resize
                adjustOverflow();
                jQuery(window).resize(adjustOverflow);
        });


        // adjuts the height of the main list
        function adjustOverflow() {
            jQuery('.adminBoxNavListContainer').css('maxHeight', jQuery(window).height() - 90 + 'px');
        }

        function loadSurveyForm(surveyId) {
            window.location = 'Surveys_Edit.aspx?diseaseId=<%= QueryDiseaseId %>&surveyId=' + surveyId;
            return false;
        }

        function editDiseaseSurveys() {
            var url = 'Disease_EditAssociation.aspx?table=MetadataSurveys&field=SurveyType&diseaseId=';
            top.showModalWithConfig(url, 'Add/Remove Surveys', { width: 600, height: 500 });
            return false;
        }

        function addNewSurvey() {
            top.showModalWithConfig('Surveys_Add.aspx', 'Add New Survey', { width: '300px', height: '50px' });
            return false;
        }

        function editMetaSurvey(metadataSurveyId, surveyType) {
            top.showModalWithConfig('<%= Page.ResolveUrl("Survey_Edit.aspx") %>?metadataSurveyId=' + metadataSurveyId, 'Edit Survey: ' + surveyType, { width: '95%', height: '95%' });
            return false;
        }

        function previewMetaSurvey(surveyType,evt) {
            top.showModalWithConfig('<%= Page.ResolveUrl("~/Plugins/SurveyPlugin/SurveyWizardPage.aspx") %>?surveyType=' + surveyType + '&preview=true', 'Preview Survey: ' + surveyType, { width: '900px', height: '95%' });
            stopBubble(evt);
            return false;
        }

        function showHideResponseFields(label, containerId) {
            var labelDOM = jQuery(label);
            var questionsDOM = jQuery('#' + containerId);
            if (questionsDOM.is(':visible')) {
                labelDOM.text('show questions');
                questionsDOM.slideUp();
            }
            else {
                labelDOM.text('hide questions');
                questionsDOM.slideDown();
            }
        }

        /* ]]> */
    </script>

    <style type="text/css">
        #SurveyQuestionFields
        {
            max-height: 450px;
            overflow: auto;
        }
        .surveyListItemTable
        {
            table-layout: fixed;
            width: 95%;
        }
        .surveyListItemTable th
        {
            text-align: left;
            font-family: Arial, Helvetica, sans-serif;
	        font-size: 12px;
	        line-height: 12px;
	        color: #000000;
	        font-weight: bold;
	        padding: 0px 0px 1px 2px;
	        white-space: nowrap;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField runat="server" ID="CurrentSurveyId" />
    
<div id="SelectFormBox" class="adminNavBoxContainer" style="width: 600px;">
        
        <table class="surveyListItemTable" cellspacing="0">
        <thead>
            <tr>
                <th style="width: 50%;">
                    Survey Name
                </th>
                <th style="width: 25%;">
                    Category
                </th>
                <th style="width: 10%;">
                    Ver
                </th>
                <th style="width: 15%;">
                    Preview
                </th>
            </tr>
        </thead></table>
        
        
        <div id="mainAdminBox" class="adminBox" >
            <div id="adminBoxNavListContainer" class="adminBoxNavListContainer" style="overflow-x: hidden; word-wrap: break-word;">
                <ul id="TableList" class="adminBoxNavList">                    
                    <asp:Repeater runat="server" ID="SurveysRptr">
                        <ItemTemplate>
                            <li id="" title="" class="<%# (Container.ItemIndex % 2 == 0 ? "alternate" : "") %>"
                                onclick="return editMetaSurvey('<%# Eval("MetadataSurveyId") %>', '<%# PageUtil.EscapeSingleQuotes(Eval("SurveyType").ToString()) %>');">
                           <table cellspacing="0" class="surveyListItemTable">
                            <tr id="Survey_<%# Eval("MetadataSurveyId") %>" class="" onclick="return loadSurveyForm('<%# Eval("MetadataSurveyId") %>');">
                                <td style="width: 50%;">
                                    <%# Eval("SurveyType") %>
                                </td>
                                <td style="width: 25%;">
                                    <%# Eval("SurveyCategory")%>
                                </td>
                                <td style="width: 10%;">
                                    <%# Eval("VersionNumber")%>
                                </td>
                                <td style="width: 15%; text-align: right;">
                                    <span class="dataEntryButtonGray" onclick="return previewMetaSurvey('<%# PageUtil.EscapeSingleQuotes(Eval("SurveyType").ToString()) %>',event);">
                                        Preview</span>
                                </td>
                            </tr>
                           </table> 
                                  </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <span runat="server" id="NoTablesMessage" visible="false">No surveys have been customized
        for this disease view.<br />
        <br />
        Click <strong>Add Survey</strong> below to select surveys you would like to associate
        with this disease.</span>
            </div>
        </div>
        <span class="dataEntryButtonGray NavListFooterButton" onclick="return addNewSurvey();">
            Add A Survey</span> <span runat="server" id="AddRemoveBtn" class="dataEntryButtonGray NavListFooterButton"
                onclick="return editDiseaseSurveys();">Add/Remove
                <%= QueryDiseaseName %>
                Survey</span>        
    </div>
 









    
    
    
    
    
    
    
    </form>
</body>
</html>
