<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProjectStageEvents.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.EditProjectStageEvents" %>

<%@ Register TagPrefix="project" Namespace="Caisis.UI.Modules.ProjectMgmt" %>
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Stage Stages &amp; Events</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    Browser.ResizeElement( { nodeId: 'OverflowContainer', heightOffset: 250 } );

    // copies enddate to startdate if no startdate entered
    function handleEndDateEntered(sDateId,eDateId)
    {
        var start = $(sDateId);
        var end = $(eDateId);
        if(end && start && end.value!='' && start.value=='') { start.value = end.value; }
    }
    
    // confirm deleteion of stage
    function deleteStage()
    {
        var message = 'Are you sure you would like to delete this Stage and its associated Events and Details?';
        return confirmDelete(message);
    }
    
    // selects active stage on parent navigation
    function setActiveStageLink(stageId) { if(parent.setStagesLink) { parent.setStagesLink(stageId); } }
    
    </script>

    <style type="text/css">
.Grid
{
    table-layout: fixed;
}
.SectionTitle
{
    color: #000000;
    background-color: #ffffff;
    border-top: 1px solid #cccccc;
    border-left: 1px solid #cccccc;
    border-right: 1px solid #cccccc;
    display: block; 
    margin-bottom: 0px;
    padding-top: 5px;
    padding-bottom: 5px;
    padding-left: 10px;
}
.EventTable
{
    vertical-align: top; 
    width: 100%; 
    border-left: 1px solid #cccccc;
    border-right: 1px solid #cccccc;
    border-bottom: 1px solid #cccccc;
    background-color: #ffffff; 
    margin-bottom: 20px; 
    table-layout: fixed;
}
.ColTitle
{
    height: 30px;
    width: 75px;
}
.FieldLabel
{
    color: #333333;
    font-weight: bold;
}
.AttitbuteName
{
    display: block;
    font-size: 10px;
    font-weight: bold;
    color: #333333;
    padding-right: 5px;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="OverflowContainer" style="height: 400px; overflow: auto; padding-right: 20px;
            width: 96%; position: relative;">

            <script src="../../ClientScripts/popcalendar.js" type="text/javascript"></script>

            <custom:ExtendedGridView CssClass="Grid" runat="server" ID="ProjectStageEventsGrid"
                TableName="ProjectStageEvent" AutoUpdateChildGridViews="true" AutoBindChildGridByRowPrimaryKey="true"
                ShowHeader="false" AutoGenerateColumns="false" Width="95%" BorderStyle="None"
                GridLines="None" BorderWidth="1" OnRowDataBound="SetBlurEvent">
                <Columns>
                    <custom:ExtendedTemplateField>
                        <ItemTemplate>
                            <div style="width: 100%;">
                                <span class="SectionTitle">
                                    <%# Eval("Name")  %>
                                </span>
                                <table class="EventTable" cellpadding="8" border="0">
                                    <tbody>
                                        <tr>
                                            <td class="ColTitle">
                                                <label class="FieldLabel">
                                                    Pending
                                                    <cc:CaisisCheckBox runat="server" Table="ProjectStageEvent" ID="PendingEvent" Field="PendingEvent"
                                                        ShowLabel="false" /></label>
                                            </td>
                                            <td>
                                                <label class="FieldLabel">
                                                    Start Date
                                                    <cc:CaisisTextBox runat="server" Table="ProjectStageEvent" ID="EventStartDate" Field="EventStartDate"
                                                        ShowCalendar="true" Width="100" ShowLabel="false"></cc:CaisisTextBox></label>
                                            </td>
                                            <td>
                                                <label class="FieldLabel">
                                                    End Date
                                                    <cc:CaisisTextBox runat="server" Table="ProjectStageEvent" ID="EventEndDate" Field="EventEndDate"
                                                        ShowCalendar="true" Width="100" ShowLabel="false"></cc:CaisisTextBox></label>
                                            </td>
                                            <td>
                                                <label class="FieldLabel" style="white-space: nowrap;">
                                                    Notes
                                                    <cc:CaisisTextBox runat="server" Table="ProjectStageEvent" ID="Notes" Field="Notes"
                                                        ShowLabel="false" Width="140" ShowTextEditor="true" MaxLength="1000"></cc:CaisisTextBox></label></td>
                                        </tr>
                                        <!-- Show Optional Fields -->
                                        <tr runat="server" id="ShowOptionFieldsRow">
                                            <td colspan="4">
                                                <img src="Images/ViewOptionalFields.gif" alt="View Optional Fields" title="View Opional Fields"
                                                    style="cursor: pointer;" onclick="showHideOptionalFields(this,'<%#Eval("StageEventId") %>Details');" />
                                            </td>
                                        </tr>
                                        <!-- Option Fields -->
                                        <tr id="<%#Eval("StageEventId") %>Details" style="display: none;">
                                            <td colspan="4">
                                                <!-- Project Stage Event Attribute/Values -->
                                                <custom:ExtendedGridView GridLines="None" TableName="ProjectEventAttributes" runat="server"
                                                    ID="ProjectStageEventAttributesGrid" ShowHeader="false" ShowFooter="false" AutoGenerateColumns="false"
                                                    AutoUpdateChildGridViews="true" border="0" OnRowDataBound="HandleDateAttributes"
                                                    OnPreRender="ShowHideOptionsLink">
                                                    <Columns>
                                                        <custom:ExtendedTemplateField>
                                                            <ItemTemplate>
                                                                <asp:Label ID="AttributeName" CssClass="AttitbuteName" runat="server" Text='<%# Eval("AttributeName") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </custom:ExtendedTemplateField>
                                                        <custom:ExtendedTemplateField>
                                                            <ItemTemplate>
                                                                <cc:CaisisTextBox runat="server" ID="AttributeValue" Table="ProjectEventAttributes"
                                                                    Field="AttributeValue" ShowLabel="false" MaxLength="200"></cc:CaisisTextBox>
                                                            </ItemTemplate>
                                                        </custom:ExtendedTemplateField>
                                                    </Columns>
                                                </custom:ExtendedGridView>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </ItemTemplate>
                    </custom:ExtendedTemplateField>
                </Columns>
            </custom:ExtendedGridView>
        </div>
        <div style="padding-right: 20px; width: 96%;">
            <table class="ProjectMgmtBtnContainer">
                <tr>
                    <td colspan="2" style="text-align: left;">
                        <asp:ImageButton runat="server" ID="SaveBtn" ImageUrl="Images/Button_Save.gif" ToolTip="Save"
                            OnClick="UpdateStageAndEvents" Style="margin-right: 30px;" />
                    </td>
                    <td style="text-align: right; width: 100px;">
                        <project:ProjectMgmtButton runat="server" ID="DeleteBtn" ImageUrl="Images/Button_Delete.gif"
                            ToolTip="Delete this Stage, Events &amp; Details" OnClick="DeleteStage" OnClientClick="return deleteStage();" />
                    </td>
                    <td style="text-align: right; width: 100px;">
                        <project:ProjectMgmtButton runat="server" ID="EditBtn" ImageUrl="Images/Button_Edit.gif"
                            ToolTip="Edit Events and Details" OnPreRender="SetModalLink" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
