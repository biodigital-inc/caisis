<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminCreateProject.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.AdminCreateProject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<%@ Register TagPrefix="help" TagName="HelpLayer" Src="../Controls/ProjectMgmtHelpLayer.ascx" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create a New Project</title>
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    Browser.ResizeElement( { nodeId: 'ProjectContainer', heightOffset: 225 });

    function setDefaultForm(ProjectType)
    {
        if (ProjectType == 'Retrospective Data Analysis')
        {
            setForm('Project Proposal');
        }
        else if (ProjectType == 'PCCTC Project')
        {
            setForm('Letter Of Intent');
        }
        else if (ProjectType == 'Specimen Trial')
        {
            setForm('Letter Of Intent');
        }
        else
        {
            setForm('None');
        }
    }
    
    function setForm(FormName)
    {
        var radioFormList = $('IncludeFormRadioList');
        for (i = 0; i < radioFormList.rows.length; i++)
        {
            if (radioFormList.rows[i].cells.length > 0
                && radioFormList.rows[i].cells[0].childNodes.length > 0)
            {
                var currentCell = radioFormList.rows[i].cells[0].childNodes[0];
                if (currentCell.type == 'radio')
                {
                    if (currentCell.value == FormName)
                        radioFormList.rows[i].cells[0].childNodes[0].checked = true;
                }
            }
        }
    }
    
    function setActiveOnLoad() 
    { 
        showFieldDescription($('ProjectTitle'),'Title');
    }
    window.addEvent('load',setActiveOnLoad,false);
    
    </script>
    
    <style type="text/css">
    
    .ProjectTable
    {
        padding: 10px;
    }

    #IncludeFormRadioList td
    {
        padding: 0px;
    }

    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div class="MenuContainter" style="height: 12px; width: 100%; display: block; border: none; margin: 0px;"> </div>
        <table class="ProjectWizardTable">
            <tr>
                <td style="width: auto;">
                    <table cellpadding="0" cellspacing="0" border="0" width="81%" align="center">
                        <tr class="BlueListBar">
                            <td class="BlueListBar" width="2%">
                                <img src="../Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;" /></td>
                            <td class="BlueListBar" width="96%">
                                <span style="font-size: 14px; margin-top: 10px; font-weight: normal;"><strong>Create New Project -</strong>&nbsp;&nbsp;&nbsp;Step 1: General Information</td>
                            <td class="BlueListBar" width="2%" style="text-align: right;">
                                <img src="../Images/HeaderBarBlueRight.gif" width="6" height="35" align="right" /></td>
                        </tr>
                        <tr>
                            <td colspan="3" >
                                <div id="ProjectContainer" style="border: solid 3px #e4e4e4; border-top: none; height: 600px;
                                    overflow: auto; position: relative; background-color: #ffffff;">

                                    <table id="ProjectTable" cellpadding="0" cellspacing="0" style="margin: 10px; width: 94%;" >
                                        <tbody>
                                            <tr>
                                                <td class="LeftCol">
                                                    <label for="ProjectTitle" title="Project Title">
                                                        Project Title
                                                    </label>
                                                </td>
                                                <td>
                                                    <cc:CaisisTextArea onfocus="showFieldDescription(this,'Title');" ID="ProjectTitle"
                                                        runat="server" CssClass="UnselectedField" ShowLabel="false" Table="Project" Width="450px" style="height: 40px;"
                                                        Field="Title"></cc:CaisisTextArea><br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ProjectTitle"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter a Project Title."></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="LeftCol">
                                                    <label for="ShortName" title="Short Name">
                                                        Project Short Title
                                                    </label>
                                                </td>
                                                <td>
                                                    <cc:CaisisTextBox onfocus="showFieldDescription(this,'ShortName');" ID="ShortName"
                                                        runat="server" CssClass="UnselectedField" ShowLabel="false" Table="Project" style="width: 450px;"
                                                        Field="ShortName" MaxLength="50"></cc:CaisisTextBox><br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="LeftCol">
                                                    <label for="ProjectNum" title="Project Number">
                                                        Project #
                                                    </label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ReadOnly="true" onfocus="showFieldDescription(this,'Number');" ID="ProjectNum"
                                                        runat="server" CssClass="UnselectedField" Width="75px"></asp:TextBox>&nbsp;&nbsp;<span style="font-size: smaller;">(Auto-generated)</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="LeftCol">
                                                    <label for="ProjectDescription" title="Description">
                                                        Protocol #</label></td>
                                                <td>
                                                    <cc:CaisisTextBox onfocus="showFieldDescription(this,'Description');" ID="ProjectDescription"
                                                        runat="server" CssClass="UnselectedField" ShowLabel="false" Table="Project"
                                                        Field="Description" Width="150px"></cc:CaisisTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="LeftCol">
                                                    <label for="ProjectType" title="Project Type">
                                                        Project Type</label></td>
                                                <td>
                                                    <cc:CaisisSelect onfocus="showFieldDescription(this,'Type');" ID="ProjectType" runat="server"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="Project" Width="150px" Field="Type"
                                                        LookupCode="ProjectType" onchange="setDefaultForm(this.value);">
                                                    </cc:CaisisSelect>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ProjectType"
                                                        SetFocusOnError="true" ErrorMessage="Please Enter a Project Type."></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="LeftCol">
                                                    <label for="ProjectPhase" title="Project Phase">
                                                        Project Phase</label></td>
                                                <td>
                                                    <cc:CaisisSelect onfocus="showFieldDescription(this,'Phase');" ID="ProjectPhase" runat="server"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="Project" Width="150px" Field="Phase"
                                                        LookupCode="ProjectPhase">
                                                    </cc:CaisisSelect>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="LeftCol">
                                                    <label for="AgentName" title="Agent Name">
                                                        Agent Name</label></td>
                                                <td>
                                                    <cc:CaisisCheckBoxList runat="server" Table="Project" ID="AgentName" Field="AgentName"
                                                        MaxLength="255" ShowLabel="false" LookupCode="MedTxAgent" RepeatLayout="Table"
                                                        RepeatColumns="1" DropDown="true" Width="150px">
                                                    </cc:CaisisCheckBoxList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="LeftCol">
                                                    <label for="ClassOfDrug" title="Class Of Drug">
                                                        Class Of Drug</label></td>
                                                <td>
                                                    <cc:CaisisComboBox onfocus="showFieldDescription(this,'ClassOfDrug');" ID="ClassOfDrug" runat="server"
                                                        CssClass="UnselectedField" ShowLabel="false" Table="Project" Field="ClassOfDrug" MaxLength="255" LookupCode="MedTxType" Width="150px">
                                                    </cc:CaisisComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" class="LeftCol">
                                                    <label for="ProjectType" title="Project Type">
                                                        Additional Forms</label></td>
                                                <td onclick="showFieldDescription(this,'ProjectApproval');" >
                                                    <cc:CaisisRadioButtonList ID="IncludeFormRadioList" runat="server" Width="200px" TextAlign="Right" RepeatLayout="Table" RepeatDirection="Vertical" CellPadding="0" CellSpacing="0">
                                                        <asp:ListItem Value="Letter Of Intent">Include Letter Of Intent</asp:ListItem>
                                                        <asp:ListItem Value="Project Proposal">Include Project Proposal Form</asp:ListItem>
                                                        <asp:ListItem Value="None">None</asp:ListItem>
                                                    </cc:CaisisRadioButtonList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="LeftCol">
                                                    <label for="ProjectNotes" title="Notes">
                                                        Notes</label></td>
                                                <td>
                                                    <cc:CaisisTextArea onfocus="showFieldDescription(this,'Notes');" ID="ProjectNotes"
                                                        runat="server" CssClass="UnselectedField" ShowLabel="false" ShowTextEditor="true"
                                                        Width="450" Table="Project" Field="Notes" MaxLength="1000"></cc:CaisisTextArea>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="WizardBtnContainer">
                                    <asp:ImageButton ImageUrl="../Images/Button_Next.gif" runat="server" ID="CreateProjectBtn"
                                        OnClick="OnCreateNewProjectClick" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
