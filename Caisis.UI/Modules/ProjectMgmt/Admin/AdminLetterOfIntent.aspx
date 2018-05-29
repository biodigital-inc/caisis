<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminLetterOfIntent.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.AdminLetterOfIntent" ValidateRequest="false" %>

<%@ Register TagPrefix="spaw" Namespace="Solmetra.Spaw2" Assembly="Solmetra.Spaw2" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="help" TagName="HelpLayer" Src="../Controls/ProjectMgmtHelpLayer.ascx" %>
<%@ Register TagPrefix="editorGI" TagName="LOIEditorGI" Src="../Controls/LetterOfIntentEditorGI.ascx" %>
<%@ Register TagPrefix="editor" TagName="LOIEditor" Src="../Controls/LetterOfIntentEditor.ascx" %>
<%@ Register TagPrefix="editorBudget" TagName="LOIBudget" Src="../Controls/LetterOfIntentEditorBudget.ascx" %>
<%@ Register TagPrefix="editorContract" TagName="LOIContract" Src="../Controls/LetterOfIntentEditorContract.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Letter Of Intent</title>
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../../ClientScripts/DynamicControls.js"></script>

    <script src="../../../ClientScripts/popcalendar.js" type="text/javascript"></script>

    <script type="text/javascript">
    // Resize main container on load and resize
    Browser.ResizeElement( { nodeId: 'ProjectContainer', heightOffset: 210 } );
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
    
    function displayPrintButton(show)
    {
        /*if (show)
        {
          $('printButton').style.display = '';
        }
        else
        {
          $('printButton').style.display = 'none';
        }*/
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

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="MenuContainter" style="height: 12px; width: 100%; display: block; border: none; margin: 0px;"> </div>
        <table class="ProjectWizardTable">
            <tr>
                <td style="width: auto;">
                    <table cellpadding="0" cellspacing="0" border="0" width="90%" align="center">
                        <tr class="BlueListBar">
                            <td class="BlueListBar" width="2%">
                                <img src="../Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;" /></td>
                            <td class="BlueListBar" width="96%">
                                <span style="font-size: 14px; margin-top: 10px; font-weight: normal;"><strong>Create New Project -</strong>&nbsp;&nbsp;&nbsp;Step 2: Letter of Intent</span></td>
                            <td class="BlueListBar" width="2%" style="text-align: right;">
                                <img src="../Images/HeaderBarBlueRight.gif" width="6" height="35" align="right" /></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <div style="position: relative; z-index: 9; ">
                                    <div id="RichTextHolder" style="width: 625px; z-index: 10; display: none; position: absolute;">
                                        <img src="../../../Images/Header/SmallCloseButton.gif" style="position: absolute;
                                            top: 10px; right: 10px; cursor: pointer;" onclick="closeRichText();">
                                        <spaw:Editor ID="SubTopicContentRTE" runat="server" ToolbarSet="slim" Height="330"
                                            FloatingMode="false" Resizable="false" ModeStripVisible="true" Width="625">
                                        </spaw:Editor>
                                    </div>
                                </div>
                                <div id="ProjectContainer" style="border: solid 3px #e4e4e4; border-top: none; height: 600px;
                                    overflow: auto; position: relative;background-color: #ffffff;">
                                    <editorGI:LOIEditorGI runat="server" ID="LOIFormGI" />
                                    <div id="LargeFieldsContainer" runat="server">
                                        <table style="table-layout:fixed; width: 95%; margin: 10px auto 25px auto; vertical-align: top; font-weight: bold;">
                                            <tr onmouseover="this.className='RichTextDisplayHover';">
                                                <td  style="vertical-align: top; font-weight: bold; width: 100px;">
                                                    <label for="Objectives" title="Objectives">
                                                        Objectives</label>
                                                </td>
                                                <td >
                                                    <div runat="server" id="ObjectivesHTML" class="RichTextDisplayView" onmouseover="this.className='RichTextDisplayViewHover';" onmouseout="this.className='RichTextDisplayView';"  onclick="NotesEditor.show('Objectives',5000);">
                                                    </div>
                                                    <cc:CaisisTextArea ID="Objectives" runat="server" MaxLength="5000" ShowTextEditor="true"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="Objectives"></cc:CaisisTextArea>
                                                </td>
                                            </tr>
                                            <tr><td style="height: 10px;"><img src="../Images/shim.gif" /></td></tr>
                                            <tr>
                                                <td  style="vertical-align: top; font-weight: bold;">
                                                    <label for="Background" title="Rational/Hypothesis">
                                                        Rational / Hypothesis</label>
                                                </td>
                                                <td >
                                                    <div runat="server" id="BackgroundHTML" class="RichTextDisplayView" onmouseover="this.className='RichTextDisplayViewHover';" onmouseout="this.className='RichTextDisplayView';" onclick="NotesEditor.show('Background',5000);">
                                                    </div>
                                                    <cc:CaisisTextArea ID="Background" runat="server" MaxLength="5000" ShowTextEditor="true"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="Background"></cc:CaisisTextArea>
                                                </td>
                                            </tr>
                                            <tr><td style="height: 10px;"><img src="../Images/shim.gif" /></td></tr>
                                            <tr>
                                                <td   style="vertical-align: top; font-weight: bold;">
                                                    <label for="Eligibility" title="Eligibility">
                                                        Eligibility</label>
                                                </td>
                                                <td >
                                                    <div runat="server" id="EligibilityHTML" class="RichTextDisplayView" onmouseover="this.className='RichTextDisplayViewHover';" onmouseout="this.className='RichTextDisplayView';" onclick="NotesEditor.show('Eligibility',5000);">
                                                    </div>
                                                    <cc:CaisisTextArea ID="Eligibility" runat="server" MaxLength="5000" ShowTextEditor="true"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="Eligibility"></cc:CaisisTextArea>
                                                </td>
                                            </tr>
                                            <tr><td style="height: 10px;"><img src="../Images/shim.gif" /></td></tr>
                                            <tr>
                                                <td   style="vertical-align: top; font-weight: bold;">
                                                    <label for="ResearchMethods" title="Treatment Plan">
                                                        Treatment Plan</label>
                                                </td>
                                                <td >
                                                    <div runat="server" id="ResearchMethodsHTML" class="RichTextDisplayView" onmouseover="this.className='RichTextDisplayViewHover';" onmouseout="this.className='RichTextDisplayView';" onclick="NotesEditor.show('ResearchMethods',5000);">
                                                    </div>
                                                    <cc:CaisisTextArea ID="ResearchMethods" runat="server" MaxLength="5000" ShowTextEditor="true"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="ResearchMethods"></cc:CaisisTextArea>
                                                </td>
                                            </tr>
                                            <tr><td style="height: 10px;"><img src="../Images/shim.gif" /></td></tr>
                                            <tr>
                                                <td   style="vertical-align: top; font-weight: bold;">
                                                    <label for="EvaluationMetrics" title="Evaluation Metrics">
                                                        Evaluation Metrics</label>
                                                </td>
                                                <td >
                                                    <div runat="server" id="EvaluationMetricsHTML" class="RichTextDisplayView" onmouseover="this.className='RichTextDisplayViewHover';" onmouseout="this.className='RichTextDisplayView';" onclick="NotesEditor.show('EvaluationMetrics',5000);">
                                                    </div>
                                                    <cc:CaisisTextArea ID="EvaluationMetrics" runat="server" MaxLength="5000" ShowTextEditor="true"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="EvaluationMetrics"></cc:CaisisTextArea>
                                                </td>
                                            </tr>
                                            <tr><td style="height: 10px;"><img src="../Images/shim.gif" /></td></tr>
                                            <tr>
                                                <td   style="vertical-align: top; font-weight: bold;">
                                                    <label for="PopulationDescription" title="Population Description">
                                                        Population Description</label>
                                                </td>
                                                <td >
                                                    <div runat="server" id="PopulationDescriptionHTML" class="RichTextDisplayView" onmouseover="this.className='RichTextDisplayViewHover';" onmouseout="this.className='RichTextDisplayView';" onclick="NotesEditor.show('PopulationDescription',5000);">
                                                    </div>
                                                    <cc:CaisisTextArea ID="PopulationDescription" runat="server" MaxLength="5000" ShowTextEditor="true"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="PopulationDescription"></cc:CaisisTextArea>
                                                </td>
                                            </tr>
                                            <tr><td style="height: 10px;"><img src="../Images/shim.gif" /></td></tr>
                                            <tr>
                                                <td   style="vertical-align: top; font-weight: bold;">
                                                    <label for="StatisticsAnalyticsPlans" title="StatisticsAnalyticsPlans">
                                                        Statistics / AnalyticsPlans</label>
                                                </td>
                                                <td >
                                                    <div runat="server" id="StatisticsAnalyticsPlansHTML" class="RichTextDisplayView" onmouseover="this.className='RichTextDisplayViewHover';" onmouseout="this.className='RichTextDisplayView';" onclick="NotesEditor.show('StatisticsAnalyticsPlans',5000);">
                                                    </div>
                                                    <cc:CaisisTextArea ID="StatisticsAnalyticsPlans" runat="server" MaxLength="8000" ShowTextEditor="true"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="StatisticsAnalyticsPlans"></cc:CaisisTextArea>
                                                </td>
                                            </tr>
                                            <tr><td style="height: 10px;"><img src="../Images/shim.gif" /></td></tr>
                                        </table>
                                    </div>
                                    <editor:LOIEditor runat="server" ID="LOIForm" />
                                    <div>
                                        <editorContract:LOIContract runat="server" ID="LOIContractForm" />
                                        <table style="table-layout:fixed; width: 95%; margin: 10px auto 25px auto; vertical-align: top; font-weight: bold;">
                                            <tr>
                                                <td  style="vertical-align: top; font-weight: bold; width:10%;">
                                                    <label for="ContractNotes" title="Contract Notes">
                                                        Contract Notes</label>
                                                </td>
                                                <td>
                                                    <div runat="server" id="ContractNotesHTML" class="RichTextDisplayView" onmouseover="this.className='RichTextDisplayViewHover';" onmouseout="this.className='RichTextDisplayView';" onclick="NotesEditor.show('ContractNotes',5000);">
                                                    </div>
                                                    <cc:CaisisTextArea ID="ContractNotes" runat="server" MaxLength="5000" ShowTextEditor="true"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="ContractNotes"></cc:CaisisTextArea>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div>
                                        <editorBudget:LOIBudget runat="server" ID="LOIBudgetForm" />
                                        <table style="table-layout:fixed; width: 95%; margin: 10px auto 25px auto; vertical-align: top; font-weight: bold;">
                                            <tr>
                                                <td style="vertical-align: top; font-weight: bold; width:10%;">
                                                    <label for="BudgetNotes" title="Budget Notes">
                                                        Budget Notes</label>
                                                </td>
                                                <td >
                                                    <div runat="server" id="BudgetNotesHTML" class="RichTextDisplayView" onmouseover="this.className='RichTextDisplayViewHover';" onmouseout="this.className='RichTextDisplayView';" onclick="NotesEditor.show('BudgetNotes',5000);">
                                                    </div>
                                                    <cc:CaisisTextArea ID="BudgetNotes" runat="server" MaxLength="1000" ShowTextEditor="true"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="ProjectLetterOfIntent" Field="BudgetNotes"></cc:CaisisTextArea>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <!-- Navigation Buttons -->
                    <div style="margin: auto; width: 80%; margin-top: 6px;">
                    <asp:ImageButton ID="ImageButton2" AlternateText="Go To Associate Organizations"
                            ImageUrl="../Images/Button_Next.gif" runat="server" OnClick="HandleNextClick"
                            Style="float: right;" />
                        <asp:ImageButton ID="ImageButton3" AlternateText="Save and Print" ImageUrl="../Images/Button_SaveAndPrint.gif"
                            runat="server" OnClick="SaveAndPrint" Style="float: right; margin-right: 200px;" />
                        <asp:ImageButton ID="ImageButton1" AlternateText="Go To Project Details" ImageUrl="../Images/Button_Back.gif"
                            runat="server" OnClick="HandleBackClick" Style="float: left;" />
                        
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
