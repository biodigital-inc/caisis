<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="AdminAddEditStageEvents.aspx.cs"
    Inherits="Caisis.UI.Modules.ProjectMgmt.AdminAddEditStageEvents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="custom" Namespace="Caisis.UI.Core.Classes" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add/Edit Stages and Events</title>
    <link href="../../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../ProjectMgmtStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../../ClientScripts/DynamicControls.js" type="text/javascript"></script>

    <script src="../ProjectMgmtScripts.js" type="text/javascript"></script>

    <script type="text/javascript">
    Browser.ResizeElement( { customResizer: resizeOnLoad });
    
    function resizeOnLoad(w,h)
    {
        var overflow = $('MatrixOverFlow');
        var winHeight = getHeight(window);
        var overflowNewHeight = Math.max(100,winHeight - 125);
        overflow.style.height = overflowNewHeight + 'px'; 
    }
    
    function editStage(stageId,stageName)
    {
        var title = 'Edit Stage: ' + stageName;
        var url = '<%= Page.ResolveUrl("../EditStage.aspx") %>?projectId=<%= ProjectId %>&stageId=' + stageId;
        showEditDetailsInModal(url,title,800,600);
        return false;
    }
    
    // Sets a node's checked state (checked=true|false)
    function setCheckState(check,node) { if(node.checked!=null) node.checked = check; }

    // Handle click event for matrix checkbox
    // based on type of checkbox
    function handleCheckClick(checkBox)
    {
        // All org checkboxes signaled by title
        var isMasterCheck = checkBox.title=='Check/Uncheck All';
        var isCheckAll = checkBox.checked;
        
        var cell = checkBox;
        while(cell && (cell=cell.parentNode).nodeName != 'TD');
        var row = cell.parentNode;

        var containerList = new Array();
        var checkType;
        if(isMasterCheck)
        {
            containerList.push(row);
            // If checking on event row, need to check off parent stage row
            if(row.className=='EventRow' && isCheckAll)
            {
                var p = row;
                while((p=p.previousSibling).className!='StageRow');
                // Loop through stage row columns check all except check/uncheck
                var stageRow = $(p);
                stageRow.tag('TD').foreach(function(c) { if(c.className!='CheckAllCol') containerList.push(c); } );
            }
        }
        else if(row.className=='StageRow')
        {
            containerList.push(cell);
        }
        else if(row.className=='EventRow' && isCheckAll)
        {
            var p = row;
            while((p=p.previousSibling).className!='StageRow');
            containerList.push(p.cells[cell.cellIndex]);
        }

        if(row.className=='StageRow')
        {
            var nextRow = row;
            // Keep visiting next sibling, until null or enconter next stage, then quit
            while( (nextRow=nextRow.nextSibling) && nextRow.className!='StageRow')
            {
                if(nextRow.className=='EventRow')
                {
                    if(isMasterCheck)
                    {
                        containerList.push(nextRow);
                    }
                    else
                    {
                        var nextRowCell = nextRow.cells[cell.cellIndex];
                        containerList.push(nextRowCell);
                    }
                }
            }
        }
        
        for(var i=0;i<containerList.length;i++)
        {
            var container = containerList[i];       
            var checkBoxes = $(container).tag('INPUT');
            var doCheck = curry(setCheckState,isCheckAll);
            checkBoxes.foreach(doCheck);
        }
    }
    
    function showHideEvents(img,stageIndex)
    {
        var stageEvent;
        var i=0;
        while( stageEvent=$('EventRow_' + stageIndex + '_' + i) )
        {
            showHideOptionalFields(img,stageEvent,'ProjMgr_ViewEvents.gif','ProjMgr_HideEvents.gif','View Events','Hide Events');
            i++;
        }        
    }
    
    // LOAD EVENTS
    
    function wireViewHideEvent(img,index) { img.addEvent('click',curry(showHideEvents,img,index)); }
    
    function wireCheckBoxEvent(field)
    {
        if(field.type=='checkbox')
        {
            // Check box and attach click event
            setCheckState(field,true);
            field.addEvent('click',curry(handleCheckClick,field));
        }
    }
    
    window.addEvent('load',function() {  $(document.body).tag('IMG.ViewDetailsImage').foreach(wireViewHideEvent); } );
    window.addEvent('load',function() { $(document.body).tag('INPUT').foreach(wireCheckBoxEvent); } );

    </script>

    <style type="text/css">
    .RowLabel
    {
        color: #ffffff;
        font-weight: bold;
    }
    .GridCheckBox
    {
        display: block;
        text-align: center;
        margin: auto;
        height: 100%;
        width: 100%; 
        padding: 0px; 
        display: block;
    }
    .GridCheckBoxContainer
    {
        margin: auto; 
        padding: 0px; 
        width: 15px; 
        height: 15px;
    }
    .GridCheckBoxContainer input
    {
        display: block;
        text-align: center;
        margin: auto;
        height: 100%;
        width: 100%; 
        padding: 0px; 
        display: block;
    }
    .Grid
    {
        table-layout: fixed;
        width: 95%;
        border-style: none;
        border-width: 0px;
    }
    .Grid td
    {
        background-color: #ffffff;
        
    }
    .HiddenRow
    {
        display: none;
    }
    .StagesCol
    {
        width: 150px;
        font-weight: bold;
        font-size: 11px;
    }
    .EventNameCol
    {
        width: 150px;
    }
    .EventTypeCol
    {
        width: 200px;
    }
    .EventNotesCol
    {
        width: auto;
    }
    #HeaderTable
    {
        table-layout: fixed;
        width: 100%;
        background-image: url(../Images/HeaderBarBlueBG.gif);
        background-repeat: repeat-x;
    }
    #HeaderTable td
    { 
        height: 22px;
        font-weight: bold;
        text-align: left;
        color: #ffffff;
    }
    #StageEventsContainer
    {
        height: 600px;
        overflow: auto;
        position: relative;
        margin: auto;
    }
    #Wrapper
    {
        width: 95%;
        margin: 10px auto auto auto;
        border-left: solid 2px #e4e4e4;
        border-right: solid 2px #e4e4e4;
        border-bottom: solid 2px #e4e4e4;
    }
    #OrgListContainer
    {
        width: 95%; 
        margin: 15px auto auto auto;
    }
    #BtnContainer
    {
        width: 95%; 
        margin: 20px auto auto auto;
    }
    .OrgCheckBoxCol
    {
        border-left: 1px solid #ebebeb; 
        border-collapse: collapse; 
        text-align: center; 
        vertical-align: top;
        padding-top: 5px;
    }
    ul
    {
        list-style: none;
        text-align: left;
        margin-left: 0px;
        margin-top: 8px;
        margin-bottom: 2px;
    }
    li
    {
        padding: 2px;
        font-weight: normal;
        border-bottom: solid 1px #cccccc;
    }
    .StagesEventsTD
    {
        width: 200px;
    }
    .StagesEventsHeaderCell
    {
        background-color: #004256;
        height: 20px;
        color: #ffffff;
        text-align: center;
        font-weight: bold;
        font-size: 11px;
    }
    
    .StageRow
    {
        background-color: #6C7B8B;
    }
    .EventCell
    {
        background-color: #cccccc;
        background-image: url(../Images/EventBGCurve.gif);
        background-repeat: no-repeat;
        border-bottom: solid 2px #6C7B8B;
        padding-left: 17px;
        padding-top: 4px;
        font-weight: bold;
        color: #111111;
    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="ColorPicker" style="display: none; position: absolute; border: 1px solid black;
            width: 150px; z-index: 10; background-color: #ffffff;" onmouseout="if(isMouseLeave(this,event)) { $(this).hide('none'); }">
        </div>
        <div runat="server" id="WizardTitle" style="margin-left: auto; margin-right: auto;
            margin-top: 0px; margin-bottom: 0px; width: 95%; display: block;">
            <span style="color: #8d2a2c; font-size: 14px; font-weight: bold; display: block;
                margin-bottom: 2px; margin-top: 3px;">Step 4: Stages & Events</span></div>
        <div style="width: 95%; overflow: auto; margin: auto; margin-top: 10px;">
            <table id="MatrixHeaderTable" cellpadding="2" cellspacing="0" border="0" style="width: 98%;
                table-layout: fixed;">
                <tr>
                    <td class="StagesEventsHeaderCell" style="width: 23px;">
                        <img src="../Images/shim.gif" style="width: 23px; height: 1px;" /></td>
                    <td class="StagesEventsHeaderCell" style="width: 210px; text-align: left;">
                        Stages & Events
                    </td>
                    <td class="StagesEventsHeaderCell" style="width: 56px;">
                        <img src="../Images/ProjMgr_Stages_AllOrgs.gif" /></td>
                    <!-- Header Cells for Organization Short Names -->
                    <asp:Repeater runat="server" ID="OrgListRptr">
                        <ItemTemplate>
                            <td class="StagesEventsHeaderCell" width="*">
                                <%# Eval("ShortName") %>
                            </td>
                        </ItemTemplate>
                    </asp:Repeater>
                </tr>
            </table>
            <div id="MatrixOverFlow" style="width: 100%; height: 400px; overflow: auto;">
                <table id="OrgListTable" class="dataGrid" border="0" cellpadding="0" cellspacing="0"
                    style="table-layout: fixed; width: 98%; margin: 0px; background-color: #ffffff;
                    border-top: none;">
                    <!-- Rows Of Stages -->
                    <asp:Repeater runat="server" ID="StagesRptr" OnItemDataBound="BindProjectStageEvents">
                        <ItemTemplate>
                            <!-- Stage Row id = 'StageRow_StageIndex' -->
                            <tr id="StageRow_<%# Container.ItemIndex %>" class="StageRow">
                                <td style="padding-top: 5px; padding-left: 7px; padding-bottom: 5px; width: 23px;
                                    vertical-align: top;">
                                    <span style="float: left; display: block; width: 14px; height: 14px; border: 1px solid #666666;
                                        background-color: <%# Eval("ColorCode") %>">
                                        <img src="../Images/shim.gif" style="width: 1px;" /></span></td>
                                <td colspan="1" style="padding-top: 5px; padding-bottom: 5px; width: 210px;">
                                    <img src="../Images/ProjMgr_Stages_Edit.gif" onclick="editStage(<%# Eval("StageID") %>,'<%# Eval("Name") %>');"
                                        style="vertical-align: middle; margin-left: 8px; margin-right: 10px; float: right;
                                        cursor: pointer;" /><asp:Label CssClass="RowLabel" runat="server" ID="StageLabel"></asp:Label>
                                    <asp:HiddenField runat="server" ID="ColorCode" />
                                    <asp:HiddenField runat="server" ID="ProjectStageId" />
                                    <asp:HiddenField runat="server" ID="StageColor" />
                                </td>
                                <td style="width: 56px;" class="CheckAllCol">
                                    <asp:Panel runat="server" ID="DoCheckBoxContainer" CssClass="GridCheckBoxContainer">
                                        <input runat="server" id="DoCheckBox" type="checkbox" class="GridCheckBox" title="Check/Uncheck All" /></asp:Panel>
                                </td>
                                <!-- Column Container Record for each Organization's Stage Record by Stage Name -->
                                <asp:Repeater runat="server" ID="OrgSingleStageRptr" OnItemDataBound="SetSingleStageEvents">
                                    <ItemTemplate>
                                        <td style="text-align: center;" class="HilightCol">
                                            <div class="GridCheckBoxContainer">
                                                <asp:HiddenField runat="server" ID="OrgIdField" />
                                                <asp:HiddenField runat="server" ID="OrgStageIdField" />
                                                <cc:CaisisCheckBox runat="server" ID="StageCheckBox" Table="ProjectStage" CssClass="GridCheckBoxContainer"
                                                    OnCheckedChanged="CreateOrganizationStageRecord" />
                                            </div>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                            <tr>
                                <td colspan="2" class="StageRow">
                                    <img class="ViewDetailsImage" src="../Images/ProjMgr_HideEvents.gif" alt="Hide Events"
                                        title="Hide Events" style="cursor: pointer; float: right; margin-right: 0px;
                                        margin-bottom: 2px;" /></td>
                            </tr>
                            <asp:Repeater runat="server" ID="ProjectStageEventsRptr" OnItemDataBound="BindProjectStageEventAttributes">
                                <ItemTemplate>
                                    <!-- Event Row id = 'EventRow_StageIndex_StageEventIndex' -->
                                    <tr id="EventRow_<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex %>_<%# Container.ItemIndex %>"
                                        class="EventRow">
                                        <!-- Event list for Stage in Project-->
                                        <td class="StageRow">
                                            &nbsp;</td>
                                        <td class="EventCell">
                                            <asp:HiddenField runat="server" ID="StageEventIdField" />
                                            <asp:Label runat="server" ID="StageEventLabel"></asp:Label>
                                            <!-- List of Event Attributes id = 'EventAttributes_StageIndex_StageEventIndex' -->
<%--                                            <ul id="EventAttributes_<%# (Container.NamingContainer.NamingContainer as RepeaterItem).ItemIndex %>_<%# Container.ItemIndex %>">
                                                <!-- Event Attributes for StageEvent in Project -->
                                                <asp:Repeater runat="server" ID="ProjectStageEventAttributesRptr">
                                                    <ItemTemplate>
                                                        <li style="background-color: #E6F0F4;">
                                                            <%# Eval("AttributeName") %>
                                                        </li>
                                                    </ItemTemplate>
                                                    <AlternatingItemTemplate>
                                                        <li style="background-color: #ffffff;">
                                                            <%# Eval("AttributeName")%>
                                                        </li>
                                                    </AlternatingItemTemplate>
                                                </asp:Repeater>
                                            </ul>--%>
                                        </td>
                                        <td class="OrgCheckBoxCol" style="background-color: #fafafa; border-top: 1px solid #ebebeb;">
                                            <div class="GridCheckBoxContainer">
                                                <input type="checkbox" class="GridCheckBox" title="Check/Uncheck All" />
                                            </div>
                                        </td>
                                        <asp:Repeater runat="server" ID="OrgStageEventRptr" OnItemDataBound="SetOrgIdField">
                                            <ItemTemplate>
                                                <td class="OrgCheckBoxCol" style="background-color: #ffffff; border-top: 1px solid #ebebeb;">
                                                    <div class="GridCheckBoxContainer">
                                                        <asp:HiddenField runat="server" ID="OrgIdField" />
                                                        <cc:CaisisCheckBox runat="server" ID="OrgStageEventCheckBox" Table="ProjectStageEvent"
                                                            CssClass="GridCheckBoxContainer" OnCheckedChanged="CreateOrganizationStageEventRecord" />
                                                    </div>
                                                </td>
                                            </ItemTemplate>
                                            <AlternatingItemTemplate>
                                                <td class="OrgCheckBoxCol" style="background-color: #fafafa; border-top: 1px solid #ebebeb;">
                                                    <div class="GridCheckBoxContainer">
                                                        <asp:HiddenField runat="server" ID="OrgIdField" />
                                                        <cc:CaisisCheckBox runat="server" ID="OrgStageEventCheckBox" Table="ProjectStageEvent"
                                                            CssClass="GridCheckBoxContainer" OnCheckedChanged="CreateOrganizationStageEventRecord" />
                                                    </div>
                                                </td>
                                            </AlternatingItemTemplate>
                                        </asp:Repeater>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                            <tr>
                                <td style="height: 1px;">
                                    <img src="../Images/shim.gif" /></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
            <div>
                <img alt="Add a New Stage" title="Add a New Stage" src="../Images/ProjMgr_Stages_AddStage.gif"
                    style="float: left; border: none; cursor: pointer;" onclick="editStage('','');" />
                <input style="float: right; display: block; width: 100px;  padding: 1px;
                    text-align: center; vertical-align: middle; color: #333333; background-image: url('../Images/AddBtnBg.gif');"
                    title="Reset Values" type="reset" value="Reset Values" />
            </div>
        </div>
        <div style="display: none;">
            <asp:Button runat="server" ID="UpdateListBtn" OnClick="HandleMatrixUpdated" Text="Update List"
                OnClientClick="$(this).hide('none'); $('LoadingBtn').show('');" Enabled="true" />
            <input type="button" id="LoadingBtn" value="Updating" disabled="true" style="display: none;" />
        </div>
        <table cellpadding="0" cellspacing="0" border="0" width="95%" align="center" style="display: none;">
            <tr class="BlueListBar">
                <td class="BlueListBar" width="2%">
                    <img src="../Images/HeaderBarBlueLeft.gif" width="6" height="35" style="margin: 0px;" /></td>
                <td class="BlueListBar" width="96%">
                    <span style="font-weight: bold; font-size: 14px; margin-top: 10px;">Edit Stages
                    and Events</td>
                <td class="BlueListBar" width="2%" style="text-align: right;">
                    <img src="../Images/HeaderBarBlueRight.gif" width="6" height="35" align="right" /></td>
            </tr>
        </table>
        <asp:Panel ID="BtnContainer" runat="server">
            <asp:ImageButton ImageUrl="../Images/Button_Back.gif" runat="server" ID="BackBtn"
                OnClick="OnBackClick" Style="float: left;" />
            <asp:ImageButton ImageUrl="../Images/Button_Done.gif" runat="server" ID="DoneBtn"
                OnClick="OnDoneClick" Style="float: right;" />
            <asp:ImageButton ImageUrl="../Images/Button_Save.gif" runat="server" ID="SaveBtn"
                OnClick="OnSaveClick" Style="float: right;" />
        </asp:Panel>
    </form>
</body>
</html>
