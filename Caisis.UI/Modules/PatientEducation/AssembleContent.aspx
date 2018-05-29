<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AssembleContent.aspx.cs"
    Inherits="Modules_PatientEducation_AssembleContent" %>

<%@ Register TagPrefix="cc" Namespace="Caisis.UI.Core.Classes.CustomControls" %>
<%@ Register TagPrefix="caisis" Namespace="Caisis.UI.Core.Classes" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Caisis: Patient Education - Assemble Content</title>
    <link href="../../StyleSheets/GlobalStyles.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/MenuStyles.css" type="text/css" rel="stylesheet" />
    <link href="PtEdStyles.css" type="text/css" rel="stylesheet" />

    <script src="../../ClientScripts/utilities.js" type="text/javascript"></script>

    <script src="../../ClientScripts/Menu.js" type="text/javascript"></script>

    <script src="PatientEdScripts.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
    // Resize frame
    //Browser.ResizeFrame({ heightOffset: 100, widthOffset: 10 });
    Browser.ResizeFrame({ heightOffset: 100});
    
    // Resize Left and Right Navigation and Content divs
    //Browser.ResizeElement({nodeId: 'LeftDiv', heightOffset: 240 },{nodeId: 'RightDiv', heightOffset: 240, widthOffset: 400 },{nodeId: 'ContentDetail', heightOffset: 220,  widthOffset: 415  }, { nodeId: 'PrintingContainer', heightOffset: 230} );
//    Browser.ResizeElement({nodeId: 'LeftDiv', heightOffset: 250 },{nodeId: 'RightDiv', heightOffset: 250 },{nodeId: 'ContentDetail', heightOffset: 230 }, { nodeId: 'ContentPrintPage', heightOffset:240 } );
      Browser.ResizeElement({nodeId: 'leftDiv', heightOffset: 211},{nodeId: 'profilesDiv', heightOffset: 315},{nodeId: 'RightDiv', heightOffset: 240},{nodeId: 'ContentDetail', heightOffset: 220 }, { nodeId: 'PrintingContainer', heightOffset: 230} );

    function swapTabs(num)
    {
        if(num==1) // 1 is the active profile
        {
            showElement('treeTabContent');  hideElement('profilesListTabContent');
            //$('treeTabContent').show('inline');  $('profilesListTabContent').hide('none');
            $('profileTab').className = 'activeTab';
            $('profileListTab').className = 'tab';
        }
        else // 2 is the list of profiles
        {
            showElement('profilesListTabContent');  hideElement('treeTabContent');
            $('profileTab').className = 'tab';
            $('profileListTab').className = 'activeTab';
        }
    }

    function loadTreeByVisitType(vtype)
    {
        $('_visitTypeStage').value = vtype;
        var cname = vtype==0 ? 'noVisitTypeBoxCurrent' : 'currentStage';
        document.form1.submit();
    }
    
    function loadTreeByPacketType(vtype, packetId, packetName)
    {
        $('_visitTypeStage').value = vtype;
        var cname = vtype==0 ? 'noVisitTypeBoxCurrent' : 'currentStage';
        
        $('_packetName').value = packetName;
        
        $('_packetId').value = packetId;
        document.form1.submit();
    }
    
    function setVisitStageInfo(num, theClassName)
    {
        var theStageId = "stage" + num;
        if($(theStageId)) { $(theStageId).className = theClassName; }
    } 
    
    function updateStatusTimeline()
    {
        var num = $('_visitTypeStage').value;
        var totalStages = $('stagesRow').cells.length;
        if(num > 0)
        {
            var cname = num==(totalStages-1) ? 'currentStageLast' : 'currentStage';
            setVisitStageInfo(num, cname);
            if(num > 1) { setVisitStageInfo(num-1, "currentStagePrev"); }
        }
        else { setVisitStageInfo(num, "noVisitTypeBoxCurrent"); }
    }
    
    function loadProfile(pId,vtId)
    {
        $('_ptProfileId').value = pId;
        $('_visitTypeStage').value = vtId; 
        setCallBackType('profileListSelect');
        $('_ptProfileIdLastSelected').value = pId;
        document.form1.submit();
    }

    function updateProfilesList()
    {
        var currentRowId = 'listRow' + $('_ptProfileId').value;
        var currentRow = $(currentRowId);
        if(currentRow) 
        { 
            currentRow.className = 'ListManDataTableRowSelected'; 
        }
        else
        {
            var lastSelected = $('_ptProfileIdLastSelected').value;
            if(lastSelected != '')
            {
                var lastRowSelectedId = 'listRow' + lastSelected;
                $(lastRowSelectedId).className = 'ListManDataTableRowSelected';
                
                if(currentRowId == 'listRow0')
                {
                    var lastRowSelectedId = 'listRow' + lastSelected;
                    $(lastRowSelectedId).className = 'ListManDataTableRow';
                    $('_ptProfileIdLastSelected').value = '';
                }
            }
        }
    }
     
    function resetProfilesListStyles()
    {
        var totalProfiles = $('profilesTable').rows.length;
        
        for(var i=0; i<totalProfiles; i++)
        {
            var rowId = 'listRow'+i;
            if($(rowId))
            {
                $(rowId).className = 'ListManDataTableRow';
            }
        }
    }
    
    // Print assembled content contained in iframe
    function printAssembledContent()
    {
        copyAssembledContent();
        var innerFrame = window.frames['HiddenContentDetails'];
        innerFrame.ScanPagesForPageBreaks.call(innerFrame);
       innerFrame.focus();
        innerFrame.print();
        //window.focus();
    }
    
    // Copies the contents of the assemble content frame into hidden frame for printing
    function copyAssembledContent()
    {
        var assembledContentWindow = window.frames['ContentDetail'];
        var hiddenPrintWindow = window.frames['HiddenContentDetails'];
        var assembledContent = assembledContentWindow.document.getElementById('DocumentStart');
        clearChildren(hiddenPrintWindow.document.body);
        var tmp  = hiddenPrintWindow.document.createElement('DIV');
        tmp.innerHTML = assembledContent.parentNode.innerHTML;
        hiddenPrintWindow.document.body.appendChild(tmp);
    }

    // Set OnLoad Event
    Event.Register('load',window,wireEventsOnLoad);
    Event.Register('load',window,updateStatusTimeline);
    Event.Register('load',window,updateProfilesList);
    
    
    
    function showStageSubMenu(cell,menuNum)
    {
        var subMenu = $('SubMenu' + menuNum);
        // Only show submenu if it has children
        if(subMenu.childNodes.length)
        {
            var left = getLeftPos(cell);
            var top = getTopPos(cell) + cell.offsetHeight;
            subMenu.style.left = (left - 15) + 'px';
            subMenu.style.top = top + 'px';
            subMenu.show('block');
        }
    }
    function hideStageSubMenu(menuNum)
    {
        var subMenu = $('SubMenu' + menuNum);
        subMenu.hide('none');
    }
    
    	function checkBrowser(){
		this.ver=navigator.appVersion
		this.dom=document.getElementById?1:0
		this.ie=(this.ver.indexOf("MSIE")>-1 && this.dom)?1:0;
		return this
		}
		
		bw=new checkBrowser()
		if(!bw.ie)
		{
			alert('Please Note: Printing in the Patient Education module\nis currently optimized for Microsoft Internet Explorer.');
		}
		
		
    
    
    
    
    </script>
    <style type="text/css">
    .validStageSubMenu
    {
        text-align: left; 
        display: block;
        width: 15%;
        margin-left: 12px;
        position: absolute; 
        color: #ffffff;
        background-color: #3D556D;
        top: 5px; 
        display: none;
        cursor:hand;
    }
    .packetMenuItem
    {
	    margin-left:5px;
	    padding-top:2px;
	    padding-bottom:2px;
    }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        
        <asp:HiddenField ID="_visitTypeStage" runat="server" />
        <asp:HiddenField ID="_packetId" runat="server" />
        <asp:HiddenField ID="_packetName" runat="server" />
        <asp:HiddenField ID="_ptProfileId" runat="server" />
        <asp:HiddenField ID="_ptProfileIdLastSelected" runat="server" />
        <asp:HiddenField ID="_callbackType" runat="server" />
        <asp:HiddenField ID="_usePtInSession" runat="server" />

                    <table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align: left;background-color: #f8fafc;
            height: 100%; margin-top: 5px;">
                        <tr>
                            <td style="padding-top: 5px; width: 230px; vertical-align: top;">
                                <asp:Label ID="ResultsTitle" runat="server" CssClass="ListManTitle">Assemble Content</asp:Label>
                                <div style="width: 100%; margin-right: 15px; margin-bottom: 0px; margin-top: 10px;">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td id="profileTab" class="activeTab" onclick="javascript:swapTabs(1); return false;" title="Select contents for a new handout.">
                                                Create New Handout</td>
                                            <td >
                                                &nbsp;</td>
                                            <td id="profileListTab" runat="server" class="tab" onclick="javascript:swapTabs(2); return false;" title="View handouts previously printed for this patient.">
                                                Previous Handouts</td>
                                            <td >
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="4" style="border: solid 1px #666666; vertical-align: top; background-color: #ffffff;">
                                            
                                            <div id="leftDiv" style="height: 434px; overflow: auto;">
                                            
                                            
                                            <!-- Create New -->
                                            <div id="treeTabContent" runat="server">
                                                <asp:TreeView ID="contentTV" runat="server" OnTreeNodePopulate="TreeNode_Populate"
                                                    SelectedNodeStyle-CssClass="selectedNode" NodeStyle-Width="200">
                                                    <LevelStyles>
                                                        <asp:TreeNodeStyle CssClass="sectionTreeNode" />
                                                        <asp:TreeNodeStyle CssClass="topicTreeNode" />
                                                        <asp:TreeNodeStyle CssClass="subTopicTreeNode" />
                                                    </LevelStyles>
                                                </asp:TreeView>
                                            </div>
                                            
                                            
                                            <!-- View Previous -->
                                            <div id="profilesListTabContent"  style="visibility: hidden; display: none;">

                                            <!-- Titles - PtEd. Profiles "Grid" ... width is 802 to compensate for next div -->
                                            <table id="resultsTitles" width="100%" border="0" cellpadding="3" cellspacing="0"
                                                class="ListManDataTableOuterBorder" runat="server">
                                                <tr>
                                                    <td style="width: 40%; text-align: left;" class="RepeaterRowHeader">
                                                        Printed</td>
                                                    <td style="width: 30%;" class="RepeaterRowHeader">
                                                        Disease</td>
                                                    <td style="width: 30%;" class="RepeaterRowHeader">
                                                        Visit Type</td>
                                                </tr>
                                            </table>
                                            <!-- Content - Results Table -->
                                            <div id="profilesDiv" style="width: 100%; height: 380px; overflow: auto;">
                                                <table id="profilesTable" width="100%" cellspacing="0" cellpadding="1" border="0">
                                                    <asp:Repeater ID="rptProfileResults" runat="server">
                                                        <ItemTemplate>
                                                            <tr onclick="loadProfile('<%# Eval("ProfileId") %>','<%# Eval("ProfileVisitTypeId") %>');"
                                                                id="listRow<%# Eval("ProfileId") %>" class="ListManDataTableRow" onmouseover="handleRowOver(this,event);"
                                                                onmouseout="handleRowOut(this,event);" style="vertical-align: middle; cursor: pointer;">
                                                                <td style="width: 40%;" class="ListManDataTableCell">
                                                                    <span>
                                                                        <%# Eval("LastPrintedTime", "{0:d}")%><br />by <%# Eval("LastPrintedBy") %>
                                                                    </span>
                                                                </td>
                                                                <td style="width: 30%;" class="ListManDataTableCell">
                                                                    <span>
                                                                        <%# Eval("DiseaseName") %>
                                                                    </span>
                                                                </td>
                                                                <td style="width: 30%;" class="ListManDataTableCell">
                                                                    <span>
                                                                        <%# Eval("VisitTypeName") %>
                                                                    </span>
                                                                </td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <SeparatorTemplate>
                                                            <tr>
                                                                <td colspan="4" class="ListManDataTableDottedLine" style="cursor: default; height: 5px;">
                                                                </td>
                                                            </tr>
                                                        </SeparatorTemplate>
                                                    </asp:Repeater>
                                                </table>
                                            </div>

                                    </div>
                                            
                                            
                                            
                                            
                                            </div>
                                            </td>
                                        </tr>
                                        
                                        
                                    </table>
                                </div>
                            </td>
                            <td style="vertical-align: top; padding-left: 20px;" >
                                <table width="100%" border="0"  style="position: relative; margin-bottom: 14px;" >
                                    <tr>
                                        <td style="width: 13%; font-weight: bold;">Select Disease</td>
                                        <td style="width: 19%;">
                                            <cc:CaisisSelect ID="ddlDiseaseProfile" OnSelectedIndexChanged="DiseaseDDLSelected"
                                                Table="PatientEdDisease" Field="DiseaseName"  LabelClass="label"
                                                AutoPostBack="True" ShowLabel="False" runat="server" Width="100">
                                            </cc:CaisisSelect>
                                        </td>
                                        <td  style="width: 78%; white-space: nowrap; padding-right: 15px;"><table class="stages" cellpadding="0" cellspacing="0">
                                                <tr id="stagesRow">
                                                    
                                                    <td id="stage0" class="noVisitTypeBox" onclick="loadTreeByVisitType(0)" title="No Visit Type">
                                                        &nbsp;&nbsp;</td>
                                                        
                                                    <td id="stage1" class="validStage" style="width: 27%" onmouseover="showStageSubMenu(this,1);" onmouseout="if(isMouseLeave(this,event)) { hideStageSubMenu(1); }">
                                                        <div >
                                                            Initial Consult</div>
                                                        <div id="SubMenu1" class="validStageSubMenu">
                                                            <asp:Repeater ID="rptInitialConsultPackets" runat="server">
                                                                <ItemTemplate>
                                                                    <div class="packetMenuItem" onclick="loadTreeByPacketType(1, <%# Eval("PacketId") %>, '<%# Eval("PacketName") %>' );"><%# Eval("PacketName") %></div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </td>
                                                    
                                                    <td id="stage2" class="validStage" onmouseover="showStageSubMenu(this,2);"  onmouseout="if(isMouseLeave(this,event)) { hideStageSubMenu(2); }">
                                                        <div >
                                                            Post-Op Visit</div>
                                                        <div onmouseout="hideStageSubMenu(2)" id="SubMenu2" class="validStageSubMenu">
                                                            <asp:Repeater ID="rptPostOpVisit" runat="server">
                                                                <ItemTemplate>
                                                                    <div onclick="">
                                                                        <div class="packetMenuItem" onclick="loadTreeByPacketType(2, <%# Eval("PacketId") %>, '<%# Eval("PacketName") %>')"><%# Eval("PacketName") %></div>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </td>
                                                    <td id="stage3" class="validStage" style="width: 23%" onmouseover="showStageSubMenu(this,3);" onmouseout="if(isMouseLeave(this,event)) { hideStageSubMenu(3); }">
                                                        <div>
                                                            Discharge</div>
                                                        <div onmouseout="hideStageSubMenu(3)" id="SubMenu3" class="validStageSubMenu">
                                                            <asp:Repeater ID="rptDischarge" runat="server">
                                                                <ItemTemplate>
                                                                    <div onclick="">
                                                                        <div class="packetMenuItem" onclick="loadTreeByPacketType(3, <%# Eval("PacketId") %>, '<%# Eval("PacketName") %>')"><%# Eval("PacketName") %></div>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </td>
                                                    <td id="stage4" class="validStageLast"  onmouseover="showStageSubMenu(this,4);" onmouseout="if(isMouseLeave(this,event)) { hideStageSubMenu(4); }">
                                                        <div>
                                                            Follow-Up</div>
                                                        <div onmouseout="hideStageSubMenu(4)" id="SubMenu4" class="validStageSubMenu">
                                                            <asp:Repeater ID="rptFollowUp" runat="server">
                                                                <ItemTemplate>
                                                                        <div class="packetMenuItem" onclick="loadTreeByPacketType(4, <%# Eval("PacketId") %>, '<%# Eval("PacketName") %>')"><%# Eval("PacketName") %></div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table><span style="font-weight: bold;">Packets by Visit</span>
                                        </td>
                                    </tr>

                                </table><asp:Label id="PacketName" CssClass="ListManTitle" runat="server">&nbsp;</asp:Label>
                                <div id="RightDiv" style="background-color: #FFFFFF; width: 96%; padding: 10px;
                                    padding-bottom: 20px; border: solid 1px #cccccc;">
                                    <!-- Content Is Assembled and Printed In Frame -->
                                    <iframe id="ContentDetail" name="ContentDetail" src="ContentPrintPage.aspx" frameborder="0"
                                        style="background-color: #FFFFFF; width: 100%; height: 700px;"></iframe>
                                    
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                <%-- <asp:ImageButton ID="ResetContentBtn" runat="server" OnClientClick="setCallBackType('reset');"
                                    ToolTip="Reset Content" ImageUrl="Images/Button_ResetToDefault.gif" />--%>
                                <asp:ImageButton ID="SaveContentBtn" runat="server" OnClick="SaveProfile" OnClientClick="setCallBackType('save');"
                                    ToolTip="Save Content" ImageUrl="../../Images/SaveContentBtn.gif" />
                                <asp:ImageButton ID="ClearContentBtn" runat="server" OnClientClick="top.clearPatientInHeader(); parent.window.location='Index.aspx?goToSection=AssembleContent';"
                                    ToolTip="Clear Content" ImageUrl="Images/Button_ClearContent.gif" />
                                    
                            </td>
                            <td style="text-align: right;">
                                <table border="0" width="100%">
                                    <tr>
                                        <td id="profileLog" runat="server" style="width: 90%; text-align: left;" class="smallGrayText">
                                            <span class="boldSpan">Last Printed: </span><span id="printedDate" runat="server" />
                                            <span id="printedBy" runat="server" />&nbsp;&nbsp; <span class="boldSpan">Last Modified:
                                            </span><span id="updatedDate" runat="server" /><span id="updatedBy" runat="server" />
                                        </td>
                                        <td style="text-align: right; padding-right: 70px;" width="*">
                                            <asp:ImageButton ID="printIcon" runat="server" OnClientClick="printAssembledContent();if($('_usePtInSession').value == 'false'){return false;} else { setCallBackType('print');};"
                                                OnClick="PrintProfile" Visible="true" AlternateText="Print Education Material"
                                                ImageUrl="Images/PrintEducationMaterial.gif" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>


    <div style="position: absolute; visibility: visible; z-index: -1;"><iframe id="HiddenContentDetails" name="HiddenContentDetails" src="FormattedContentPrintPage.htm" style="height: 1px; width: 1px;" scrolling="no"></iframe></div>

    </form>
</body>
</html>
