<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminProjectApproval.aspx.cs" 
Inherits="Caisis.UI.Modules.ProjectMgmt.AdminProjectApproval" ValidateRequest="false"%>

<%@ Register TagPrefix="spaw" Namespace="Solmetra.Spaw2" Assembly="Solmetra.Spaw2" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="diseaseState" TagName="DiseaseEditor" Src="../Controls/DiseaseState.ascx" %>
<%@ Register TagPrefix="help" TagName="HelpLayer" Src="../Controls/ProjectMgmtHelpLayer.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Project Approval</title>
    
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ProjectMgmtScripts.js" type="text/javascript"></script>

    <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>
    <script type="text/javascript">
    // Resize main container on load and resize
    Browser.ResizeElement( { nodeId: 'ProjectContainer', heightOffset: 200 } );
    Browser.ResizeElement( { nodeId: 'ProjectContainerModal' } );

    // Variables
    var currentRichTextField;
    var RICH_TEXT_EDITOR_WIDTH = 625;
    var RICH_TEXT_EDITOR_HEIGHT = 330;
    
    // Shows the rich text editor with modal background
    function openRichText(id,max)
    {
        var field = $(id);
        currentRichTextField = field;
        currentRichTextField.maxCharLength = max;
        //field.focus();
        var modal = $('ProjectContainerModal');
        var container = $('ProjectContainer');
        var editorHolder = $('RichTextHolder');
        var editor = SpawEngine.getEditor('SubTopicContentRTE');
        // Adjust modal cover layer
        modal.css('height',container.scrollHeight  + 'px')
        modal.show('');
        modal.setTransparency(65);
        // Show editor holder and center
        editorHolder.show('');
        editorHolder.center(container);
        // Update editor to reflect context of new textarea
        editor.focus();
        $('SubTopicContentRTE').value = field.value;
        editor.updatePageDoc(editor);
    }
    
    // Hides the modal text editor and updates ref TextArea with
    // text editor's html content
    function closeRichText()
    {
        if(validateRichText())
        {
            $('ProjectContainerModal').hide('none');
            $('RichTextHolder').hide('none');
        }
    }
    function validateRichText()
    {
        var valid = true;
        var editor = SpawEngine.getEditor('SubTopicContentRTE');
        var page = editor.getPage('SubTopicContentRTE');
        var rawHTML = editor.getPageHtml(page);
        
        // Check length
        var max = currentRichTextField.maxCharLength;
        if(rawHTML.length>max)
        {
            var message = 'The content in the editor contains ' + rawHTML.length + ' charcters,\nexceeding the character limit of ' + max + ' characters.';
            alert(message);
            valid = false;
        }
        else
        {
            var helperDiv = $(currentRichTextField.id + 'HTML');
            // Update calling TextArea and helper display div
            if(helperDiv)
            {        
                helperDiv.innerHTML = rawHTML;
                currentRichTextField.value = rawHTML;
            }
            valid = true;
        }
        return valid;
    }
    
    // Will Overwrite built in function, and use custom rich text editor
    // instead of utility textarea editor
    NotesEditor.show = openRichText;
    
    // Set default help item when page loads 
    window.addEvent('load',function(e) { showFieldDescription($('CreationDate'),'CreationDate'); } );
    </script>
    
    <style type="text/css">
    textarea
    {
        width: 90%;
        display: none;
    }
    .RichTextDisplayView
    {
        width: 90%;
        float: left;
        height: 125px; 
        background-color: #efefef;
        border: 1px solid #cccccc;
        overflow: auto;
        cursor: pointer;
        padding: 4px;
    }
    .RichTextDisplayView:hover
    {
        width: 90%;
        float: left;
        height: 125px; 
        background-color: #E9D5D6;
        border: 1px solid #cccccc;
        overflow: auto;
        cursor: pointer;
        border: solid 1px #8d2a2c;
        color: #000000;
        padding: 4px;
    }
    .RichTextDisplayViewHover
    {
        width: 90%;
        float: left;
        height: 125px; 
        background-color: #E9D5D6;
        border: 1px solid #cccccc;
        overflow: auto;
        cursor: pointer;
        border: solid 1px #8d2a2c;
        color: #000000;
        padding: 4px;
    }
    #MainTable td
    {
        padding-top: 10px;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="MenuContainter" style="height: 12px; width: 100%; display: block; border: none; margin: 0px;"> </div>
    <div>
        <table class="ProjectWizardTable">
            <tr>
                <td style="width: auto;">
                    <table cellpadding="0" cellspacing="0" border="0" width="85%" align="center">
                        <tr class="BlueListBar">
                            <td class="BlueListBar" width="2%">
                                <img src="../Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;" /></td>
                            <td class="BlueListBar" width="96%">
                                <span style="font-size: 14px; margin-top: 10px; font-weight: normal;"><strong>Create New Project -</strong>&nbsp;&nbsp;&nbsp;Step 2: Project Proposal Form</span></td>
                            <td class="BlueListBar" width="2%" style="text-align: right;">
                                <img src="../Images/HeaderBarBlueRight.gif" width="6" height="35" align="right" /></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="background-color: #ffffff;">
                                <div style="position: relative; z-index: 9;">
                                    <div id="RichTextHolder" style="width: 625px; z-index: 10; display: none; position: absolute;">
                                        <img src="../../../Images/Header/SmallCloseButton.gif" style="position: absolute;
                                            top: 10px; right: 10px; width: 20px; height: 20px; cursor: pointer;" onclick="closeRichText();">
                                        <spaw:Editor ID="SubTopicContentRTE" runat="server" ToolbarSet="standard" Height="330"
                                            FloatingMode="false" Resizable="false" ModeStripVisible="true" Width="625">
                                        </spaw:Editor>
                                    </div>
                                </div>
                                <div id="ProjectContainer" style="border: solid 3px #e4e4e4; border-top: none; height: 600px;
                                    overflow: auto; position: relative;"><div id="ProjectContainerModal" style="position: absolute; z-index: 5; background-color: #000000;
                                                    width: 100%; margin: 0; padding: 0; height: 600px; top: 0px; left: 0px; display: none;">
                                                </div>
                                    <table style="table-layout: fixed; width: 95%; margin: 10px auto 25px auto; vertical-align: top;"
                                        id="MainTable">

                                        <tr>
                                            <td style="vertical-align: top; font-weight: bold; width: 200px;">
                                                <label for="RequesDate" title="Creation Date">
                                                    Request Date</label>
                                            </td>
                                            <td>
                                                <cc:CaisisTextBox ID="RequestDate" runat="server" CssClass="UnselectedField" ShowLabel="false"
                                                    Table="ProjectLetterOfIntent" Field="CreationDate" ShowCalendar="true"></cc:CaisisTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; font-weight: bold;">
                                                <label for="DiseaseStateEditor" title="Disease Working Group">
                                                    Disease Working Group</label>
                                            </td>
                                            <td>
                                                <diseaseState:DiseaseEditor ID="DiseaseStateEditor" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; font-weight: bold;">
                                                <label for="PopulationDescription" title="Research study sample/dataset">
                                                    Research study sample/dataset</label>
                                            </td>
                                            <td>
                                                <cc:CaisisTextBox ID="PopulationDescription" runat="server" CssClass="UnselectedField"
                                                    ShowLabel="false" Table="ProjectLetterOfIntent" Field="PopulationDescription"></cc:CaisisTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  style="vertical-align: top; font-weight: bold; text-align: right; padding-right: 26px;">
                                                <label for="Objectives" title="Research Question(s)">
                                                    Research Question(s)</label>
                                            </td>
                                            <td>
                                                <div runat="server" id="ObjectivesHTML" class="RichTextDisplayView"  onclick="NotesEditor.show('Objectives',5000);">
                                                </div>
                                                <cc:CaisisTextArea ID="Objectives" runat="server" MaxLength="5000" ShowTextEditor="true"
                                                    CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="Objectives"></cc:CaisisTextArea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: top; font-weight: bold; text-align: right; padding-right: 26px;">
                                                <label for="ResearchMethods" title="Statistical Methods">
                                                    Statistical Methods</label>
                                            </td>
                                            <td >
                                                <div runat="server" id="ResearchMethodsHTML" class="RichTextDisplayView" onclick="NotesEditor.show('ResearchMethods',5000);">
                                                </div>
                                                <cc:CaisisTextArea ID="ResearchMethods" runat="server" MaxLength="5000" ShowTextEditor="true"
                                                    CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="ResearchMethods"></cc:CaisisTextArea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td  style="vertical-align: top; font-weight: bold; text-align: right; padding-right: 26px;">
                                                <label for="Notes" title="Notes">
                                                    Notes</label></td>
                                            <td >
                                                <div runat="server" id="NotesHTML" class="RichTextDisplayView" onclick="NotesEditor.show('Notes',5000);">
                                                </div>
                                                <cc:CaisisTextArea ID="Notes" runat="server" MaxLength="5000" ShowTextEditor="true"
                                                    CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="Notes"></cc:CaisisTextArea></td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <!-- Navigation Buttons -->
                    <div style="margin: 10px;">
                        <asp:ImageButton ID="ImageButton1" AlternateText="Go To Project Details" ImageUrl="../Images/Button_Back.gif"
                            runat="server" OnClick="HandleBackClick" Style="float: left;" />
                        <asp:ImageButton ID="ImageButton2" AlternateText="Go To Associate Organizations"
                            ImageUrl="../Images/Button_Next.gif" runat="server" OnClick="HandleNextClick"
                            Style="float: right;" />
                    </div>
                </td>

            </tr>
        </table>
    </div>
    </form>
</body>
</html>
